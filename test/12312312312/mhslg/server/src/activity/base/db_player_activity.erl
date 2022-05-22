%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2021 17:24
%%%-------------------------------------------------------------------
-module(db_player_activity).
-author("13661").

-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").

%% API
-export([
	load_player_activity/1,
	save_player_activity/1,
	remove_detail/2
]).

data_to_bson(MainType, Data) ->
	case MainType of
		?ACTIVITY_MAIN_TYPE_ACC_RECHARGE ->
			lib_player_cumulative_recharge:data_to_bson(Data);
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK ->
			db_open_server_rank:player_info_to_bson(Data);
		_ -> Data
	end
.

bson_to_data(MainType, Bson) ->
	case MainType of
		?ACTIVITY_MAIN_TYPE_ACC_RECHARGE ->
			lib_player_cumulative_recharge:bson_to_data(Bson);
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK ->
			db_open_server_rank:bson_to_player_info(Bson);
		_ -> Bson
	end
.

activity_detail_to_bson(Detail) when is_record(Detail, activity_detail) ->
	MainType = Detail#activity_detail.main_type,

	DataBson = data_to_bson(MainType, Detail#activity_detail.data),

	#{
		?BSONSET_INT(activity_id, Detail#activity_detail.id),
        ?BSONSET_INT(system_type, Detail#activity_detail.system_type),
        ?BSONSET_INT(server_type, Detail#activity_detail.server_type),
		?BSONSET_INT(main_type, Detail#activity_detail.main_type),
		?BSONSET_INT(sub_type, Detail#activity_detail.sub_type),
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
        system_type = ?BSON_INT(Bson, system_type),
        server_type = ?BSON_INT(Bson, server_type),
		main_type = ?BSON_INT(Bson, main_type),
		sub_type = ?BSON_INT(Bson, sub_type),
		is_click = ?BSON_BOOL(Bson, is_click),
		data = Data
	}
.

load_player_activity(PlayerId) ->
	QueryBson = #{
		?BSONSET_INT(id, PlayerId)
	},
	case mongo_poolboy:find(?MMO_POOL, ?DB_PLAYER_ACTIVITY, QueryBson) of
		[_ | _] = BsonList ->
			TypeMap = lists:foldl(fun(DetailBson, Map) ->
				Detail = bson_to_activity_detail(DetailBson),
                TID = lib_activity_api:tid(Detail),

				DetailMap = maps:get(TID, Map, maps:new()),
                NewDetailMap = maps:put(Detail#activity_detail.id, Detail, DetailMap),
                maps:put(TID, NewDetailMap, Map)
		 	end, maps:new(), BsonList),

			#player_activity{
				id = PlayerId,
				act_detail_map = TypeMap
			};
		_ -> #player_activity{id = PlayerId}
	end

%%	case mongo_poolboy:find_one(?MMO_POOL, ?DB_PLAYER_ACTIVITY, QueryBson) of
%%		Res = #{} ->
%%			DetailBsonList = ?BSON_LIST_DEFAULT(Res, act_detail_dict, []),
%%			DetailDict = lists:foldl(fun(DetailBson, Dict) ->
%%				Detail = bson_to_activity_detail(DetailBson),
%%				dict:store(Detail#activity_detail.id, Detail, Dict)
%%			end, dict:new(), DetailBsonList),
%%
%%			#player_activity{
%%				id = PlayerId,
%%				act_detail_dict = DetailDict
%%			};
%%		_ ->
%%			#player_activity{id = PlayerId}
%%	end
.

save_player_activity(PlayerActivity) when is_record(PlayerActivity, player_activity) ->
	PlayerId = PlayerActivity#player_activity.id,
	?INFO("save player backstage activity : ~p", [PlayerId]),
%%	DetailBsonList = dict:fold(fun(_, Detail, List) ->
%%		[activity_detail_to_bson(Detail) | List]
%%  	end, [], Data#player_activity.act_detail_dict),
%%	Bson = #{
%%		?BSONSET_INT(id, Data#player_activity.id),
%%		?BSONSET_LIST(act_detail_dict, DetailBsonList)
%%	},


%%	mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_ACTIVITY, #{?BSONSET_INT(id, Id)}, #{?BSONSET_INT(<<"$set">>, Bson)})
%%	lib_gamedb_api:noreply_update(?DB_PLAYER_ACTIVITY, #{?BSONSET_INT(id, Id)}, #{?BSONSET_BSON(<<"$set">>, Bson)})

	maps:map(fun(_TID, DetailMap) ->
        maps:map(fun(ActId, Detail) -> 
            DetailBson = activity_detail_to_bson(Detail),
            QueryBson = #{
                ?BSONSET_INT(player_id, PlayerId),
                ?BSONSET_INT(activity_id, ActId),
                ?BSONSET_INT(system_type, Detail#activity_detail.system_type),
                ?BSONSET_INT(server_type, Detail#activity_detail.server_type)
            },
            mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_ACTIVITY, QueryBson, DetailBson#{?BSONSET_INT(player_id, PlayerId)})    
        end, DetailMap)
   	end, PlayerActivity#player_activity.act_detail_map)
.

remove_detail(PlayerId, Detail) ->
	QueryBson = #{
		?BSONSET_INT(player_id, PlayerId),
		?BSONSET_INT(activity_id, Detail#activity_detail.id),
        ?BSONSET_INT(system_type, Detail#activity_detail.system_type),
        ?BSONSET_INT(server_type, Detail#activity_detail.server_type)
	},
	mongo_poolboy:async_delete_one(?MMO_POOL, ?DB_PLAYER_ACTIVITY, QueryBson)
.