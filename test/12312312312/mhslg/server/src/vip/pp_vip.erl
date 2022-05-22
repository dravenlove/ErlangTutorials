%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_vip
%%% Created on : 2020/8/28 0028 17:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_vip).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_VIP_PANNEL, _, _Msg) ->
	lib_player_vip:request_vip_pannel();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
