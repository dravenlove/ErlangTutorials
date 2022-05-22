%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_rank
%%% Created on : 2020/8/27 0027 16:04
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_rank).
-author("glendy").
-include("common.hrl").
-include("rank.hrl").
-include("ProtoClient_10109.hrl").

-define(RANK_UPDATE_FLAG(RankType), {rank_update_flag, RankType}).

%% API
-export([
	put_player_rank/1,
	put_player_rank/2,
	get_player_rank/0,
	ets_init/0,
	build_index/0,
	player_rank_handler/0,
	sign_in/0,
	sign_out/0
]).

-export([
	update_player_level/0,
	update_player_force/0,
	add_build_val/1,
	update_kills/1,
	update_be_kills/1,
	update_rank0_kills/1,
	add_rank0_build_val/1,
	update_rank0_build_val/1,
	update_max_force_hero/1
]).
-export([
	process_player_show_update/1
]).

-export([
	request_rank_list/1
]).

-export([
	async_ranker_show/0,
	check_update_rank/0,
	refresh_rank_player_level/0,
	refresh_rank_player_force/0,
	test_rank_command/4
]).

put_player_rank(PlayerRank) ->
	put_player_rank(PlayerRank, true)
.
put_player_rank(PlayerRank, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_RANK),
	erlang:put(?ETS_PLAYER_RANK, PlayerRank).

get_player_rank() ->
	erlang:get(?ETS_PLAYER_RANK).

ets_init() ->
	ets:new(?ETS_PLAYER_RANK, [?ETS_KEY_POS(#player_rank.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"country_id">>, 1), ?TUPLE_INT(<<"level">>, -1), ?TUPLE_INT(<<"level_update_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"country_id">>, 1), ?TUPLE_INT(<<"force">>, -1), ?TUPLE_INT(<<"force_update_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"country_id">>, 1), ?TUPLE_INT(<<"build_val">>, -1), ?TUPLE_INT(<<"build_val_update_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"country_id">>, 1), ?TUPLE_INT(<<"kills">>, -1), ?TUPLE_INT(<<"kills_update_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_RANK, {?TUPLE_INT(<<"country_id">>, 1), ?TUPLE_INT(<<"be_kills">>, -1), ?TUPLE_INT(<<"be_kills_update_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBRANK, {?TUPLE_INT(<<"id">>, 1)}, true),
	ok.

player_rank_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_RANK,
		table_name = ?DBPLAYER_RANK,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_rank:ets_init/0,
		mongo_index_func = fun lib_player_rank:build_index/0,
		load_func = fun db_rank:load_player_rank/1,
		save_func = fun db_rank:save_player_rank/1,
		get_func = fun lib_player_rank:get_player_rank/0,
		put_func = fun lib_player_rank:put_player_rank/2
	}.

sign_in() ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{
		is_online = true,
		sign_in_tick = lib_timer:unixtime(),
		country_id = lib_player:player_country(),
		show = lib_player:player_show()
	}, true),

	update_player_level(),
	update_player_force(),
	lib_player:check_player_force()
.

sign_out() ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{
		is_online = false,
		sign_out_tick = lib_timer:unixtime(),
		country_id = lib_player:player_country(),
		show = lib_player:player_show()
	}, true),
	check_update_rank().

update_player_level() ->
	PlayerRank = get_player_rank(),
	#player_rank{
		level = OldLevel,
		level_update_tick = OldUpdateTick
	} = PlayerRank,

	NewLevel = lib_player:player_level(),
	UpdateTick =
	case OldLevel =/= NewLevel of
		true -> lib_timer:unixtime();
		false -> OldUpdateTick
	end,

	put_player_rank(PlayerRank#player_rank{level = NewLevel, level_update_tick = UpdateTick}, true)
.

update_player_force() ->
	PlayerRank = get_player_rank(),
	#player_rank{
		force = OldForce,
		force_update_tick = OldUpdateTick
	} = PlayerRank,

	NewForce = lib_player:player_force(),
	UpdateTick =
	case OldForce =/= NewForce of
		true -> lib_timer:unixtime();
		false -> OldUpdateTick
	end,

	put_player_rank(PlayerRank#player_rank{force = NewForce, force_update_tick = UpdateTick}, true)
.

add_build_val(Value) ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{
		build_val = PlayerRank#player_rank.build_val + Value,
		build_val_update_tick = lib_timer:unixtime()
	}, true)
.

