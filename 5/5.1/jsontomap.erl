%%(1) 配置文件可以很方便地用JSON数据表示。请编写一些函数来读取包含JSON数据的配置文件，并将它们转换成Erlang的映射组。再编写一些代码，对配置文件里的数据进行合理性检查。

%%我这里安装了一个库rfc4627以读取Json文件.

-module(jsontomap).
-export([start/1]).

%%读取Json到列表实现.
start(X)->
	{ok,Contant}=file:read_file(X),
	List=erlang:tuple_to_list(rfc4627:decode(Contant)),
	List--[ok].
	%%maps:from_list(List--[ok]).

%% 自己写从json到erlang映射组.
-ifdef(JSON).
-type json() :: jsonobj() | jsonarry() | jsonnum() | jsonstr() | true | false | null.
-type jsonobj :: {obj, [{jsonkey(), json()}]}.
-type jsonkey :: string().
-type jsonarry() :: [json()].
-type jsonnum() :: integer() | float().
-type jsonstr() :: binary().

-export_type([json/0, jsonobj/0. jsonkey/0, jsonarray/0, jsonnum/0, jsonstr/0]).
-endif.

% 暂时没找到好的实现方法,后面再回顾.

% json_to_map(Json) ->
% 	case file:read_file(JSON) of
% 		{ok, Binary} ->
% 			NewMap = maps:new(),
% 			maps:put(, , NewMap),
% 			;
% 		skip
% 	end.

% check_json(Json) ->
% 	case file:read_file(JSON) of
% 		{ok, Binary} ->
% 			List = erlang:bitstring_to_list(Binary),
% 			ture;
% 		false
% 	end.