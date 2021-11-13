%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_task_system
%%% Created on : 2021/2/19 10:16
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_task_system).
-author("yc").
-include("common.hrl").

%% API
-export([
  handle/3
]).

%%handle(?MSG_CLIENT_TASK_SYSTEM_LIST, _, _Msg)->
%%  lib_player_task_system:fetch_task_system_list()
%%;
%%handle(?MSG_CLIENT_REQUEST_TASK_SYSTEM,_, Msg) ->
%%  lib_player_task_system:request_task_system_click(Msg)
%%;
%%handle(?MSG_CLIENT_COUNTRY_TASK_INFO,_, Msg) ->
%%  lib_player_task_system:request_task_system_click(Msg)
%%;
%%
%%handle(?MSG_RETURN_COUNTRY_TASK_INFO,_, Msg) ->
%%  lib_player_task_system:request_task_system_click(Msg)
%%;


handle(_,_,_)->
  throw({error, -1})
.