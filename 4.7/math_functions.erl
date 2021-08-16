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

%%归集器方法.
%%这个归集器的关键点是列表推导.
%%[A(X)||X<-B,C],||左边的意思是构造器,右边可以是生成器<-,位串生成器<=,过滤器返回false或true.
%%这个的意思是"A表达式"列表,表达式A中的X值从B中提取,B也可以是个元组,后面跟一个模式.

%%下面的列表推导只有当过滤器为true值才能在[]中.

split(L)->
	Even=[X||X<-L,X rem 2=:=0],
	Odd=[X||X<-L,X rem 2=:=1],
	{Even,Odd}.

%%filter方法.

split1(L)->
	Even=lists:filter(fun(X)->X rem 2 =:=0end,L),
	Odd=lists:filter(fun(X)->X rem 2 =:=1end,L),
	{Even,Odd}.



