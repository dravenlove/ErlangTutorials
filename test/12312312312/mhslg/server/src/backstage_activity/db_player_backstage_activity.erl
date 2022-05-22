%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 十二月 2019 17:47
%%%-------------------------------------------------------------------
-module(db_player_backstage_activity).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").
-include("backstage_activity_player.hrl").

%% API
-export([
	load_player_backstage_activity/1,
	save_player_backstage_activity/1,
	remove_detail/2
]).

data_to_bson(MainType, Data) ->
	case MainType of
		_ -> Data
	end
.

bson_to_data(MainType, Bson) ->
	case MainType of
		_ -> Bson
	end
.

activity_detail_to_bson(Detail) when is_record(Detail, activity_detail) ->
	MainType = Detail#activity_detail.main_type,

	DataBson = data_to_bson(MainType, Detail#activity_detail.data),

	#{
		?BSONSET_INT(activity_id, Detail#activity_detail.id),
		?BSONSET_INT(main_type, Detail#activity_detail.main_type),
		?BSONSET_INT(sub_type, Detail#activity_detail.sub_type),
		?BSONSET_INT(group_type, Detail#activity_detail.group_type),
		?BSONSET_BOOL(is_cluster, Detail#activity_detail.is_cluster),
		?BSONSET_INT(update_tick, Detail#activity_detail.update_tick),
		?BSONSET_INT(version, Detail#activity_detail.version),
		?BSONSET_BOOL(is_click, Detail#activity_detail.is_click),
		?BSONSET_BSON(data, DataBson)
	}
.

bson_to_activity_detail(Bson) ->
	MainType = ?BSON_INT(Bson, main_type),
	DataBson = ?BSON_BSON_DEFAULT(Bson, data, #{}),

	Data = bson_to_data(MainType, DataBson),

	#activity_detail{
		id = ?BSON_INT(Bson, activity_id),
		main_type = ?BSON_INT(Bson, main_type),
		sub_type = ?BSON_INT(Bson, sub_type),
		group_type = ?BSON_INT(Bson, group_type),
		is_cluster = ?BSON_BOOL(Bson, is_cluster),
		update_tick = ?BSON_INT(Bson, update_tick),
		version = ?BSON_INT(Bson, version),
		is_click = ?BSON_BOOL(Bson, is_click),
		data = Data
	}
.

load_player_backstage_activity(PlayerId) ->
	QueryBson = #{
		?BSONSET_INT(id, PlayerId)
	},
	case mongo_poolboy:find(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, QueryBson) of
		[_ | _] = BsonList ->
			DetailDict = lists:foldl(fun(DetailBson, Dict) ->
				Detail = bson_to_activity_detail(DetailBson),
				dict:store(Detail#activity_detail.id, Detail, Dict)
		 	end, dict:new(), BsonList),

			#player_back_act{
				id = PlayerId,
				act_detail_dict = DetailDict
			};
		_ -> #player_back_act{id = PlayerId}
	end

%%	case mongo_poolboy:find_one(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, QueryBson) of
%%		Res = #{} ->
%%			DetailBsonList = ?BSON_LIST_DEFAULT(Res, act_detail_dict, []),
%%			DetailDict = lists:foldl(fun(DetailBson, Dict) ->
%%				Detail = bson_to_activity_detail(DetailBson),
%%				dict:store(Detail#activity_detail.id, Detail, Dict)
%%			end, dict:new(), DetailBsonList),
%%
%%			#player_back_act{
%%				id = PlayerId,
%%				act_detail_dict = DetailDict
%%			};
%%		_ ->
%%			#player_back_act{id = PlayerId}
%%	end
.

save_player_backstage_activity(PlayerActivity) when is_record(PlayerActivity, player_back_act) ->
	PlayerId = PlayerActivity#player_back_act.id,
	?INFO("save player backstage activity : ~p", [PlayerId]),
%%	DetailBsonList = dict:fold(fun(_, Detail, List) ->
%%		[activity_detail_to_bson(Detail) | List]
%%  	end, [], Data#player_back_act.act_detail_dict),
%%	Bson = #{
%%		?BSONSET_INT(id, Data#player_back_act.id),
%%		?BSONSET_LIST(act_detail_dict, DetailBsonList)
%%	},


%%	mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, #{?BSONSET_INT(id, Id)}, #{?BSONSET_INT(<<"$set">>, Bson)})
%%	lib_gamedb_api:noreply_update(?DB_PLAYER_BACKSTAGE_ACTIVITY, #{?BSONSET_INT(id, Id)}, #{?BSONSET_BSON(<<"$set">>, Bson)})

	dict:map(fun(ActId, Detail) ->
		DetailBson = activity_detail_to_bson(Detail),
		QueryBson = #{
			?BSONSET_INT(id, PlayerId),
			?BSONSET_INT(activity_id, ActId)
		},
		mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, QueryBson, DetailBson#{?BSONSET_INT(id, PlayerId)})
   	end, PlayerActivity#player_back_act.act_detail_dict)
.

remove_detail(PlayerId, Detail) ->
	QueryBson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_INT(activity_id, Detail#activity_detail.id)
	},
	mongo_poolboy:async_delete_one(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, QueryBson)
.