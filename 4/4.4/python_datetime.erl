%%(4) 高级练习：查找Python datetime模块的手册页。找出Python的datetime类里有多少方法可以通过erlang模块里有关时间的内置函数实现。在erlang的手册页里查找等价的函数。如果有明显的遗漏，就实现它。

%%我这里打算实现一个两个时间节点相减的功能.

-module(python_datetime).

-define(MINUTE, 60).
-define(HOUR, (60 * 60)).
-define(DAY, (60 * 60 * 24)).
-define(LEAPYEAR, (365 * 3 + 366)).
-define(MONTH1, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]).
-define(MONTH2, [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]).


-export([
	timedelta/2
	,now_time/0
	,get_timestamp/1
	,get_time/1
		]).

timedelta(Time1,Time2)->
	{A,B,C}=Time1,
	{D,E,F}=Time2,
	{erlang:abs(A-D),erlang:abs(B-E),erlang:abs(C-F)}.

%% 获取当前时间戳 返回{ , , }三个对应的时间戳
now_time() ->
	os:timestamp().

%% 获取指定时间的时间戳,将标准时间转换成时间戳 输入{年, 月, 日, 时, 分, 秒}
get_timestamp(Tuple) ->
	{Year, Month, Day, Hour, Minute, Second} = Tuple,
	Second + 
	Minute * 60 +
	Hour * 60 * 60 +
	Day * 24 * 60 * 60 +
	Month * 30 * 24 * 60 * 60 +
	(Year - 1970) * 12 * 30 * 24 * 60 * 60.

%% 获取指定时间,将时间戳转换成标准时间 输出{年, 月, 日, 时, 分, 秒}
get_time(Timestamp) ->
	Year = Timestamp div (12 * 30 * 24 * 60 * 60) + 1970,
	Month = sum_month(Timestamp),
	Day = sum_day1(Timestamp),	
	Second = Timestamp rem ?MINUTE,
	Minute = Timestamp div ?MINUTE rem ?MINUTE,
	Hour = (Timestamp div ?HOUR + 8) rem 24 ,
	{Year, Month, Day, Hour, Minute, Second}.

sum_month(Timestamp) ->
		{Type, Day} = sum_day(Timestamp),
		sum_month1(Day, 1, Type).

sum_month1(0, Month, _MonthType) ->
	Month;
sum_month1(_Day, 12, _MonthType) ->
	12;
sum_month1(Day, Month, MonthType) ->
	case (Day - lists:sum(lists:nthtail(Month, MonthType))) >= 0 of
		true ->
			sum_month1(Day, Month + 1, MonthType);
		false ->
			Month
	end.

sum_day(Timestamp) ->
	Day = (Timestamp div ?DAY +1) rem ?LEAPYEAR,
	case Day < (365 + 366) andalso Day >= 365 of
		true -> {?MONTH2, Day - 365};
		false -> 
			case Day >= (365 + 366) of
				true ->
					{?MONTH1, (Day - 365 - 366) rem 365};
				false ->
					{?MONTH1, Day}
			end
	end.

sum_day1(Timestamp) ->
	{MonthType, Day} = sum_day(Timestamp),
	Day1 = Day,
	Day2 = case MonthType of
		?MONTH1 ->
			Day1 rem 365;
		?MONTH2 ->
			(Day1 - (365 * 3)) rem 366
	end,
	Month = sum_month(Timestamp),
	Day2 - lists:sum(lists:sublist(MonthType, Month -1)).