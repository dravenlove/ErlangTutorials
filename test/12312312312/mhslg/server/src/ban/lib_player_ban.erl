%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_ban
%%% Created on : 2020/9/14 0014 11:49
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_ban).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("ban.hrl").

%% API
-export([
	put_player_ban/2,
	get_player_ban/0,
	ets_init/0,
	build_index/0,
	player_ban_handler/0
]).

-export([
	ban_online_player/1,
	unban_player_chat/0,
	ban_player_chat/0
]).

put_player_ban(PlayerBan, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BAN),
	erlang:put(?ETS_PLAYER_BAN, PlayerBan).

get_player_ban() ->
	erlang:get(?ETS_PLAYER_BAN).

ets_init() ->
	ets:new(?ETS_PLAYER_BAN, [?ETS_KEY_POS(#player_ban.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_BAN, {?TUPLE_INT(<<"account">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBBAN_IP, {?TUPLE_INT(<<"ip">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_BAN, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_BAN, {?TUPLE_INT(<<"flag">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_BAN, {?TUPLE_INT(<<"opt_type">>, 1), ?TUPLE_INT(<<"account">>, 1), ?TUPLE_INT(<<"action">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_BAN, {?TUPLE_INT(<<"opt_type">>, 1), ?TUPLE_INT(<<"ip">>, 1), ?TUPLE_INT(<<"action">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_BAN, {?TUPLE_INT(<<"opt_type">>, 1), ?TUPLE_INT(<<"role_id">>, 1), ?TUPLE_INT(<<"action">>, 1)}, false),
	ok.

player_ban_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BAN,
		table_name = ?DBPLAYER_BAN,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_ban:ets_init/0,
		mongo_index_func = fun lib_player_ban:build_index/0,
		load_func = fun db_player_ban:load_player_ban/1,
		save_func = fun db_player_ban:save_player_ban/1,
		get_func = fun lib_player_ban:get_player_ban/0,
		put_func = fun lib_player_ban:put_player_ban/2
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 封禁在线的玩家，即踢下线
ban_online_player(OptType) ->
	lib_send:respond_to_client(?MSG_RETURN_HEARTBEAT, ?ERROR_BAN_LOGIN),
	PlayerBan = get_player_ban(),
	if
		OptType =:= ?OPT_TYPE_ACCOUNT ->
			put_player_ban(PlayerBan#player_ban{
				account_ban = 1
			}, true);
		OptType =:= ?OPT_TYPE_IP ->
			PlayerOther = lib_player:get_player_base_other(),
			put_player_ban(PlayerBan#player_ban{
				ip_ban = 1,
				ip = PlayerOther#player_base_other.ip
			}, true);
		true ->
			skip
	end,
	Sid = lib_player:player_sid(),
	mod_server:cast(Sid, kick_off),
	ok.

unban_player_chat() ->
	PlayerBan = get_player_ban(),
	put_player_ban(PlayerBan#player_ban{
		chat_ban = 0
	}, true),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat_ban:unban_player_chat/2, [PlayerBan#player_ban.id]),
	ok.

ban_player_chat() ->
	PlayerBan = get_player_ban(),
	put_player_ban(PlayerBan#player_ban{
		chat_ban = 1
	}, true),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat_ban:ban_player_chat/2, [PlayerBan#player_ban.id]),
	ok.
