%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2021 3:43 PM
%%%-------------------------------------------------------------------
-module(lib_player_country_task).
-author("lichaoyu").
-include("common.hrl").
-include("country_task.hrl").
-include("ProtoClient_10128.hrl").

%% API
-export([
	put_player_country_task/1,
	get_player_country_task/0,
	player_country_task_handler/0,
	test/0,
	request_country_task_info/0,
	request_country_task_get/0
]).

put_player_country_task(CountryTask) ->
	put_player_country_task(CountryTask, true).
put_player_country_task(CountryTask, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_COUNTRY_TASK),
	erlang:put(?ETS_PLAYER_COUNTRY_TASK, CountryTask).

get_player_country_task() ->
	erlang:get(?ETS_PLAYER_COUNTRY_TASK).

ets_init() ->
	ets:new(?ETS_PLAYER_COUNTRY_TASK, [?ETS_KEY_POS(#player_country_task.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_COUNTRY_TASK, {?TUPLE_INT(id, 1)}, true).

player_country_task_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_COUNTRY_TASK,
		table_name = ?DBPLAYER_COUNTRY_TASK,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_country_task:load_player_country_task/1,
		save_func = fun db_player_country_task:save_player_country_task/1,
		get_func = fun get_player_country_task/0,
		put_func = fun put_player_country_task/2
	}.

request_country_task_info() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_124), ?INFO("功能未开启")),
	{Task, Param, Current, Target} = lib_country_task_api:country_task_info(),
	Res = #'Proto50128201'{
		task = Task,
		param = Param,
		current = Current,
		target = Target
	},
	lib_send:respond_to_client(Res)
.

request_country_task_get() ->
	{Task, _Param, Current, Target} = lib_country_task_api:country_task_info(),
	Flag =
		case Current >= Target of
			true ->
				PlayerCountryTask = get_player_country_task(),
				NextTask = Task + 1,
				lib_map_api:async(fun lib_country_task_api:activate/2, [lib_player:player_country(), NextTask]),
				lib_equip_api:item(maps:get(reward, tb_country_task:get(lib_country_task_api:task(Task))), ?ADD_COUNTRY_TASK, Task),
				put_player_country_task(PlayerCountryTask#player_country_task{task = NextTask, param = 0}),
				1;
			false -> 0
		end,
	Res = #'Proto50128202'{flag = Flag},
	lib_send:respond_to_client(Res)
.

test() ->
	{Task, Param, Current, Target} = lib_country_task_api:country_task_info(),
	Res = #'Proto50128201'{
		task = Task,
		param = Param,
		current = Current,
		target = Target
	},
	?DEBUG("~p", [Res]),
	PlayerCountryTask = get_player_country_task(),
	NextTask = Task + 1,
	lib_map_api:async(fun lib_country_task_api:activate/2, [lib_player:player_country(), NextTask]),
	put_player_country_task(PlayerCountryTask#player_country_task{task = NextTask, param = 0})
.