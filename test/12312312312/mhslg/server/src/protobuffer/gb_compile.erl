%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: gb_compile
%%% Created on : 2020/9/2 0002 11:58
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(gb_compile).
-author("glendy").
-include("protobuffer.hrl").

-define(gb_version, "1.0.0").

%% API
-export([
	show_usage/0,
	parse_opts/1,
	c/0, c/2
]).

show_usage() ->
	io:format("usage: ~s [options] X.proto [...]~n",
		[filename:basename(escript:script_name())]),
	show_args().

%% 解释参数
parse_opts(Argv) ->
	do_parse_opts([], [], Argv).

c() ->
	io:format("No proto files specified.~n"),
	show_help(),
	halt(0).

c(Opts, Args) ->
	case determine_cmdline_op(Opts, Args) of
		error  ->
			show_help(),
			halt(1);
		show_help  ->
			show_help(),
			halt(0);
		show_version  ->
			show_version(),
			halt(0);
		compile ->
			OptMap = opts_to_map(Opts),
			compile(OptMap, Args)
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opt_specs() ->
	[
		{"I", 'string_maybe_appended()', i, "\n"
		"       Specify include directory.\n"
		"       Option may be specified more than once to specify\n"
		"       several include directories.\n"},
		{"o-erl", 'string()', o_erl, "Dir\n"
		"       Specify output directory for where to generate\n"
		"       the <ProtoFile>.erl.\n"
		"       The -o-erl Dir option overrides any -o Dir option, and\n"
		"       similarly for the other file-type specific output options.\n"},
		{"o-hrl", 'string()', o_hrl, "Dir\n"
		"       Specify output directory for where to generate\n"
		"       the <ProtoFile>.hrl\n"},
		{"h", undefined, help, "\n"
		"       Show help\n"},
		{"-help", undefined, help, "\n"
		"       Show help\n"},
		{"V", undefined, version, "\n"
		"       Show version\n"},
		{"-version", undefined, version, "\n"
		"       Show version\n"}
	].

show_args() ->
	lists:foreach(fun show_arg/1, opt_specs()).

show_arg({OptDef, 'string_maybe_appended()', _, OptDoc}) ->
	io:format("   -~s   -~sOption ~s", [OptDef, OptDef, OptDoc]);
show_arg({OptDef, _, _, OptDoc}) ->
	io:format("   -~s ~s", [OptDef, OptDoc]).

do_parse_opts(Opts, Files, []) ->
	{ok, {lists:reverse(Opts), lists:reverse(Files)}};
do_parse_opts(Opts, Files, ["-"++OptName=Opt | Rest]) ->
	case find_opt_spec(OptName) of
		{ok, OptSpec} ->
			case parse_opt(OptName, OptSpec, Rest) of
				{ok, {ParsedOpt, Rest2}} ->
					do_parse_opts([ParsedOpt | Opts], Files, Rest2);
				{error, Reason} ->
					{error, Reason}
			end;
		error ->
			{error, "Unknown option " ++ Opt}
	end;
do_parse_opts(Opts, Files, [File | Rest]) ->
	do_parse_opts(Opts, [File | Files], Rest).

find_opt_spec(OptName) ->
	case [OptSpec || OptSpec <- opt_specs(), opt_matches(OptName, OptSpec)] of
		[] ->
			error;
		[OptSpec] ->
			{ok, OptSpec}
	end.
opt_matches(Opt, {OptName, 'string_maybe_appended()', _OptTag, _Descr}) ->
	lists:prefix(norm_uscore_dash(OptName), norm_uscore_dash(Opt));
opt_matches(Opt, {OptName, _Type, _OptTag, _Descr}) ->
	norm_uscore_dash(Opt) == norm_uscore_dash(OptName).
norm_uscore_dash("_"++Tl)  -> "-" ++ norm_uscore_dash(Tl);
norm_uscore_dash([C | Tl]) -> [C | norm_uscore_dash(Tl)];
norm_uscore_dash("")       -> "".

