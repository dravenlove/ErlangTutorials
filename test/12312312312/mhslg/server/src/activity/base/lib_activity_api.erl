%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 5月 2021 15:33
%%%-------------------------------------------------------------------
-module(lib_activity_api).
-author("13661").

-include("base.hrl").
-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").
-include("ProtoPublic.hrl").

%% API
-export([   %%进程无关接口
    uid/1,                  %%UID
    tid/1,                  %%TID
    get_process_name/1,     %%获取进程名
    get_process_name/2,     %%获取进程名
    get_pid/1,              %%获取进程ID
    is_have_process/1,      %%是否有这个活动进程
    is_initialized/1,       %%活动是否已初始化
    is_started/1,           %%活动是否已开启
    is_ended/1,             %%活动是否已结束
    is_closed/1,            %%活动是否已关闭
    is_ongoing/1,           %%活动是否进行中
    start_tick/1,           %%活动的开始时间, 已开始是有效
    calc_start_tick/2,      %%计算活动开始时间
    calc_end_tick/3,        %%计算活动结束时间
    calc_end_tick/4,        %%计算活动结束时间
    delete_surplus/1,       %%跨进程发送删除多余数据
    activity_to_proto/1,
    activity_to_proto_no_tip/1,
    uid_to_proto/1,
    tid_to_proto/1
]).
-export([   %%进程无关接口
    conf_index/1
]).
-export([   %%活动进程使用接口
    activity_info/1,        %%获取活动信息
    activity_data/1,        %%获取活动data
    update_activity_data/2, %%更新活动data
    player_async_apply/4    %%玩家进行异步执行
]).

uid(Detail) when is_record(Detail, activity_detail) ->
    #activity_uid{
        id = Detail#activity_detail.id,
        system_type = Detail#activity_detail.system_type,
        server_type = Detail#activity_detail.server_type
    }
;
uid(ProtoUID) when is_record(ProtoUID, 'ProtoActivityUID') ->
    #activity_uid{
        id = ProtoUID#'ProtoActivityUID'.id,
        system_type = ProtoUID#'ProtoActivityUID'.system_type,
        server_type = ProtoUID#'ProtoActivityUID'.server_type
    }
;
uid(Activity) when is_record(Activity, activity) ->
    #activity_uid{
        id = Activity#activity.id,
        system_type = Activity#activity.system_type,
        server_type = Activity#activity.server_type
    }
.

tid(Detail) when is_record(Detail, activity_detail) ->
    #activity_tid{
        system_type = Detail#activity_detail.system_type,
        server_type = Detail#activity_detail.server_type
    }
;
tid(Activity) when is_record(Activity, activity) ->
    #activity_tid{
        system_type = Activity#activity.system_type,
        server_type = Activity#activity.server_type
    }
;
tid(ProtoTID) when is_record(ProtoTID, 'ProtoActivityTID') ->
    #activity_tid{
        system_type = ProtoTID#'ProtoActivityTID'.system_type,
        server_type = ProtoTID#'ProtoActivityTID'.server_type
    }
;
tid(UID) when is_record(UID, activity_uid) ->
    #activity_tid{
        system_type = UID#activity_uid.system_type,
        server_type = UID#activity_uid.server_type
    }
.

get_process_name(SystemType, Index) ->
    util:to_atom( "mod_activity_" ++ lib_types:to_list(SystemType) ++ "_" ++ lib_types:to_list(Index))
.
get_process_name(Activity) when is_record(Activity, activity) ->
    get_process_name(uid(Activity))
