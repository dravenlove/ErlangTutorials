%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_common
%%% Created on : 2020/7/29 0029 20:38
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%　处理业务无关的公共接口，业务相关的接口不能放此处
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_common).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("ProtoPublic.hrl").

%% API
-export([
	md5/1,
	format_chinese/2,
	lists_find/2,
	ceil/1,
	floor/1,
	for/3,
	fold/4,
	list_map/2,
	list_foldl/3,
	list_foldr/3,
	list_max/2,
	map_map/2,
	map_fold/3,
	dict_map/2,
	dict_fold/3,
	set_fold/3,
	try_run/1,
	try_run/2,
	dict_to_map/1,
	bson_list_to_dict/1,
	dict_to_bson_list/1,
	bson_list_to_map/1,
	map_to_bson_list/1,
	conf_to_proto_item_obj/1,
	player_show_to_proto/1,
	player_show_to_bson/1,
	bson_to_player_show/1,

	random/2,
	random_list/2,
	random_one/1,
	random_weight_list/1,
	random_weight_list/2,

	random_name/1
]).

md5(S) ->
	lists:flatten([io_lib:format("~2.16.0b", [N])
		|| N <- binary_to_list(erlang:md5(S))]).

%%%% 删除列表中元素
%%lists_delete(Value, List) ->
%%	lists:delete(Value, List).

%% 防止各种乱码问题
format_chinese(Content, []) ->
	Content;
format_chinese(Content, Args) ->
	NewArgs = [lib_types:to_binary(V) || V <- Args],
	lib_types:to_binary(io_lib:format(lib_types:to_list(Content), NewArgs)).

%% 查找元素所在列表位置
lists_find(Val, List) ->
	lists_find(Val, 1, List).
lists_find(_Val, _Index, []) ->
	-1;
lists_find(Val, Index, [Val | _T]) ->
	Index;
lists_find(Val, Index, [_V | T]) ->
	lists_find(Val, Index + 1, T).

%% 向上取整
ceil(N) ->
	T = trunc(N),
	case N == T of
		true -> T;
		false -> 1 + T
	end.

%% 向下取整
floor(X) ->
	T = trunc(X),
	case X < T of
		true -> T - 1;
		_ -> T
	end.

for(F, I, Max) when I > Max, is_function(F) ->
	ok
;
for(F, I, Max) when is_function(F)->
	Result =
	try
		F(I),
		continue
	catch
		throw: continue -> continue;
		throw: break -> break
	end,

	case Result of
		continue -> for(F, I + 1, Max);
		break -> ok
	end
.

fold(_F, Acc, I, Max) when I > Max ->
	Acc
;
fold(F, Acc, I, Max) ->
	Result =
	try
		Acc1 = F(I, Acc),
		{continue, Acc1}
	catch
		throw: continue -> {continue, Acc};
	    throw: {continue, Acc2} -> {continue, Acc2};

		throw: break -> {break, Acc};
		throw: {break, Acc2} -> {break, Acc2}
	end,

	case Result of
		{continue, Acc3} -> fold(F, Acc3, I + 1, Max);
		{break, Acc3} -> Acc3
	end
.

list_map(F, List) ->
	Fun = fun(V) ->
		try
			F(V)
		catch
			throw: continue -> continue;
			throw: {continue, Info} -> Info
		end
    end,

	try
		lists:map(Fun, List)
	catch
		throw: break -> skip;
		throw: {break, Info} -> Info
	end
.

list_foldl(F, Acc, List) ->
	Fun = fun(Value, Acc1) ->
		try
			F(Value, Acc1)
		catch
			throw: continue -> Acc1;
			throw: {continue, Acc2} -> Acc2;

			throw: break -> throw({break, Acc1})
		end
    end,

	try
		lists:foldl(Fun, Acc, List)
	catch
		throw: {break, Acc2} -> Acc2
	end
.

list_foldr(F, Acc, List) ->
	Fun = fun(Value, Acc1) ->
		try
			F(Value, Acc1)
		catch
			throw: continue -> Acc1;
			throw: {continue, Acc2} -> Acc2;

			throw: break -> throw({break, Acc1})
		end
	      end,

	try
		lists:foldr(Fun, Acc, List)
	catch
		throw: {break, Acc2} -> Acc2
	end
.

list_max(F, [First | List]) ->
	list_max(F, First, List)
.
list_max(_F, Max, []) ->
	Max
;
list_max(F, Max, [E | List]) ->
	NewMax =
		case F(E, Max) of
			false -> Max;
			true -> E
		end,
	list_max(F, NewMax, List)