parse_opt(Opt, {OptName, 'string_maybe_appended()', OptTag, _Descr}, Rest) ->
	case {Opt, Rest} of
		{OptName, [H | Rest2]} ->
			{ok, {{OptTag, H}, Rest2}};
		{OptName, []} ->
			{error, "Missing argument for option -" ++ OptName};
		_ ->
			true = lists:prefix(OptName, Opt),
			OptArg = gpb_lib:string_slice(Opt, length(OptName)),
			{ok, {{OptTag, OptArg}, Rest}}
	end;
parse_opt(_, {_OptName, undefined, OptTag, _Descr}, Rest) ->
	{ok, {OptTag, Rest}};
parse_opt(_, {_OptName, 'string()', OptTag, _Descr}, [OptArg | Rest]) ->
	{ok, {{OptTag, OptArg}, Rest}};
parse_opt(_, {_OptName, 'atom()', OptTag, _Descr}, [OptArg | Rest]) ->
	{ok, {{OptTag, list_to_atom(OptArg)}, Rest}};
parse_opt(_, {OptName, 'integer()', OptTag, _Descr}, [OptArg | Rest]) ->
	try list_to_integer(OptArg) of
		N -> {ok, {{OptTag, N}, Rest}}
	catch error:badarg ->
		{error, io_lib:format("Invalid version number (integer) for ~s: ~p",
			[OptName, OptArg])}
	end;
parse_opt(_, {_OptName, F, OptTag, _Descr}, Rest) when is_function(F) ->
	F(OptTag, Rest);
parse_opt(_, {OptName, Alternatives, OptTag, _Descr}, [OptArg | Rest]) ->
	case parse_opt_alts(tuple_to_list(Alternatives), OptArg, OptTag) of
		{ok, Opt} -> {ok, {Opt, Rest}};
		error     -> {error, "Invalid argument for -" ++ OptName}
	end;
parse_opt(OptName, _OptSpec, []) ->
	{error, "Missing argument for option -" ++ OptName}.

parse_opt_alts(['number()' | Rest], OptArg, OptTag) ->
	case string_to_number(OptArg) of
		{ok, Value} -> {ok, {OptTag, Value}};
		error       -> parse_opt_alts(Rest, OptArg, OptTag)
	end;
parse_opt_alts([Value | Rest], OptArg, OptTag) ->
	case atom_to_list(Value) of
		OptArg -> {ok, {OptTag, Value}};
		_      -> parse_opt_alts(Rest, OptArg, OptTag)
	end;
parse_opt_alts([], _OptArg, _OptTag) ->
	error.

string_to_number(S) ->
	try {ok, list_to_integer(S)}
	catch error:badarg ->
		try {ok, list_to_float(S)}
		catch error:badarg -> error
		end
	end.

show_help() ->
	io:format(
		"gpb version ~s~n"
		"Usage: erl <erlargs> [gpb-opts] -s ~p c <ProtoFile>.proto~n"
		"   or: erl <erlargs> -s ~p c <ProtoFile>.proto -extra [gpb-opts]~n"
		"Typical erlargs = -noshell -noinput +B -boot start_clean -pa SomeDir~n"
		"~n",
		[version_as_string(), ?MODULE, ?MODULE]),
	show_args().

version_as_string() ->
	?gb_version.

determine_cmdline_op(Opts, FileNames) ->
	case {lists:member(help, Opts), lists:member(version, Opts)} of
		{true, _} -> show_help;
		{_, true} -> show_version;
		_         -> if FileNames == [] -> error;
						 FileNames /= [] -> compile
					 end
	end.

show_version() ->
	io:format("gb version ~s~n", [version_as_string()]).

