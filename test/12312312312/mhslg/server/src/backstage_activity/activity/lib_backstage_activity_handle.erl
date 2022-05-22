%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 九月 2020 16:26
%%%-------------------------------------------------------------------
-module(lib_backstage_activity_handle).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").

%% API
-export([
	process_activity_init/0,		%%活动初始化
	process_activity_start/0,		%%活动开始
	process_activity_end/0,			%%活动结束
	process_activity_daily_reset/1,	%%活动每日重置
	before_activity_reset/0,		%%在活动重置之前
	after_activity_reset/0,			%%在活动重置之后
	before_activity_modify/0,		%%在活动修改之前
	after_activity_modify/0,		%%在活动修改之后
	process_activity_close/0,		%%活动关闭
	process_activity_timeout/1,		%%活动超时
	process_activity_process_start/1,	%%活动进程启动
	process_activity_process_termination/1,	%%活动进行终止
	modify_activity_data/2,			%%修改活动数据
	reset_activity_data/2			%%重置活动数据
]).

get_activity() ->
	mod_backstage_activity:get_activity()
.

%%初始化活动data
process_activity_init() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_init()
	end
.

%%处理活动开始
process_activity_start() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_start()
	end
.

%%处理活动结束
process_activity_end() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_end()
	end
.

%%处理活动每天重置
%% CurTick : 当前时间
process_activity_daily_reset(CurTick) ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_daily_reset(CurTick)
	end
.

%%在活动重置之前
before_activity_reset() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:before_activity_reset()
	end
.

%%在活动重置之后
after_activity_reset() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:after_activity_reset()
	end
.

%%在活动修改之前
before_activity_modify() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:before_activity_modify()
	end
.

%%在活动修改之后
after_activity_modify() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:after_activity_modify()
	end
.

%%处理活动关闭
process_activity_close() ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_close()
	end
.

%%处理活动超时
%% CurTick : 当前时间
process_activity_timeout(CurTick) ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_timeout(CurTick)
	end
.

%%处理活动进程启动
%% IsNew : 是否是新活动
process_activity_process_start(IsNew) ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_process_start(IsNew)
	end
.

%%处理活动进程终止
%% TerminationType : 终止类型
process_activity_process_termination(TerminationType) ->
	Activity = get_activity(),
	case Activity#activity.main_type of
		_ -> lib_backstage_activity_default:process_activity_process_termination(TerminationType)
	end
.

%%修改活动数据
%% NewActivity : 新活动
%% OldActivity : 老活动
modify_activity_data(NewActivity, OldActivity) ->
	case OldActivity#activity.main_type of
		_ -> reset_activity_data(NewActivity, OldActivity)
	end
.

%%重置活动数据
%% NewActivity : 新活动
%% OldActivity : 老活动
reset_activity_data(NewActivity, _OldActivity) ->
	case NewActivity#activity.main_type of
		_ -> NewActivity#activity.data
	end
.