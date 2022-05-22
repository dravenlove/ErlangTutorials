%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 10. Apr 2021 4:25 PM
%%%-------------------------------------------------------------------
-module(pp_country_war_task).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_COUNTRY_WAR_TASK, _, _Msg) ->
	lib_country_war_task:request_info();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

