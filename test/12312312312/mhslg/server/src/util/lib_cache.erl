%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_cache
%%% Created on : 2020/7/30 0030 19:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_cache).
-author("glendy").
-include("ets.hrl").

%% API
-export([
	fetch/1,
	fetch/2,
	del/1,
	set/2
]).

fetch(K) ->
	fetch(K,undefined).

fetch(K,Def) ->
	case ets:lookup(?ETS_GLOBAL_CACHE,K) of
		[{K,V}] ->
			V;
		[] ->
			Def
	end.

del(K) ->
	ets:delete(?ETS_GLOBAL_CACHE, K).

set(K,V) ->
	ets:insert(?ETS_GLOBAL_CACHE, {K,V}).
