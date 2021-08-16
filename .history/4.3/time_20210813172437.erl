-module(time).
-export([my_time_func/0,my_date_string/0]).

my_time_func()->
	
	erlang:time().
my_date_string()->
	erlang:tuple_to_list(erlang:date())++erlang:tuple_to_list(erlang:time()).
