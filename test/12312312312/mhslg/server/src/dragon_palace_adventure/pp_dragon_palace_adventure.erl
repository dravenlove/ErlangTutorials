%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 10:09
%%%-------------------------------------------------------------------
-module(pp_dragon_palace_adventure).
-author("df").
-include("common.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_DRAGON_PALACE_INFO, _, _) ->
	lib_dragon_palace_adventure:request_dragon_palace_info()
;
handle(?MSG_CLIENT_DRAGON_PALACE_HERO, _, _) ->
	lib_dragon_palace_adventure:request_dragon_palace_hero_list()
;
handle(?MSG_CLIENT_SEND_HERO_EXPEDITIONS, _, Msg) ->
	lib_dragon_palace_adventure:send_hero_expeditions(Msg)
;
handle(?MSG_CLIENT_SEND_HERO_ROB, _, Msg) ->
	lib_dragon_palace_adventure:send_hero_rob(Msg)
;
handle(?MSG_CLIENT_LOOK_GRAND, _, _) ->
	lib_dragon_palace_adventure:look_report()
;
handle(?MSG_CLIENT_FIND_ROB_PLAYER, _, Msg) ->
	lib_dragon_palace_adventure:find_rob_player(Msg)
;
handle(?MSG_CLIENT_ASTROLOGY, _, Msg) ->
	lib_dragon_palace_adventure:request_astrology(Msg)
;
handle(?MSG_CLIENT_GET_DRAGON_PALACE_ITEM, _, Msg) ->
	lib_dragon_palace_adventure:get_dragon_palace_item(Msg)
;
handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
ok.
