-module(my_tuple). 
-export([for/3,my_tuple_to_list/1]).

for(Max,Max,F)->[F(Max)];
for(I,Max,F)->[F(I)|for(I+1,Max,F)].


my_tuple_to_list(T) ->
	Lengths=erlang:tuple_size(T),

	%%if 
	%%(Lengths>=1) ->
		for(erlang:element(1,T),erlang:element(Lengths,T),fun(X) ->X end).%%;

	%%true ->
	%%io:format("NO!")
	%%end



	
			

