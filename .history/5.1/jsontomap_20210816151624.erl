%%(1) 配置文件可以很方便地用JSON数据表示。请编写一些函数来读取包含JSON数据的配置文件，并将它们转换成Erlang的映射组。再编写一些代码，对配置文件里的数据进行合理性检查。

%%我这里安装了一个库rfc4627以读取Json文件.

-module(jsontomap).
-export([start/1]).

%%读取Json到列表实现.
start(X)->
	{ok,Contant}=file:read_file(X),
	List=erlang:tuple_to_list(rfc4627:decode(Contant)),
	List--[ok].