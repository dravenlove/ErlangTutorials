%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: server_app
%%% Created on : 2020/7/29 0029 17:42
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(server_app).
-author("glendy").
-include("common.hrl").

%% API
-export([
	start/2,
	stop/1
]).

start(_Type, []) ->
	config:load_game_config(),
	io:format("game server start ... ~n", []),
	{ok, Pid} = server_sup:start_link(),
	io:format("game server sup Pid: ~p ~n", [Pid]),
	lib_server:start(),
	{ok, Pid}.

stop(_State) ->
	io:format("game server stop... ~n").
