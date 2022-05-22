%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_http_api
%%% Created on : 2020/10/11 16:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_http_api).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-define(HTTP_OPTS, [{connect_timeout, 10000}, {timeout, 5000}]).

%% API
-export([
	process_result_callback/7
]).
-export([
	async_http/3,
	async_http/6,
	do_async_http/6,
	async_post/2,
	async_post/5,
	async_get/2,
	async_get/5,
	test_http/4
]).

%% 异步http请求的接口
async_http(Method, Url, UrlParamsMap) ->
	async_http(Method, Url, UrlParamsMap, undefined, undefined, undefined).
%% 异步http请求的接口, 带回调函数
async_http(Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs) ->
	mod_server:async_apply(mod_http_request:get_pid(), fun lib_http_api:do_async_http/6, [Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs]).
do_async_http(Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs) ->
	if
		Method =:= get ->
			{ok, Result} = process_http_get(Url, UrlParamsMap),
			process_result_callback(Method, Url, UrlParamsMap, Result, CallBackPid, CallBackFunc, CallBackArgs);
		Method =:= post ->
			process_http_post(Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs);
		true ->
			?ERROR("no process http method[~p] ~p ~p", [Method, Url, UrlParamsMap])
	end,
	ok.

%% 异步post的基础接口
async_post(Url, UrlParamsMap) ->
	async_http(post, Url, UrlParamsMap).
%% 异步post的基础接口, 带回调函数
async_post(Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs) ->
	async_http(post, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs).

%% 异步get的基础接口
async_get(Url, UrlParamsMap) ->
	async_http(get, Url, UrlParamsMap).
%% 异步get的基础接口, 带回调函数
async_get(Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs) ->
	async_http(get, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

process_http_get(Url, UrlParamsMap) ->
	UriParams = maps:fold(
		fun(Key, Val, AccUri0) ->
			if
				AccUri0 =:= "" -> AccUri0 ++ lib_types:to_list(Key) ++ "=" ++ lib_types:to_list(Val);
				true -> AccUri0 ++ "&" ++ lib_types:to_list(Key) ++ "=" ++ lib_types:to_list(Val)
			end
		end, "", UrlParamsMap),
	Request = {Url ++ "?" ++ http_uri:encode(UriParams), [{"content-type","application/json"},{"charset", "utf-8"}]},
	httpc:request(get, Request, ?HTTP_OPTS, [{body_format,binary},{sync,true}]).

process_http_post(Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs) ->
	ReceiverFunc =
		fun(RespondInfo) ->
			case RespondInfo of
				{_, Result} ->
					mod_server:async_apply(mod_http_request:get_pid(), fun lib_http_api:process_result_callback/7, [Method, Url, UrlParamsMap, Result, CallBackPid, CallBackFunc, CallBackArgs]);
				_ ->
					?ERROR("http post respond: ~p ~p ~nrespond: ~p", [Url, UrlParamsMap, RespondInfo])
			end
		end,
	UrlParamsJson = lib_types:to_list(lib_types:to_binary(mochijson2:encode(UrlParamsMap) ++ "\r\n\r\n")),
	UrlParamsJsonByteSize = length(UrlParamsJson),
	?DEBUG("http: ~p ~p ~n ~ts - ~p", [Method, Url, UrlParamsJson, UrlParamsJsonByteSize]),
	Request = {Url, ["Content-Length", lib_types:to_list(UrlParamsJsonByteSize)], "application/json;charset=utf-8", UrlParamsJson},
	httpc:request(post, Request, ?HTTP_OPTS, [{body_format,string},{sync, false},{receiver,ReceiverFunc}]).

process_result_callback(Method, Url, UrlParamsMap, Result, CallBackPid, CallBackFunc, CallBackArgs) ->
%%	?INFO("Result ~p",[Result]),
	case Result of
		{{_, 200, _}, _, RespondBody} ->
			if
				CallBackPid =/= undefined andalso CallBackFunc =/= undefined andalso CallBackArgs =/= undefined ->
					mod_server:async_apply(CallBackPid, CallBackFunc, [RespondBody, CallBackArgs]);
				true ->
					?INFO("http ok: ~p ~p ~p ~n    respond: ~ts", [Method, Url, UrlParamsMap, RespondBody])
			end;
		_ ->
			?INFO("http error: ~p ~p ~p ~p ~p ~p ~n    respond: ~p",
				[Method, Url, UrlParamsMap, CallBackPid, CallBackFunc, CallBackArgs, Result])
	end.

test_http(Par1, _Par2, _Par3, _Par4) ->
	PlayerBase = lib_player:get_player_base(),
	if
		Par1 =:= 1 ->
			async_get("http://192.168.16.232:4005/connector/server", #{func=>roleInfo});
		Par1 =:= 2 ->
			A = async_post("http://192.168.16.232:4005/connector/server",
				#{func=>gift,role_id=>PlayerBase#player_base.id,role_name=>lib_types:to_binary(PlayerBase#player_base.name),
					server=>lib_types:to_binary(PlayerBase#player_base.server_flag),level=>PlayerBase#player_base.level,
					fighting=>PlayerBase#player_base.force,account=>lib_types:to_binary(PlayerBase#player_base.account),
					package=>PlayerBase#player_base.market,channel=>lib_types:to_binary(PlayerBase#player_base.agent),career=>0
					}),
			?INFO("A ~p",[A]);
		true -> skip
	end.