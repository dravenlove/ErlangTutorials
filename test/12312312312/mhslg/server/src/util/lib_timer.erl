%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_timer
%%% Created on : 2020/7/29 0029 19:33
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%  处理时间相关的接口
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_timer).
-author("glendy").
-include("common.hrl").

%% API
-export([
	sleep/1,
	unixtime_ms/0,
	unixtime/0,
	unixtime/1,
	to_localtime/1,
	minute_second/0,
	hour_second/0,
	day_second/0,
	week_second/0,
	now_hour/0,
	next_min_time/0,
	next_min_time/1,
	next_10min_time/0,
	next_hour_time/0,
	next_hour_time/1,
	next_zero_time/0,
	next_five_time/0,
	next_six_time/0,
	next_nine_time/0,
	annual_award_time/0,
	submit_tax_time/0,
	pay_tribute_time/0,
	meritorious_rank_time/0,
	next_meritorious_rank_time/1,
    next_refresh_time/0,
	next_refresh_time/1,
	prev_refresh_tick/1,
	cur_refresh_tick/1,
	next_refresh_tick/1,
	refresh_time/0,
	next_week_time/0,
	next_week_zero_time/0,
	next_week_zero_time/1,
	next_month_time/0,
	next_month_zero_time/0,
	next_month_zero_time/1,
	next_time_second/1,
	current_zero_unixtime/0,
	current_zero_unixtime/1,
	next_zero_unixtime/0,
	current_hour_unixtime/1,
	next_hour_unixtime/1,			%% 下一个整点的时间戳
	prev_hour_unixtime/2,
	cur_hour_unixtime/2,
	next_hour_unixtime/2,
	is_same_day/2,
	is_same_week/2,
	is_same_month/2,
	is_same_hour/2,
	last_time_second/1,
	get_diff_days/2,
	get_diff_days/1,
	next_time_unixtime/2
]).

%% 单位毫秒
sleep(T) ->
	timer:sleep(T).

%% 获取时间戳, 单位毫秒
unixtime_ms() ->
	{M,S,MM} = os:timestamp(),
	(M * 1000000 + S) * 1000 + MM div 1000.

%% 获取当前时间戳,单位秒
unixtime() ->
	{M,S,_MM} = os:timestamp(),
	M * 1000000 + S.

%% {{Y,M,D},{H,M,S}}日期转时间戳, 单位秒
unixtime({{_, _, _},{_, _, _}} = DateTime) ->
	calendar:datetime_to_gregorian_seconds(DateTime) - calendar:datetime_to_gregorian_seconds(calendar:universal_time_to_local_time({{1970,1,1}, {0,0,0}})).

%% 时间戳转日期
to_localtime(Tick) ->
	calendar:now_to_local_time({Tick div 1000000, Tick rem 1000000, 0}).

minute_second() ->
	60.
hour_second() ->
	3600.
day_second() ->
	3600 * 24.
week_second() ->
	3600 * 24 * 7.

next_min_time() ->
	next_min_time(unixtime())	
.
next_min_time(Tick) ->
	{_, {_,_,S}} = to_localtime(Tick),
	case S > 58 of
		true ->
			(60 - S) + 60;
		false ->
			60 - S
	end
.

now_hour() ->
	{H,_M,_S} = erlang:time(),
	H
.

%% 距离传入时间的秒数
next_time_second(Time) ->
	{H, M, S} = erlang:time(),
	case (H  * 3600 + M * 60 + S) >= Time of
		true ->
			86400 - (H  * 3600 + M * 60 + S) + Time;
		false ->
			Time - (H * 3600 + M * 60 + S)
	end.

last_time_second(Time) ->
	{H, M, S} = erlang:time(),
	NowTime = H * 3600 + M * 60 + S,
	case NowTime >= Time of
		true ->
			NowTime - Time;
		false ->
			86400 - Time + NowTime
	end
.

next_10min_time() ->
	{_H,M,S} = erlang:time(),
	M2 = M rem 10,
	case M2 == 9 andalso S > 55 of
		true ->
			600 + (600 - (M2 * 60 + S));
		false ->
			600 - (M2 * 60 + S)
	end.

%% 距离下个整点的秒数
next_hour_time() ->
	next_hour_time(unixtime()).
%%	{_H,M,S} = erlang:time(),
%%	case M == 59 andalso S > 55 of
%%		true ->
%%			3600 + 60 - S;
%%		false ->
%%			3600 - (M * 60 + S)
%%	end.
next_hour_time(Tick) ->
	{_, {_, M, S}} = to_localtime(Tick),
	3600 - (M * 60 + S).

