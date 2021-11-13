%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_rand.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_rand).
%% API
-export([
	init_rand_state/1,

	rand/1,
	rand/2,

	rand_float/0,
	rand_float/2,

	rand_one/1
]).

get_rand_state() ->
	erlang:get(?MODULE).
put_rand_state(RandState) ->
	erlang:put(?MODULE, RandState).

init_rand_state(RandInit) ->
	{StateMap, _} = rand:seed(exs64),
	put_rand_state({StateMap, RandInit}),
	RandInit.

rand_float() ->
	{RandNumber, NewState} = rand:uniform_s(get_rand_state()),
	put_rand_state(NewState),
	RandNumber.

rand(N) ->
	{RandNumber, NewState} = rand:uniform_s(N, get_rand_state()),
	put_rand_state(NewState),
	RandNumber.

%% 取随机值[Min~Max]
rand(Same, Same) -> Same;
rand(Value1, Value2) when Value1 > Value2 ->
	rand(Value2, Value1);
rand(Min, Max) ->
	M = Min - 1,
	rand(Max - M) + M.

%% 取float随机值[Min~Max]
rand_float(Same, Same) -> Same;
rand_float(Value1, Value2) when Value1 > Value2 ->
	rand_float(Value2, Value1);
rand_float(Min, Max) ->
	MathMin = lib_types:to_integer(Min * 10000),
	MathMax = lib_types:to_integer(Max * 10000),
	MathRandom = rand(MathMin, MathMax),
	Random = float(MathRandom / 10000),
	Random.

%% 从列表中随机抽取一个值出来
rand_one([]) ->
	[];
rand_one([H]) ->
	H;
rand_one(L) when is_list(L) ->
	Rand = rand(length(L)),
	lists:nth(Rand, L).


