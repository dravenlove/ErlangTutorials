%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 十二月 2019 11:35
%%%-------------------------------------------------------------------
-module(lib_backstage_activity_default).
-author("13661").

-include("backstage_activity.hrl").

%% API
-export([
	process_activity_init/0,
	process_activity_start/0,
	process_activity_end/0,
	process_activity_daily_reset/1,
	before_activity_reset/0,
	after_activity_reset/0,
	before_activity_modify/0,
	after_activity_modify/0,
	process_activity_close/0,
	process_activity_timeout/1,
	process_activity_process_start/1,
	process_activity_process_termination/1,
	modify_activity/1,
	process_player_recharge/2
]).

process_activity_init() ->
	ok
.

process_activity_start()  ->
	ok
.

process_activity_end()->
	ok
.

process_activity_daily_reset(_CurTick) ->
	ok
.

before_activity_reset() ->
	ok
.

after_activity_reset() ->
	ok
.

before_activity_modify() ->
	ok
.

after_activity_modify() ->
	ok
.

process_activity_close() ->
	ok
.

process_activity_timeout(_CurTick) ->
	ok
.

process_activity_process_start(_IsNew) ->
	ok
.

process_activity_process_termination(_TerminationType) ->
	ok
.

modify_activity(NewActivity) when is_record(NewActivity, activity) ->
	ok
.

process_player_recharge(_PlayerId, _RechargeNumber) ->
	ok
.
