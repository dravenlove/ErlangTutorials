%%(6) 向math_functions.erl添加一个名为filter(F, L)的高阶函数，它返回L里所有符合条件的元素X（条件是F(X)为true）。

-module(math_functions).
-export([even/1
		,odd/1,
		split/1]).


even(X)->
	X rem 2 =:= 0.
		
odd(X)->
	X rem 2 =:= 1.	



split(List) ->
	{lists:filter(fun(X) -> even(X) end, List), lists:filter(fun(X) -> odd(X) end, List)}.

%%这一题的关键点是在上一题的基础上加了一个高阶函数filter(F,L).
%%记得fun()的格式fun(参数)->参数... end.
