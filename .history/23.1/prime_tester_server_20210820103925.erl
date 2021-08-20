%%(1) 制作一个名为prime_tester_server的gen_server，让它测试给定的数字是否是质数。
%%你可以使用lib_primes.erl里的is_prime/2函数来处理（或者自己实现一个更好的质数测试函数）。把它添加到sellaprime_supervisor.erl的监控树里。

-module(prime_tester_server).
-export([start_link/0]).
-behaviour(gen_server).
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]).

start
