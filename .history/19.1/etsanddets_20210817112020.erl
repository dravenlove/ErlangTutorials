%%(1) Mod:module_info(exports)会返回Mod模块里所有导出函数的列表。用这个函数找出Erlang系统库里导出的所有函数。制作一个键值查询表，其中键是一个{Function,Arity}对，值是一个模块名。把这些数据储存在ETS和DETS表里.

-module(etsanddets).
-export([date/1,for/3]).


date(Mod) ->
Ets=ets:new(ets,[bag,protected]),

Info=Mod:module_info(exports),

lists:map(fun(X)->ets:insert(ets,X) end,Info).




for(I,N,F) ->
    [F(I),for(I+1,N,F)];

for(N,N,F) ->
    [F(N)].