%% 距离下个零晨的秒数
next_zero_time() ->
	{H,M,S} = erlang:time(),
	case H == 23 andalso M == 59 andalso S > 50 of
		true ->
			86400 + 60 - S;
		false ->
			86400 - (H * 3600 + M * 60 + S)
	end.

%% 距离下个五点的秒数
next_five_time() ->
	{H, M, S} = erlang:time(),
	case H >= 5 of
		true ->
			86400 - ((H - 5) * 3600 + M * 60 + S);
		false ->
			5 * 3600 - (H * 3600 + M * 60 + S)
	end.

next_refresh_time() ->
	Refresh_time = refresh_time(),
	next_time_second(Refresh_time)
.

%% 距离下个系统通用刷新时间的秒数
next_refresh_time(Login_tick) ->
	Refresh_time = refresh_time(),
	next_time_second(Login_tick,Refresh_time)
.

prev_refresh_tick(Tick) ->
	Time = refresh_time(),
	prev_time_unixtime(Time, Tick)
.

cur_refresh_tick(Tick) ->
	Time = refresh_time(),
	cur_time_unixtime(Time, Tick)
.

next_refresh_tick(Tick) ->
	Time = refresh_time(),
	next_time_unixtime(Time, Tick)
.


refresh_time() ->
	maps:get(timevalue, tb_const:get(refresh_time))
.
%% 距离传入时间的秒数
next_time_second(Tick,Time) ->
	{_,{H, M, S}} = to_localtime(Tick),
	case (H  * 3600 + M * 60 + S) >= Time of
		true ->
			86400 - (H  * 3600 + M * 60 + S) + Time;
		false ->
			Time - (H * 3600 + M * 60 + S)
	end.



%% 距离下个六点的秒数
next_six_time() ->
	{H, M, S} = erlang:time(),
	case H >= 6 of
		true ->
			86400 - ((H - 6) * 3600 + M * 60 + S);
		false ->
			6 * 3600 - (H * 3600 + M * 60 + S)
	end.

%% 距离下个21点的秒数
next_nine_time() ->
	{H, M, S} = erlang:time(),
	case H >= 21 of
		true ->
			86400 - ((H - 21) * 3600 + M * 60 + S);
		false ->
			21 * 3600 - (H * 3600 + M * 60 + S)
	end.


%% 距离下个战功排行榜发放奖励时间的秒数
meritorious_rank_time() ->
	maps:get(timevalue, tb_meritorious_award_const:get(restet_time))
.
next_meritorious_rank_time(Tick) ->
	Refresh_time = meritorious_rank_time(),
	next_time_second(Tick,Refresh_time)
.

%% 距离下个年度宝箱奖励结算时间的秒数
annual_award_time() ->
	maps:get(timevalue, tb_const:get(annual_award_time))
.

%% 距离下个税收上缴国库时间的秒数
submit_tax_time() ->
	maps:get(timevalue, tb_const:get(submit_tax_time))
.

%% 战败国国库进贡时间
pay_tribute_time() ->
	maps:get(timevalue, tb_const:get(pay_tribute_time))
.


%% 距离下周一0点的秒数
next_week_time() ->
	NextWeekZeroTick = next_week_zero_time(),
	NextWeekZeroTick - unixtime().

%% 计算下周一0点(周末24点)的时间戳
next_week_zero_time() ->
	next_week_zero_time(unixtime()).

next_week_zero_time(Tick) ->
	{{Y,M,D},{_,_,_}} = to_localtime(Tick),
	CurDay = calendar:day_of_the_week(Y,M,D),
	DiffDay = 7 - CurDay + 1,
	unixtime({{Y, M, D},{0,0,0}}) + day_second() * DiffDay.

%% 距离下个月一号0点的秒数
next_month_time() ->
	NextMonthZeroTick = next_month_zero_time(),
	NextMonthZeroTick - unixtime().

%% 计算下个月一号0点的时间戳
next_month_zero_time() ->
	next_month_zero_time(unixtime()).

next_month_zero_time(Tick) ->
	{{Y,M,_},{_,_,_}} = to_localtime(Tick),
	case M =:= 12 of
		true -> unixtime({{Y + 1, 1, 1},{0,0,0}});
		false-> unixtime({{Y, M + 1, 1},{0,0,0}})
	end.

%% 获取当天零晨的时间戳
current_zero_unixtime() ->
	current_zero_unixtime(unixtime())
