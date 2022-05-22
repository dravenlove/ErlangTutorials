%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_tips_api.erl
%% Created on : 2019-06-11 17:48:00
%% Author: Jiuan
%% Last Modified: 2019-06-11 17:48:00
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_tips_api).
-include("common.hrl").
-export([
	tips/1,
	tips/2,
	tips/3
		]).

tips(TipsId) ->
	tips(TipsId, []).

tips(TipsId, Args) ->
	tips(TipsId, Args, lib_player:player_id()).

tips(TipsId, Args, PlayerId) ->
	lib_tips:tips(TipsId, Args, PlayerId).