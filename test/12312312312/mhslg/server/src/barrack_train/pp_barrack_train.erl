%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dec 2020 3:59 PM
%%%-------------------------------------------------------------------
-module(pp_barrack_train).
-author("df").
-include("common.hrl").
%% API
-export([
	handle/3
]).

%% 请求训练士兵
handle(?MSG_CLIENT_TRAIN_SOLDIER, _, Msg) ->
	lib_barrack_train:request_barrack_train(Msg);

%% 请求兵营信息
handle(?MSG_CLIENT_BARRACK_INFO, _, Msg) ->
	lib_barrack_train:request_get_barrack_info(Msg);

%% 请求训练士兵加速
handle(?MSG_CLIENT_TRAIN_SOLDIER_ACCELERATE, _, Msg) ->
	lib_barrack_train:request_train_accelerate(Msg);

%% 自动训练
handle(?MSG_CLIENT_AUTO_TRAIN, _, Msg) ->
	lib_barrack_train:auto_train(Msg);

%% 领取士兵
handle(?MSG_CLIENT_GET_SOLDIER, _, Msg) ->
	lib_barrack_train:get_soldier(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.