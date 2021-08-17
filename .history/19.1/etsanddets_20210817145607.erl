%%(1) Mod:module_info(exports)会返回Mod模块里所有导出函数的列表。用这个函数找出Erlang系统库里导出的所有函数。制作一个键值查询表，其中键是一个{Function,Arity}对，值是一个模块名。把这些数据储存在ETS和DETS表里.

-module(etsanddets).
-export([date/1,start/0]).

%%这个函数的功能是将模块的键值插入到ets中.

date(Mod) ->
    %%创建一个ets表
Ets=ets:new(ets,[bag,protected]),
    %%将模块导出的函数提取出来.
Key=Mod:module_info(exports),


Keyandvalue=lists:map(fun(X)-> {X,Mod} end,Key),

Cout=lists:map(fun(X)->ets:insert(Ets,X) end,Keyandvalue),

Ets.

start() ->

{ok,Lib}=file:list_dir_all(code:lib_dir()),

%%在Erlang里字符串其实就是每一个字符的ASC II码的列表.


ets:insert(date(Mod),ets:tab2list(date(Mod))).






