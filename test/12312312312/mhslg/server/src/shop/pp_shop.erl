%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 三月 2021 20:48
%%%-------------------------------------------------------------------
-module(pp_shop).
-author("13661").

-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_SHOP_INFO, _, Msg) ->
	lib_player_shop:request_info(Msg);
handle(?MSG_CLIENT_SHOP_BUY, _, Msg) ->
	lib_player_shop:request_buy(Msg);
handle(?MSG_CLIENT_SHOP_REFRESH, _, Msg) ->
	lib_player_shop:request_refresh(Msg);
handle(?MSG_CLIENT_BUY_LIMIT, _, Msg) ->
	lib_player_shop:request_refresh(Msg);

handle(Recogn, State, _Msg)->
  ?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
  ok.
