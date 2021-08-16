%%(7) 向math_functions.erl添加一个返回{Even, Odd}的split(L)函数，其中Even是一个包含L里所有偶数的列表，Odd是一个包含L里所有奇数的列表。请用两种不同的方式编写这个函数，一种使用归集器，另一种使用在练习6中编写的filter函数。

-module(math_functions).
-export([even/1,odd/1,split/1,split1/1]).

even(X)->
	case X rem 2=:=0 of
	true->true;
	false->false end.
		
odd(X)->
	case X rem 2=:=1 of
	true -> true end.	

split(L)->
	Even=[X||X<-L,X rem 2=:=0],
	Odd=[X||X<-L,X rem 2=:=1],
	{Even,Odd}.

%%filter方法

split1(L)->
	Even=lists:filter(fun(X)->X rem 2 =:=0end,L),
	Odd=lists:filter(fun(X)->X rem 2 =:=1end,L),
	{Even,Odd}.



