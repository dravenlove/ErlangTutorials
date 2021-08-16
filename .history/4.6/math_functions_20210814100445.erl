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


split1(L)->
	Even=lists:filter(fun(X)->X rem 2 =:=0end,L),
	Odd=lists:filter(fun(X)->X rem 2 =:=1end,L),
	{Even,Odd}.