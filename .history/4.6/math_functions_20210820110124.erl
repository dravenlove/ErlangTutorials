%%(6) 向math_functions.erl添加一个名为filter(F, L)的高阶函数，它返回L里所有符合条件的元素X（条件是F(X)为true）。

-module(math_functions).
-export([even/1,odd/1,filter/2]).


even(X)->
	case X rem 2=:=0 of
	true->true;
	false->false end.
		
odd(X)->
	case X rem 2=:=1 of
	true -> true end.	



filter(F, L)->
	Even=lists:filter(F,L),
	Odd=lists:filter(F,L),
	{Even,Odd}.

%%这一题的关键点是在上一题的基础上加了一个高阶函数filter(F,L).
%%记得fun()的格式fun(参数)->参数... end.
