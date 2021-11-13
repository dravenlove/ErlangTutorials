%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. 4月 2021 11:43
%%%-------------------------------------------------------------------
-module(lib_player_task_new).
-author("xuyonghui").
-include("ProtoClient_10139.hrl").
-include("common.hrl").
-include("inner_city.hrl").
-include("hero.hrl").
-include("clearing.hrl").
-include("chapter.hrl").
-include("hero_skill.hrl").
-include("science.hrl").

%% API
-export([
	get_player_task_info/0,
	put_player_task_info/1,
	player_task_handler/0,

	sign_in/0,						%% 登陆游戏处理
	reset_everyday/0,				%% 每日刷新
	process_update_task/1,			%% 处理更新任务条件
	process_update_task/2,
	process_update_task/3,

	refresh_task_status/1,			%% 刷新任务状态
	refresh_task_status/2,
	refresh_task_status/3,

	fetch_task_type_detail/1,		%% 获取对应任务类型的任务数据
	fetch_task_dict_by_type/1,		%% 获取对应任务类型的所有任务
	notify_task/2,					%% 通知任务更新
	find_task_info/1,				%% 查找某个任务信息
	update_task_info/1,				%% 更新任务信息
	delete_task_info/1,				%% 删除任务
	delete_all_task_info/1,			%% 删除对应类型的所有任务,不通知
	accept_task/1,					%% 接受任务
	submit_task/1,					%% 提交任务

	request_player_task_info/0,
	request_player_task_info/1,		%% 请求对应任务类型的面板信息
	request_submit_task/1,			%% 请求提交任务或领取任务奖励
	request_accept_task/1,			%% 请求接受任务
	request_abandon_task/1,			%% 请求放弃任务
	request_buy_task_times/1,		%% 请求购买政务任务次数
	request_task_donate/1,			%% 请求捐赠
	request_refresh_task/1,			%% 请求刷新政务任务
	request_upgrade_task_grade/1	%% 请求提升任务评价到S级

]).

player_task_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_TASK_INFO,
		table_name = ?DBPLAYER_PLAYER_TASK,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_task_new:load_player_task/1,
		save_func = fun db_player_task_new:save_player_task/1,
		get_func = fun get_player_task_info/0,
		put_func = fun put_player_task_info/2
	}.

