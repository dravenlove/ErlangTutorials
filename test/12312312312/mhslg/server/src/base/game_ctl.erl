%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: game_ctl.erl
%% Created on : 2019-05-29 18:07:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-30 11:28:42
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(game_ctl).

-export([
		 start/0,
		 game_node_get_status/0,
		 process_safe_stop/1,
		 process_stop/1,
		 game_node_get_online/0
		]).

-define(CHILD_SPEC(Mod),{Mod, {Mod, start_link, []}, permanent, 5000, worker, [Mod]}).
-define(SUP_FLAGS,{one_for_one,1,60}).

-define(STATUS_SUCCESS,		0).		% 成功
-define(STATUS_NORUN,		1).		% 未运行
-define(STATUS_USAGE,		2).		% 使用错误
-define(STATUS_BADRPC,		3).		% rpc调用错误
-define(STATUS_ERROR,		4).		% 其它错误
-define(STATUS_STARTING,	5).		% 正在开服中
-define(STATUS_RUNNING,		6).		% 运行中
-define(STATUS_STOPING,		7).		% 正在关服中


start() ->
	[NodeStr, OpNameStr] = init:get_plain_arguments(),
    Node = lib_types:to_atom(NodeStr),
    OpName = lib_types:to_atom(OpNameStr),
	case OpName of
		status ->
			process_node_status(Node);
		safe_stop ->
			process_safe_stop(Node);
		stop ->
			process_stop(Node);
		hotup ->
			process_hotup(Node);
		reload_config ->
			process_reload_config(Node);
		count ->
			process_online_count(Node);
		index ->
			process_build_index(Node);
		hotfix ->
			process_hotfix(Node);
		version ->
			process_version(Node);
		_ ->
			erlang:halt(?STATUS_SUCCESS)
	end.


%% 热修复
process_hotfix(Node) ->
	try
		rpc:call(Node, u, code, []),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_ : Reason ->
			io:format("process_hotfix error: ~p ~p ~n", [ Node, Reason ]),
			erlang:halt(?STATUS_BADRPC)
	end.


%% 获取服务端程序状态
process_node_status(Node) ->
	case net_adm:ping(Node) of
		pong ->
			Ret = rpc:call(Node, ?MODULE, game_node_get_status, []),
			erlang:halt(Ret);
		_Reason ->
			erlang:halt(?STATUS_BADRPC)
	end.

%% 在游戏进程里执行的接口
game_node_get_status() ->
    try
	    case lib_game_cache:get_service_start_tick() of
	    	undefined -> ?STATUS_STARTING;
	    	_Tick -> ?STATUS_RUNNING
	    end
    catch
        _ : _ -> ?STATUS_NORUN
    end.

%% 停止服务端程序
process_safe_stop(Node) ->
	process_stop(Node).

process_stop(Node) ->
	try
		rpc:call(Node, main, stop, []),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("safe stop error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.

%% 代码热更新
process_hotup(Node) ->
	try
		rpc:call(Node, u, u, []),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("hotup error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.

%% 重新加载配置
process_reload_config(Node) ->
	try
		rpc:call(Node, config, load_game_config, []),
		rpc:call(Node, lib_config_api, reload, []),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("reload config error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.

%% 获取在线数量
process_online_count(Node) ->
	try
		Count = rpc:call(Node, ?MODULE, game_node_get_online, []),
		io:format("~w~n", [Count]),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("online count error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.

%% 在游戏进程里执行的接口
game_node_get_online() ->
	0.
%%	mod_server:call(mod_chat:get_pid(), online_count).

process_build_index(Node) ->
	try
		rpc:call(Node, lib_cache, build_index, []),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("build index error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.

%% 获取版本号
process_version(Node) ->
	try
		Version = rpc:call(Node, game_version, v, []),
		io:format("~s~n", [Version]),
		erlang:halt(?STATUS_SUCCESS)
	catch
		_:Reason ->
			io:format("hotup error: ~p ~p", [Node, Reason]),
			erlang:halt(?STATUS_BADRPC)
	end.
