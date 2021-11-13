%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 4:11 PM
%%%-------------------------------------------------------------------
-module(pp_city_industry).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).

%%请求产业信息
handle(?MSG_CLIENT_CITY_INDUSTRY_INFO, _, Msg) ->
	lib_player_city_industry:request_city_industry_info(Msg);

%%请求产业操作
handle(?MSG_CLIENT_CITY_INDUSTRY_OPERATION, _, Msg) ->
	lib_player_city_industry:request_city_industry_operation(Msg);

%%请求占领产业
handle(?MSG_CLIENT_CITY_INDUSTRY_HOLD, _, Msg) ->
	lib_player_city_industry:request_city_industry_hold(Msg);

%%请求英雄作业
handle(?MSG_CLIENT_HERO_INDUSTRY_WORK, _, Msg) ->
	lib_player_city_industry:request_hero_industry_work(Msg);

%%请求产业信息
handle(?MSG_CLIENT_ONE_CITY_INDUSTRY_INFO, _, Msg) ->
	lib_player_city_industry:request_one_city_industry_info(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.