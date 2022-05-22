%%(2) 编写一个map_search_pred(Map, Pred)函数，让它返回映射组里第一个符合条件的{Key,Value}元素（条件是Pred(Key, Value)为true）。

-module(search_map).

-export([
        map_search_pred/2
        ]).

%  Pred fun(K,V1) -> V1 *V1 end.
map_search_pred(Map, Pred) ->
    maps:fold(fun(K, V, Acc) ->
        case Pred(K, V) of
            true ->
                {K, V};
            false ->
                Acc
        end
             end, {null, null}, Map).