update_kills(Number) ->
	PlayerRank = get_player_rank(),
	#player_rank{
		kills = OldVal,
		kills_update_tick = OldUpdateTick
	} = PlayerRank,

	UpdateTick =
	case OldVal =/= Number of
		true -> lib_timer:unixtime();
		false -> OldUpdateTick
	end,
	put_player_rank(PlayerRank#player_rank{kills = Number, kills_update_tick = UpdateTick}, true)
.

update_be_kills(Number) ->
	PlayerRank = get_player_rank(),
	#player_rank{
		be_kills = OldVal,
		be_kills_update_tick = OldUpdateTick
	} = PlayerRank,

	UpdateTick =
	case OldVal =/= Number of
		true -> lib_timer:unixtime();
		false -> OldUpdateTick
	end,
	put_player_rank(PlayerRank#player_rank{be_kills = Number, be_kills_update_tick = UpdateTick}, true)
.

update_rank0_kills(Number) ->
	PlayerRank = get_player_rank(),
	#player_rank{
		rank0_kills = OldVal,
		rank0_kills_update_tick = OldUpdateTick
	} = PlayerRank,

	UpdateTick =
		case OldVal =/= Number of
			true -> lib_timer:unixtime();
			false -> OldUpdateTick
		end,
	put_player_rank(PlayerRank#player_rank{rank0_kills = Number, rank0_kills_update_tick = UpdateTick}, true)
.

add_rank0_build_val(Number) ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{
		rank0_build_val = PlayerRank#player_rank.rank0_build_val + Number,
		rank0_build_val_update_tick = lib_timer:unixtime()
	}, true)
.
update_rank0_build_val(Number) ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{
		rank0_build_val = Number,
		rank0_build_val_update_tick = lib_timer:unixtime()
	}, true)
.

update_max_force_hero(HeroId) ->
	PlayerRank = get_player_rank(),
	put_player_rank(PlayerRank#player_rank{max_force_hero = HeroId}, true)
.

process_player_show_update(Show) ->
	mod_country_rank:update_ranker_show(lib_player:player_country(), lib_player:player_id(), Show)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端请求
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
request_rank_list(Msg) ->
	#'Proto10109001'{rank_type = RankType} = Msg,
	Conf = tb_rank:get(RankType),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	request_rank_list(RankType, Msg).

request_rank_list(RankType, _Msg)
  when RankType =:= ?RANK_PLAYER_LEVEL
  orelse RankType =:= ?RANK_PLAYER_FORCE ->
	Ranker = make_up_ranker(RankType),
	mod_server:async_status(mod_rank:get_pid(RankType), fun lib_rank_base:async_fetch_rank_list/3, [lib_player:player_id(), Ranker]);
request_rank_list(RankType, Msg)
  when RankType =:= ?RANK_CLUSTER_RECHARGE ->
	lib_player_cluster_rank:request_rank_list(RankType, Msg);
request_rank_list(RankType, _Msg) ->
	?WARNING("no rank type for get rank list: ~p", [RankType]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 通过设置排行榜的更新标识来同步最新的#'ProtoShowRole'数据到各排行榜
async_ranker_show() ->
	lib_player_flag:set_rank_player_level(1),
	lib_player_flag:set_rank_player_force(1),
	ok.

%% 定时刷新排行信息
check_update_rank() ->
	check_update_rank(lib_player_flag:get_rank_player_level(), fun lib_player_rank:refresh_rank_player_level/0),
	check_update_rank(lib_player_flag:get_rank_player_force(), fun lib_player_rank:refresh_rank_player_force/0),
	ok.

check_update_rank(Flag, Func) ->
	if
		Flag =:= 1 -> Func();
		true -> skip
	end.

make_up_ranker(?RANK_PLAYER_LEVEL) ->
	#ranker{
		rank_key = lib_player:player_id(),
		rank_type = ?RANK_PLAYER_LEVEL,
		rank_value = lib_player:player_level(),
		rank_tick = lib_timer:unixtime(),
		player_show = lib_player:serialize_show_role()
	};
make_up_ranker(?RANK_PLAYER_FORCE) ->
	#ranker{
		rank_key = lib_player:player_id(),
		rank_type = ?RANK_PLAYER_FORCE,
		rank_value = lib_player:player_force(),
		rank_tick = lib_timer:unixtime(),
		player_show = lib_player:serialize_show_role()
	};
make_up_ranker(RankType) ->
	?WARNING("no rank type for make up ranker: ~p", [RankType]).

%% 更新等级排行
refresh_rank_player_level() ->
	RankType = ?RANK_PLAYER_LEVEL,
	lib_player_flag:set_rank_player_level(0),
	Ranker = make_up_ranker(RankType),
	mod_server:async_status(mod_rank:get_pid(RankType), fun lib_rank_base:async_refresh_rank_player_level/2, [Ranker]).

%% 更新战力排行
refresh_rank_player_force() ->
	RankType = ?RANK_PLAYER_FORCE,
	lib_player_flag:set_rank_player_force(0),
	try
		?JUDGE_RETURN(lib_player:player_force() > 0, -1),
		Ranker = make_up_ranker(RankType),
		mod_server:async_status(mod_rank:get_pid(RankType), fun lib_rank_base:async_refresh_rank_player_force/2, [Ranker])
	catch
	    throw:{error, _ErrCode} -> skip
	end.


test_rank_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 1 ->
			lib_player_flag:set_rank_player_level(1),
			lib_player_flag:set_rank_player_force(1);
		Par1 =:= 2 ->
			lib_player_rank:request_rank_list(#'Proto10109001'{rank_type = Par2});
		true ->
			?WARNING("test rank: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end.