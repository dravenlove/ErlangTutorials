%%(5) 编写一个名为math_functions.erl的模块，并导出函数even/1和odd/1。even(X)函数应当在X是偶整数时返回true，否则返回false。odd(X)应当在X是奇整数时返回true。

-module(math_functions).
-export([even/1,odd/1]).

even(X)->
	case X rem 2 =:= 0 of
		true->true;
		false->false 
	end.
		
odd(X)->
	case X rem 2 =:= 1 of
	false->io:format("no comeback.");
	true -> true 
	end.	