opts_to_map(Opts) ->
	opts_to_map(#{}, Opts).
opts_to_map(OptMap, []) ->
	OptMap;
opts_to_map(OptMap, [{Name, Val} | T]) ->
	opts_to_map(maps:put(Name, Val, OptMap), T).

compile(_OptMap, []) ->
	ok;
compile(OptMap, [File | T]) ->
	FileMsgMap = compile_file(OptMap, File),
	{FileName, _Ext} = split_file_ext(File),
	write_hrl_file(FileMsgMap, OptMap, FileName),
	write_erl_file(FileMsgMap, OptMap, FileName),
	compile(OptMap, T).

compile_file(OptMap, File) ->
	ProtoPath = maps:get(i, OptMap),
	FileRealPath = filename:join(ProtoPath, File),
	io:format(FileRealPath ++ "~n"),
	{ok, FileHandler} = file:open(FileRealPath, [read]),
	FileMsgMap = compile_file_to_map(#{}, FileHandler),
	file:close(FileHandler),
	FileMsgMap.

compile_file_to_map(FileMsgMap, FileHandler) ->
	Read = file:read_line(FileHandler),
	case Read of
		{ok, Line} ->
			case Line of
				[$m,$e,$s,$s,$a,$g,$e | NameTail] ->
					[MsgName | _T] = string:tokens(NameTail, " "),
					io:format("message: ~ts ~n", [MsgName]),
					NewFileMsgMap0 = maps:put(MsgName, [], FileMsgMap),
					NewFileMsgMap1 = compile_file_for_msgbody(NewFileMsgMap0, FileHandler, MsgName),
					compile_file_to_map(NewFileMsgMap1, FileHandler);
				_ ->
					compile_file_to_map(FileMsgMap, FileHandler)
			end;
		eof ->
			FileMsgMap;
		_ ->
			compile_file_to_map(FileMsgMap, FileHandler)
	end.

compile_file_for_msgbody(FileMsgMap, FileHandler, MsgName) ->
	case file:read_line(FileHandler) of
		{ok, [$} | _T]} ->
			FileMsgMap;
		{ok, Line} ->
			WordsList = string:tokens(Line, " "),
			NewFileMsgMap =
				case WordsList of
					["optional",Type,FieldName,_Eq,Tags | _T] ->
						[Tag | _T2] = string:tokens(Tags, ";"),
						Term = {"optional", Type, FieldName, Tag},
						TermList = maps:get(MsgName, FileMsgMap),
						NewTermList = [Term | TermList],
						maps:put(MsgName, NewTermList, FileMsgMap);
					["repeated",Type,FieldName,_Eq,Tags | _T] ->
						[Tag | _T2] = string:tokens(Tags, ";"),
						Term = {"repeated", Type, FieldName, Tag},
						TermList = maps:get(MsgName, FileMsgMap),
						NewTermList = [Term | TermList],
						maps:put(MsgName, NewTermList, FileMsgMap);
					_ ->
						FileMsgMap
				end,
			compile_file_for_msgbody(NewFileMsgMap, FileHandler, MsgName)
	end.

split_file_ext(File) ->
	BaseName = filename:basename(File),
	Ext = filename:extension(BaseName),
	FileName = filename:rootname(BaseName),
	{FileName, Ext}.

write_hrl_file(FileMsgMap, OptMap, ModName) ->
	HrlPath = maps:get(o_hrl, OptMap),
	FileRealPath = filename:join(HrlPath, ModName ++ ".hrl"),
	io:format("write hrl to: ~ts~n", [FileRealPath]),
	{ok, FileHandle} = file:open(FileRealPath, [write, {encoding,utf8}]),
	io:format(FileHandle, "%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version ~ts
-ifndef('~ts').
-define('~ts', true).
-define('~ts_gb_version', \"~ts\").~n", [version_as_string(), ModName, ModName, ModName, version_as_string()]),
	if
		ModName =/= "ProtoPublic" -> io:format(FileHandle, "-include(\"ProtoPublic.hrl\").~n", []);
		true -> skip
	end,
	maps:fold(
		fun(MsgName, TermList, Acc0) ->
			io:format(FileHandle, "~n-record('~ts',{~n", [MsgName]),
			write_hrl_record_term(FileHandle, length(TermList), 1, lists:reverse(TermList)),
			io:format(FileHandle, "}).~n", []),
			Acc0
		end, ok, FileMsgMap),
	io:format(FileHandle, "~n-endif.~n", []),
	file:close(FileHandle).

write_erl_file(FileMsgMap, OptMap, ModName) ->
	ErlPath = maps:get(o_erl, OptMap),
	FileRealPath = filename:join(ErlPath, ModName ++ ".erl"),
	io:format("write erl to: ~ts~n", [FileRealPath]),
	{ok, FileHandle} = file:open(FileRealPath, [write, {encoding,utf8}]),
	io:format(FileHandle, "%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version ~ts
-module('~ts').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include(\"~ts.hrl\").
-include(\"ProtoPublic.hrl\").
-include(\"protobuffer.hrl\").
encode_msg(Msg) ->
	encode_msg(Msg, element(1, Msg)).
encode_msg(Msg, MsgName)->
	SerialFieldList = convert_field_list(Msg),
	gb_serialize:serialize_field_list(SerialFieldList, MsgName).
decode_msg(DataBin, MsgNameAtom) ->
	FieldMap = fetch_field_map(MsgNameAtom),
	NewFieldMap = gb_unserialize:unserialize_field_list(DataBin, FieldMap),
	field_map_to_msg(MsgNameAtom, NewFieldMap).~n", [version_as_string(), ModName, ModName]),
	{ConvertString, FetchString, FieldToString, _V1, _V2} = maps:fold(
		fun(MsgName, TermList, {AccConvertString0, AccFetchString0, AccFieldToString0, AccCur0, MaxSize}) ->
			{ConvertString0, FetchString0, FieldToString0} = write_erl_by_terms(MsgName, lists:reverse(TermList), AccCur0 >= MaxSize),
			{AccConvertString0 ++ ConvertString0, AccFetchString0 ++ FetchString0, AccFieldToString0 ++ FieldToString0, AccCur0 + 1, MaxSize}
		end, {"", "", "", 1, maps:size(FileMsgMap)}, FileMsgMap),
	file:write(FileHandle, ConvertString),
	file:write(FileHandle, FetchString),
	file:write(FileHandle, FieldToString),
	file:close(FileHandle).

write_hrl_record_term(_FileHandle, MaxLen, Cur, _TermList) when Cur > MaxLen ->
	ok;
write_hrl_record_term(FileHandle, MaxLen, Cur, [{ArrayFlag, Type, FieldName, Tag} | _T]) when Cur =:= MaxLen ->
	case ArrayFlag of
		"repeated" ->
			file:write(FileHandle, array_field_to_hrl_string(Type, FieldName, Tag, ""));
		_ ->
			file:write(FileHandle, option_field_to_hrl_string(Type, FieldName, Tag, ""))
	end,
	ok;
write_hrl_record_term(FileHandle, MaxLen, Cur, [{ArrayFlag, Type, FieldName, Tag} | T]) ->
	case ArrayFlag of
		"repeated" ->
			file:write(FileHandle, array_field_to_hrl_string(Type, FieldName, Tag, ","));
		_ ->
			file:write(FileHandle, option_field_to_hrl_string(Type, FieldName, Tag, ","))
	end,
	write_hrl_record_term(FileHandle, MaxLen, Cur + 1, T).

option_field_to_hrl_string("int32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
option_field_to_hrl_string("int64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
option_field_to_hrl_string("uint32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
option_field_to_hrl_string("uint64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
option_field_to_hrl_string("sint32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
option_field_to_hrl_string("sint64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
option_field_to_hrl_string("fixed32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
option_field_to_hrl_string("fixed64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
option_field_to_hrl_string("sfixed32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
option_field_to_hrl_string("sfixed64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: integer() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
option_field_to_hrl_string("double", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: float() | integer() | infinity | '-infinity' | nan | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
option_field_to_hrl_string("float", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: float() | integer() | infinity | '-infinity' | nan | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
option_field_to_hrl_string("string", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: iolist() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
option_field_to_hrl_string("bool", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: boolean() | 0 | 1 | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
option_field_to_hrl_string("bytes", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: iodata() | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
option_field_to_hrl_string(Type, FieldName, Tag, SplitChar) ->
	%% message子消息体
	"    '" ++ FieldName ++ "' = undefined" ++ SplitChar ++ " % = " ++ Tag ++ " #'" ++ Type ++ "'{}\n".

array_field_to_hrl_string("int32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
array_field_to_hrl_string("int64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
array_field_to_hrl_string("uint32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
array_field_to_hrl_string("uint64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
array_field_to_hrl_string("sint32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
array_field_to_hrl_string("sint64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
array_field_to_hrl_string("fixed32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
array_field_to_hrl_string("fixed64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
array_field_to_hrl_string("sfixed32", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 32 bits\n";
array_field_to_hrl_string("sfixed64", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [integer()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ ", 64 bits\n";
array_field_to_hrl_string("double", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [float()] | integer() | infinity | '-infinity' | nan | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
array_field_to_hrl_string("float", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [float()] | integer() | infinity | '-infinity' | nan | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
array_field_to_hrl_string("string", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [iolist()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
array_field_to_hrl_string("bool", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [boolean()] | 0 | 1 | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
array_field_to_hrl_string("bytes", FieldName, Tag, SplitChar) ->
	"    '" ++ FieldName ++ "'\t:: [iodata()] | undefined" ++ SplitChar ++ " % = " ++ Tag ++ "\n";
array_field_to_hrl_string(Type, FieldName, Tag, SplitChar) ->
	%% message子消息体
	"    '" ++ FieldName ++ "' = []" ++ SplitChar ++ " % = " ++ Tag ++ " [#'" ++ Type ++ "'{}]\n".


write_erl_by_terms(MsgName, TermList, IsLast) ->
	ConverHeadString = "convert_field_list(Msg) when is_record(Msg, '" ++ MsgName ++ "') ->\n",
	MsgReadString = "    #'" ++ MsgName ++ "'{",
	ConvertBodyString = "    [\n",
	FetchString = "fetch_field_map('" ++ MsgName ++ "') ->
    #{\n",
	FieldToString = "field_map_to_msg('" ++ MsgName ++ "', FieldMap) ->
    #'" ++ MsgName ++ "'{\n",
	{NewMsgReadString, NewConvertBodyString, NewFetchString, NewFieldToString} = convert_erl_string_by_term_list(MsgReadString, ConvertBodyString, FetchString, FieldToString, IsLast, 1, TermList),
	{ConverHeadString ++ NewMsgReadString ++ NewConvertBodyString, NewFetchString, NewFieldToString}.

convert_erl_string_by_term_list(MsgReadString, ConvertBodyString, FetchString, FieldToString, IsLast, _Cur, []) ->
	if
		IsLast =:= true ->
			{
				MsgReadString ++ "}=Msg,\n",
				ConvertBodyString ++ "    ].\n",
				FetchString ++ "    }.\n",
				FieldToString ++ "    }.\n"
			};
		true ->
			{
					MsgReadString ++ "}=Msg,\n",
					ConvertBodyString ++ "    ];\n",
					FetchString ++ "    };\n",
					FieldToString ++ "    };\n"
			}
	end;
convert_erl_string_by_term_list(MsgReadString, ConvertBodyString, FetchString, FieldToString, IsLast, Cur, [Term | T]) ->
	{ArrayFlag, Type, FieldName, Tag} = Term,
	IsArray =
		if
			ArrayFlag =:= "repeated" -> "1";
			true -> "0"
		end,
	{WireType, DataType, DataTypeName} = get_wire_and_data_type(Type),
	case length(T) =< 0 of
		true ->	%% 最后一个字段
			NewMsgReadString = MsgReadString ++ "'" ++ FieldName ++ "'=F" ++ Tag,
			NewConvertBodyString = ConvertBodyString ++ "        #proto_field{field_tag=" ++ Tag ++ ",wire_type=" ++ WireType ++ ",data_type=" ++ DataType ++ ",data_type_name='" ++ DataTypeName ++ "',is_array=" ++ IsArray ++ ",value=F"++ Tag ++ ",field_name='"++ FieldName ++ "'" ++ "}	% " ++ FieldName ++ "\n",
			NewFetchString = FetchString ++ "        " ++ Tag ++ " => #proto_field{field_tag="++ Tag ++ ",wire_type=" ++ WireType ++ ",data_type=" ++ DataType ++ ",data_type_name='" ++ DataTypeName ++ "',is_array=" ++ IsArray ++ ",field_name='"++ FieldName ++"'" ++ "}	% " ++ FieldName ++ "\n",
			NewFieldToString = FieldToString ++ "        '" ++ FieldName ++ "' = gb_unserialize:get_value(maps:get(" ++ Tag ++ ",FieldMap))\n",
			convert_erl_string_by_term_list(NewMsgReadString, NewConvertBodyString, NewFetchString, NewFieldToString, IsLast, Cur + 1, T);
		_ ->
			NewMsgReadString = MsgReadString ++ "'" ++ FieldName ++ "'=F" ++ Tag ++ ",",
			NewConvertBodyString = ConvertBodyString ++ "        #proto_field{field_tag=" ++ Tag ++ ",wire_type=" ++ WireType ++ ",data_type=" ++ DataType ++ ",data_type_name='" ++ DataTypeName ++ "',is_array=" ++ IsArray ++ ",value=F"++ Tag ++ ",field_name='"++ FieldName ++ "'" ++ "},	% " ++ FieldName ++ "\n",
			NewFetchString = FetchString ++ "        " ++ Tag ++ " => #proto_field{field_tag="++ Tag ++ ",wire_type=" ++ WireType ++ ",data_type=" ++ DataType ++ ",data_type_name='" ++ DataTypeName ++ "',is_array=" ++ IsArray ++ ",field_name='"++ FieldName ++ "'" ++ "},	% " ++ FieldName ++ "\n",
			NewFieldToString = FieldToString ++ "        '" ++ FieldName ++ "' = gb_unserialize:get_value(maps:get(" ++ Tag ++ ",FieldMap)),\n",
			convert_erl_string_by_term_list(NewMsgReadString, NewConvertBodyString, NewFetchString, NewFieldToString, IsLast, Cur + 1, T)
	end.

get_wire_and_data_type("int32") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_INT32), "undefined"};
get_wire_and_data_type("int64") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_INT64), "undefined"};
get_wire_and_data_type("uint32") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_UINT32), "undefined"};
get_wire_and_data_type("uint64") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_UINT32), "undefined"};
get_wire_and_data_type("sint32") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_SINT32), "undefined"};
get_wire_and_data_type("sint64") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_SINT64), "undefined"};
get_wire_and_data_type("fixed32") ->
	{integer_to_list(?WIRE_TYPE_FLOAT), integer_to_list(?DATA_TYPE_FIXED32), "undefined"};
get_wire_and_data_type("sfixed32") ->
	{integer_to_list(?WIRE_TYPE_FLOAT), integer_to_list(?DATA_TYPE_SFIXED32), "undefined"};
get_wire_and_data_type("fixed64") ->
	{integer_to_list(?WIRE_TYPE_DOUBLE), integer_to_list(?DATA_TYPE_FIXED64), "undefined"};
get_wire_and_data_type("sfixed64") ->
	{integer_to_list(?WIRE_TYPE_DOUBLE), integer_to_list(?DATA_TYPE_SFIXED64), "undefined"};
get_wire_and_data_type("double") ->
	{integer_to_list(?WIRE_TYPE_DOUBLE), integer_to_list(?DATA_TYPE_DOUBLE), "undefined"};
get_wire_and_data_type("float") ->
	{integer_to_list(?WIRE_TYPE_FLOAT), integer_to_list(?DATA_TYPE_FLOAT), "undefined"};
get_wire_and_data_type("string") ->
	{integer_to_list(?WIRE_TYPE_STRING_OR_MESSAGE), integer_to_list(?DATA_TYPE_STRING), "undefined"};
get_wire_and_data_type("bool") ->
	{integer_to_list(?WIRE_TYPE_VARINT), integer_to_list(?DATA_TYPE_BOOL), "undefined"};
get_wire_and_data_type("bytes") ->
	{integer_to_list(?WIRE_TYPE_STRING_OR_MESSAGE), integer_to_list(?DATA_TYPE_BYTES), "undefined"};
get_wire_and_data_type(Type) ->
	{integer_to_list(?WIRE_TYPE_STRING_OR_MESSAGE), integer_to_list(?DATA_TYPE_MESSAGE), Type}.