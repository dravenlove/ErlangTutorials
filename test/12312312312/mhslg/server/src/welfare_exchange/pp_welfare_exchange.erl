%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Sep 2021 10:18 AM
%%%-------------------------------------------------------------------
-module(pp_welfare_exchange).
-author("123").
-include("common.hrl").

%% API
-export([
  handle/3
]).


%%请求福利兑换触发
handle(?MSG_CLIENT_WELFARE_EXCHANGE_TRIGGER, _, Msg) ->
  welfare_exchange:request_welfare_exchange_trigger(Msg);

%%请求福利兑换界面列表
handle(?MSG_CLIENT_WELFARE_EXCHANGE_LISTS, _, _) ->
  welfare_exchange:request_welfare_exchange_lists();


%%请求福利兑换任务完成
handle(?MSG_CLIENT_WELFARE_EXCHANGE_FINISH, _, Msg) ->
  welfare_exchange:request_welfare_exchange_task_finish(Msg);




handle(Recogn, _PlayerState, _Msg)->
  ?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
  ok.