.

map_map(F, Dict) ->
	Fun = fun(K, V) ->
		try
			F(K, V)
		catch
			throw: continue -> continue;
			throw: {continue, Info} -> Info
		end
  	end,

	try
		maps:map(Fun, Dict)
	catch
		throw: break -> skip;
		throw: {break, Info} -> Info
	end
.

map_fold(F, Acc, Dict) ->
	Fun = fun(Key, Value, Acc1) ->
		try
			F(Key, Value, Acc1)
		catch
			throw: continue -> Acc1;
			throw: {continue, Acc2} -> Acc2;

			throw: break -> throw({break, Acc1})
		end
    end,

	try
		maps:fold(Fun, Acc, Dict)
	catch
		throw: {break, Acc2} -> Acc2
	end
.

dict_map(F, Dict) ->
	Fun = fun(K, V) ->
		try
			F(K, V)
		catch
			throw: continue -> continue;
			throw: {continue, Info} -> Info
		end
  	end,

	try
		dict:map(Fun, Dict)
	catch
		throw: break -> skip;
		throw: {break, Info} -> Info
	end
.

dict_fold(F, Acc, Dict) ->
	Fun = fun(Key, Value, Acc1) ->
		try
			F(Key, Value, Acc1)
		catch
			throw: continue -> Acc1;
			throw: {continue, Acc2} -> Acc2;

			throw: break -> throw({break, Acc1})
		end
    end,

	try
		dict:fold(Fun, Acc, Dict)
	catch
		throw: {break, Acc2} -> Acc2
	end
.

set_fold(F, Acc, Sets) ->
	Fun = fun(Value, Acc1) ->
		try
			F(Value, Acc1)
		catch
			throw: continue -> Acc1;
			throw: {continue, Acc2} -> Acc2;

			throw: break -> throw({break, Acc1})
		end
    end,

	try
		sets:fold(Fun, Acc, Sets)
	catch
		throw: {break, Acc2} -> Acc2
	end
.

%% RunList : [{Function, Args}]
%% 运行RunList中的每个函数, 捕获每个函数的异常使其不会影响其他函数
try_run(RunList) ->
	try_run(RunList, undefined)
.
try_run(RunList, Default) ->
	Fun = fun(FunArg) ->
		try
			try_run_run(FunArg)
		catch
			Type: Reason -> ?ERROR("try_run error : ~p , ~p, ~p", [Type, Reason, erlang:get_stacktrace()]), Default
		end
  	end,
	[Fun(Arg) || Arg <- RunList]
.
try_run_run({Fun, Args})->
	apply(Fun, Args)
;
try_run_run({Fun}) when is_function(Fun, 0) ->
	apply(Fun, [])
;
try_run_run(Fun) when is_function(Fun, 0) ->
	apply(Fun, [])
.

dict_to_map(Dict) ->
	dict:fold(fun(Key, Val, Map) -> maps:put(Key, Val, Map) end, maps:new(), Dict)
.

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

bson_list_to_map(BsonList) ->
	lists:foldl(fun(Bson, Map) ->
		Key = ?BSON_VALUE(Bson, key),
		Val = ?BSON_VALUE(Bson, value),
		maps:put(Key, Val, Map)
	end, maps:new(), BsonList)
.

%%需保证key和value 为 [int | list | atom]
map_to_bson_list(Map) ->
	maps:fold(fun(Key, Val, List) ->
		Bson = #{
			?BSONSET_VALUE(key, Key),
			?BSONSET_VALUE(value, Val)
		},
		[Bson | List]
  	end, [], Map)
.

