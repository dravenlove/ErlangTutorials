-module(jsontomap).
-export([start/1]).

start(X)->
	{ok,Contant}=file:read_file(X),
	List=erlang:tuple_to_list(rfc4627:decode(Contant)),
	List--[ok].