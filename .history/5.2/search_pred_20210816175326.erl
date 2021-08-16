%%(2) 编写一个map_search_pred(Map, Pred)函数，让它返回映射组里第一个符合条件的{Key,Value}元素（条件是Pred(Key, Value)为true）。

-module(search_pred).
-export([map_search_pred/2,pred/2]).

%%用这个方法实现得到输入的映射组的所有键.
map_search_pred(Map,pred) ->
	map_search_pred(Map,maps:keys(Map),pred).


%%判断键值是否相等,相等的话返回键值,否则就继续检索下一对键值.
map_search_pred(Map,[Key|T],pred) ->
	case pred(Key,maps:get(Key,Map)) of
	true -> {Key,maps:get(Key,Map)};
	false->map_search_pred(Map,T,pred)
end;

%%当键值表检索完成后发送一个"NULL".
map_search_pred(Map,[],pred) ->
	io:format("NULL").


	


%%这个方法实现键值相等就返回真,否则返回假.
pred(Key,Value) ->
	case (Key =:= Value) of
		true ->true;
		false ->false end.


%%map_search_pred(Map,Pred) ->
%%	map_search_pred(Map,maps:keys(Map),Pred).
%%
%%map_search_pred(Map,[Key|T],pred) ->
%%	case pred(Key,maps:get(Key,Map)) of
%%	true -> {Key,maps:get(Key,Map)};
%%	false->map_search_pred(Map,T,pred)
%%end;
%%map_search_pred(Map,[],pred) ->
%%	io:format("NULL").