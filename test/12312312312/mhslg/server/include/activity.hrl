%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 5月 2021 16:44
%%%-------------------------------------------------------------------
-include("player.hrl").
-include("task_new.hrl").
-define(ACTIVITY_SERVER_TYPE_START,     1).
-define(ACTIVITY_SERVER_TYPE_SINGLE,    1). %% 单服活动
-define(ACTIVITY_SERVER_TYPE_CLUSTER,   2). %% 小世界活动
-define(ACTIVITY_SERVER_TYPE_WORLD,     3). %% 大世界活动
-define(ACTIVITY_SERVER_TYPE_END,       3).

-define(ACTIVITY_SYSTEM_TYPE_START,     1).
-define(ACTIVITY_SYSTEM_TYPE_INNER,     1). %% 内置活动
-define(ACTIVITY_SYSTEM_TYPE_END,       1).

-define(ACTIVITY_TERMINATION_TYPE_NORMAL, 1).	%%正常终止

%%开始: 指定赛季 
%%结束: 满足 指定持续时间 或 指定赛季
-define(ACTIVITY_TIME_TYPE_1,       1).

%%开始: 同时满足 指定具体日期时间 和 指定赛季
%%结束: 满足 指定具体日期时间 或 指定赛季
-define(ACTIVITY_TIME_TYPE_2,       2).

%%开始: 同时满足 指定节日 和 指定赛季
%%结束: 满足 指定持续时间 或 指定赛季
-define(ACTIVITY_TIME_TYPE_3,       3).

%% 提示类型
-define(TIPS_TYPE_NUM,      1). %% 数字提示，显示活动可领取次数
-define(TIPS_TYPE_FUN,      2). %% 配置提示，显示各功能配置类型
-define(TIPS_TYPE_CON,      2). %% 配置提示，显示总功能配置类型


-define(ACTIVITY_MAIN_TYPE_ACC_RECHARGE,        1003).  %% 累计充值
-define(ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK,    1009).  %% 开服冲榜

-record(activity_uid, {
    id = 0,

    server_type = 0,
    system_type = 0
}).
-record(activity_tid, {
    server_type = 0,
    system_type = 0
}).

-record(activity, {
    id = 0,

    server_type = 0,
    system_type = 0,

    main_type = 0,
    sub_type = 0,

    conf_index = 0,

    time_type = 0,

    start_date = 0,
    start_season = [0, 0, 0],
    start_festival = ["", 0, 0],

    end_date = 0,
    end_season = [0, 0, 0],
    duration_min = 0,
    
    is_initialized = false,
    is_started = false,
    is_ended = false,
    is_closed = false,

    start_tick = 0,
    daily_reset_tick = 0,

    data = undefined,

    tips_time = 0,
    tips = 0

}).

-record(activity_state, {
    is_new = false,
    is_init = false
}).


%% 开服冲榜
-record(activity_open_server,{
    map = maps:new()
}).
-record(open_server,{
    type = 0,
    map = maps:new()
}).
-record(open_server_rank,{
    player_id = 0,
    rank = 0,				%% 排名 -1 为未上榜
    rank_grade = 0,			%% 排行榜评分
    tick = 0,
    show = #player_show{},
    task_map = maps:new()
}).
-record(open_server_task,{
    task_id = 0,
    task_grade = 0,                     %% 任务评分
    state = ?TASK_STATUS_UNDONE		    %% 奖励状态(1 未完成，2 已完成,3 已领取)
}).
