%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 6月 2021 10:54
%%%-------------------------------------------------------------------
-module(pp_star).
-author("df").
-include("common.hrl").

%% API
-export([handle/3]).


handle(?MSG_CLIENT_STAR_SHOP, _, _) ->
	lib_star_stop:get_star_stop();

handle(?MSG_CLIENT_STAR_ASTROLOGY, _, Msg) ->
	lib_star_stop:star_astrology(Msg);

handle(?MSG_CLIENT_STAR_RESOLVE, _, Msg) ->
	lib_star_stop:star_resolve(Msg);

handle(?MSG_CLIENT_STAR_MAX_LV, _, _) ->
	lib_star_hero:get_star_max_lv();

handle(?MSG_CLIENT_UPDATE_STAR_ITEM, _, Msg) ->
	lib_star_hero:update_star_item(Msg);

handle(?MSG_CLIENT_UPGRADE_STAR_ITEM, _, Msg) ->
	lib_star_hero:upgrade_star_item(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.