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