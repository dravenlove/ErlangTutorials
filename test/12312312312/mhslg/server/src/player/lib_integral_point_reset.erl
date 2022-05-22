%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Dec 2020 5:14 PM
%%%-------------------------------------------------------------------
-module(lib_integral_point_reset).
-author("df").
-include("common.hrl").
-include("player.hrl").

-define(ZERO,			0).
-define(ONE,			1).
-define(TWO,			2).
-define(THREE,			3).
-define(FOUR,			4).
-define(FIVE,			5).
-define(SIX,			6).
-define(SEVEN,			7).
-define(EIGHT,			8).
-define(NINE,			9).
-define(TEN,			10).
-define(ELEVEN,			11).
-define(TWELVE,			12).
-define(THIRTEEN,		13).
-define(FOURTEEN,		14).
-define(FIFTEEN,		15).
-define(SIXTEEN,		16).
-define(SEVENTEEN,		17).
-define(EIGHTEEN,		18).
-define(NINETEEN,		19).
-define(TWENTY,			20).
-define(TWENTY_ONE,		21).
-define(TWENTY_TWO,		22).
-define(TWENTY_THREE,	23).


 
%% API
-export([
	player_integral_point_resat/1,
	player_every_integral_point_resat/0
]).


update_hour_reset_tick(Hour, Tick) ->
	PlayerBase = lib_player:get_player_base(),
	Reset_tick = PlayerBase#player_base.hour_reset_tick,
	NewMap = maps:put(Hour, Tick, Reset_tick),
	lib_player:put_player_base(PlayerBase#player_base{hour_reset_tick = NewMap}, true)
.



%% 玩家进程0-23点更新
player_integral_point_resat(?ZERO) ->
	update_hour_reset_tick(?ZERO,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?ONE) ->
	update_hour_reset_tick(?ONE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWO) ->
	update_hour_reset_tick(?TWO,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?THREE) ->
	update_hour_reset_tick(?THREE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?FOUR) ->
	update_hour_reset_tick(?FOUR,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?FIVE) ->
	update_hour_reset_tick(?FIVE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?SIX) ->
	update_hour_reset_tick(?SIX,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?SEVEN) ->
	update_hour_reset_tick(?SEVEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?EIGHT) ->
	update_hour_reset_tick(?EIGHT,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?NINE) ->
	update_hour_reset_tick(?NINE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TEN) ->
	update_hour_reset_tick(?TEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?ELEVEN) ->
	update_hour_reset_tick(?ELEVEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWELVE) ->
	update_hour_reset_tick(?TWELVE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?THIRTEEN) ->
	update_hour_reset_tick(?THIRTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?FOURTEEN) ->
	update_hour_reset_tick(?FOURTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?FIFTEEN) ->
	update_hour_reset_tick(?FIFTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?SIXTEEN) ->
	update_hour_reset_tick(?SIXTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?SEVENTEEN) ->
	update_hour_reset_tick(?SEVENTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?EIGHTEEN) ->
	update_hour_reset_tick(?EIGHTEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?NINETEEN) ->
	update_hour_reset_tick(?NINETEEN,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWENTY) ->
	update_hour_reset_tick(?TWENTY,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWENTY_ONE) ->
	update_hour_reset_tick(?TWENTY_ONE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWENTY_TWO) ->
	update_hour_reset_tick(?TWENTY_TWO,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;

player_integral_point_resat(?TWENTY_THREE) ->
	update_hour_reset_tick(?TWENTY_THREE,lib_timer:unixtime()),
	RunList = [

	],
	lib_common:try_run(RunList)
;



player_integral_point_resat(_Time) ->
	RunList = [
	],
	lib_common:try_run(RunList)
.

player_every_integral_point_resat() ->
	RunList = [
		{fun lib_player_puppet:refresh_all_puppet/0, []},
		{fun lib_player_government_task:refresh_all_government_task_begin/0, []}
	],
	lib_common:try_run(RunList)
.
