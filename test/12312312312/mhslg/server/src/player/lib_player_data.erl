%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_data
%%% Created on : 2020/8/4 0004 18:28
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_data).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("ProtoClient_10101.hrl").

%% API
-export([
	login/1,
	logout/0,
	cache_save/0,
	clear_cache/1
]).

%% 玩家登录数据处理逻辑
login(PlayerId) ->
	lists:foreach(
		fun(#player_handler{ets = Ets, load_func = LoadFunc, put_func = PutFunc}) ->
			if
				LoadFunc =/= undefined andalso PutFunc =/= undefined ->
					Data = lib_game_cache:get_player_cache(Ets, PlayerId, LoadFunc, false),
					PutFunc(Data, false);
				true -> skip
			end
		end, lib_player_handler:get_handlers()),
	PlayerBaseOther = lib_player:get_player_base_other(),
	PlayerBase = lib_player:get_player_base(),
	lib_serial_api:serial_login(lib_player:get_player_base(), PlayerBaseOther),
	lib_player:system_refresh(PlayerBase#player_base.login_tick),
	lib_player_process:sign_in(),
	lib_player:reset_every_day(),
	lib_player:hour_reset(),
	notify_player_login(),
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_player_login/5, [PlayerId, lib_player:get_process_name(PlayerId), PlayerBase#player_base.sid, PlayerBase#player_base.country]),
	PlayerBaseNew = lib_player:get_player_base(),
	NewPlayerBase = PlayerBaseNew#player_base{is_logining = 0},
	lib_player:put_player_base(NewPlayerBase, true),
	db_player_base:save_player_base(NewPlayerBase),
	db_player_base:save_player_base_other(PlayerBaseOther),
	ok.

%% 玩家登出数据处理逻辑
logout() ->
	PlayerBase = lib_player:get_player_base(),
	PlayerId = PlayerBase#player_base.id,
	NowTick = lib_timer:unixtime(),
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_player_logout/3, [PlayerId, PlayerBase#player_base.country]),
	lib_serial_api:serial_logout(PlayerId, PlayerBase#player_base.login_tick, NowTick, PlayerBase#player_base.level),
	lib_player:put_player_base(PlayerBase#player_base{
		logout_tick = NowTick,
		online = 0
	}, true),
	if
		PlayerBase#player_base.is_logining =:= 0 ->
			lib_player_process:sign_out(),
			lists:foreach(
				fun(Handler) ->
					player_logout_handler(PlayerId, Handler)
				end, lib_player_handler:get_handlers());
		true ->
			?WARNING("player no save because not finish login: ~p ~p", [PlayerId, PlayerBase#player_base.is_logining]),
			Hander = lib_player_handler:get_handler(?ETS_PLAYER_BASE),
			player_logout_handler(PlayerId, Hander)
	end,
	%%下线时保存玩家登陆时间
%%	online_gift:today_accumulative_time(),
	ok.

player_logout_handler(PlayerId, #player_handler{ets = Ets, save_func = SaveFunc, get_func = GetFunc}) ->
	if
		SaveFunc =/= undefined andalso GetFunc =/= undefined ->
			Data = GetFunc(),
			lib_game_cache:update_player_cache(Ets, PlayerId, Data, false),
			SaveFunc(Data);
		true -> skip
	end.


cache_save() ->
	lib_player_copy:update_player_copy(),
	PlayerId = lib_player:player_id(),
	IsUpdate = lists:foldl(
		fun(#player_handler{ets = Ets, save_func = SaveFunc, get_func = GetFunc}, AccFlag0) ->
			Flag = lib_player:get_ets_cache_flag(Ets),
			if
				SaveFunc =/= undefined andalso GetFunc =/= undefined andalso Flag =:= 1 ->
					lib_player:set_ets_cache_flag(Ets, 0),
					Data = GetFunc(),
					lib_game_cache:update_player_cache(Ets, PlayerId, Data, false),
					SaveFunc(Data),
					true;
				true -> AccFlag0
			end
		end, false, lib_player_handler:get_handlers()),
	if
		IsUpdate =:= true ->
			mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_player_cache/2, [PlayerId]);
		true -> skip
	end,
	ok.

notify_player_login() ->
	PlayerOther = lib_player:get_player_base_other(),
	Respond = #'Proto80101001'{
		show = lib_player:serialize_show_role(),
		exp = 0,
		open_days = config:get_open_days(lib_timer:unixtime()),
		create_days = lib_timer:get_diff_days(PlayerOther#player_base_other.create_tick),
		create_tick = lib_player:create_tick()
	},
	lib_send:respond_to_client(Respond).

clear_cache(PlayerId) ->
	ets:delete(?ETS_PLAYER_FRIEND, PlayerId),
	lists:foreach(
		fun(#player_handler{ets = Ets}) ->
			ets:delete(Ets, PlayerId)
		end, lib_player_handler:get_handlers()),
	ok.