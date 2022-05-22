%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Jan 2021 2:48 PM
%%%-------------------------------------------------------------------
-module(pp_logistics_center).
-author("df").
-include("common.hrl").

%% API
-export([
	handle/3
]).

%%请求后勤中心信息
handle(?MSG_CLIENT_LOGISTICS_CENTER_INFO, _, _) ->
	lib_logistics_center:request_logistics_center_info();

%%请求购买资源
handle(?MSG_CLIENT_BUY_RESOURCE, _, Msg) ->
	lib_logistics_center:request_buy_resource(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.