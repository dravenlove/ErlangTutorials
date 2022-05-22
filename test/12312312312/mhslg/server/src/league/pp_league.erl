%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_league
%%% Created on : 2020/8/15 0015 15:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_league).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_LEAGUE_LIST, _, _Msg) ->
	lib_player_league:request_league_list();
handle(?MSG_CLIENT_LEAGUE_INFO, _, _Msg) ->
	lib_player_league:request_league_info();
handle(?MSG_CLIENT_LEAGUE_CREATE, _, Msg) ->
	lib_player_league:request_league_create(Msg);
handle(?MSG_CLIENT_LEAGUE_APPLY, _, Msg) ->
	lib_player_league:request_league_apply(Msg);
handle(?MSG_CLIENT_LEAGUE_APPLY_REPLY, _, Msg) ->
	lib_player_league:request_league_apply_reply(Msg);
handle(?MSG_CLIENT_LEAGUE_QUIT, _, _Msg) ->
	lib_player_league:request_league_quit();
handle(?MSG_CLIENT_LEAGUE_KICK, _, Msg) ->
	lib_player_league:request_league_kick(Msg);
handle(?MSG_CLIENT_LEAGUE_DIMISS, _, _Msg) ->
	lib_player_league:request_league_dismiss();
handle(?MSG_CLIENT_LEAGUE_MEMBER_LIST, _, _Msg) ->
	lib_player_league:request_league_member_list();
handle(?MSG_CLIENT_LEAGUE_POSITION, _, Msg) ->
	lib_player_league:request_league_position(Msg);
handle(?MSG_CLIENT_LEAGUE_LEADER, _, Msg) ->
	lib_player_league:request_league_change_leader(Msg);
handle(?MSG_CLIENT_LEAGUE_NOTICE, _, Msg) ->
	lib_player_league:request_league_notice(Msg);
handle(?MSG_CLIENT_LEAGUE_APPLY_LIST, _, _Msg) ->
	lib_player_league:request_league_apply_list();
handle(?MSG_CLIENT_LEAGUE_LOG, _, _Msg) ->
	lib_player_league:request_league_log_list();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