;
get_process_name(UID) when is_record(UID, activity_uid) ->
    case UID#activity_uid.system_type of
        ?ACTIVITY_SYSTEM_TYPE_INNER ->
            get_process_name(?ACTIVITY_SYSTEM_TYPE_INNER, UID#activity_uid.id)
    end
.

get_pid(UID) ->
	ProcessName = get_process_name(UID),
	erlang:whereis(ProcessName)
.

is_have_process(UID) ->
    Pid = get_pid(UID#activity_uid.id),
	case is_pid(Pid) of
		false -> false;
		true -> is_process_alive(Pid)
	end
.

is_initialized(Activity) ->
    Activity#activity.is_initialized
.

is_started(Activity) ->
    Activity#activity.is_started
.

is_ended(Activity) ->
    Activity#activity.is_ended
.

is_closed(Activity) ->
    Activity#activity.is_closed
.

is_ongoing(Activity) when is_record(Activity, activity) ->
	is_started(Activity) andalso not is_ended(Activity) andalso not is_closed(Activity)
.

start_tick(Activity) ->
    Activity#activity.start_tick
.

validate_season(ConfSeason, ConfDay, ConfHM, CurTick) ->
    try
        {CurSeason, CurDay} = lib_season_api:season_info(CurTick),
        ValidateSeason = CurSeason > ConfSeason orelse (CurSeason =:= ConfSeason andalso CurDay >= ConfDay),
        ?JUDGE_RETURN(ValidateSeason, false),

        ConfH = ConfHM div 100,
        ConfM = ConfHM rem 100,
        ConfSec = lib_timer:hour_second() * ConfH + lib_timer:minute_second() * ConfM,

        {_, {CurH, CurM, _}} = lib_timer:to_localtime(CurTick),
        CurSec = lib_timer:hour_second() * CurH + lib_timer:minute_second() * CurM,

        CurSec >= ConfSec
    catch
        throw: {error, Flag} -> Flag
    end
.

calc_start_tick(Activity, CurTick) ->
    try
        case Activity#activity.time_type of
            ?ACTIVITY_TIME_TYPE_1 ->
                [ConfSeason, ConfDay, ConfHM] = Activity#activity.start_season,
                {CurSeason, CurDay} = lib_season_api:season_info(CurTick),
                ?JUDGE_RETURN(CurSeason =:= ConfSeason andalso CurDay >= ConfDay, {false, 0}),
                ConfDayTick = CurTick - (CurDay - ConfDay) * lib_timer:day_second(),
                ConfZeroTick = lib_timer:current_zero_unixtime(ConfDayTick),    

                ConfH = ConfHM div 100,
                ConfM = ConfHM rem 100,
                ConfSec = lib_timer:hour_second() * ConfH + lib_timer:minute_second() * ConfM,

                StartTick = ConfZeroTick + ConfSec,
                {CurTick >= StartTick, StartTick};
            ?ACTIVITY_TIME_TYPE_2 ->
                ConfStartTick = Activity#activity.start_date,
                ?JUDGE_RETURN(CurTick >= ConfStartTick, {false, 0}),

                [ConfSeason, ConfDay, ConfHM] = Activity#activity.start_season,
                ValidateFlag = validate_season(ConfSeason, ConfDay, ConfHM, CurTick),

                ?IIF(ValidateFlag, {true, ConfStartTick}, {false, 0});
            ?ACTIVITY_TIME_TYPE_3 ->
                [ConfHoliday, ConfDay, ConfHM] = Activity#activity.start_festival,
                ConfHolidayList = unicode:characters_to_list(ConfHoliday, utf8),
                HolidayTick = lib_season_and_days_api:holiday_tick(ConfHolidayList, CurTick),
                ConfH = ConfHM div 100,
                ConfM = ConfHM rem 100,
                ConfSec = lib_timer:day_second() * ConfDay + lib_timer:hour_second() * ConfH + lib_timer:minute_second() * ConfM,
                StartTick = HolidayTick + ConfSec,
                {CurTick >= StartTick, StartTick}
        end
    catch
        throw: {error, Result} -> Result
    end
.

calc_end_tick(Activity, CurTick, StartTick) ->
    {_, EndTick} = calc_end_tick(Activity, CurTick, StartTick, false),
    EndTick
.
calc_end_tick(Activity, CurTick, StartTick, ValidateSeason) ->
    try
        case Activity#activity.time_type of
            ?ACTIVITY_TIME_TYPE_1 -> 
                DurationSec = Activity#activity.duration_min * lib_timer:minute_second(),
                EndTick = StartTick + DurationSec,
                ?JUDGE_RETURN(CurTick < EndTick, {true, EndTick}),
                ?JUDGE_RETURN(ValidateSeason, {false, EndTick}),

                [ConfSeason, ConfDay, ConfHM] = Activity#activity.end_season,
                ValidateFlag = validate_season(ConfSeason, ConfDay, ConfHM, CurTick),
                
                ?IIF(ValidateFlag, {true, CurTick}, {false, 0});
            ?ACTIVITY_TIME_TYPE_2 ->
                ConfEndTick = Activity#activity.end_date,
                ?JUDGE_RETURN(CurTick < ConfEndTick, {true, ConfEndTick}),
                ?JUDGE_RETURN(ValidateSeason, {false, ConfEndTick}),

                [ConfSeason, ConfDay, ConfHM] = Activity#activity.end_season,
                ValidateFlag = validate_season(ConfSeason, ConfDay, ConfHM, CurTick),
                
                ?IIF(ValidateFlag, {true, CurTick}, {false, 0});
            ?ACTIVITY_TIME_TYPE_3 ->
                DurationSec = Activity#activity.duration_min * lib_timer:minute_second(),
                EndTick = StartTick + DurationSec,
                ?JUDGE_RETURN(CurTick < EndTick, {true, EndTick}),
                ?JUDGE_RETURN(ValidateSeason, {false, EndTick}),

                [ConfSeason, ConfDay, ConfHM] = Activity#activity.end_season,
                ValidateFlag = validate_season(ConfSeason, ConfDay, ConfHM, CurTick),
                
                ?IIF(ValidateFlag, {true, CurTick}, {false, 0});
            _ -> {false, 0}
        end 
    catch
        throw: {error, Result} -> Result
    end
.

%% 去掉多余的信息
delete_surplus(Activity) when is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> Activity#activity{
			data = undefined
		}
	end
.

activity_to_proto(Activity) when is_record(Activity, activity) ->
    StartTick = start_tick(Activity),
    NowTick = lib_timer:unixtime(),
    EndTick = calc_end_tick(Activity, NowTick, StartTick),
    {TipsType, Tips} = activity_tips(Activity, NowTick - StartTick),
	#'ProtoActivity'{
		id = Activity#activity.id,
        server_type = Activity#activity.server_type,
        system_type = Activity#activity.system_type,
		main_type = Activity#activity.main_type,
		sub_type = Activity#activity.sub_type,
		start_tick = StartTick,
		end_tick = EndTick,
        time = EndTick - NowTick,
        tips_type = TipsType,
        tips = Tips
	}
