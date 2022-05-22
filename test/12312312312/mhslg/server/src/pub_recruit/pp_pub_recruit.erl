%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 3:32 PM
%%%-------------------------------------------------------------------
-module(pp_pub_recruit).
-author("df").
-include("common.hrl").
%% API
-export([
	handle/3
]).

%% 请求酒馆招募信息
handle(?MSG_CLIENT_PUB_RECRUIT_INFO, _, _) ->
	lib_pub_recruit:request_pub_recruit_info();

%% 请求酒馆招募
handle(?MSG_CLIENT_PUB_RECRUIT, _, Msg) ->
	lib_pub_recruit:request_pub_recruit(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.