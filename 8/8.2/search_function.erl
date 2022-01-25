%%(2) code:all_loaded()命令会返回一个由{Mod,File}对构成的列表，内含所有Erlang系统载入的模块。使用内置函数Mod:module_info()了解这些模块。编写一些函数来找出哪个模块导出的函数最多，以及哪个函数名最常见。编写一个函数来找出所有不带歧义的函数名，也就是那些只在一个模块里出现过的函数名。

-module(search_function).
-export([]).

