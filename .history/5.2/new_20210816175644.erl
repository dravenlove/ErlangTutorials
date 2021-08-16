-module(new).
-export([map_search_pred/2]).




map_search_pred(Map,Pred) ->
	map_search_pred(Map,maps:keys(Map),Pred).

map_search_pred(Map,[Key|T],Pred) ->
	case Pred(Key,Map) of
	true -> {Key,maps:get(Key,Map)};
	false->map_search_pred(Map,T,pred)
end;
map_search_pred(Map,[],Pred) ->
	io:format("NULL").