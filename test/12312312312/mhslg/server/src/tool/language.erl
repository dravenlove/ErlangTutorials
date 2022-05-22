%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: record
%%% Created on : 2021/1/19 17:20
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(language).
-include("common.hrl").
%% API
-export([auto/1,auto/2]).

-export([language_package/1]).

auto(Str) ->
	auto(config:language(), Str).
auto(Language, Str) ->
	KeyMap = lib_config_api:get_language_package(Language),
	maps:get(lib_types:to_list(unicode:characters_to_binary(Str)), KeyMap, Str).

language_package(Language) ->
	LanguageContent = read_language_file(Language),
	parsing_language_package(lib_types:to_list(LanguageContent), maps:new()).

read_language_file(Language) ->
	#{language_package := PackageTxt} = tb_language:get(Language),
	{_, LanguageContent} = file:read_file("ebin/" ++ unicode:characters_to_list(PackageTxt) ++ ".txt"),
	LanguageContent.

parsing_language_package(Txt, KeyMap) ->
	B = 61,
	C = 13,
	D = 10,
	Len = erlang:length(Txt),
	{_,_,NewKeyMap,_} =
	lists:foldl(fun(A, {Acc0, Key0, KeyMap0, Len0}) ->
		case A of
			B ->
				{lib_types:to_list(""), Acc0, KeyMap0, Len0 + 1};
			C ->
				KeyMap1 = maps:put(Key0, Acc0, KeyMap0),
				{lib_types:to_list(""), Key0, KeyMap1, Len0 + 1};
			D ->
				{Acc0, Key0, KeyMap0, Len0 + 1};
			_ ->
				if
					Len0 =:= Len ->
						KeyMap1 = maps:put(Key0, lists:append(Acc0, [A]), KeyMap0),
						{lib_types:to_list(""), Key0, KeyMap1, Len0 + 1};
					true ->
						{lists:append(Acc0, [A]), Key0, KeyMap0, Len0 + 1}
				end
		end
	end, {lib_types:to_list(""), "", KeyMap, 1}, Txt),NewKeyMap.