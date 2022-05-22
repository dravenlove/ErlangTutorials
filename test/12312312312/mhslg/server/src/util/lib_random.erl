%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_random
%%% Created on : 2020/7/30 0030 12:04
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_random).
-author("glendy").
-include("common.hrl").

%% API
-export([
	rand/1,
	rand/2,
	rand_float/2,
	rand_one/1,
	random_sort/1,
	rand_more/2
]).

%% 概率保留4位小数位
-define(RATE_BASE_NUMBER, 10000).
-define(BASE_PERCENT, 100). %%百分数基数

%% 取随机值[1~N]
rand(N) when is_integer(N) ->
	rand(1, N);
rand([]) ->
	[];
rand([_ | _] = L) ->
	Nth = rand(length(L)),
	lists:nth(Nth, L).

%% 取随机值[Min~Max]
rand(Same, Same) -> Same;
rand(Value1, Value2) when Value1 > Value2 ->
	rand(Value2, Value1);
rand(Min, Max) ->
	M = Min - 1,
	rand:uniform(Max - M) + M.

%% 取float随机值[Min~Max]
rand_float(Same, Same) -> Same;
rand_float(Value1, Value2) when Value1 > Value2 ->
	rand_float(Value2, Value1);
rand_float(Min, Max) ->
%%	Precision1 = get_precision(Min, 0),
%%	Precision2 = get_precision(Max, 0),
%%	Precision = max(Precision1, Precision2),  %%两者之间取最大精度
%%	ToInt = math:pow(10, Precision),

	MathMin = lib_types:to_integer(Min * ?RATE_BASE_NUMBER),
	MathMax = lib_types:to_integer(Max * ?RATE_BASE_NUMBER), %%化整
	MathRandom = rand(MathMin, MathMax), %%计算随机数
	Random = float(MathRandom / ?RATE_BASE_NUMBER), %%小数点归位
	Random.

%% 从列表中随机抽取一个值出来
rand_one([]) ->
	[];
rand_one([H]) ->
	H;
rand_one(L) when is_list(L) ->
	Len = length(L),
	N = rand(1, Len),
	lists:nth(N, L).

%% 随机排序
random_sort(L) ->
	[X || {_, X} <- lists:sort([{rand:uniform(), N} || N <- L])].

%% 从列表随机抽取N个值
rand_more(N, L) ->
	more(N, L, []).
more(0, _, L) -> L;
more(_, [], L) -> L;
more(N, M, L) ->
	R = rand_one(M),
	more(N - 1, lists:delete(R, M), [R | L])
.
