%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 11月 2020 18:36
%%%-------------------------------------------------------------------
-module(pp_online_gift).
-author("df").
-include("common.hrl").

%% API
-export([
	handle/3
]).

%%请求在线奖励界面
handle(?MSG_CLIENT_ONLINE_GIFT_INFO, _, _) ->
	online_gift:request_online_gift_info();

%%请求在线奖励礼包领取
handle(?MSG_CLIENT_ONLINE_GIFT_CLICK, _, Msg) ->
	online_gift:request_online_gift_receive(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.