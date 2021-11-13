%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 六月 2021 11:29
%%%-------------------------------------------------------------------
-module(lib_activity_default).
-author("13661").

-include("activity.hrl").

%% API
-export([
	process_activity_init/1,
	process_activity_start/1,
	process_activity_end/1,
	process_activity_daily_reset/2,
	before_activity_reset/1,
	after_activity_reset/1,
	before_activity_modify/1,
	after_activity_modify/1,
	process_activity_close/1,
	process_activity_timeout/2,
	process_activity_process_start/2,
	process_activity_process_termination/2,
	modify_activity/1,
	process_player_recharge/3
]).

process_activity_init(_ActId) ->
	ok
.

process_activity_start(_ActId)  ->
	ok
.

process_activity_end(_ActId)->
	ok
.

process_activity_daily_reset(_ActId, _CurTick) ->
	ok
.

before_activity_reset(_ActId) ->
	ok
.

after_activity_reset(_ActId) ->
	ok
.

before_activity_modify(_ActId) ->
	ok
.

after_activity_modify(_ActId) ->
	ok
.

process_activity_close(_ActId) ->
	ok
.

process_activity_timeout(_ActId, _CurTick) ->
	ok
.

process_activity_process_start(_ActId, _IsNew) ->
	ok
.

process_activity_process_termination(_ActId, _TerminationType) ->
	ok
.

modify_activity(NewActivity) when is_record(NewActivity, activity) ->
	ok
.

process_player_recharge(_ActId, _PlayerId, _RechargeNumber) ->
	ok
.
