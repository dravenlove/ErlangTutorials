%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 16:35
%%%-------------------------------------------------------------------
-module(pp_troops).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_TROOPS_LIST, _, _Msg) ->
	lib_player_troops:request_player_troops();
handle(?MSG_CLIENT_TROOPS_HERO_LIST, _, _Msg) ->
	lib_player_troops:request_not_create_hero_list();
handle(?MSG_CLIENT_CREATE_TROOPS, _, Msg) ->
	lib_player_troops:request_troops_create(Msg);
handle(?MSG_CLIENT_DISSOLUTION_TROOPS, _, Msg) ->
	lib_player_troops:request_troops_dissolve(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH, _, Msg) ->
	lib_player_troops:request_troops_march_consume(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_GO, _, Msg) ->
	lib_player_troops:request_troops_depart(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_GO_QUICKEN, _, Msg) ->
	lib_player_troops:request_troops_quicken(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_GO_BACK, _, Msg) ->
	lib_player_troops:request_troops_recall(Msg);
handle(?MSG_CLIENT_ONE_TROOPS_MARCH, _, Msg) ->
	lib_player_troops:request_one_troops(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_REPAIR, _, Msg) ->
	lib_player_troops:request_troops_repair(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_EXTRUDE, _, Msg) ->
	lib_player_troops:request_troops_extrude(Msg);
handle(?MSG_CLIENT_TROOPS_MARCH_WITHDRAW, _, Msg) ->
	lib_player_troops:request_troops_withdraw(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

