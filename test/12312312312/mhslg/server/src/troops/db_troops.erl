%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 17:07
%%%-------------------------------------------------------------------
-module(db_troops).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").
%% API
-export([
	load_troops/1,
	save_troops/1
]).

%%从数据库读取玩家id的队伍列表
load_troops(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_TROOPS, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_troops{
				id = PlayerId,
				hero_id = ?BSON_LIST(Bson, <<"hero_id_list">>)
			};
		_ ->
			#player_troops{id = PlayerId}
	end
.

%%保存玩家的部队列表
save_troops(Troops) ->
	PlayerId = Troops#player_troops.id,
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"hero_id_list">>, Troops#player_troops.hero_id)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_TROOPS, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.


