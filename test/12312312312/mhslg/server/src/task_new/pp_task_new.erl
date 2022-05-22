%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. 4月 2021 11:41
%%%-------------------------------------------------------------------
-module(pp_task_new).
-author("xuyonghui").
-include("common.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_PLAYER_TASK_INFO, _, Msg)->
	lib_player_task_new:request_player_task_info(Msg)
;
handle(?MSG_CLIENT_SUBMIT_TASK,_, Msg) ->
	lib_player_task_new:request_submit_task(Msg)
;
handle(?MSG_CLIENT_DRAW_CHAPTER_REWARD,_, _Msg) ->
	lib_player_chapter_task:request_draw_chapter_task_reward()
;
handle(?MSG_CLIENT_ACCEPT_TASK,_, Msg) ->
	lib_player_task_new:request_accept_task(Msg)
;
handle(?MSG_CLIENT_ABANDON_TASK,_, Msg) ->
	lib_player_task_new:request_abandon_task(Msg)
;
handle(?MSG_CLIENT_BUY_TASK_TIMES,_, Msg) ->
	lib_player_task_new:request_buy_task_times(Msg)
;
handle(?MSG_CLIENT_TASK_DONATE,_, Msg) ->
	lib_player_task_new:request_task_donate(Msg)
;
handle(?MSG_CLIENT_TASK_REFRESH,_, Msg) ->
	lib_player_task_new:request_refresh_task(Msg)
;
handle(?MSG_CLIENT_TASK_GRADE,_, Msg) ->
	lib_player_task_new:request_upgrade_task_grade(Msg)
;

handle(Recogn, State, _Msg) ->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.