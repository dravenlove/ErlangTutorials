%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_mongodb
%%% Created on : 2020/7/30 0030 20:32
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_mongodb).
-author("glendy").
-include("common.hrl").

%% API
-export([
	build_index/0,
	kvmap_to_bson_list/1,
	bson_list_to_kvmap/1,
	dict_to_bson_list/1,
	bson_list_to_dict/1,
	record_to_bson/1,
	record_to_bson/2,
	value_to_bson/2
]).

build_index() ->
	lib_friend_base:build_index(),
	lib_server_info:build_index(),
	lib_backstage_activity:build_index(),
	lib_country:build_index(),
	lib_arena:build_index(),
	lists:foreach(
		fun(#player_handler{mongo_index_func = Func}) ->
			if
				Func =/= undefined -> Func();
				true -> skip
			end
		end, lib_player_handler:get_handlers()),
	ok.

kvmap_to_bson_list(Map) ->
	maps:fold(
		fun(Key, Value, AccBsonList0) ->
			[Key, Value | AccBsonList0]
		end, [], Map).

bson_list_to_kvmap(BsonList) ->
	bson_list_to_kvmap(#{}, BsonList).
bson_list_to_kvmap(Map, []) ->
	Map;
bson_list_to_kvmap(Map, [Key, Value | T]) ->
	bson_list_to_kvmap(maps:put(Key, Value, Map), T).


bson_list_to_dict(BsonList) ->
	lists:foldl(fun(Bson, Dict) ->
		Key = ?BSON_VALUE(Bson, key),
		Val = ?BSON_VALUE(Bson, value),
		dict:store(Key, Val, Dict)
				end, dict:new(), BsonList)
.

%%需保证key和value 为 [int | list | atom]
dict_to_bson_list(Dict) ->
	dict:fold(fun(Key, Val, List) ->
		Bson = #{
			?BSONSET_VALUE(key, Key),
			?BSONSET_VALUE(value, Val)
		},
		[Bson | List]
	end, [], Dict)
.

%% 把record自动转为bson的map形式
record_to_bson(Record) ->
	record_to_bson(Record, true).
record_to_bson(Record, ListToBin) ->
	{_RecordName, FieldNameList} = lib_record:record_field_names(Record),
	{Bson, _Index} = lists:foldl(fun(FieldName, {Bson0, Index0}) ->
		Value0 = element(Index0, Record),
		ChangeFieldName = case FieldName of player_id -> id; FieldName->FieldName end,
		{Bson0#{util:to_binary(ChangeFieldName) => value_to_bson(Value0, ListToBin)}, Index0 + 1}
															 end, {#{}, 2}, FieldNameList),
	Bson.

convert_number_list(List) ->
	case util:to_binary(List) of
		{error, _, _} -> List;
		BinList -> BinList
	end.

value_to_bson(Value, ListToBin) when erlang:is_tuple(Value) ->
	TupleFirst = erlang:element(1, Value),
	if
		TupleFirst =:= dict -> dict_to_bson(Value, ListToBin);
		true -> record_to_bson(Value, ListToBin)
	end;
value_to_bson(Value, _ListToBin) when is_number(Value) or is_binary(Value) or is_boolean(Value) ->
	Value;
value_to_bson(Value, ListToBin) when is_list(Value) ->
	Bool = (length(Value) =< 0) or (length(Value) > 0 andalso is_number(lists:last(Value))),
	if
		Bool =:= true andalso ListToBin =:= true ->
			convert_number_list(Value);
		true ->
			[value_to_bson(V, ListToBin) || V <- Value]
	end;
value_to_bson(Value, _ListToBin) ->
	util:to_binary(Value).

%%dict => map  (key -> val => to_binary(key) -> to_binary(val))
dict_to_bson(Dict, ListToBin) ->
	dict:fold(
		fun(Key, Value, AccMap0) ->
			AccMap0#{util:to_binary(Key) => value_to_bson(Value, ListToBin)}
		end, #{}, Dict).