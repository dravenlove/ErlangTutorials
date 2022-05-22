%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 18:17
%%%-------------------------------------------------------------------
-module(pp_alien).

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_ALIEN_MAIN_INFO, _, _)->
	lib_player_alien:request_main_info();

handle(?MSG_CLIENT_ALIEN_JOIN_TEAM, _, Msg)->
	lib_player_alien:request_join_team(Msg);

handle(?MSG_CLIENT_ALIEN_EXIT_TEAM, _, Msg)->
	lib_player_alien:request_exit_team(Msg);

handle(?MSG_CLIENT_ALIEN_DRAW_REWARD, _, Msg)->
	lib_player_alien:request_draw_reward(Msg);

handle(?MSG_CLIENT_ALIEN_WATCH_FIGHT, _, Msg)->
	lib_player_alien:request_watch_fight(Msg);

handle(?MSG_CLIENT_ALIEN_CLOSE_SHOW, _, _)->
	lib_player_alien:request_close_interface();

handle(?MSG_CLIENT_ALIEN_CONVENE, _, Msg)->
	lib_player_alien:request_convene(Msg);

handle(_,_,_)->
	throw({error, -1}).
