%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_types
%%% Created on : 2020/7/29 0029 20:38
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%  处理类型转换
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_types).
-author("glendy").
-include("common.hrl").

%% API
-export([
	term_to_string/1,
	term_to_bitstring/1,
	string_to_term/1,
	bitstring_to_term/1,
	to_integer/1,
	to_float/1,
	to_binary/1,
	to_atom/1,
	to_list/1,
	to_bool/1,
	int_to_long/2,
	long_to_int/1,
	to_ip_string/1
]).

term_to_string(Term) ->
	binary_to_list(list_to_binary(io_lib:format("~w", [Term]))).

term_to_bitstring(Term) ->
	erlang:list_to_bitstring(io_lib:format("~w", [Term])).

string_to_term(String) when is_binary(String) ->
	string_to_term(to_list(String));
string_to_term(String) ->
	case erl_scan:string(String ++ ".") of
		{ok, Tokens, _} ->
			case erl_parse:parse_term(Tokens) of
				{ok, Term} ->
					Term;
				Err ->
					try
						String = false
					catch
						_:_ ->
							?WARNING("Parse Term Error,String:~w,Err:~w", [String, Err])
					end,
					undefined
			end;
		Error ->
			?WARNING("erl Scan Error,String:~w,Err:~w", [String, Error]),
			undefined
	end.

bitstring_to_term(undefined) -> undefined;
bitstring_to_term(BitString) when is_binary(BitString) ->
	string_to_term(binary_to_list(BitString)).

%% 转换为整数
to_integer(Msg) when is_integer(Msg) -> Msg;
to_integer(Msg) when is_binary(Msg) ->
	Msg2 = binary_to_list(Msg), list_to_integer(Msg2);
to_integer(Msg) when is_list(Msg) ->
	list_to_integer(Msg);
to_integer(Msg) when is_float(Msg) -> round(Msg);
to_integer(true) -> 1;
to_integer(false) -> 0;
to_integer(Msg) when Msg =:= undefined -> 0;
to_integer(Msg) -> throw({int_other_value, Msg}).

%% 转换为浮点数
to_float(Msg) when is_integer(Msg) -> Msg;
to_float(Msg) when is_binary(Msg) ->
	to_float(to_list(Msg));
to_float(Msg) when is_float(Msg) -> Msg;
to_float(Msg) when is_list(Msg) ->
	try
		erlang:list_to_float(Msg)
	catch _:_ ->
		erlang:list_to_integer(Msg)
	end;
to_float(Msg) when Msg =:= undefined -> 0.0;
to_float(_Msg) -> throw(float_other_value).

%% 转换为二进制
to_binary(Msg) when is_binary(Msg) -> Msg;
to_binary(Msg) when is_atom(Msg) ->
	list_to_binary(atom_to_list(Msg));
to_binary(Msg) when is_list(Msg) ->
	unicode:characters_to_binary(Msg, utf8);
to_binary(Msg) when is_integer(Msg) ->
	list_to_binary(integer_to_list(Msg));
to_binary(Msg) when is_float(Msg) ->
	list_to_binary(f2s(Msg));
to_binary(Msg) when is_tuple(Msg) ->    %% 此处不能处理带中文的tuple
	list_to_binary(tuple_to_list(Msg));
to_binary(_) -> throw(binary_other_value).

%% 转换为原子
to_atom(Msg) when is_atom(Msg) -> Msg;
to_atom(Msg) when is_binary(Msg) ->
	list_to_atom2(binary_to_list(Msg));
to_atom(Msg) when is_list(Msg) ->
	list_to_atom2(Msg);
to_atom(Msg) when is_integer(Msg) ->
	list_to_atom2(erlang:integer_to_list(Msg));
to_atom(_) -> throw(atom_other_value).

list_to_atom2(List) when is_list(List) ->
	case catch list_to_existing_atom(List) of
		{'EXIT', _} -> erlang:list_to_atom(List);
		Atom when is_atom(Atom) -> Atom
	end.

%% 转换为列表
to_list(Msg) when is_list(Msg) -> Msg;
to_list(Msg) when is_atom(Msg) -> atom_to_list(Msg);
to_list(Msg) when is_binary(Msg) -> unicode:characters_to_list(Msg, utf8);
to_list(Msg) when is_integer(Msg) ->
	integer_to_list(Msg);
to_list(Msg) when is_float(Msg) -> f2s(Msg);
to_list(Msg) when is_tuple(Msg) -> tuple_to_list(Msg);
to_list(_) -> throw(list_other_value).

to_bool(0) ->
	false;
to_bool(Msg) when is_integer(Msg) ->
	true;
to_bool(_) -> throw(bool_other_value).

f2s(F) when is_float(F) ->
	[A] = io_lib:format("~.2f", [F]), A.

int_to_long(High, Low) when is_integer(High) andalso is_integer(Low) ->
	Bin = <<Low:32/little, High:32/little>>,
	<<Value:64/little>> = Bin,
	Value;
int_to_long(High, Low) ->
	int_to_long(to_integer(High), to_integer(Low)).

%% 返回{高位整数, 低位整数}
long_to_int(Value) when is_integer(Value) ->
	Bin = <<Value:64/little>>,
	<<Low:32/little, High:32/little>> = Bin,
	{High, Low};
long_to_int(Value) ->
	long_to_int(to_integer(Value)).

to_ip_string(IP) ->
	BitIp = lib_types:term_to_bitstring(IP),
	try
		[case S of $, -> $.;S1 -> S1 end || S <- to_list(BitIp), S /= ${ andalso S /= $}]
	catch
		_:_ ->
			BitIp
	end.
