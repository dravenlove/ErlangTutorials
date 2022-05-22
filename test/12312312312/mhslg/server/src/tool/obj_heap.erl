%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 2月 2021 16:51
%%%-------------------------------------------------------------------
-module(obj_heap).
-author("13661").

-record(obj_heap, {
	key_pos = 0,
	elements = array:new(),
	key_map = maps:new(),
	size = 0,
	sorter = undefined
}).

%% API
-export([new/0, new/1, new/2, empty/1, size/1, has_key/2, top/1, pop/1, push/3, erase/2, update/3, to_list/1, sort_list/1]).
-export([
	key_compare_less/2,
	key_compare_greater/2,
	val_compare_less/2,
	val_compare_greater/2,
	ele_compare_less/2,
	ele_compare_greater/2
]).

-define(LEFT(I), I * 2).
-define(RIGHT(I), I * 2 + 1).
-define(PARENT(I), I div 2).
-define(IIF(EXP, R1, R2), case EXP of true -> R1; false -> R2 end).

swap(Elements, KMap, FirstIndex, SecondIndex) ->
	{FirstKey, _FirstValue} = E1 = array:get(FirstIndex - 1, Elements),
	{SecondKey, _SecondValue} = E2 = array:get(SecondIndex - 1, Elements),

	Elements2 = array:set(FirstIndex - 1, E2, Elements),
	Elements3 = array:set(SecondIndex - 1, E1, Elements2),

	KMap2 = maps:put(FirstKey, SecondIndex, KMap),
	KMap3 = maps:put(SecondKey, FirstIndex, KMap2),
	{Elements3, KMap3}
.

down(Elements, KMap, Size, Index, F) ->
	LeftIndex = ?LEFT(Index),
	RightIndex = ?RIGHT(Index),

	HaveL = LeftIndex =< Size,
	HaveR = RightIndex =< Size,

	RetIndex = ?IIF(HaveL andalso F(array:get(LeftIndex - 1, Elements), array:get(Index - 1, Elements)) , LeftIndex , Index),
	RetIndex2 = ?IIF(HaveR andalso F(array:get(RightIndex - 1, Elements), array:get(RetIndex - 1, Elements)), RightIndex, RetIndex),

	case RetIndex2 =/= Index of
		false -> {Elements, KMap};
		true ->
			{NewElements, NewKMap} = swap(Elements, KMap, Index, RetIndex2),
			NewIndex = ?IIF(RetIndex2 =:= LeftIndex, LeftIndex, RightIndex),
			down(NewElements, NewKMap, Size, NewIndex, F)
	end
.

up(Elements, KMap, Size, Index, F) ->
	ParentIndex = ?PARENT(Index),
	RetIndex = ?IIF(ParentIndex >= 1 andalso F(array:get(Index - 1, Elements), array:get(ParentIndex - 1, Elements)), ParentIndex, Index),
	case RetIndex =/= Index of
		false -> {Elements, KMap};
		true ->
			{NewElements, NewKMap} = swap(Elements, KMap, Index, RetIndex),
			up(NewElements, NewKMap, Size, RetIndex, F)
	end
.

make_heap(Elements, F) ->
	KMap =
	lists:foldl(fun(Index, KMap0) ->
		{Key, _Val} = array:get(Index - 1, Elements),
		maps:put(Key, Index, KMap0)
	end, maps:new(), lists:seq(1, array:size(Elements))),

	Size = array:size(Elements),
	StartIndex = Size div 2,
	lists:foldl(fun(Index, {NewElements, NewKMap}) ->
		down(NewElements, NewKMap, Size, Index, F)
	end, {Elements, KMap}, lists:reverse(lists:seq(1, StartIndex)))
.

new() ->
	new([])
.
new(L) ->
	new(L, fun ele_compare_less/2)
.
new(L, F) when is_list(L), is_function(F, 2) ->
	new(array:from_list(L), F)
;
new(T, F) when is_function(F, 2) ->
	{Elements, KMap} = make_heap(T, F),
	#obj_heap{
		elements = Elements,
		key_map = KMap,
		size = array:size(Elements),
		sorter = F
	}
.

empty(H) when is_record(H, obj_heap) ->
	obj_heap:size(H) =:= 0
.

size(H) when is_record(H, obj_heap) ->
	H#obj_heap.size
.

has_key(Key, #obj_heap{key_map = KMap} = H) when is_record(H, obj_heap) ->
	maps:is_key(Key, KMap)
.

top(#obj_heap{elements = Elements} = H) when is_record(H, obj_heap) ->
	array:get(0, Elements)
.

pop(#obj_heap{elements = Elements, key_map = KMap, size = Size, sorter = Sorter} = H) when is_record(H, obj_heap) ->
	{Elements1, KMap1} = swap(Elements, KMap, 1, Size),

	{RemoveKey, _Val} = array:get(Size - 1, Elements1),

	{NewElements, NewKMap} = down(Elements1, maps:remove(RemoveKey, KMap1), Size - 1, 1, Sorter),
	H#obj_heap{
		elements = NewElements,
		key_map = NewKMap,
		size = Size - 1
	}
.

push(Key, Val, #obj_heap{key_map = KMap, elements = Elements, size = Size, sorter = Sorter} = H) when is_record(H, obj_heap) ->
	Ele = {Key, Val},
	Elements1 = array:set(Size, Ele, Elements),

	case has_key(Key, H) of
		true -> skip;
		false ->
			KeyMap1 = maps:put(Key, Size + 1, KMap),

			{NewElements, NewKMap} = up(Elements1, KeyMap1, Size + 1, Size + 1, Sorter),
			H#obj_heap{
				elements = NewElements,
				key_map = NewKMap,
				size = Size + 1
			}
	end
.

erase(Key, #obj_heap{elements = Elements, key_map = KMap, size = Size, sorter = Sorter} = H) when is_record(H, obj_heap) ->
	case maps:is_key(Key, KMap) of
		true ->
			Index = maps:get(Key, KMap),
			{Elements1, KMap1} = swap(Elements, KMap, Index, Size),

			{RemoveKey, _Val} = array:get(Size - 1, Elements1),

			{NewElements, NewKMap} = down(Elements1, maps:remove(RemoveKey, KMap1), Size - 1, 1, Sorter),
			H#obj_heap{
				elements = NewElements,
				key_map = NewKMap,
				size = Size - 1
			};
		false -> H
	end
.

update(Key, Val, H) when is_record(H, obj_heap) ->
	push(Key, Val, erase(Key, H))
.

to_list(#obj_heap{elements = Elements, size = Size} = H) when is_record(H, obj_heap) ->
	lists:sublist(array:sparse_to_list(Elements), Size)
.

sort_list(#obj_heap{size = Size} = H) when is_record(H, obj_heap) ->
	sort_list(H, 1, Size, [])
.
sort_list(_H, I, Max, List) when I > Max->
	lists:reverse(List)
;
sort_list(H, I, Max, List) ->
	sort_list(pop(H), I + 1, Max, [top(H) | List])
.

key_compare_less({Key1, _}, {Key2, _}) ->
	Key1 < Key2.

key_compare_greater({Key1, _}, {Key2, _}) ->
	Key1 > Key2.

val_compare_less({_, Val1}, {_, Val2}) ->
	Val1 < Val2.

val_compare_greater({_, Val1}, {_, Val2}) ->
	Val1 > Val2.

ele_compare_less(Ele1, Ele2) ->
	Ele1 < Ele2.

ele_compare_greater(Ele1, Ele2) ->
	Ele1 > Ele2.