-module(python_datetime).
-export([timedelta/2]).

timedelta(Time1,Time2)->
	{A,B,C}=Time1,
	{D,E,F}=Time2,
	{erlang:abs(A-D),erlang:abs(B-E),erlang:abs(C-F)}.