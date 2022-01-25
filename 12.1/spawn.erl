%% 编写一个start(AnAtom, Fun)函数把spawn(Fun)注册为AnAtom,确保两个并行进程同时执行start/2时程序也能正常功能,必须保证其中一个进程成功,另一个失败

-module(spawn).

-export([
        start/2
        ,skip/0
        ]).

start(AnAtom, MFA) ->
    {M,P,A} = MFA,
    Pid = spawn(M,P,A),
    case whereis(AnAtom) of
        undefined ->
            register(AnAtom, Pid);
        _ ->
            false
    end.

skip() ->
    void,
    skip().