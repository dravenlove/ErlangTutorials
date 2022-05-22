%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_backban_base
%%% Created on : 2020/9/14 0014 11:50
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_backban_base).
-author("glendy").
-include("common.hrl").
-include("ban.hrl").

%% API
-export([
	check_back_ban/0
]).

check_back_ban() ->
	BackBanList = db_player_ban:load_back_ban_list(),
	check_back_ban(BackBanList).

check_back_ban([]) ->
	ok;
check_back_ban([BanRec | T]) ->
	db_player_ban:update_ban_rec_flag(BanRec#ban_rec.id),
	case BanRec#ban_rec.opt_type of
		?OPT_TYPE_ACCOUNT ->
			ban_account(BanRec#ban_rec.action, BanRec);
		?OPT_TYPE_IP ->
			ban_ip(BanRec#ban_rec.action, BanRec);
		?OPT_TYPE_CHAT ->
			ban_chat(BanRec#ban_rec.action, BanRec);
		_ -> skip
	end,
	check_back_ban(T).

ban_account(?ACTION_UNBAN, BanRec) ->
	db_player_ban:unban_account(BanRec#ban_rec.account);
ban_account(_Action, BanRec) ->
	db_player_ban:ban_account(BanRec#ban_rec.account),
	PlayerIdList = db_player_base:get_player_id_by_account(BanRec#ban_rec.account),
	lists:foreach(
		fun(PlayerId) ->
			ban_player_login(PlayerId, ?OPT_TYPE_ACCOUNT)
		end, PlayerIdList),
	ok.

ban_ip(?ACTION_UNBAN, BanRec) ->
	db_player_ban:unban_ip(BanRec#ban_rec.ip);
ban_ip(_Action, BanRec) ->
	db_player_ban:ban_ip(BanRec#ban_rec.ip),
	PlayerIdList = db_player_base:get_player_id_by_ip(BanRec#ban_rec.ip),
	lists:foreach(
		fun(PlayerId) ->
			ban_player_login(PlayerId, ?OPT_TYPE_IP)
		end, PlayerIdList),
	ok.

ban_chat(?ACTION_UNBAN, BanRec) ->
	PlayerIdList =
		case length(BanRec#ban_rec.account) > 0 of
			true -> db_player_base:get_player_id_by_account(BanRec#ban_rec.account);
			_ -> [BanRec#ban_rec.role_id]
		end,
	lists:foreach(
		fun(PlayerId) ->
			unban_player_chat(PlayerId)
		end, PlayerIdList),
	ok;
ban_chat(_Action, BanRec) ->
	PlayerIdList =
		case length(BanRec#ban_rec.account) > 0 of
			true -> db_player_base:get_player_id_by_account(BanRec#ban_rec.account);
			_ -> [BanRec#ban_rec.role_id]
		end,
	lists:foreach(
		fun(PlayerId) ->
			ban_player_chat(PlayerId)
		end, PlayerIdList),
	ok.

%%%%%%%%%%%%%%%%%%%%%
ban_player_login(PlayerId, OptType) ->
	case lib_player:is_player_process_alive(PlayerId) of
		true ->
			PlayerPid = lib_player:get_pid(PlayerId),
			mod_server:async_apply(PlayerPid, fun lib_player_ban:ban_online_player/1, [OptType]);
		false -> skip
	end.

unban_player_chat(PlayerId) ->
	case lib_player:is_player_process_alive(PlayerId) of
		true ->
			PlayerPid = lib_player:get_pid(PlayerId),
			mod_server:async_apply(PlayerPid, fun lib_player_ban:unban_player_chat/0);
		false -> skip
	end.

ban_player_chat(PlayerId) ->
	case lib_player:is_player_process_alive(PlayerId) of
		true ->
			PlayerPid = lib_player:get_pid(PlayerId),
			mod_server:async_apply(PlayerPid, fun lib_player_ban:ban_player_chat/0);
		false -> skip
	end.


