%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_backactivity
%%% Created on : 2020/8/25 0025 10:41
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_backactivity).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_BACKACT_INFO, _, Msg) ->
	lib_player_backactivity:request_backact_info(Msg);
handle(?MSG_CLIENT_BA_CUMULATE_RECHAREGE_DRAW, _, Msg) ->
	lib_player_ba_cumulate_recharge:request_cumulate_recharge_draw(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
