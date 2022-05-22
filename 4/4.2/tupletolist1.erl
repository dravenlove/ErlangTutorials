%% (2) 内置函数tuple_to_list(T)能将元组T里的元素转换成一个列表。请编写一个名为my_tuple_to_list(T)的函数来做同样的事，但不要使用相同功能的内置函数。
%% 新版本

%% 通过尾递归实现

-module(tupletolist1).
-export([
    my_tuple_to_list/1
        ]).

    my_tuple_to_list(T) ->
        do_list(T, []).

    do_list({}, List) ->
        List;
    do_list(Tuple, List) ->
        Element = erlang:element(1, Tuple),
        Tuple1 = erlang:delete_element(1, Tuple),
        do_list(Tuple1, List ++ [Element]).