conf_to_proto_item_obj([Id, Amount, Effect, Flag | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount, Effect, Flag)
;
conf_to_proto_item_obj([Id, Amount, Effect | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount, Effect)
;
conf_to_proto_item_obj([Id, Amount | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount)
.

player_show_to_proto(undefined) ->
	undefined
;
player_show_to_proto(PlayerShow) when is_record(PlayerShow, player_show) ->
	#'ProtoShowRole'{
		id = PlayerShow#player_show.id,
		name = PlayerShow#player_show.name,
		level = PlayerShow#player_show.level,
		country = PlayerShow#player_show.country,
		head_icon = PlayerShow#player_show.head_icon,
		server_flag = PlayerShow#player_show.server_flag,
		force = PlayerShow#player_show.force,
		country_pos = PlayerShow#player_show.country_pos,
		city_id = PlayerShow#player_show.city_id,
		is_robot = PlayerShow#player_show.is_robot,
		nobility = PlayerShow#player_show.nobility
	}
.

player_show_to_bson(undefined) ->
	undefined
;
player_show_to_bson(PlayerShow) when is_record(PlayerShow, player_show) ->
	#{
		?BSONSET_INT(id, PlayerShow#player_show.id),
		?BSONSET_BOOL(is_robot, PlayerShow#player_show.is_robot),
		?BSONSET_STRING(name, PlayerShow#player_show.name),
		?BSONSET_INT(level, PlayerShow#player_show.level),
		?BSONSET_INT(sex, PlayerShow#player_show.sex),
		?BSONSET_INT(country, PlayerShow#player_show.country),
		?BSONSET_INT(country_pos, PlayerShow#player_show.country_pos),
		?BSONSET_INT(head_icon, PlayerShow#player_show.head_icon),
		?BSONSET_STRING(server_flag, PlayerShow#player_show.server_flag),
		?BSONSET_INT(force, PlayerShow#player_show.force),
		?BSONSET_INT(city_id, PlayerShow#player_show.city_id),
		?BSONSET_INT(nobility, PlayerShow#player_show.nobility)
	}
.

bson_to_player_show(undefined) ->
	undefined
;
bson_to_player_show(Bson) ->
	#player_show{
		id = ?BSON_INT(Bson, id),
		is_robot = ?BSON_BOOL(Bson, is_robot),
		name = ?BSON_STRING(Bson, name),
		level = ?BSON_INT(Bson, level),
		sex = ?BSON_INT(Bson, sex),
		country = ?BSON_INT(Bson, country),
		country_pos = ?BSON_INT(Bson, country_pos),
		head_icon = ?BSON_INT(Bson, head_icon),
		server_flag = ?BSON_STRING(Bson, server_flag),
		force = ?BSON_INT(Bson, force),
		city_id = ?BSON_INT(Bson, city_id),
		nobility = ?BSON_INT(Bson, nobility)
	}
.

random(Same, Same) ->
	Same
;
random(L, R) when L > R ->
	random(R, L)
;
random(L, R) when is_integer(L), is_integer(R) ->
	random_i(L, R)
.
random_i(Min, Max) when Min < 0 ->
	ABSMin = abs(Min),
	random_i(0, Max + ABSMin) - ABSMin
;
random_i(Min, Max) ->
	M = Min - 1,
	rand:uniform(Max - M) + M
.

%%从列表List里随机取Num个
random_list(List, Num) ->
	random_list(List, Num, []).
random_list([], _Num, RetList) ->
	RetList;
random_list(_List, 0, RetList) ->
	RetList;
random_list(List, Num, RetList) ->
	Size = erlang:length(List),
	Ret = lists:nth(util:rand(Size), List),
	random_list(lists:delete(Ret, List), Num-1, [Ret | RetList]).

%%从列表List里随机取1个
random_one(List) ->
	lists:nth(1, random_list(List, 1))
.

%%从权重List里随机取一个
%%List : [[Index, Weight]]
%%返回Index
random_weight_list(List) ->
	Sum = lists:sum([Weight || [_Index, Weight] <- List]),
	Rand = util:rand(1, Sum),
	random_weight_list(List, 0, Rand)
.
random_weight_list(List, TotalWeight) ->
	Rand = util:rand(1, TotalWeight),
	random_weight_list(List, 0, Rand)
.
random_weight_list([], _Temp, _Rand) ->
	throw(empty_list)
;
random_weight_list([[Index, Weight] | List], Temp, Rand) ->
	Cur = Temp + Weight,
	case Cur >= Rand of
		true -> Index;
		false -> random_weight_list(List, Cur, Rand)
	end
.

random_name(Sex) ->
	if
		Sex =:= ?SEX_MAN ->
			FirstList = tb_role_name:get(man_first),
			SecondList = tb_role_name:get(man_second),
			ThirdList = tb_role_name:get(man_third),
			First = lib_types:to_list(lib_random:rand_one(FirstList)),
			Second = lib_types:to_list(lib_random:rand_one(SecondList)),
			Third = lib_types:to_list(lib_random:rand_one(ThirdList)),
			First ++ Second ++ Third;
		true ->
			FirstList = tb_role_name:get(woman_first),
			SecondList = tb_role_name:get(woman_second),
			ThirdList = tb_role_name:get(woman_third),
			First = lib_types:to_list(lib_random:rand_one(FirstList)),
			Second = lib_types:to_list(lib_random:rand_one(SecondList)),
			Third = lib_types:to_list(lib_random:rand_one(ThirdList)),
			First ++ Second ++ Third
	end
.