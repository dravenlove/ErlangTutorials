%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_recharge
%%% Created on : 2020/8/28 0028 11:31
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_recharge).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_RECHARGE_INFO, _, _Msg) ->
	lib_player_recharge:notify_recharge_info();



handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