.
current_zero_unixtime(Tick) ->
	{{Y,M,D},{_,_,_}} = to_localtime(Tick),
	unixtime({{Y,M,D},{0,0,0}}).

%% 获取下一个零晨的时间戳
next_zero_unixtime() ->
	current_zero_unixtime() + day_second().

current_hour_unixtime(Tick) ->
	{{Y,M,D},{H,_,_}} = to_localtime(Tick),
	unixtime({{Y,M,D},{H,0,0}}).

next_hour_unixtime(Tick) ->
	{{Y,M,D},{H,_,_}} = to_localtime(Tick),
	unixtime({{Y,M,D},{H + 1,0,0}}).

prev_hour_unixtime(Hour, Tick) ->
	{{Y,M,D},{H,_,_}} = to_localtime(Tick),

	case H >= Hour of
		true -> unixtime({{Y,M,D},{Hour,0,0}});
		false -> unixtime({{Y,M,D},{Hour,0,0}}) - day_second()
	end
.

cur_hour_unixtime(Hour, Tick) ->
	{YMD,_} = to_localtime(Tick),
	unixtime({YMD,{Hour,0,0}})
.

next_hour_unixtime(Hour, Tick) ->
	{{Y,M,D},{H,_,_}} = to_localtime(Tick),

	case H < Hour of
		true -> unixtime({{Y,M,D},{Hour,0,0}});
		false -> unixtime({{Y,M,D},{Hour,0,0}}) + day_second()
	end
.

prev_time_unixtime(Time, Tick) ->
	{_,{H, M, S}} = to_localtime(Tick),
	case  (H  * 3600 + M * 60 + S) >= Time  of
		true ->
			current_zero_unixtime(Tick) + Time ;
		false ->
			current_zero_unixtime(Tick) + Time - day_second()
	end
.

cur_time_unixtime(Time, Tick) ->
	current_zero_unixtime(Tick) + Time
.

next_time_unixtime(Time, Tick) ->
	{_,{H, M, S}} = to_localtime(Tick),
	case (H  * 3600 + M * 60 + S) < Time of
		true ->
			current_zero_unixtime(Tick) + Time;
		false ->
			current_zero_unixtime(Tick) + Time + day_second()
	end
.

%%比较两个时间是否为同一天
is_same_day(TickLeft, TickRight) when is_integer(TickLeft) andalso is_integer(TickRight) ->
	is_same_day(to_localtime(TickLeft), to_localtime(TickRight));
is_same_day({{LeftY, LeftM, LeftD}, {_,_,_}} = _DateLeft, {{RightY, RightM, RightD}, {_,_,_}} = _DateRight) ->
	LeftTick0 = unixtime({{LeftY, LeftM, LeftD}, {0,0,0}}),
	RightTick0 = unixtime({{RightY, RightM, RightD}, {0,0,0}}),
	RightTick0 =:= LeftTick0
.

%%比较两个时间是否为同一周
is_same_week(TickLeft, TickRight) when is_integer(TickLeft) andalso is_integer(TickRight) ->
	next_week_zero_time(TickLeft) =:= next_week_zero_time(TickRight)
.

%%比较两个时间是否为同一月
is_same_month(TickLeft, TickRight) when is_integer(TickLeft) andalso is_integer(TickRight) ->
	is_same_month(to_localtime(TickLeft), to_localtime(TickRight));
is_same_month({{LeftY, LeftM, _}, {_,_,_}} = _DateLeft, {{RightY, RightM, _}, {_,_,_}} = _DateRight) ->
	LeftTick0 = unixtime({{LeftY, LeftM, 1}, {0,0,0}}),
	RightTick0 = unixtime({{RightY, RightM, 1}, {0,0,0}}),
	RightTick0 =:= LeftTick0
.

is_same_hour(TickLeft, TickRight) when is_integer(TickLeft) andalso is_integer(TickRight) ->
	current_hour_unixtime(TickLeft) =:= current_hour_unixtime(TickRight)
.

get_diff_days(Tick) ->
	get_diff_days(Tick, unixtime()).
get_diff_days(Tick1, Tick2) ->
	{T1_YMD, _} = lib_timer:to_localtime(Tick1),
	{T2_YMD, _} = lib_timer:to_localtime(Tick2),

	T1ZeroTick = lib_timer:unixtime({T1_YMD, {0,0,0}}),
	T2ZeroTick = lib_timer:unixtime({T2_YMD, {0,0,0}}),

	Diff = (T2ZeroTick - T1ZeroTick) div lib_timer:day_second(),

	case Diff >= 0 of
		true -> Diff + 1;
		false -> Diff
	end
.