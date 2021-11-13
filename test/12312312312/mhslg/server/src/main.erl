%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: main
%%% Created on : 2020/7/29 0029 17:31
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(main).
-author("glendy").

%% API
-export([
	start/0,
	stop/0
]).

start() ->
	io:format("game start~n"),
	try
		application:ensure_all_started(sasl),
		application:ensure_all_started(ssl),
		application:ensure_all_started(esockd),
		application:ensure_all_started(mongodb),
%%		application:ensure_all_started(recon_web),
		application:ensure_all_started(server),
		lib_timer:sleep(15*60*1000),
		ok
	catch
		_:Reason ->
			io:format("game start error, Reason ~w ~n", [Reason])
	end.

stop() ->
	try
		application:stop(esockd),
		lib_server:stop(),
		application:stop(server),
%%		application:stop(recon_web),
		application:stop(sasl),
		init:stop()
	catch
		_:Reason ->
			io:format("game stop error, Reason ~p ~n", [Reason])
	end,
	io:format("game stop~n"),
	ok.
