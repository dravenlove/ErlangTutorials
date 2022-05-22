%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 六月 2021 14:07
%%%-------------------------------------------------------------------
-module(lib_activity_handle).
-author("13661").

-include("base.hrl").
-include("activity.hrl").
-include("common.hrl").
%% API
-compile(export_all).

%% API
-export([
	process_activity_init/1,		%%活动初始化
	process_activity_start/1,		%%活动开始
	process_activity_end/1,		 	%%活动结束
	process_activity_daily_reset/2,	%%活动每日重置
	% before_activity_reset/1,		%%在活动重置之前
	% after_activity_reset/1,			%%在活动重置之后
	% before_activity_modify/1,		%%在活动修改之前
	% after_activity_modify/1,		%%在活动修改之后
	process_activity_close/1,		%%活动关闭
	% process_activity_timeout/2,		%%活动超时
	process_activity_process_start/2,	%%活动进程启动
	process_activity_process_termination/2	%%活动进行终止
	% modify_activity_data/2,			%%修改活动数据
	% reset_activity_data/2			%%重置活动数据
]).

get_activity(ActId) ->
	mod_activity:get_activity(ActId)
.

%%初始化活动data
process_activity_init(ActId) ->
	?INFO("process_activity_init ~p",[ActId]),
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> lib_open_server_rank:init_activity(Activity);
		_ -> lib_activity_default:process_activity_init(ActId)
	end
.

%%处理活动开始
process_activity_start(ActId) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_start(ActId)
	end
.

%%处理活动结束
process_activity_end(ActId) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_end(ActId)
	end
.

%%处理活动每天重置
% CurTick : 当前时间
process_activity_daily_reset(ActId, CurTick) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_daily_reset(ActId, CurTick)
	end
.

% %%在活动重置之前
% before_activity_reset(ActId) ->
% 	Activity = get_activity(ActId),
% 	case Activity#activity.main_type of
% 		_ -> lib_activity_default:before_activity_reset(ActId)
% 	end
% .

% %%在活动重置之后
% after_activity_reset(ActId) ->
% 	Activity = get_activity(ActId),
% 	case Activity#activity.main_type of
% 		_ -> lib_activity_default:after_activity_reset(ActId)
% 	end
% .

% %%在活动修改之前
% before_activity_modify(ActId) ->
% 	Activity = get_activity(ActId),
% 	case Activity#activity.main_type of
% 		_ -> lib_activity_default:before_activity_modify(ActId)
% 	end
% .

% %%在活动修改之后
% after_activity_modify(ActId) ->
% 	Activity = get_activity(ActId),
% 	case Activity#activity.main_type of
% 		_ -> lib_activity_default:after_activity_modify(ActId)
% 	end
% .

%%处理活动关闭
process_activity_close(ActId) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_close(ActId)
	end
.

%%处理活动超时
%% CurTick : 当前时间
% process_activity_timeout(ActId, CurTick) ->
% 	Activity = get_activity(ActId),
% 	case Activity#activity.main_type of
% 		_ -> lib_activity_default:process_activity_timeout(ActId, CurTick)
% 	end
% .

%%处理活动进程启动
%% IsNew : 是否是新活动
process_activity_process_start(ActId, IsNew) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_process_start(ActId, IsNew)
	end
.

%%处理活动进程终止
%% TerminationType : 终止类型
process_activity_process_termination(ActId, TerminationType) ->
	Activity = get_activity(ActId),
	case Activity#activity.main_type of
		_ -> lib_activity_default:process_activity_process_termination(ActId, TerminationType)
	end
.

%%修改活动数据
%% NewActivity : 新活动
%% OldActivity : 老活动
% modify_activity_data(NewActivity, OldActivity) ->
% 	case OldActivity#activity.main_type of
% 		_ -> reset_activity_data(NewActivity, OldActivity)
% 	end
% .

% %%重置活动数据
% %% NewActivity : 新活动
% %% OldActivity : 老活动
% reset_activity_data(NewActivity, _OldActivity) ->
% 	case NewActivity#activity.main_type of
% 		_ -> NewActivity#activity.data
% 	end
% .