ets_init() ->
	ets:new(?ETS_PLAYER_TASK_INFO,[?ETS_KEY_POS(#player_task_info.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PLAYER_TASK, {?TUPLE_INT(id, 1)}, false)
.

get_player_task_info() ->
	erlang:get(?ETS_PLAYER_TASK_INFO)
.

put_player_task_info(PlayerTask) when is_record(PlayerTask, player_task_info) ->
	put_player_task_info(PlayerTask, true)
.
put_player_task_info(PlayerTask, IsSaveDb) when is_record(PlayerTask, player_task_info) ->
	erlang:put(?ETS_PLAYER_TASK_INFO, PlayerTask),
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_TASK_INFO)
.

fetch_listen_task_type_dict(CondType) ->
	PlayerTaskInfo = get_player_task_info(),
	case dict:find(CondType,PlayerTaskInfo#player_task_info.listen_task_dict) of
		{ok, Value} -> Value;
		error -> dict:new()
	end
.

fetch_task_type_detail(?TASK_TYPE_CHAPTER_TASK) ->
	PlayerTaskInfo = get_player_task_info(),
	case dict:find(?TASK_TYPE_CHAPTER_TASK, PlayerTaskInfo#player_task_info.task_type_detail) of
		{ok, Value} -> Value;
		error -> #chapter_detail{}
	end
;
fetch_task_type_detail(?TASK_TYPE_ACHIEVEMENT_TASK) ->
	PlayerTaskInfo = get_player_task_info(),
	case dict:find(?TASK_TYPE_ACHIEVEMENT_TASK, PlayerTaskInfo#player_task_info.task_type_detail) of
		{ok, Value} -> Value;
		error -> #achievement_detail{}
	end
;
fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK) ->
	PlayerTaskInfo = get_player_task_info(),
	case dict:find(?TASK_TYPE_GOVERNMENT_TASK, PlayerTaskInfo#player_task_info.task_type_detail) of
		{ok, Value} -> Value;
		error -> #government_detail{}
	end
;
fetch_task_type_detail(_Type) ->
	undefined
.

fetch_task_dict_by_type(Type) ->
	PlayerTaskInfo = get_player_task_info(),
	case dict:find(Type, PlayerTaskInfo#player_task_info.task_dict) of
		{ok, Value} -> Value;
		error -> dict:new()
	end
.

find_task_info(TaskId) ->
	Type = lib_task_api:calc_task_type(TaskId),
	TaskTypeDict = fetch_task_dict_by_type(Type),
	case dict:find(TaskId, TaskTypeDict) of
		{ok, Value} -> Value;
		error -> undefined
	end
.

refresh_player_task_cur_value(TaskInfo, Value) ->
	#task_info{
		id = TaskId,
		cond_type = CondType,
		cur_value = CurValue
	} = TaskInfo,
	Conf = lib_task_api:get_task_conf(TaskId),
	FinalValue = case CondType of
		?COND_HERO_AMOUNT -> erlang:length(lib_hero_api:hero_list());
		?COND_TOTAL_HERO_LEVEL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_CITY_BOUNTY -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_BUILDING_LEVEL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_AFFAIR -> check_task_cond_cur_value(CondType, TaskInfo, Conf, Value);
		?COND_BUILDING_TYPE_LEVEL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_NOBILITY_PRIVILEGE -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_OCCUPY_INDUSTRY -> check_task_cond_cur_value(CondType, TaskInfo, Conf, Value);
		?COND_NOBILITY_LEVEL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_BELIEF_PASS -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_TOTAL_HERO_LEARN_SKILL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_EQUIP_AMOUNT -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_HERO_COLOR -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_HERO_ARMY_STAGE -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_INDUSTRY_AMOUNT -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_ARENA_RANK -> check_task_cond_cur_value(CondType, TaskInfo, Conf, Value);
		?COND_BUILD_CITY_HIDDEN_PATH -> check_task_cond_cur_value(CondType, TaskInfo, Conf, Value);
		?COND_HERO_SEX_SSR -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_EQUIP_COLOR -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_EQUIP_PART_AMOUNT -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_HERO_SR_SSR -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_ANY_HERO_SKILL_LEVEL -> fetch_task_cond_cur_value(CondType, Conf);
		?COND_KILL_MONSTER_ITEMS -> fetch_task_cond_cur_value(CondType, Conf);
		_ -> CurValue + Value
	end,
	NewTaskInfo = check_finish_task(CondType, TaskInfo, FinalValue),
	case NewTaskInfo#task_info.type =:= ?TASK_TYPE_GOVERNMENT_TASK andalso
			NewTaskInfo#task_info.status =:= ?TASK_STATUS_FINISH of
		true ->
			NewTaskInfo#task_info{grade = calc_task_grade(NewTaskInfo)};
		false -> NewTaskInfo
	end
.

check_finish_task(?COND_ARENA_RANK, TaskInfo, FinalValue) ->
	{CurValue, Status} =
		case FinalValue =< TaskInfo#task_info.final_value andalso FinalValue =/= 0 of
			true ->
				{?IIF(TaskInfo#task_info.type =:= ?TASK_TYPE_GOVERNMENT_TASK, FinalValue, TaskInfo#task_info.final_value)
					, ?TASK_STATUS_FINISH};
			false ->
				{FinalValue, ?TASK_STATUS_UNDONE}
		end,
	TaskInfo#task_info{cur_value = CurValue, status = Status}
;
check_finish_task(_CondType, TaskInfo, FinalValue) ->
	Status =
		if
			TaskInfo#task_info.status =:= ?TASK_STATUS_DRAW -> ?TASK_STATUS_DRAW;
			FinalValue >= TaskInfo#task_info.final_value -> ?TASK_STATUS_FINISH;
			true -> ?TASK_STATUS_UNDONE
		end,
TaskInfo#task_info{cur_value = FinalValue, status = Status}
.

fetch_task_cond_cur_value(?COND_TOTAL_HERO_LEVEL, Conf) ->
	CondValue = maps:get('cond', Conf, 0),
	lists:foldl(
		fun(HeroId, Sum) ->
			Level =  lib_hero_api:hero_level(HeroId),
			case Level >= CondValue of
				true -> Sum + 1;
				false -> Sum
			end
		end,
	0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_CITY_BOUNTY, Conf) ->
	CondId = maps:get(cond_id, Conf, 0),
	case lib_bounty_mission_api:is_finish(CondId) of
		true -> 1;
		false -> 0
	end
;
fetch_task_cond_cur_value(?COND_BUILDING_LEVEL, Conf) ->
	CondId = maps:get(cond_id, Conf, 0),
	lib_inner_city_api:building_level(CondId)
;
fetch_task_cond_cur_value(?COND_BUILDING_TYPE_LEVEL, Conf) ->
	CondId = maps:get(cond_id, Conf, 0),
	SubCond = maps:get(sub_cond , Conf, 0),
	PlayerBuilding = lib_inner_city:get_player_inner_city(),
	lib_common:dict_fold(
		fun(_BuildingId, Building, Max) ->
			Level = Building#building.building_lv,
			?JUDGE_CONTINUE(CondId =:= Building#building.class_id_big andalso
				SubCond =:= Building#building.class_id),
			?IIF(Level > Max, Level, Max)
		end,
	0, PlayerBuilding#inner_city.buildings_dict)
;
fetch_task_cond_cur_value(?COND_NOBILITY_PRIVILEGE, _Conf) ->
	Privilege = lib_nobility_api:get_privilege(),
	sets:size(Privilege)
;
fetch_task_cond_cur_value(?COND_NOBILITY_LEVEL, Conf) ->
	Cond = maps:get('cond',Conf,0),
	Privilege = lib_nobility_api:get_nobility(),
	?IIF(Privilege >= Cond, 1, 0)
;
fetch_task_cond_cur_value(?COND_BELIEF_PASS, Conf) ->
	Cond = maps:get('cond',Conf,0),
	StageId = maps:get(cond_id, Conf),
	Stage = lib_player_chapter:stage_info(StageId),
	?IIF(Stage#stage.is_pass andalso Stage#stage.pass_star >= Cond, 1, 0)
;
fetch_task_cond_cur_value(?COND_TOTAL_HERO_LEARN_SKILL, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	lib_common:list_foldl(
		fun(HeroId, Sum) ->
			Hero = lib_hero_api:hero_info(HeroId),
			Amount = maps:size(Hero#hero.skill_learning_map),
			?JUDGE_CONTINUE(Amount >= Cond),
			Sum + 1
		end,
	0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_EQUIP_AMOUNT, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	EquipDict = lib_equip_api:all_equip(),
	lib_common:dict_fold(
		fun(UniqueId, _EquipInfo, Acc) ->
			?JUDGE_CONTINUE(Cond =:= 0 orelse  Cond =:= lib_equip_api:type(UniqueId)),
			Acc + 1
		end,
	0, EquipDict)
;
fetch_task_cond_cur_value(?COND_HERO_COLOR, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	PlayerHero = lib_hero:get_player_hero(),
	lib_common:dict_fold(
		fun(_HeroId, Hero, Acc) ->
			?JUDGE_CONTINUE(Hero#hero.star >= Cond),
			Acc + 1
		end,
	0, PlayerHero#player_hero.hero_dict)
;
fetch_task_cond_cur_value(?COND_HERO_ARMY_STAGE, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	lib_common:list_foldl(
		fun(HeroId, Sum) ->
			{FrontStage, BackStage} = lib_hero_api:hero_corps_stage(HeroId),
			?JUDGE_CONTINUE(FrontStage >= Cond andalso BackStage >= Cond),
			Sum + 1
		end,
	0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_INDUSTRY_AMOUNT, Conf) ->
	CityIndustryDict = lib_city_industry_api:city_industry_dict(),
	case maps:find('cond', Conf) of
		error -> dict:size(CityIndustryDict);
		{ok, Cond} ->
			dict:fold(
				fun(CityId, _, Acc) ->
					Conf0 = tb_world_city:get(CityId),
					case maps:get(attacktype, Conf0) =:= maps:get(cond_id, Conf) andalso maps:get(canattacklv, Conf0) >= Cond of
						true -> Acc + 1;
						false -> Acc
					end
				end, 0, CityIndustryDict)
	end
;
fetch_task_cond_cur_value(?COND_ARENA_RANK, _Conf) ->
	lib_player_arena:sync_request(fun lib_arena_api:player_rank/1, [])
;
fetch_task_cond_cur_value(?COND_HERO_SEX_SSR, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	lib_common:list_foldl(
		fun(HeroId, Sum) ->
			Sex = lib_hero_api:hero_sex(HeroId),
			Quality = lib_hero_api:hero_quality(HeroId),
			?JUDGE_CONTINUE(Sex =:= Cond andalso Quality =:= ?HERO_QUALITY_KINGDOM),
			Sum + 1
		end,
		0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_EQUIP_COLOR, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	SubCond = maps:get('sub_cond', Conf, 0),
	EquipDict = lib_equip_api:all_equip(),
	lib_common:dict_fold(
		fun(UniqueId, PackItem, Sum) ->
			Color = PackItem#item.equip_info#equip_info.break_through,
			TypeFlag = Cond =:= 0 orelse  Cond =:= lib_equip_api:type(UniqueId),
			?JUDGE_CONTINUE(TypeFlag andalso Color >= SubCond),
			Sum + 1
		end,
	0, EquipDict)
;
fetch_task_cond_cur_value(?COND_EQUIP_PART_AMOUNT, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	SubCond = maps:get(sub_cond, Conf, 0),
	EquipDict = lib_equip_api:all_equip(),
	lib_common:dict_fold(
		fun(_UniqueId, EquipInfo, Sum) ->
			SubType = maps:get(sub_type, tb_item:get(EquipInfo#item.item_id)),
			Color = maps:get(color, tb_item:get(EquipInfo#item.item_id)),
			?JUDGE_CONTINUE(SubType =:= Cond andalso Color >= SubCond),
			Sum + 1
		end,
		0, EquipDict)
;
fetch_task_cond_cur_value(?COND_HERO_SR_SSR, _Conf) ->
	lib_common:list_foldl(
		fun(HeroId, Sum) ->
			Quality = lib_hero_api:hero_quality(HeroId),
			?JUDGE_CONTINUE(Quality =:= ?HERO_QUALITY_HEROES orelse Quality =:= ?HERO_QUALITY_KINGDOM),
			Sum + 1
		end,
	0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_ANY_HERO_SKILL_LEVEL, Conf) ->
	Cond = maps:get('cond', Conf, 0),
	lists:foldl(
		fun(HeroId, Sum) ->
			Hero = lib_hero_api:hero_info(HeroId),
			Value = lib_common:map_fold(
				fun(_SkillId, Skill, Acc) ->
					case Skill#skill.level >= Cond of
						true ->
							throw({break, 1});
						false -> Acc
					end
				end,
			0, Hero#hero.skill_learning_map),
			Sum + Value
		end,
	0, lib_hero_api:hero_id_list())
;
fetch_task_cond_cur_value(?COND_KILL_MONSTER_ITEMS, Conf) ->
	CondId = maps:get(cond_id, Conf, 0),
	lib_player_pack:count_by_id(CondId)
;
fetch_task_cond_cur_value(_CondType, _Conf) ->
	0
.

check_task_cond_cur_value(?COND_AFFAIR, TaskInfo, Conf, Value) ->
	Cond = maps:get('cond', Conf, 0),
	case  Value >= Cond andalso Value =/= 0 of
		true -> TaskInfo#task_info.cur_value + 1;
		false -> TaskInfo#task_info.cur_value
	end
;
check_task_cond_cur_value(?COND_OCCUPY_INDUSTRY, TaskInfo, Conf, Value) ->
	Cond = maps:get('cond', Conf, 0),
	case Value >= Cond of
		true -> TaskInfo#task_info.cur_value + 1;
		false -> TaskInfo#task_info.cur_value
	end
;
check_task_cond_cur_value(?COND_ARENA_RANK, _TaskInfo, _Conf, Value) ->
	Value
;
check_task_cond_cur_value(?COND_BUILD_CITY_HIDDEN_PATH, TaskInfo, Conf, Value) ->
	Cond = maps:get('cond', Conf, 0),
	case Cond =:= Value andalso Value =/= 0 of
		true -> TaskInfo#task_info.cur_value + 1;
		false -> TaskInfo#task_info.cur_value
	end
;
check_task_cond_cur_value(_CondType, TaskInfo, _Conf, _Value) ->
	TaskInfo#task_info.cur_value
.

sign_in() ->
	lib_player_chapter_task:check_start_next_chapter(),
	lib_player_daily_task:check_accept_daily_task(),
	lib_player_achievement_task:check_accept_achievement_task(),
	lib_player_government_task:refresh_all_government_task_begin(false, false, ?TASK_STATUS_INIT)
.

reset_everyday() ->
	lib_player_daily_task:reset_everyday(),
	lib_player_government_task:reset_everyday()
.

refresh_task_status(CondType) ->
	refresh_task_status(CondType, 0)
.
refresh_task_status(CondType, CondId) ->
	refresh_task_status(CondType, CondId, 0)
.
refresh_task_status(CondType, CondId, Value) ->
	PlayerTaskInfo = get_player_task_info(),
	TaskDict = PlayerTaskInfo#player_task_info.task_dict,
	ListenTaskTypeDict = fetch_listen_task_type_dict(CondType),
	{NewTaskDict, NewListenTaskTypeDict} = lib_common:dict_fold(
		fun(TaskId, TaskInfo, {TaskDictAcc, ListenTaskTypeDictAcc}) ->
			?JUDGE_CONTINUE(TaskInfo#task_info.cond_id =:= CondId),
			Type = TaskInfo#task_info.type,
			TaskTypeDict = ?DICT_FETCH(Type, TaskDictAcc, dict:new()),
			?JUDGE_CONTINUE((dict:fetch(TaskId, TaskTypeDict))#task_info.status =/= ?TASK_STATUS_DRAW),
			NewTaskInfo = refresh_player_task_cur_value(TaskInfo, Value),
			notify_task(NewTaskInfo, ?TASK_UPDATE),
			Type = NewTaskInfo#task_info.type,
			NewTaskTypeDict = dict:store(TaskId, NewTaskInfo, TaskTypeDict),
			NewListenTaskTypeDictAcc = dict:store(TaskId, NewTaskInfo, ListenTaskTypeDictAcc),
			{dict:store(Type, NewTaskTypeDict, TaskDictAcc), NewListenTaskTypeDictAcc}
		end, {TaskDict, ListenTaskTypeDict}, ListenTaskTypeDict),
	NewPlayerTaskInfo = PlayerTaskInfo#player_task_info
	{
		task_dict = NewTaskDict,
		listen_task_dict = dict:store(CondType, NewListenTaskTypeDict, PlayerTaskInfo#player_task_info.listen_task_dict)
	},
	put_player_task_info(NewPlayerTaskInfo)
.

notify_task(TaskInfo, Cmd) ->
	ProtoTaskInfo = lib_task_api:make_proto_task_info(TaskInfo),
	Respond = #'Proto80139001'{
		task = ProtoTaskInfo,
		cmd = Cmd
	},
	lib_send:respond_to_client(Respond)
.

accept_task(TaskInfo) ->
	PlayerTaskInfo = get_player_task_info(),
	#task_info{
		id = TaskId,
		type = Type,
		cond_type = CondType
	} = TaskInfo,

	Conf = lib_task_api:get_task_conf(TaskId),
	NewTaskInfo =
		case CondType of
			?COND_ARENA_RANK ->
				Value = fetch_task_cond_cur_value(CondType,Conf),
				refresh_player_task_cur_value(TaskInfo, Value);
			_ ->
				refresh_player_task_cur_value(TaskInfo, 0)
		end,
	TaskTypeDict = fetch_task_dict_by_type(Type),
	NewTaskTypeDict = dict:store(TaskId, NewTaskInfo, TaskTypeDict),
	ListenTaskDict = PlayerTaskInfo#player_task_info.listen_task_dict,
	ListenTaskTypeDict = fetch_listen_task_type_dict(CondType),
	NewListenTaskDict =
		case NewTaskInfo#task_info.status =:= ?TASK_STATUS_UNDONE of
			true ->
				NewListenTaskTypeDict = dict:store(TaskId, NewTaskInfo, ListenTaskTypeDict),
				dict:store(CondType, NewListenTaskTypeDict, ListenTaskDict);
			false ->
				ListenTaskDict
		end,

	put_player_task_info(PlayerTaskInfo#player_task_info{
		task_dict = dict:store(Type, NewTaskTypeDict, PlayerTaskInfo#player_task_info.task_dict),
		listen_task_dict = NewListenTaskDict
	}),
	lib_serial_api:serial_task(lib_player:get_player_base(), NewTaskInfo, ?SERIAL_TASK_ACCEPT),
	notify_task(NewTaskInfo, ?TASK_ADD)
.

update_task_info(TaskInfo) ->
	TaskId = TaskInfo#task_info.id,
	Type = TaskInfo#task_info.type,
	PlayerTaskInfo = get_player_task_info(),
	TaskTypeDict = fetch_task_dict_by_type(Type),
	NewTaskTypeDict = dict:store(TaskId, TaskInfo, TaskTypeDict),
	put_player_task_info(PlayerTaskInfo#player_task_info{
		task_dict = dict:store(Type, NewTaskTypeDict ,PlayerTaskInfo#player_task_info.task_dict)
	})
.

delete_task_info(TaskInfo) ->
	#task_info{
		id = TaskId,
		type = Type,
		cond_type = CondType
	} = TaskInfo,
	PlayerTaskInfo = get_player_task_info(),
	TaskTypeDict = fetch_task_dict_by_type(Type),
	NewTaskTypeDict = dict:erase(TaskId, TaskTypeDict),
	NewTaskInfoDict = dict:store(Type, NewTaskTypeDict, PlayerTaskInfo#player_task_info.task_dict),
	ListenTypeDict = fetch_listen_task_type_dict(CondType),
	NewListenTypeDict = dict:erase(TaskId, ListenTypeDict),
	NewListenDict = dict:store(CondType, NewListenTypeDict, PlayerTaskInfo#player_task_info.listen_task_dict),
	put_player_task_info(PlayerTaskInfo#player_task_info{task_dict = NewTaskInfoDict, listen_task_dict = NewListenDict}),
	notify_task(TaskInfo, ?TASK_DELETE)
.

delete_all_task_info(Type) ->
	TaskTypeDict = fetch_task_dict_by_type(Type),
	dict:map(
		fun(_TaskId, TaskInfo) ->
			delete_task_info(TaskInfo)
		end,
	TaskTypeDict)
.


request_player_task_info() ->
	request_player_task_info(#'Proto10139001'{type = ?TASK_TYPE_GOVERNMENT_TASK})
.
request_player_task_info(Msg) ->
	Type = Msg#'Proto10139001'.type,
	ProtoGovernmentDetail =
		case Type =:= ?TASK_TYPE_GOVERNMENT_TASK of
			true ->
				?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_139), ?ERROR_MANSION_LEVEL),
				GovernmentDetail = fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
				TotalTimes = maps:get(value, tb_task_const:get(government_times), 0)
					+ lib_nobility_api:privilege_add(?GOVERNMENT_AFFAIRS_TIME)
					+ GovernmentDetail#government_detail.buy_times
					+ lib_player_science_api:get_effect_value(?EFFECT_GOVERNMENT_TASK_TIMES_ADD),
				#'ProtoGovernmentDetail'{
					use_times = GovernmentDetail#government_detail.use_times,
					total_times =TotalTimes,
					use_buy_times = GovernmentDetail#government_detail.buy_times,
					next_refresh_tick = GovernmentDetail#government_detail.next_refresh_tick,
					use_free_times = GovernmentDetail#government_detail.free_refresh_times
				};
			false ->
				#'ProtoGovernmentDetail'{}
		end,
	TaskTypeDict = fetch_task_dict_by_type(Type),
	ProtoTaskInfoList = dict:fold(
		fun(_TaskId,TaskInfo,Acc) ->
			ProtoTaskInfo = lib_task_api:make_proto_task_info(TaskInfo),
			[ProtoTaskInfo | Acc]
		end, [], TaskTypeDict),
	Respond = #'Proto50139001'{type = Type, task_list = ProtoTaskInfoList, government = ProtoGovernmentDetail},
	lib_send:respond_to_client(Respond)
.

request_submit_task(Msg) ->
	TaskId = Msg#'Proto10139002'.task_id,
	TaskInfo = find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo =/= undefined, ?ERROR_BAD_TASK),
	?JUDGE_RETURN(TaskInfo#task_info.status =:= ?TASK_STATUS_FINISH, ?ERROR_TASK_NOT_FINISH),
	process_submit_remove(TaskInfo#task_info.cond_type, TaskInfo),
	NewTaskInfo = TaskInfo#task_info{status = ?TASK_STATUS_DRAW},
	case NewTaskInfo#task_info.type of
		?TASK_TYPE_ACHIEVEMENT_TASK ->
			submit_task(NewTaskInfo),
			lib_player_achievement_task:accept_next_task(NewTaskInfo);
		?TASK_TYPE_GOVERNMENT_TASK ->
			update_task_info(NewTaskInfo),
			lib_player_government_task:submit_task(NewTaskInfo);
		_ ->
			submit_task(NewTaskInfo),
			update_task_info(NewTaskInfo)
	end
.

submit_task(TaskInfo) ->
	TaskId = TaskInfo#task_info.id,
	Conf = lib_task_api:get_task_conf(TaskId),
	RewardId = maps:get(reward_id, Conf),
	ItemList = lib_task_api:make_reward(RewardId),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_TASK_REWARD, TaskId), true, ?PACK_TIPS1),
	lib_serial_api:serial_task(lib_player:get_player_base(), TaskInfo, ?SERIAL_TASK_SUBMIT),
	notify_task(TaskInfo, ?TASK_UPDATE)
.

process_submit_remove(?COND_KILL_MONSTER_ITEMS, TaskInfo) ->
	Item = #item{item_id = TaskInfo#task_info.cond_id, amount = TaskInfo#task_info.cur_value},
	lib_player_pack:auto_remove([Item], ?REMOVE_SERIAL(?USE_TASK_SUBMIT, TaskInfo#task_info.id))
;
process_submit_remove(_CondType, _TaskInfo) ->
	ok
.

request_accept_task(Msg) ->
	TaskId = Msg#'Proto10139006'.task_id,
	TaskInfo = find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo =/= undefined, ?ERROR_BAD_TASK),
	?JUDGE_RETURN(TaskInfo#task_info.status =:= ?TASK_STATUS_INIT, ?ERROR_GOTTEN_REWARD),
	case TaskInfo#task_info.type of
		?TASK_TYPE_GOVERNMENT_TASK -> lib_player_government_task:accept_task(TaskInfo);
		_ -> accept_task(TaskInfo)
	end
.

request_abandon_task(Msg) ->
	TaskId = Msg#'Proto10139007'.task_id,
	TaskInfo = find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo =/= undefined, ?ERROR_BAD_TASK),
	?JUDGE_RETURN(TaskInfo#task_info.status =:= ?TASK_STATUS_UNDONE, ?ERROR_GOTTEN_REWARD),
	NewTaskInfo = TaskInfo#task_info{status = ?TASK_STATUS_INIT},
	lib_serial_api:serial_task(lib_player:get_player_base(), NewTaskInfo, ?SERIAL_TASK_ABANDON),
	case TaskInfo#task_info.city_id of 0 -> skip; CityId -> lib_map_clearing_api:d_clearing_by_type(?TYPE_GOVERNMENT_TASK, CityId) end,
	update_task_info(NewTaskInfo#task_info{status = ?TASK_STATUS_DRAW}),
	lib_player_government_task:refresh_all_government_task_begin(false, true, ?TASK_STATUS_DRAW),
	request_player_task_info()
.

request_buy_task_times(Msg) ->
	Type = Msg#'Proto10139008'.type,
	case Type of
		?TASK_TYPE_GOVERNMENT_TASK ->
			?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_139), ?ERROR_MANSION_LEVEL),
			lib_player_government_task:buy_task_times();
		_ -> buy_task_times(Type)
	end
.

buy_task_times(_Type) ->
	?JUDGE_RETURN(false, ?ERROR_INVALID_PARAM)
.

request_task_donate(Msg) ->
	TaskId = Msg#'Proto10139009'.task_id,
	Amount = Msg#'Proto10139009'.amount,
	TaskInfo = find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo =/= undefined, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(TaskInfo#task_info.final_value * maps:get(value, tb_task_const:get(government_multiple)) >= TaskInfo#task_info.cur_value, ?ERROR_GOTTEN_REWARD),
	?JUDGE_RETURN(lib_player_map:city_country(TaskInfo#task_info.city_id) =:= lib_player:player_country(), ?ERROR_TASK_CITY),
	?JUDGE_RETURN(TaskInfo#task_info.cond_type =:= ?COND_DONATE_ITEMS andalso
		TaskInfo#task_info.status =/= ?TASK_STATUS_INIT, ?ERROR_INVALID_PARAM),
	Item = #item{item_id = TaskInfo#task_info.cond_id, amount = Amount},
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_TASK_DONATE, TaskId)),
	NewTaskInfo = process_task_donate(TaskInfo, Amount),
	update_task_info(NewTaskInfo),
	notify_task(NewTaskInfo, ?TASK_UPDATE)
.

process_task_donate(TaskInfo, Amount) ->
	NewTaskInfo = TaskInfo#task_info{cur_value = TaskInfo#task_info.cur_value + Amount},
	Status =
		case NewTaskInfo#task_info.cur_value >= NewTaskInfo#task_info.final_value of
			true -> ?TASK_STATUS_FINISH;
			false -> TaskInfo#task_info.status
		end,
	Grade = calc_task_grade(NewTaskInfo),
	NewTaskInfo#task_info{status = Status, grade = Grade}
.

calc_task_grade(TaskInfo) ->
	Multiple = TaskInfo#task_info.cur_value div TaskInfo#task_info.final_value,
	try
		?JUDGE_RETURN(Multiple > 0, 1),
		lists:foldl(
			fun(GradeId, Acc) ->
				#{min_multiple := Min} = tb_government_task_grade:get(GradeId),
				?JUDGE_RETURN(Multiple >= Min, Acc),
				GradeId
			end,
		1, tb_government_task_grade:get_list())
	catch
		throw : {error, Grade} -> Grade
	end
.

request_refresh_task(Msg) ->
	IsFree =  Msg#'Proto10139010'.is_free,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_139), ?ERROR_MANSION_LEVEL),
	GovernmentDetail = fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	case IsFree > 0 of
		true ->
			FreeTimes = maps:get(value, tb_task_const:get(government_free_times)),
			RefreshTimes = GovernmentDetail#government_detail.free_refresh_times,
			?JUDGE_RETURN(RefreshTimes < FreeTimes, ?ERROR_NO_TASK_REFRESH),
			lib_player_government_task:update_government(GovernmentDetail#government_detail{
				free_refresh_times = RefreshTimes + 1
			}),
			lib_player_task_new:request_player_task_info(#'Proto10139001'{type = ?TASK_TYPE_GOVERNMENT_TASK});
		false ->
			Cost = maps:get(jsonvalue, tb_task_const:get(government_refresh_cost)),
			Item = lib_item_api:conf_item_to_pack_item(Cost),
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_TASK_REFRESH, ?TASK_TYPE_GOVERNMENT_TASK))
	end,
	lib_player_government_task:refresh_all_government_task_begin(true, true, ?TASK_STATUS_INIT)
.

request_upgrade_task_grade(Msg) ->
	TaskId = Msg#'Proto10139011'.task_id,
	TaskInfo = find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo =/= undefined, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(TaskInfo#task_info.status =:= ?TASK_STATUS_FINISH andalso
		TaskInfo#task_info.grade =/= ?TASK_GRADE_S, ?ERROR_INVALID_PARAM),
	Cost = maps:get(jsonvalue, tb_task_const:get(government_grade_cost)),
	Item = lib_item_api:conf_item_to_pack_item(Cost),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_TASK_GRADE, TaskId)),
	NewTaskInfo = TaskInfo#task_info{grade = ?TASK_GRADE_S},
	update_task_info(NewTaskInfo),
	notify_task(NewTaskInfo, ?TASK_UPDATE)
.

process_update_task(CondType) ->
	process_update_task(CondType, 0)
.
process_update_task(CondType, CondId) ->
	process_update_task(CondType, CondId, 0)
.
process_update_task(CondType, CondId, Value) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [CondType, CondId, Value]}
	],
	lib_common:try_run(RunList)
.
