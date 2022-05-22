%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 2月 2021 15:41
%%%-------------------------------------------------------------------
-module(heap).
-author("13661").

-record(heap, {
	elements = undefined, %%array
	size = 0,
	sorter = undefined
}).

%% API
-export([new/0, new/1, new/2, empty/1, size/1, top/1, pop/1, push/2, to_list/1, sort_list/1]).

-define(LEFT(I), I * 2).
-define(RIGHT(I), I * 2 + 1).
-define(PARENT(I), I div 2).
-define(IIF(EXP, R1, R2), case EXP of true -> R1; false -> R2 end).

default_sorter(L, R) ->
	L < R
.

swap(T, FirstIndex, SecondIndex) ->
	FirstValue = array:get(FirstIndex - 1, T),
	SecondValue = array:get(SecondIndex - 1, T),
	T2 = array:set(FirstIndex - 1, SecondValue, T),
	array:set(SecondIndex - 1, FirstValue, T2)
.

down(T, Size, Index, F) ->
	LeftIndex = ?LEFT(Index),
	RightIndex = ?RIGHT(Index),

	HaveL = LeftIndex =< Size,
	HaveR = RightIndex =< Size,

	RetIndex = ?IIF(HaveL andalso F(array:get(LeftIndex - 1, T), array:get(Index - 1, T)) , LeftIndex , Index),
	RetIndex2 = ?IIF(HaveR andalso F(array:get(RightIndex - 1, T), array:get(RetIndex - 1, T)), RightIndex, RetIndex),

	case RetIndex2 =/= Index of
		false -> T;
		true ->
			NewT = swap(T, Index, RetIndex2),
			NewIndex = ?IIF(RetIndex2 =:= LeftIndex, LeftIndex, RightIndex),
			down(NewT, Size, NewIndex, F)
	end
.

up(T, Size, Index, F) ->
	ParentIndex = ?PARENT(Index),
	RetIndex = ?IIF(ParentIndex >= 1 andalso F(array:get(Index - 1, T), array:get(ParentIndex - 1, T)), ParentIndex, Index),
	case RetIndex =/= Index of
		false -> T;
		true ->
			NewT = swap(T, Index, RetIndex),
			up(NewT, Size, RetIndex, F)
	end
.

make_heap(T, F) ->
	Size = array:size(T),
	StartIndex = Size div 2,
%%	lists:foldl(fun(Index, NewT) ->
%%		down(NewT, Size, Index, F)
%%	end, T, lists:reverse(lists:seq(1, StartIndex)))
	make_heap(T, Size, F, 1, StartIndex)
.
make_heap(T, Size, F, Index, Max) when Index =< Max ->
	make_heap(down(T, Size, Index, F), Size, F, Index + 1, Max)
.


new() ->
	new([])
.
new(L) ->
	new(L, fun default_sorter/2)
.
new(L, F) when is_list(L), is_function(F, 2) ->
	new(array:from_list(L), F)
;
new(T, F) when is_function(F, 2) ->
	#heap{
		elements = make_heap(T, F),
		size = array:size(T),
		sorter = F
	}
.

empty(H) when is_record(H, heap) ->
	heap:size(H) =:= 0
.

size(H) when is_record(H, heap) ->
	H#heap.size
.

top(#heap{elements = Elements} = H) when is_record(H, heap) ->
	array:get(0, Elements)
.

pop(#heap{elements = Elements, size = Size, sorter = Sorter} = H) when is_record(H, heap) ->
	T = swap(Elements, 1, Size),
	NewT = down(T, Size - 1, 1, Sorter),
	H#heap{
		elements = NewT,
		size = Size - 1
	}
.

push(E, #heap{elements = Elements, size = Size, sorter = Sorter} = H) when is_record(H, heap) ->
	T = array:set(Size, E, Elements),
	NewT = up(T, Size + 1, Size + 1, Sorter),
	H#heap{
		elements = NewT,
		size = Size + 1
	}
.

to_list(#heap{elements = Elements, size = Size} = H) when is_record(H, heap) ->
	lists:sublist(array:to_list(Elements), Size)
.

sort_list(#heap{size = Size} = H) when is_record(H, heap) ->
	sort_list(H, 1, Size, [])
.
sort_list(_H, I, Max, List) when I > Max->
	lists:reverse(List)
;
sort_list(H, I, Max, List) ->
	sort_list(pop(H), I + 1, Max, [top(H) | List])
.