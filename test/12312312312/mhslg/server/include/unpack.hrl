%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: unpack
%%% Created on : 2020/8/3 0003 20:12
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('unpack_HRL').
-define('unpack_HRL', true).

-define(PACK_MAX_LEN, 1024*1024*1).

-define(HEARTBEAT_CHECK_INTERVAL, 10 * 1000).

-define(PEND_SHAKEHANDS_STATE, 0).
-define(PEND_FRAME_STATE, 1).
-define(PEND_LEN_STATE, 2).
-define(PEND_DATA_STATE, 3).
-define(CRC_HEAD_KEY, [123,0,0,0]).
-record(unpack_state, {
	sock_pid,
	client_ip = "",
	client_port = 0,
	player_id = 0,
	player_pid = undefined,
	pending_wait = <<>>,
	pending_state = ?PEND_LEN_STATE,
	pending_len = 0,
	is_validate = false,
	is_login = false,
	account = "",
	serial_key = 0,	%% 由客户端发来递增
	heratbeat_tick = 0,
	mod_routing = undefined
}).


-endif.
