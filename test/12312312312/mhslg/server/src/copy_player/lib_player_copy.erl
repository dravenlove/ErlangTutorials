%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_copy
%%% Created on : 2020/8/15 0015 10:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		此模块用来处理跟离线玩家的战斗信息的获取
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_copy).
-author("glendy").
-include("common.hrl").
-include("player_copy.hrl").

%% API
-export([
	put_player_copy/2,
	get_player_copy/0,
	ets_init/0,
	build_index/0,
	player_copy_handler/0,
	update_player_copy/0,
	sign_in/0,
	sign_out/0,

	check_update_player_show/0
]).

put_player_copy(PlayerCopy, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_COPY),
	erlang:put(?ETS_PLAYER_COPY, PlayerCopy).

get_player_copy() ->
	erlang:get(?ETS_PLAYER_COPY).

ets_init() ->
	ets:new(?ETS_PLAYER_COPY, [?ETS_KEY_POS(#player_copy.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_COPY, {?TUPLE_INT(<<"id">>, 1)}, true),
	ok.

player_copy_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_COPY,
		table_name = ?DBPLAYER_COPY,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_copy:ets_init/0,
		mongo_index_func = fun lib_player_copy:build_index/0,
		load_func = fun db_player_copy:load_player_copy/1,
		save_func = fun db_player_copy:save_player_copy/1,
		get_func = fun lib_player_copy:get_player_copy/0,
		put_func = fun lib_player_copy:put_player_copy/2
	}.

%% 更新离线玩家的信息
update_player_copy() ->
	update_player_copy(1, 0).
update_player_copy(Online, OfflineTick) ->
	PlayerCopy = get_player_copy(),
	ShowRole = lib_player:serialize_show_role(),
	Props = #{},%lib_player_fight:get_fight_props(),
	ActiveSkillMap = #{},%%lib_player_fight:get_active_skill_map(),
	PassiveSkillMap = #{},%lib_player_fight:get_passive_skill_map(),
	put_player_copy(PlayerCopy#player_copy{
		player_show = ShowRole,
		online = Online,
		offline_tick = OfflineTick,
		fight_props = Props,
		active_skill_map = ActiveSkillMap,
		passive_skill_map = PassiveSkillMap
	}, true).

check_update_player_show() ->
	case lib_player_flag:get_player_show_flag() of
		1 ->
			lib_player_flag:set_player_show_flag(0),
			update_player_copy(),
			listen_update_show_role();
		_ -> skip
	end.

sign_in() ->
	update_player_copy(1, 0),
	ok.

sign_out() ->
	update_player_copy(0, lib_timer:unixtime()),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 同步最新的ShowRole到其他功能进程
listen_update_show_role() ->
	lib_player_friend:async_friend_info(),
	lib_player_league:async_league_member_show(),
	lib_player_rank:async_ranker_show(),
	lib_player_chat:async_chat_show(),
	ok.

