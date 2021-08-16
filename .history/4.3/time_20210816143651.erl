%%(3) 查 看 erlang:now/0 、 erlang:date/0 和 erlang:time/0 的定义。编写一个名为my_time_func(F)的函数，让它执行fun F并记下执行时间。编写一个名为my_date_string()的函数，用它把当前的日期和时间改成整齐的格式。

-module(time).
-export([my_time_func/0,my_date_string/0]).

my_time_func()->
	
	erlang:time().
my_date_string()->
	erlang:tuple_to_list(erlang:date())++erlang:tuple_to_list(erlang:time()).


%%这个题的关键点是用erlang:time和erlang:date显示当前系统时间和日期.
%%另一个关键的点是++这个是两个列表相加的操作.