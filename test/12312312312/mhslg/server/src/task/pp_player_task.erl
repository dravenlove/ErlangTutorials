%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_player_task
%%% Created on : 2020/12/11 11:30
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_player_task).
-author("yc").
-include("common.hrl").

%% API
-export([
  handle/3
]).


handle(?MSG_CLIENT_TASK_INFO, _, _) ->
  lib_player_task_api:request_player_task_info();

handle(?MSG_CLIENT_SUB_TASK, _, Msg) ->
  lib_player_task_api:request_player_submit_task(Msg);

handle(?MSG_CLIENT_RECORD_GUIDANCE, _, Msg) ->
  lib_player_task_api:request_record_player_guidance_info(Msg);

handle(?MSG_CLIENT_BOUNTY_MISSION, _, _Msg) ->
  lib_player_bounty_mission:request_bounty_mission();

handle(Recogn, State, _Msg)->
  ?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
  ok.
