-module(math_functions).
-export([even/1,odd/1]).

even(X) when (X rem 2 ==0) ->true;
even(X) ->false.

odd(X) when (X rem 2== 1)->true.
