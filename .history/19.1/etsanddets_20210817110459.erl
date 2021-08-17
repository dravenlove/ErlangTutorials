%%(1) Mod:module_info(exports)会返回Mod模块里所有导出函数的列表。用这个函数找出Erlang系统库里导出的所有函数。制作一个键值查询表，其中键是一个{Function,Arity}对，值是一个模块名。把这些数据储存在ETS和DETS表里.

-module(etsanddets).
-export([date/]).

Ets=ets:new(ets,[set,protected]).
date(Mod,) ->
    
[H|T]=Mod:module_info(exports).
Export=erlang:module_info(exports).


ets:new