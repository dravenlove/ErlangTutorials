%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 4:12 PM
%%%-------------------------------------------------------------------
-module(lib_player_city_industry).
-author("lichaoyu").
-include("common.hrl").
-include("city_industry.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("hero_busy.hrl").
-include("ProtoClient_10114.hrl").
-include("ProtoClient_10136.hrl").

-define(CITY_INDUSTRY_ALL, 0).	%% 全部产业
-define(CITY_INDUSTRY_1, 1).	%% 已占领产业
-define(CITY_INDUSTRY_2, 2).	%% 未占领产业
-define(STATE_GET, 0).		%% 领取收益
-define(STATE_WAIVE, 1).	%% 放弃产业
-define(STATE_TIME, 0).		%% 等待时间
-define(STATE_MONEY, 1).	%% 使用元宝

%% API
-export([
	request_map_industry/0,
	notice_map_industry/2,
	request_city_industry_info/1,
	request_city_industry_operation/1,
	request_city_industry_hold/1,
	respond_city_industry_hold/2,
	request_hero_industry_work/1,
	request_one_city_industry_info/1
]).

-export([
	test/0,
	put_city_industry/1,
	get_city_industry/0,
	player_city_industry_handler/0,
	sign_in/0,
	city_be_occupy/1,
	check_reset/0,
	check_finish/0,
	process_nobility_active/0,
	update_finish/0,
	all_city_industry_info/1
]).

put_city_industry(CityIndustry) ->
	put_city_industry(CityIndustry, true).
put_city_industry(CityIndustry, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_CITY_INDUSTRY),
	erlang:put(?ETS_PLAYER_CITY_INDUSTRY, CityIndustry).

get_city_industry() ->
	erlang:get(?ETS_PLAYER_CITY_INDUSTRY).

ets_init() ->
	ets:new(?ETS_PLAYER_CITY_INDUSTRY, [?ETS_KEY_POS(#player_city_industry.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_CITY_INDUSTRY, {?TUPLE_INT(id, 1)}, true).

player_city_industry_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_CITY_INDUSTRY,
		table_name = ?DBPLAYER_CITY_INDUSTRY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_city_industry:load_player_city_industry/1,
		save_func = fun db_city_industry:save_player_city_industry/1,
		get_func = fun get_city_industry/0,
		put_func = fun put_city_industry/2
	}.

sign_in() ->
	PlayerCityIndustry = get_city_industry(),
	CityIndustryDict = PlayerCityIndustry#player_city_industry.city_industry,
	NewCityIndustryDict = dict:fold(
		fun(Id, CityIndustry, Dict) ->
			OccupyTick = lib_player_map:city_occupy_tick(Id div 100),
			case OccupyTick > CityIndustry#city_industry.hold_tick of
				true -> dict:erase(Id, Dict);
				false -> Dict
			end
		end, CityIndustryDict, CityIndustryDict),
	put_city_industry(PlayerCityIndustry#player_city_industry{city_industry = NewCityIndustryDict})
.

city_be_occupy(CityId) ->
	PlayerCityIndustry = get_city_industry(),
	CityIndustryDict = PlayerCityIndustry#player_city_industry.city_industry,
	{NewCityIndustryDict, CityIndustryList} = dict:fold(
		fun(Id, _, {Dict, List}) ->
			case Id div 100 of
				CityId -> {dict:erase(Id, Dict), [Id | List]};
				_ -> {Dict, List}
			end
		end, {CityIndustryDict, []}, CityIndustryDict),
	put_city_industry(PlayerCityIndustry#player_city_industry{city_industry = NewCityIndustryDict}),
	case CityIndustryList of
		[] -> skip;
		_ -> notice_map_industry(?CITY_INDUSTRY_DELETE, CityIndustryList)
	end
.

check_reset() ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = get_city_industry(),
	NowTick = lib_timer:unixtime(),
	CityIndustryList = dict:fold(
		fun(_, #city_industry{reset_tick = ResetTick} = CityIndustry, List) ->
			case ResetTick =:= 0 orelse NowTick < ResetTick of
				true -> List;
				false -> [CityIndustry#city_industry{reset_tick = 0, work_time = 0} | List]
			end
		end, [], CityIndustryDict),
	case CityIndustryList of
		[] -> skip;
		_ -> lib_city_industry_api:u_city_industry(CityIndustryList)
	end
.

check_finish() ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = get_city_industry(),
	NowTick = lib_timer:unixtime(),
	CityIndustryList = dict:fold(
		fun(_, CityIndustry, List) ->
			Time = NowTick - CityIndustry#city_industry.last_tick,
			EveryTime = maps:get(value, tb_const:get(industry_waive_time)),
			case Time rem EveryTime > 10 of
				true -> List;
				false -> [CityIndustry | List]
			end
		end, [], CityIndustryDict),
	case CityIndustryList of
		[] -> skip;
		_ -> notice_map_industry(?CITY_INDUSTRY_UPDATE, CityIndustryList)
	end
.

process_nobility_active() ->
	Res = #'Proto50136001'{
		total_num = lib_city_industry_api:hold_num(),
		num = lib_city_industry_api:now_num()
	},
	lib_send:respond_to_client(Res)
.

update_finish() ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = get_city_industry(),
	CityIndustryList = util:dict_values(CityIndustryDict),
	notice_map_industry(?CITY_INDUSTRY_UPDATE, CityIndustryList)
.

request_map_industry() ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = get_city_industry(),
	NowTick = lib_timer:unixtime(),
	WorkNum = lib_city_industry_api:work_num(),
	CityIndustryList = dict:fold(
		fun(_, #city_industry{id = Id, last_tick = LastTick, work_time = WorkTime}, List) ->
			Add = lib_city_industry_api:add(Id),
			[#'ProtoMapIndustry'{
				city_id = Id,
				earning = trunc(lib_city_industry_api:calc_num(Id, NowTick - LastTick) * (100 + Add) / 100),
				time = WorkNum - WorkTime
			} | List]
		end, [], CityIndustryDict),
	Res = #'Proto50114009'{
		map_industry = CityIndustryList
	},
	lib_send:respond_to_client(Res)
.
notice_map_industry(Flag, CityIndustryList) ->
	ProtoList =
		case Flag of
			?CITY_INDUSTRY_UPDATE ->
				NowTick = lib_timer:unixtime(),
				WorkNum = lib_city_industry_api:work_num(),
				[#'ProtoMapIndustry'{
					city_id = Id,
					earning = trunc(lib_city_industry_api:calc_num(Id, NowTick - LastTick) * (100 + lib_city_industry_api:add(Id)) / 100),
					time = WorkNum - WorkTime
				} || #city_industry{id = Id, last_tick = LastTick, work_time = WorkTime} <- CityIndustryList];
			?CITY_INDUSTRY_DELETE -> [#'ProtoMapIndustry'{city_id = X}|| X <- CityIndustryList]
		end,
	Res = #'Proto80114009'{
		state = Flag,
		map_industry = ProtoList
	},
	lib_send:respond_to_client(Res)
.

to_proto(CityIndustry) when is_record(CityIndustry, city_industry) ->
	#city_industry{
		id = Id,
		last_tick = LastTick,
		work_time = WorkTime,
		reset_tick = ResetTick
	} = CityIndustry,
	Add = lib_city_industry_api:add(Id),
	Proto = #'ProtoCityIndustry'{
		city_id = Id,
		add = trunc(Add)
	},
	case LastTick of
		0 -> Proto#'ProtoCityIndustry'{hold = 0};
		_ ->
			NowTick = lib_timer:unixtime(),
			TotalNum = lib_city_industry_api:work_num(),
			Proto#'ProtoCityIndustry'{
				hold = 1,
				earning = trunc(lib_city_industry_api:calc_num(Id, NowTick - LastTick) * (100 + Add) / 100),
				num = TotalNum - WorkTime,
				total_num = TotalNum,
				full_time = ?IIF(WorkTime =:= 0, 0, ResetTick - NowTick)
			}
	end;
to_proto(CityIndustryList) ->
	NowTick = lib_timer:unixtime(),
	TotalNum = lib_city_industry_api:work_num(),
	[case LastTick of
		 0 -> #'ProtoCityIndustry'{city_id = Id, hold = 0, add = trunc(lib_city_industry_api:add(Id))};
		 _ ->
			 Add = lib_city_industry_api:add(Id),
			 #'ProtoCityIndustry'{
				 city_id = Id,
				 hold = 1,
				 earning = trunc(lib_city_industry_api:calc_num(Id, NowTick - LastTick) * (100 + Add) / 100),
				 add = trunc(Add),
				 num = TotalNum - WorkTime,
				 total_num = TotalNum,
				 full_time = ?IIF(WorkTime =:= 0, 0, ResetTick - NowTick)
			 }
	 end || #city_industry{
		id = Id,
		last_tick = LastTick,
		work_time = WorkTime,
		reset_tick = ResetTick
	} <- CityIndustryList]
