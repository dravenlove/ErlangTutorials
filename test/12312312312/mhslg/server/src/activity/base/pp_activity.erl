%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 十二月 2019 14:24
%%%-------------------------------------------------------------------
-module(pp_activity).
-author("13661").

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_ACTIVITY_LIST, _, _Msg)->
	lib_player_activity:fetch_activity_list()
;
% handle(?MSG_CLIENT_BACK_ACT_CLICK, _, Msg)->
% 	lib_player_backstage_activity:request_activity_click(Msg)
% ;

handle(?MSG_CLIENT_ACC_RECHARGE_INFO, _, Msg)->
	lib_player_cumulative_recharge:request_info(Msg)
;
handle(?MSG_CLIENT_ACC_RECHARGE_RECEIVE, _, Msg)->
	lib_player_cumulative_recharge:request_receive(Msg)
;

%% 开服冲榜
handle(?MSG_CLIENT_OPEN_SERVER_RANK, _, Msg)->
	lib_player_open_server_rank:request_rank_info(Msg)
;
handle(?MSG_CLIENT_OPEN_SERVER_TASK, _, Msg)->
	lib_player_open_server_rank:request_task_info(Msg)
;
handle(?MSG_CLIENT_OPEN_SERVER_TASK_AWARD, _, Msg)->
	lib_player_open_server_rank:get_task_award(Msg)
;
handle(?MSG_CLIENT_OPEN_SERVER_BOX, _, Msg)->
	lib_player_open_server_rank:get_open_server_box(Msg)
;
handle(?MSG_CLIENT_OPEN_SERVER_INTERFACE, _, Msg)->
	lib_player_open_server_rank:request_interface_info(Msg)
;

handle(_,_,_)->
	throw({error, -1})
.