%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_garbage_collect
%%% Created on : 2020/10/16 10:51
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_garbage_collect).
-author("glendy").
-include("common.hrl").

-export([
	handle/0
]).

%% @doc 内存gc
handle()->
	MicroSec = lib_random:rand(30 * 1000,180 * 1000),
	lib_timer:sleep(MicroSec),
	Pids = erlang:processes(),
	[erlang:garbage_collect(Pid) || Pid <- Pids].