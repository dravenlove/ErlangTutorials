%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_player_head_icon).
-author("13661").

-include("common.hrl").
-include("head_icon.hrl").

%% API
-export([
	load_player_head_icon/1,
	save_player_head_icon/1
]).

load_player_head_icon(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_HEAD_ICON, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonChapterList = ?BSON_LIST(Bson, head_dict),
			HeadDict =
			lists:foldl(fun(Bson1, Dict) ->
				HeadId = ?BSON_INT(Bson1, head_id),
				dict:store(HeadId, #head_icon{
					head_id = HeadId,
					active_tick = ?BSON_INT(Bson1, active_tick)
				}, Dict)
			end, dict:new(), BsonChapterList),

			#player_head_icon{
				id = PlayerId,
				head_dict = HeadDict
			};
		_ ->
			#player_head_icon{
				id = PlayerId
			}
	end.

save_player_head_icon(PlayerHeadIcon) ->
	PlayerId = PlayerHeadIcon#player_head_icon.id,

	BsonList =
	dict:fold(fun(_HeadId, Head, List) ->
		[#{
			?BSONSET_INT(<<"head_id">>, Head#head_icon.head_id),
			?BSONSET_INT(<<"active_tick">>, Head#head_icon.active_tick)
		} | List]
	end, [], PlayerHeadIcon#player_head_icon.head_dict),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(head_dict, BsonList)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HEAD_ICON, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson}).