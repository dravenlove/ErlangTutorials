%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_ba_cumulate_recharge
%%% Created on : 2020/8/29 0029 10:55
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_ba_cumulate_recharge).
-author("glendy").
-include("common.hrl").

%% API
-export([
	fast_load_config/1
]).

%% 累积充值配置预加载
%% 必须返回#backactivity{}
fast_load_config(BackActivity) ->
	BackActivity.
