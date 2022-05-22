%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. Jan 2021 9:17 PM
%%%-------------------------------------------------------------------
-module(lib_player_map_clearing).
-author("lichaoyu").
-include("common.hrl").
-include("ProtoClient_10114.hrl").
-include("clearing.hrl").
-include("task.hrl").

%% API
-export([
	test/0,
	request_map_clearing/0,
	request_attack_map_clearing/1,
	request_clearing_award/1,
	notice_map_clearing/2
]).

-export([
	put_map_clearing/1,
	put_map_clearing/2,
	get_map_clearing/0,
	player_map_clearing_handler/0,
	sign_in/0
]).

put_map_clearing(MapClearing) ->
	put_map_clearing(MapClearing, true).
put_map_clearing(MapClearing, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_MAP_CLEARING),
	erlang:put(?ETS_PLAYER_MAP_CLEARING, MapClearing).

get_map_clearing() ->
	erlang:get(?ETS_PLAYER_MAP_CLEARING).

ets_init() ->
	ets:new(?ETS_PLAYER_MAP_CLEARING, [?ETS_KEY_POS(#player_map_clearing.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_MAP_CLEARING, {?TUPLE_INT(id, 1)}, true).

player_map_clearing_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_MAP_CLEARING,
		table_name = ?DBPLAYER_MAP_CLEARING,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_map_clearing:load_player_map_clearing/1,
		save_func = fun db_player_map_clearing:save_player_map_clearing/1,
		get_func = fun get_map_clearing/0,
		put_func = fun put_map_clearing/2
	}.

sign_in() ->
	lib_map_clearing_api:json_to_maps()
.

request_map_clearing() ->
	#player_map_clearing{
		map_clearing = MapClearing
	} = get_map_clearing(),
	ClearingList = dict:fold(
		fun(_, Clearing, L) ->
			[to_proto(Clearing) | L]
		end, [], MapClearing),
	Res = #'Proto50114002'{
		map_clearing_list = ClearingList
	},
	lib_send:respond_to_client(Res)
.
to_proto(MapClearing) ->
	Type = MapClearing#map_clearing.type,
	Proto = #'ProtoMapClearing'{
		clearing_id = MapClearing#map_clearing.id,
		type = Type
	},
	to_proto(Type, MapClearing#map_clearing.data, Proto)
.
to_proto(?TYPE_BOUNTY_MISSION, Data, Proto) ->
	Proto#'ProtoMapClearing'{param = Data}
;
to_proto(?TYPE_PUPPET, [Data1, Data2], Proto) ->
	Proto#'ProtoMapClearing'{param = Data1, param1 = Data2}
;
to_proto(?TYPE_GOVERNMENT_TASK, Data, Proto) ->
	Proto#'ProtoMapClearing'{param = Data}
;
to_proto(?TYPE_ALIEN_INVASION, Data, Proto) ->
	AlienInvasion = #'ProtoAlienInvasionInfo'{
		combat = Data#alien_invasion.combat_id,
		num = Data#alien_invasion.num,
		conf = Data#alien_invasion.conf_id
	},
	Proto#'ProtoMapClearing'{alien_invasion = AlienInvasion}
;
to_proto(_, _Data, Proto) ->
	Proto
.

notice_map_clearing(NoticeType, MapClearing) ->
	MC =
		case NoticeType of
			0 -> to_proto(MapClearing);
			1 -> #'ProtoMapClearing'{clearing_id = MapClearing#map_clearing.id}
		end,
	Res =
		#'Proto80114002'{
			map_clearing = MC,
			state = NoticeType
		},
	lib_send:respond_to_client(Res)
.

request_attack_map_clearing(Msg) ->
	#'Proto10114008'{
		clearing_id = ClearingId,
		hero_id = HeroId,
		hero_id_list = HeroIdList
	} = Msg,
	?JUDGE_RETURN(lib_map_clearing_api:is_clearing(ClearingId), ?ERROR_BAD_TASK),
	case lib_map_clearing_api:type(ClearingId) of
		?TYPE_BOUNTY_MISSION ->
			lib_player_bounty_mission:request_bounty_mission_fight(ClearingId, HeroIdList);
		?TYPE_GOVERNMENT_TASK ->
			lib_player_government_task:request_challenge_government_task(ClearingId, HeroId);
		?TYPE_ALIEN_INVASION ->
			lib_player_alien_invasion:request_alien_invasion_fight(ClearingId, HeroIdList);
		_ -> skip
	end
.

request_clearing_award(Msg) ->
	#'Proto10114012'{
		clearing_id = ClearingId
	} = Msg,
	?JUDGE_RETURN(lib_map_clearing_api:is_clearing(ClearingId), ?ERROR_BAD_TASK),
	Clearing = lib_map_clearing_api:map_clearing(ClearingId),
	Data = Clearing#map_clearing.data,
	Award =
		case Clearing#map_clearing.type of
			?TYPE_ALIEN_INVASION ->
				?JUDGE_RETURN(Data#alien_invasion.num =:= 0, ?ERROR_NO_STATE),
				Conf = tb_alien_invasion_monster:get(Data#alien_invasion.conf_id),
				maps:get(award, Conf)
		end,
	lib_equip_api:item(Award, ?ADD_TASK_MONSTER, Clearing#map_clearing.city_id),
	lib_map_clearing_api:d_clearing(ClearingId)
.

test() ->
	lib_player_alien_invasion:request_alien_invasion_fight("19_27", [201])
.






