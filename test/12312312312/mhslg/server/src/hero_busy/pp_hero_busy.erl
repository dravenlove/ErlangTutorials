%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Feb 2021 5:44 PM
%%%-------------------------------------------------------------------
-module(pp_hero_busy).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).

%%请求英雄管理信息
handle(?MSG_CLIENT_HERO_BUSY_INFO, _, _Msg) ->
	lib_player_hero_busy:request_hero_busy_info();

%%请求英雄忙碌加速
handle(?MSG_CLIENT_HERO_BUSY_QUICKEN, _, Msg) ->
	lib_player_hero_busy:request_hero_busy_quicken(Msg);

%%请求完成事件
handle(?MSG_CLIENT_HERO_FINISH_INCIDENT, _, Msg) ->
	lib_player_hero_busy:request_hero_finish_incident(Msg);

%%请求一键收获
handle(?MSG_CLIENT_ONE_KEY_GET, _, _Msg) ->
	lib_player_hero_busy:request_one_key_get();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

