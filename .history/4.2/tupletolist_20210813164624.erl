-module(tupletolist).
-export([my_tuple_to_list/1,for/3]).

my_tuple_to_list(T) ->
	Size=erlang:tuple_size(T),
	case Size >=1 of 
	true ->	
		Sizelist=for(1,Size,fun(X)->erlang:element(X,T) end)
	;
			
	false ->
		io:format("tuple's size is null!")
	end.
	

for(N,N,F)->
	[F(N)];
for(L,N,F)->
	[F(L)|for(L+1,N,F)].