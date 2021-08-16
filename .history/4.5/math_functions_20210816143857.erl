-module(math_functions).
-export([even/1,odd/1]).

even(X)->
	case X rem 2=:=0 of
	true->true;
	false->false end.
		
odd(X)->
	case X rem 2=:=1 of
	true -> true end.	