.

activity_to_proto_no_tip(Activity) when is_record(Activity, activity) ->
    StartTick = start_tick(Activity),
    NowTick = lib_timer:unixtime(),
    EndTick = calc_end_tick(Activity, NowTick, StartTick),
    #'ProtoActivity'{
        id = Activity#activity.id,
        server_type = Activity#activity.server_type,
        system_type = Activity#activity.system_type,
        main_type = Activity#activity.main_type,
        sub_type = Activity#activity.sub_type,
        start_tick = StartTick,
        end_tick = EndTick,
        time = EndTick - NowTick,
        conf_index = Activity#activity.conf_index
    }
.

activity_tips(Activity, Time) ->
    try
        case Activity#activity.main_type of
            ?ACTIVITY_MAIN_TYPE_ACC_RECHARGE ->
                UID = lib_activity_api:uid(Activity),
                case lib_player_cumulative_recharge:tips(UID) of
                    0 -> skip;
                    Num -> throw({?TIPS_TYPE_NUM, Num})
                end;
            ?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK ->
                UID = lib_activity_api:uid(Activity),
                case lib_player_open_server_rank:tips(UID,lib_player:player_id()) of
                    0 -> skip;
                    Num -> throw({?TIPS_TYPE_NUM, Num})
                end;
            _Data -> skip
        end,
        case Activity#activity.data of
            undefined -> skip;
            _Data1 -> throw({?TIPS_TYPE_FUN, 0})
        end,
        case Activity#activity.tips_time * 60 < Time of
            true -> skip;
            false -> throw({?TIPS_TYPE_CON, Activity#activity.tips})
        end,
        {0, 0}
    catch
        throw:Result -> Result
    end

.


uid_to_proto(UID) when is_record(UID, activity_uid) ->
    #'ProtoActivityUID'{
        id = UID#activity_uid.id,
        server_type = UID#activity_uid.server_type,
        system_type = UID#activity_uid.system_type
    }
.

tid_to_proto(TID) when is_record(TID, activity_tid) ->
    #'ProtoActivityTID'{
        server_type = TID#activity_tid.server_type,
        system_type = TID#activity_tid.system_type
    }
.

conf_index(Activity) when is_record(Activity, activity) ->
    Activity#activity.conf_index
.

activity_info(ActId) ->
    mod_activity:get_activity(ActId)
.

activity_data(ActId) ->
    Activity = activity_info(ActId),
    Activity#activity.data
.

update_activity_data(ActId, Data) ->
    Activity = activity_info(ActId),
    NewActivity = Activity#activity{data = Data},
    mod_activity:put_activity(NewActivity)
. 

player_async_apply(ServerFlag, PlayerId, Fun, Args) ->
	lib_cluster_send:player_async_apply(ServerFlag, PlayerId, Fun, Args)
.