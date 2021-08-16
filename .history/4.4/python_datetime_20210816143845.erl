%%(4) 高级练习：查找Python datetime模块的手册页。找出Python的datetime类里有多少方法可以通过erlang模块里有关时间的内置函数实现。在erlang的手册页里查找等价的函数。如果有明显的遗漏，就实现它。

%%我这里打算实现一个两个时间节点相减的功能.

-module(python_datetime).
-export([timedelta/2]).

timedelta(Time1,Time2)->
	{A,B,C}=Time1,
	{D,E,F}=Time2,
	{erlang:abs(A-D),erlang:abs(B-E),erlang:abs(C-F)}.