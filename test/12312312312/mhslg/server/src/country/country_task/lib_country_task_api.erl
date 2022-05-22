%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2021 6:00 PM
%%%-------------------------------------------------------------------
-module(lib_country_task_api).
-author("lichaoyu").
-include("common.hrl").
-include("country_task.hrl").

%% API
-export([		%% 通用
	task/1
]).

-export([		%% 玩家调用
	is_finish/1,
	country_task_info/0,
	country_finish/1,

	add/2					%% 个人任务累计
]).

-export([		%% 任务调用
	country_task/1,
	country_param/2,
	u_country_task/2,
	activate/2,

	add/3					%% 国家任务累计
]).

task(Task) ->
	lib_season_and_days_api:get_season() * 1000 + Task
.

is_finish(Task) ->
	#player_country_task{task = T} = lib_player_country_task:get_player_country_task(),
	Task =< T
.

country_task_info() ->
	#player_country_task{task = T} = PlayerCountryTask = lib_player_country_task:get_player_country_task(),
	Task = task(T),
	Conf = tb_country_task:get(Task),
	Param = maps:get(p1, Conf),
	case maps:get(classify, Conf) of
		?CLASS_COUNTRY ->
			case country_finish(T) of
				{true, P} -> {Task, P, Param, Param};
				{false, P} -> {Task, param(P), current(P), Param}
			end;
		?CLASS_PERSON ->
			{Task, [],
			case maps:get(type, Conf) of
				?PERSON_ANY_INDUSTRY -> lib_city_industry_api:city_industry_num(maps:get(p3, Conf));
				_ -> PlayerCountryTask#player_country_task.param
			end, Param}
	end
.
param(P) when is_list(P) -> P;
param(_) -> [].

current(P) when is_list(P) ->
	lists:foldl(
		fun(#'ProtoCountryTask'{current = C, target = T}, Acc) ->
			?IIF(C >= T, Acc + 1, Acc)
		end, 0, P);
current(P) -> P.

country_finish(Task) ->
	lib_map_api:sync(fun lib_country_task_api:country_param/2, [lib_player:player_country(), Task])
.

add(Type, Param) ->
	PlayerCountryTask = lib_player_country_task:get_player_country_task(),
	Conf = tb_country_task:get(task(PlayerCountryTask#player_country_task.task)),
	try
	    ?JUDGE_BREAK(maps:get(classify, Conf) =:= ?CLASS_PERSON),
		Num =
			case maps:get(type, Conf) of
				?PERSON_CONFIRM_INDUSTRY_WORK ->
					?JUDGE_BREAK(Type =:= ?ADD_INDUSTRY_WORK andalso maps:get(p2, Conf) =:= Param div 100),
					1;
				?PERSON_TRAN_SOLDIER ->
					?JUDGE_BREAK(Type =:= ?ADD_TRAIN_SOLDIER),
					Param;
				?PERSON_KILL_ENEMY ->
					?JUDGE_BREAK(Type =:= ?ADD_DESTROY_SOLDIER),
					Param;
				_ -> ?BREAK
			end,
		lib_player_country_task:put_player_country_task(PlayerCountryTask#player_country_task{param = PlayerCountryTask#player_country_task.param + Num})
	catch
	    _:_  -> skip
	end,
	lib_map_api:async(fun add/3, [lib_player:player_country(), Type, Param])
.


country_task(Country) ->
	maps:get(Country, lib_country_task:get_country_task())
.
u_country_task(Country, CountryTask) ->
	CountryTaskMaps = lib_country_task:get_country_task(),
	lib_country_task:put_country_task(maps:put(Country, CountryTask, CountryTaskMaps))
.

country_param(Country, Task) ->
	#country_task{task = CTask} = CountryTask = country_task(Country),
	Conf = tb_country_task:get(task(Task)),
	F = Task < CTask,
	Param =
		case maps:get(type, Conf) of
			?COUNTRY_CITY_CONFIRM ->
				lib_country_task:city_confirm(Country, lists:nth(Country, maps:get(p_text, Conf)), F);
			?COUNTRY_CITY_CONFIRM_INDUSTRY ->
				#{p2 := P2, p3 := P3, p_text := PText} = Conf,
				lib_country_task:city_confirm_building(Country, lists:nth(Country, PText), P2, P3);
			?COUNTRY_ANY_CITY_INDUSTRY_ACCURATE ->
				#{p2 := P2, p3 := P3} = Conf,
				lib_country_task:city_confirm_building(Country, P2, P3);
			?COUNTRY_CITY_BUILDINGS_LEVEL ->
				#{p3 := P3, p4 := P4, p_text := PText} = Conf,
				lib_country_task:city_confirm_building(Country, lists:nth(Country, PText), P4, P3);
			_ ->
				?IIF(F, [], CountryTask#country_task.param)
		end,
	{F, Param}
.

activate(Country, Task) ->
	CountryTask = country_task(Country),
	case CountryTask#country_task.task < Task of
		false -> skip;
		true ->
			NewCountryTask = #country_task{task = Task},
			u_country_task(Country, NewCountryTask)
	end
.

add(Country, Type, Param) ->
	CountryTask = maps:get(Country, lib_country_task:get_country_task()),
	Conf = tb_country_task:get(task(CountryTask#country_task.task)),
	try
		?JUDGE_BREAK(maps:get(classify, Conf) =:= ?CLASS_COUNTRY),
		Num =
			case maps:get(type, Conf) of
				?COUNTRY_ANY_INDUSTRY_WORK ->
					?JUDGE_BREAK(Type =:= ?ADD_INDUSTRY_WORK andalso maps:get(p2, Conf) =:= Param div 100),
					1;
				?COUNTRY_TRAN_SOLDIER ->
					?JUDGE_BREAK(Type =:= ?ADD_TRAIN_SOLDIER),
					Param;
				?COUNTRY_KILL_ENEMY ->
					?JUDGE_BREAK(Type =:= ?ADD_DESTROY_SOLDIER),
					Param;
				?COUNTRY_LOOK_FOR ->
					?JUDGE_BREAK(Type =:= ?ADD_VISITING),
					Param;
				_ -> ?BREAK
			end,
		u_country_task(Country, CountryTask#country_task{param = CountryTask#country_task.param + Num})
	catch
		_:_  -> skip
	end
.




