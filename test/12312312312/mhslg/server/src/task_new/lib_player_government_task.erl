%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 22. 4月 2021 16:41
%%%-------------------------------------------------------------------
-module(lib_player_government_task).
-author("xuyonghui").
-include("common.hrl").
-include("ProtoClient_10139.hrl").
-include("inner_city.hrl").
-include("troops.hrl").
-include("map.hrl").
-include("clearing.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("science.hrl").

%% API
-export([
	update_government/1,
	refresh_all_government_task_begin/0,
	refresh_all_government_task_begin/3,
	buy_task_times/0,
	accept_task/1,
	submit_task/1,
	request_challenge_government_task/2,
	respond_challenge_government_task/2,
	reset_everyday/0,
	total_time/0,
	nobility_time/0,
	clean_nobility_time/0
]).

update_government(Government) when is_record(Government, government_detail) ->
	PlayerTaskInfo = lib_player_task_new:get_player_task_info(),
	NewTaskTypeDict = dict:store(
		?TASK_TYPE_GOVERNMENT_TASK, Government, PlayerTaskInfo#player_task_info.task_type_detail),
	lib_player_task_new:put_player_task_info(PlayerTaskInfo#player_task_info{task_type_detail = NewTaskTypeDict})
.

refresh_all_government_task_begin() ->
	refresh_all_government_task_begin(true, false, ?TASK_STATUS_INIT)
.
refresh_all_government_task_begin(IsNotify, IsForce, DeleteStatus) ->
	try
		?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_139), -1),
		Now = lib_timer:unixtime(),
		Government = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
		?JUDGE_RETURN(IsForce =:= true orelse Now >= Government#government_detail.next_refresh_tick, -1),
		NextRefresh = lib_timer:next_hour_unixtime(Now),
		update_government(Government#government_detail{
			next_refresh_tick = NextRefresh, is_notify = IsNotify, delete_status = DeleteStatus}),
		CityList = lib_player_map:country_city(lib_player:player_country()),
		refresh_all_government_task_end(CityList)
	catch
		throw: {error, ErrCode} -> {false, ErrCode}
	end
.

refresh_all_government_task_end(CityList) ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	NewCityList = lists:filter(
		fun(CityId) ->
			Type = lib_map_api:type(CityId),
			Type =< ?CITY_CAPITAL andalso
			Type >= ?CITY_XIAN_CITY andalso
			lib_bounty_mission_api:is_finish(CityId) andalso
			lib_player_map:city_fight(CityId) =:= ?FIGHTING_NO
		end, CityList),
	{GovernmentTaskDict, CondTypeSet, RandomCity} = dict:fold(
		fun(TaskId, TaskInfo, {Acc, Acc1, Acc2}) ->
			case TaskInfo#task_info.status =:= GovernmentDetail#government_detail.delete_status of
				true ->
					lib_player_task_new:delete_task_info(TaskInfo),
					{Acc, Acc1, Acc2};
				false ->
					CityId = TaskInfo#task_info.city_id,
					Index = maps:get(index, tb_government_task:get(TaskId), 0),
					{dict:store(TaskId, TaskInfo, Acc), sets:add_element(Index, Acc1), lists:delete(CityId, Acc2)}
			end
		end, {dict:new(), sets:new(), NewCityList}, lib_player_task_new:fetch_task_dict_by_type(?TASK_TYPE_GOVERNMENT_TASK)),

	LordMansion = lib_player:player_level(),
	TaskList = lists:filter(
		fun(TaskId) ->
			Conf = lib_task_api:get_task_conf(TaskId),
			LordMansion =:= maps:get(lord_mansion, Conf, 0) andalso
			sets:is_element(maps:get(index, Conf, 0), CondTypeSet) =:= false
		end, tb_government_task:get_list()),
	NewGovernmentTaskDict = generate_government_task(GovernmentTaskDict, RandomCity, TaskList),
	PlayerTaskInfo = lib_player_task_new:get_player_task_info(),
	NewTaskDict = dict:store(?TASK_TYPE_GOVERNMENT_TASK, NewGovernmentTaskDict, PlayerTaskInfo#player_task_info.task_dict),
	lib_player_task_new:put_player_task_info(PlayerTaskInfo#player_task_info{task_dict = NewTaskDict})
.

generate_government_task(GovernmentTaskDict, CityList, TaskList) ->
	TotalNum = maps:get(value, tb_task_const:get(government_amount)),
	NeedNum = TotalNum - dict:size(GovernmentTaskDict),
	RandomCityList = lib_random:rand_more(NeedNum, CityList),
	random_task(RandomCityList, TaskList, GovernmentTaskDict)
.
random_task([CityId | RandomCityList], List, Dict) ->
	TaskId = lib_random:rand_one(List),
	RewardId = random_reward_id(TaskId),
	TaskInfo = (lib_task_api:init_task(TaskId))#task_info{reward_id = RewardId},
	Conf = lib_task_api:get_task_conf(TaskId),
	City = maps:get(city, Conf, 0),
	NewTaskInfo =
		if
			City =:= 0 -> TaskInfo;
			TaskInfo#task_info.cond_type =:= ?COND_BUILD_VAL -> TaskInfo#task_info{cond_id = CityId, city_id = CityId};
			true -> TaskInfo#task_info{city_id = CityId}
		end,
	lib_player_task_new:notify_task(NewTaskInfo, ?TASK_ADD),
	random_task(RandomCityList, lists:delete(TaskId, List), dict:store(TaskId, NewTaskInfo, Dict))
;
random_task([], _List, Dict) ->
	Dict
.

random_reward_id(TaskId) ->
	Conf = lib_task_api:get_task_conf(TaskId),
	RewardGroupId = maps:get(reward_id, Conf),
	RewardGroup = tb_task_reward_group:get(RewardGroupId),
	WeightList =
		lib_common:map_fold(
			fun(_K, V, Acc1) ->
				#{reward_id := RewardId, power := Weight} = V,
				[{Weight, RewardId} | Acc1]
			end,
		[],RewardGroup),
	util:weight_rand(WeightList)
.

buy_task_times() ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	Max = maps:get(value, tb_task_const:get(government_buy_times), 0),
	BuyTimes = GovernmentDetail#government_detail.buy_times,
	?JUDGE_RETURN(BuyTimes < Max, ?ERROR_INVALID_PARAM),
	Cost = maps:get(jsonvalue, tb_task_const:get(government_times_cost)),
	Item = lib_item_api:conf_item_to_pack_item(Cost),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?INSERT_SERIAL(?USE_TASK_BUY_TIMES, ?TASK_TYPE_GOVERNMENT_TASK)),
	lib_player_government_task:update_government(GovernmentDetail#government_detail{buy_times = BuyTimes + 1}),
	lib_player_task_new:request_player_task_info(#'Proto10139001'{type = ?TASK_TYPE_GOVERNMENT_TASK})
.

accept_task(TaskInfo) ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	TotalTimes = maps:get(value, tb_task_const:get(government_times), 0)
		+ lib_nobility_api:privilege_add(?GOVERNMENT_AFFAIRS_TIME)
		+ GovernmentDetail#government_detail.buy_times
		+ lib_player_science_api:get_effect_value(?EFFECT_GOVERNMENT_TASK_TIMES_ADD),
	?JUDGE_RETURN(GovernmentDetail#government_detail.use_times < TotalTimes, ?ERROR_NO_TASK_TIMES),
	add_accept_task_times(1),
	lib_player_task_new:accept_task(TaskInfo),
	lib_player_task_new:request_player_task_info(#'Proto10139001'{type = ?TASK_TYPE_GOVERNMENT_TASK}),
	case TaskInfo#task_info.city_id of
		0 -> skip;
		CityId ->
			CanClearing = lib_map_clearing_api:city_task(CityId, ?TYPE_GOVERNMENT_TASK, TaskInfo#task_info.id),
			?JUDGE_RETURN(CanClearing, ?ERROR_CONFIG_NOT_EXISTENT)
	end
.

add_accept_task_times(Times) ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	update_government(GovernmentDetail#government_detail{
		use_times = GovernmentDetail#government_detail.use_times + Times
	})
.

add_total_time(Times) ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	update_government(GovernmentDetail#government_detail{
		total_time = GovernmentDetail#government_detail.total_time + Times,
		nobility_time = GovernmentDetail#government_detail.nobility_time + Times

	})
.

total_time() ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	GovernmentDetail#government_detail.total_time
.

nobility_time() ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	GovernmentDetail#government_detail.nobility_time
.

clean_nobility_time() ->
	GovernmentDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	update_government(GovernmentDetail#government_detail{
		nobility_time = 0
	})
.

submit_task(TaskInfo) ->
	#task_info{
		id = TaskId,
		sub_type = SubType,
		reward_id = RewardId,
		grade = Grade
	} = TaskInfo,
	ItemConfList1 = maps:get(item_list, tb_task_reward:get(RewardId)),
	Conf = lib_task_api:get_task_conf(TaskId),
	Mansion = maps:get(lord_mansion, Conf),
	GradeFeat0 = calc_grade_feat(Grade, Mansion) + maps:get(feat, Conf),
	GradeFeat = trunc(GradeFeat0 * (100 + lib_player_science_api:get_effect_value(?EFFECT_AFFAIR_REWARD_ADD) + lib_nobility_api:privilege_add(?GOVERNMENT_AFFAIRS_FEAT)) / 100),
	GradeSilver = calc_grade_silver(SubType, Grade, Mansion),
	ItemConfList2 = lists:filter(
		fun(ItemConf) ->
			lists:nth(2, ItemConf) > 0
		end, [[?FEAT_ID, GradeFeat], [?MONEY_ID, GradeSilver]]),
	ItemConfList = lib_item_api:merge_conf_item_list(ItemConfList1, ItemConfList2),
	ItemList = lib_item_api:conf_item_list_to_item_obj_list(ItemConfList),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_TASK_REWARD, TaskId), true, ?PACK_TIPS1),
	lib_serial_api:serial_task(lib_player:get_player_base(), TaskInfo, ?SERIAL_TASK_SUBMIT),
	lib_player_task_new:notify_task(TaskInfo, ?TASK_UPDATE),
	case TaskInfo#task_info.city_id of
		0 -> skip;
		CityId -> lib_map_clearing_api:d_clearing_by_type(?TYPE_GOVERNMENT_TASK, CityId)
	end,
	add_total_time(1),
	refresh_all_government_task_begin(true, true, ?TASK_STATUS_DRAW),
	lib_player_process:process_government_task_submit(Grade)
.

calc_grade_feat(Grade, Mansion) ->
	Id = Mansion * 100 + Grade,
	Conf = tb_government_task_grade_feat:get(Id),
	maps:get(feat, Conf, 0)
.

calc_grade_silver(Type, Grade, Mansion) ->
	Multiple = lists:foldl(
		fun(G, Acc) ->
			Conf = tb_government_task_silver_multiple:get(Type * 100 + G),
			Acc + maps:get(multiple, Conf)
		end, 0, lists:seq(1, Grade)),
	BaseConf = tb_government_task_silver_base:get(Mansion),
	Base = maps:get(amount, BaseConf, 0),
	Base * Multiple
.

request_challenge_government_task(ClearingId, HeroId) ->
	Clearing = lib_map_clearing_api:map_clearing(ClearingId),
	TaskId = Clearing#map_clearing.data,
	TaskInfo = lib_player_task_new:find_task_info(TaskId),
	?JUDGE_RETURN(TaskInfo#task_info.final_value * maps:get(value, tb_task_const:get(government_multiple)) >= TaskInfo#task_info.cur_value, ?ERROR_GOTTEN_REWARD),
	?JUDGE_RETURN(
		(TaskInfo#task_info.status =:= ?TASK_STATUS_UNDONE orelse TaskInfo#task_info.status =:= ?TASK_STATUS_FINISH) andalso
		TaskInfo#task_info.cond_type =:= ?COND_KILL_MONSTER_ITEMS, ?ERROR_INVALID_PARAM),
	CityId = Clearing#map_clearing.city_id,
	?JUDGE_RETURN(lib_player_map:city_country(CityId) =:= lib_player:player_country(), ?ERROR_TASK_CITY),
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_TROOPS_NULL),
	Conf = lib_task_api:get_task_conf(TaskId),
	RobotId = maps:get(robot_id, Conf),
	TroopsIdList = [lib_troops_api:troops_id(HeroId)],
	PlayerId = lib_player:player_id(),
	Robots = lib_combat_queue_api:robot_id_to_fighters(RobotId),
	Params = {?CALL_FIGHT_TYPE_GOVERNMENT_TASK, PlayerId, TaskId},
	IsCross = lib_troops_api:is_cross(?CALL_FIGHT_TYPE_GOVERNMENT_TASK),
	F = lib_troops_api:sync(fun lib_troops_api:to_fighting/6, [?CALL_FIGHT_TYPE_GOVERNMENT_TASK, Params, TroopsIdList, Robots, CityId, IsCross]),
	?JUDGE_RETURN(F =/= 0, ?ERROR_TROOPS_ERROR)
.
respond_challenge_government_task(TaskId, CallBackData) ->
	IsWin = CallBackData#callback_data0.win_type =:= ?FIGHTER_TYPE_L,
	ResultMsg =
		case IsWin of
			true ->
				Conf = lib_task_api:get_task_conf(TaskId),
				#{drop_id := DropId, cond_id := ItemId} = Conf,
				Amount = rand_drop_amount(DropId),
				ItemConfList = [[ItemId,Amount]],
				ItemList = lib_item_api:conf_item_list_to_item_obj_list(ItemConfList),
				lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_TASK_MONSTER, TaskId), true, ?PACK_TIPS0),
				lib_player_process:process_kill_monster_items(ItemId),
				lib_combat_queue_api:result_msg_add_reward(CallBackData#callback_data0.result_msg, ItemConfList);
			false ->
				CallBackData#callback_data0.result_msg
		end,
	lib_send:respond_to_client(CallBackData#callback_data0.msg),
	lib_send:respond_to_client(ResultMsg)
.

rand_drop_amount(DropId) ->
	Conf = tb_task_monster_drop_group:get(DropId),
	WeightList =
		lib_common:map_fold(
			fun(_K, V, Acc1) ->
				#{amount := Amount, power := Weight} = V,
				[{Weight, Amount} | Acc1]
			end,
			[], Conf),
	util:weight_rand(WeightList)
.

reset_everyday() ->
	Detail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
	update_government(Detail#government_detail{
		use_times = 0,
		buy_times = 0,
		free_refresh_times = 0,
		buy_refresh_times = 0,
		delete_status = ?TASK_STATUS_INIT
	})
.

