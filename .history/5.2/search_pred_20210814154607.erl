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