.

request_city_industry_info(Msg) ->
	#'Proto10136001'{
		state = State
	} = Msg,
	check_reset(),
	CityIndustryList =
		case State of
			?CITY_INDUSTRY_ALL ->
				CityIdList = lib_player_map:country_city(lib_player:player_country()),
				all_city_industry_info(CityIdList);
			?CITY_INDUSTRY_1 ->
				util:dict_values(lib_city_industry_api:city_industry_dict());
			?CITY_INDUSTRY_2 ->
				CityIdList = lib_player_map:country_city(lib_player:player_country()),
				not_city_industry_info(CityIdList)
		end,
	respond_city_industry_info(CityIndustryList)
.
respond_city_industry_info(CityIndustryList) ->
	Res = #'Proto50136001'{
		total_num = lib_city_industry_api:hold_num(),
		num = lib_city_industry_api:now_num(),
		city_industry_list = to_proto(CityIndustryList)
	},
	lib_send:respond_to_client(Res)
.
all_city_industry_info(CityIdList) ->
	CityIndustryDict = lib_city_industry_api:city_industry_dict(),
	lists:foldl(
		fun(CityId, List) ->
			IndustryIdList = lib_city_industry_api:industry_id_list(CityId),
			[util:dict_get(X, CityIndustryDict, #city_industry{id = X}) || X <- IndustryIdList] ++ List
		end, [], CityIdList)
.
not_city_industry_info(CityIdList) ->
	CityIndustryDict = lib_city_industry_api:city_industry_dict(),
	lists:foldl(
		fun(CityId, List) ->
			IndustryIdList = lib_city_industry_api:industry_id_list(CityId),
			[#city_industry{id = X} || X <- IndustryIdList, not dict:is_key(X, CityIndustryDict)] ++ List
		end, [], CityIdList)
.

request_city_industry_operation(Msg) ->
	#'Proto10136002'{
		state = State,
		city_id = CityId
	} = Msg,
	case State of
		?STATE_GET ->
			NowTick = lib_timer:unixtime(),
			{CityIndustryList, Award} = dict:fold(
				fun(_, #city_industry{id = Id, last_tick = LastTick} = CityIndustry, {List, ItemList}) ->
					Add = lib_city_industry_api:add(Id),
					case lib_city_industry_api:calc_time_award(Id, NowTick - LastTick) of
						[false, 0] -> {List, ItemList};
						[ItemId, ItemNum] -> {[CityIndustry#city_industry{last_tick = NowTick} | List], [[ItemId, trunc(ItemNum * (100 + Add) / 100)] | ItemList]}
					end
				end, {[], []}, lib_city_industry_api:city_industry_dict()),
			AllItem = lib_item_api:merge_conf_item_list(Award),
			case AllItem of
				[] -> skip;
				_ ->
					lib_equip_api:item(AllItem, ?ADD_CITY_INDUSTRY, 1),
					lib_city_industry_api:u_city_industry(CityIndustryList)
			end;
		?STATE_WAIVE ->
			IndustryId = lib_city_industry_api:industry_id(CityId),
			?JUDGE_RETURN(IndustryId, ?ERROR_CITY_INDUSTRY_ID),
			CityIndustry = lib_city_industry_api:city_industry(CityId),
			?JUDGE_RETURN(CityIndustry, ?ERROR_CITY_INDUSTRY_ID),
			?JUDGE_RETURN(maps:get(value, tb_const:get(industry_waive_time)) =< lib_timer:unixtime() - CityIndustry#city_industry.hold_tick, ?ERROR_CITY_INDUSTRY_WAIVE),
			lib_city_industry_api:d_city_industry(CityId)
	end
.

request_city_industry_hold(Msg) ->
	#'Proto10136003'{
		hero_id = HeroId,
		city_id = CityId
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_114), ?ERROR_MANSION_LEVEL),
	IndustryId = lib_city_industry_api:industry_id(CityId),
	?JUDGE_RETURN(IndustryId, ?ERROR_CITY_INDUSTRY_ID),
	?JUDGE_RETURN(lib_bounty_mission_api:is_finish(CityId div 100), ?ERROR_BOUNTY_MISSION),
	?JUDGE_RETURN(lib_player_map:city_country(CityId div 100) =:= lib_player:player_country(), ?ERROR_TASK_CITY),
	?JUDGE_RETURN(not lib_city_industry_api:is_industry(CityId), ?ERROR_CITY_INDUSTRY_HOLD),
	?JUDGE_RETURN(lib_city_industry_api:is_vacancy(), ?ERROR_CITY_INDUSTRY_ASTRICT),
	RobotId = maps:get(robot, tb_industry_kind:get(IndustryId)),
	TroopsIdList = lib_troops_api:troops_id([HeroId]),
	PlayerId = lib_player:player_id(),
	Robots = [lib_robot_api:random_monster(RobotId)],
	IsCross = lib_troops_api:is_cross(?CALL_FIGHT_TYPE_INDUSTRY),
	Params = {?CALL_FIGHT_TYPE_INDUSTRY, PlayerId, CityId},
	F = lib_troops_api:async(fun lib_troops_api:to_fighting/6, [?CALL_FIGHT_TYPE_INDUSTRY, Params, TroopsIdList, Robots, CityId div 100, IsCross]),
	?JUDGE_RETURN(F =/= 0, ?ERROR_TROOPS_ERROR)
.
respond_city_industry_hold(CityId, CallBackData) ->
	lib_send:respond_to_client(CallBackData#callback_data0.msg),
	lib_send:respond_to_client(CallBackData#callback_data0.result_msg),
	case CallBackData#callback_data0.win_type of
		?FIGHTER_TYPE_L ->
			NowTick = lib_timer:unixtime(),
			CityIndustry = #city_industry{
				id = CityId,
				hold_tick = NowTick,
				last_tick = NowTick
			},
			lib_city_industry_api:u_city_industry(CityIndustry),
			IndustryId = lib_city_industry_api:industry_id(CityId),
			lib_player_process:process_industry_occupy(IndustryId);
		_ -> skip
	end
.

request_hero_industry_work(Msg) ->
	#'Proto10136004'{
		hero_id = HeroId,
		state = State,
		city_id = CityId
	} = Msg,
	check_reset(),
	IndustryId = lib_city_industry_api:industry_id(CityId),
	?JUDGE_RETURN(IndustryId, ?ERROR_CITY_INDUSTRY_ID),
	CityIndustry = lib_city_industry_api:city_industry(CityId),
	?JUDGE_RETURN(CityIndustry, ?ERROR_CITY_INDUSTRY_ID),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	lib_hero_busy_api:is_correct(HeroId, ?CITY_INDUSTRY, CityId, 0),
	WorkTime = CityIndustry#city_industry.work_time,
	?JUDGE_RETURN(lib_city_industry_api:work_num() - WorkTime > 0, ?ERROR_CITY_INDUSTRY_ASTRICT),
	NowTick = lib_timer:unixtime(),
	Conf = tb_industry_kind:get(IndustryId),
	Consume = maps:get(consume, Conf),
	Time = maps:get(time, Conf),
	{FinishTick, NewConsume} =
		case State of
			?STATE_TIME -> {NowTick + Time, Consume};
			?STATE_MONEY -> {NowTick, lib_item_api:merge_conf_item_list([[?GOLD_ID, lib_equip_api:time_to_gold(Time)] | Consume])}
		end,
	?PACK_IS_SUCCESS(lib_player_pack:validate_remove(lib_item_api:conf_item_list_to_item_obj_list(NewConsume))),
	case maps:get(award_type, Conf) of
		?INDUSTRY_NO -> throw({error, ?ERROR_CITY_INDUSTRY_ID});
		?INDUSTRY_GET_ITEM -> skip;
		?INDUSTRY_GET_PIECES ->
			HeroIdList = lib_hero_busy_api:pasture_limit(),
			?JUDGE_RETURN(not lists:member(HeroId, HeroIdList), ?ERROR_HERO_INDUSTRY_ASTRICT),
			lib_hero_busy_api:u_pasture_limit([HeroId | HeroIdList])
	end,
	lib_equip_api:item(NewConsume, ?USE_CITY_INDUSTRY, CityId),
	Type = maps:get(type, Conf),
	HeroBusy = #hero_busy{
		hero_id = HeroId,
		type = ?CITY_INDUSTRY,
		city_id = CityId,
		incident = lib_hero_busy_api:incident(Type),
		start_tick = NowTick,
		finish_tick = FinishTick
	},
	lib_hero_busy_api:u_hero_busy(HeroBusy),
	lib_city_industry_api:u_total_time(Type),
	NewCityIndustry =
		case WorkTime =:= 0 of
			true -> CityIndustry#city_industry{work_time = WorkTime + 1, reset_tick = NowTick + maps:get(value, tb_const:get(industry_full_time))};
			false -> CityIndustry#city_industry{work_time = WorkTime + 1}
		end,
	lib_city_industry_api:u_city_industry(NewCityIndustry),
	lib_player_process:process_industry_work(IndustryId)
.

request_one_city_industry_info(Msg) ->
	#'Proto10136005'{city_id = CityId} = Msg,
	check_reset(),
	IndustryId = lib_city_industry_api:industry_id(CityId),
	?JUDGE_RETURN(IndustryId, ?ERROR_CITY_INDUSTRY_ID),
	CityIndustry = case lib_city_industry_api:city_industry(CityId) of false -> #city_industry{id = CityId}; Val -> Val end,
	Res = #'Proto50136005'{
		total_num = lib_city_industry_api:hold_num(),
		num = lib_city_industry_api:now_num(),
		city_industry = to_proto(CityIndustry)
	},
	lib_send:respond_to_client(Res)
.

test() ->
	lib_timer:unixtime_ms()
.