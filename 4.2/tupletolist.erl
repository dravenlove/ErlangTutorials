%% (2) 内置函数tuple_to_list(T)能将元组T里的元素转换成一个列表。请编写一个名为my_tuple_to_list(T)的函数来做同样的事，但不要使用相同功能的内置函数。

-module(tupletolist).
-export([my_tuple_to_list/1]).

my_tuple_to_list(T) ->
	Size=erlang:tuple_size(T),
	case Size >=1 of 
	true ->	
		for(1,Size,fun(X)->erlang:element(X,T) end);
	false ->
		io:format("tuple's size is null!")
	end.
	
for(N,N,F)->
	[F(N)];
for(L,N,F)->
	[F(L)|for(L+1,N,F)].

%%这里有两个关键点,第一个:case的用法.
%%case 执行语句 of,下面是执行语句的结果对应执行后面的语句.

%%另一个关键点是For循环.
%%用这个循环模板可以很容易实现循环功能.
