%%(2) 编写一个map_search_pred(Map, Pred)函数，让它返回映射组里第一个符合条件的{Key,Value}元素（条件是Pred(Key, Value)为true）。

-module(search_pred).
-export([map_search_pred/2,pred/2]).

map_search_pred(Map,pred) ->
	map_search_pred(Map,maps:keys(Map),pred).

map_search_pred(Map,[Key|T],pred) ->
	case pred(Key,maps:get(Key,Map)) of
	true -> {Key,maps:get(Key,Map)};
	false->map_search_pred(Map,T,pred)
end;
map_search_pred(Map,[],pred) ->
	io:format("NULL").


	



pred(Key,Value) ->
	case (Key =:= Value) of
		true ->true;
		false ->false end.