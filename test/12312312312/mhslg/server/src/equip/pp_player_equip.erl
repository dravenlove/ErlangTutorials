%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. Dec 2020 3:36 PM
%%%-------------------------------------------------------------------
-module(pp_player_equip).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([handle/3]).


handle(?MSG_CLIENT_HERO_EQUIP, _, Msg) ->
	lib_player_equip:request_hero_equip(Msg);
handle(?MSG_CLIENT_HERO_USE_EQUIP, _, Msg) ->
	lib_player_equip:request_hero_use_equip(Msg);
handle(?MSG_CLIENT_HERO_UNFIX_EQUIP, _, Msg) ->
	lib_player_equip:request_hero_unfix_equip(Msg);
handle(?MSG_CLIENT_EQUIP_UP, _, Msg) ->
	lib_player_equip:request_equip_up(Msg);
handle(?MSG_CLIENT_EQUIP_BREAK, _, Msg) ->
	lib_player_equip:request_equip_break(Msg);
handle(?MSG_CLIENT_EQUIP_WASH_INFO, _, Msg) ->
	lib_player_equip:request_equip_wash_info(Msg);
handle(?MSG_CLIENT_EQUIP_BREAK_QUICKEN, _, Msg) ->
	lib_player_equip:request_equip_break_quicken(Msg);
handle(?MSG_CLIENT_EQUIP_BREAK_GET, _, Msg) ->
	lib_player_equip:request_equip_break_get(Msg);
handle(?MSG_CLIENT_EQUIP_WASH_LOCK, _, Msg) ->
	lib_player_equip:request_equip_wash_lock(Msg);
handle(?MSG_CLIENT_EQUIP_WASH, _, Msg) ->
	lib_player_equip:request_equip_wash(Msg);
handle(?MSG_CLIENT_EQUIP_WASH_REPLACE, _, Msg) ->
	lib_player_equip:request_equip_wash_replace(Msg);
handle(?MSG_CLIENT_EQUIP_WASH_GOLD_FINGER, _, Msg) ->
	lib_player_equip:request_equip_wash_gold_finger(Msg);
handle(?MSG_CLIENT_EQUIP_WASH_GOLD_FINGER_SAVE, _, Msg) ->
	lib_player_equip:request_equip_gold_finger_save(Msg);
handle(?MSG_CLIENT_EQUIP_MAKE_INFO, _, _Msg) ->
	lib_player_equip:request_equip_make_info();
handle(?MSG_CLIENT_EQUIP_MAKE, _, Msg) ->
	lib_player_equip:request_equip_make(Msg)
;
handle(?MSG_CLIENT_CORE_EQUIP_LEVEL, _, Msg) ->
	lib_player_equip:request_equip_make(Msg)
;

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.






