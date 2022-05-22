%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 05. 12月 2020 15:35
%%%-------------------------------------------------------------------
-module(db_troops_march).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").

%% API
-export([
	load_troops/0,
	save_troops/1
]).

troops_to_bson(Troops) when is_record(Troops, troops) ->
	#troops{
		troops_id = TroopsId,
		combat_hero = CombatHero,
		state = State,
		city_id = CityId
	} = Troops,
	State1 =
		case State of
			?TROOPS_MOVING ->
				lib_map_api:a_defend_troops(TroopsId, CityId),
				?TROOPS_FREE;
			?TROOPS_FIGHTING -> ?TROOPS_FREE;
			_ -> State
		end,
	#{
		?BSONSET_INT(<<"troops_id">>, TroopsId),
		?BSONSET_BSON(<<"combat_hero">>, hd(db_combat_queue:fighters_to_bson_list([CombatHero]))),
		?BSONSET_INT(<<"state">>, State1),
		?BSONSET_INT(<<"city_id">>, CityId)
	}
.

bson_to_troops(Bson) ->
	#troops{
		troops_id = ?BSON_INT(Bson, <<"troops_id">>),
		combat_hero = hd(db_combat_queue:bson_list_to_fighters([?BSON_BSON(Bson, <<"combat_hero">>)])),
		state = ?BSON_INT(Bson, <<"state">>),
		city_id = ?BSON_INT(Bson, <<"city_id">>)
	}
.

%%部队从数据库获取
load_troops() ->
	case mongo_poolboy:find(?MMO_POOL, ?DB_TROOPS, #{}) of
		[_ | _] = TroopsBsonList ->
			lists:foldl(fun(Bson, Dict) ->
				Troops = bson_to_troops(Bson),
				dict:store(Troops#troops.troops_id, Troops, Dict)
			end, dict:new(), TroopsBsonList);
		_ ->
			dict:new()
	end
.

%%部队存放数据库
save_troops(TroopsMarchDict) ->
	dict:map(fun(TroopsId, Troops) ->
		Bson = troops_to_bson(Troops),
		mongo_poolboy:async_update(?MMO_POOL, ?DB_TROOPS, #{?BSONSET_INT(<<"troops_id">>, TroopsId)}, Bson)
	end, TroopsMarchDict)
.



