%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Feb 2021 5:40 PM
%%%-------------------------------------------------------------------
-module(lib_player_hero_busy).
-author("lichaoyu").
-include("common.hrl").
-include("science.hrl").
-include("hero_busy.hrl").
-include("fight_prop.hrl").
-include("city_industry.hrl").
-include("ProtoClient_10138.hrl").

%% API
-export([
	request_hero_busy_info/0,
	notice_hero_busy_info/2,
	request_hero_busy_quicken/1,
	request_hero_finish_incident/1,
	request_one_key_get/0
]).

-export([
	put_hero_busy/1,
	get_hero_busy/0,
	player_hero_busy_handler/0,
	clear/0,
	check_finish/0
]).

-define(HERO_BUSY_GET, 0).		%% 领取
-define(HERO_BUSY_MONEY, 1).	%% 元宝加速
-define(HERO_BUSY_PROP1, 2).	%% 道具1加速
-define(HERO_BUSY_PROP2, 3).	%% 道具2加速
-define(DIRECT_GET, 0).		%% 直接领取
-define(BRANCH_GET, 1).		%% 分支领取

put_hero_busy(HeroBusy) ->
	put_hero_busy(HeroBusy, true).
put_hero_busy(HeroBusy, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_HERO_BUSY),
	erlang:put(?ETS_PLAYER_HERO_BUSY, HeroBusy).

get_hero_busy() ->
	erlang:get(?ETS_PLAYER_HERO_BUSY).

ets_init() ->
	ets:new(?ETS_PLAYER_HERO_BUSY, [?ETS_KEY_POS(#player_hero_busy.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HERO_BUSY, {?TUPLE_INT(id, 1)}, true).

player_hero_busy_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_HERO_BUSY,
		table_name = ?DBPLAYER_HERO_BUSY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_hero_busy:load_player_hero_busy/1,
		save_func = fun db_hero_busy:save_player_hero_busy/1,
		get_func = fun get_hero_busy/0,
		put_func = fun put_hero_busy/2
	}.

clear() ->
	PlayerHeroBusy = get_hero_busy(),
	put_hero_busy(PlayerHeroBusy#player_hero_busy{pasture_limit = [], incident_time = maps:new()})
.

check_finish() ->
	#player_hero_busy{
		hero_busy_dict = HeroBusyDict
	} = get_hero_busy(),
	NowTick = lib_timer:unixtime(),
	HeroBusyList = dict:fold(
		fun(_, #hero_busy{finish_tick = FinishTick} = HeroBusy, List) ->
			case FinishTick =:= 0 orelse NowTick < FinishTick of
				true -> List;
				false -> [HeroBusy#hero_busy{finish_tick = 0} | List]
			end
		end, [], HeroBusyDict),
	case HeroBusyList of [] -> skip; _ -> lib_hero_busy_api:u_hero_busy(HeroBusyList) end
.

request_hero_busy_info() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_126), ?INFO("功能未开启")),
	HeroBusyDict = lib_hero_busy_api:hero_busy_dict(),
	HeroBusyList = dict:fold(
		fun(_, HeroBusy, List) ->
			[hero_busy_to_proto(HeroBusy) | List]
		end, [], HeroBusyDict),
	Res = #'Proto50138001'{
		hero_busy_list = HeroBusyList
	},
	lib_send:respond_to_client(Res)
.

notice_hero_busy_info(Flag, HeroBusyList) ->
	Res = #'Proto80138001'{
		state = Flag,
		hero_busy_list = [hero_busy_to_proto(X) || X <- HeroBusyList]
	},
	?DEBUG("~p", [Res]),
	lib_send:respond_to_client(Res)
.

hero_busy_to_proto(HeroBusy) ->
	#hero_busy{
		hero_id = HeroId,
		type = Type,
		city_id = CityId,
		incident = Incident,
		param = Param,
		finish_tick = FinishTick
	} = HeroBusy,
	ProtoHeroBusy = #'ProtoHeroBusy'{
		hero_id = HeroId,
		type = Type,
		city_id = CityId,
		incident = Incident,
		remaining_time = ?IIF(FinishTick =:= 0, 0, FinishTick - lib_timer:unixtime())
	},
	case Type of
		?CITY_BUILDING -> [BuildingId, _] = Param, ProtoHeroBusy#'ProtoHeroBusy'{param = BuildingId};
		?CITY_INDUSTRY -> ProtoHeroBusy;
		?CITY_VISITING -> ProtoHeroBusy
	end
.

request_hero_busy_quicken(Msg) ->
	#'Proto10138003'{
		hero_id = HeroId,
		type = Type,
		num = Num
	} = Msg,
	check_finish(),
	?JUDGE_RETURN(lib_hero_busy_api:is_busy(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	#hero_busy{
		start_tick = StartTick,
		incident = Incident,
		finish_tick = FinishTick
	} = HeroBusy = lib_hero_busy_api:hero_busy(HeroId),
	?JUDGE_RETURN(Incident =:= 0, ?ERROR_TASK_NOT_FINISH),
	case FinishTick =:= 0 of
		true -> hero_busy_get([HeroBusy]);
		false ->
			NowTick = lib_timer:unixtime(),
			{Consume, NewFinishTick} =
				case Type of
					?HERO_BUSY_MONEY ->
						{[?GOLD_ID, lib_equip_api:time_to_gold(FinishTick - NowTick)], 0};
					?HERO_BUSY_PROP1 ->
						[Prop1, _] = maps:get(jsonvalue, tb_const:get(quicken_prop_id_list)),
						#{param1 := Param1} = tb_item:get(Prop1),
						{[Prop1, Num], FinishTick - Param1 * Num};
					?HERO_BUSY_PROP2 ->
						[_, Prop2] = maps:get(jsonvalue, tb_const:get(quicken_prop_id_list)),
						Param1 = maps:get(param1, tb_item:get(Prop2)),
						{[Prop2, Num], FinishTick - Param1 * Num};
					_ -> {[], FinishTick}
				end,
			case Consume =:= [] of
				true -> skip;
				false ->
					lib_equip_api:item(Consume, ?USE_HERO_BUSY_QUICKEN, HeroId),
					lib_hero_busy_api:u_hero_busy(HeroBusy#hero_busy{finish_tick = NewFinishTick})
			end,
			Res = #'Proto50138003'{
				total_time = FinishTick - StartTick,
				remaining_time = NewFinishTick - NowTick,
				hero_id = HeroId
			},
			lib_send:respond_to_client(Res)
	end
.
add(?TYPE_2) -> ?TAXATION_MULTI;
add(?TYPE_3) -> ?WASTELAND_MULTI;
add(?TYPE_4) -> ?GENERATION_WOOD_MULTI;
add(?TYPE_5) -> ?MINING_MULTI;
add(?TYPE_6) -> ?HUNT_UNITS_MULTI;
add(_) ->
	0
.
random_num(Add) ->
	case rand:uniform(100) < Add of
		true -> lib_random:rand_one([1,2,3]);
		false -> 0
	end
.

hero_busy_calc(HeroBusy) ->
	#hero_busy{
		hero_id = HeroId,
		param = Param
	} = HeroBusy,
	case HeroBusy#hero_busy.type of
		?CITY_BUILDING ->
			[BuildingId, Choose] = Param,
			[_, FeatNum] = maps:get(award, tb_building_kind:get(BuildingId)),
			Feat = trunc(FeatNum * Choose * (100 + lib_player_science_api:get_effect_value(?EFFECT_BUILD_REWARD_ADD)) / 100),
			[?FEAT_ID, Feat];
		?CITY_INDUSTRY ->
			CityId = HeroBusy#hero_busy.city_id,
			IndustryId = lib_city_industry_api:industry_id(CityId),
			Conf = tb_industry_kind:get(IndustryId),
			HeroAdd = lib_hero_prop:prop_add(HeroId, add(maps:get(type, Conf, 0))) * 100,
			Add = lib_player_science_api:get_effect_value(?EFFECT_MAP_YIELD_TASK_REWARD_ADD, IndustryId div 100),
			Award = maps:get(award, Conf),
			case maps:get(award_type, Conf) of
				 ?INDUSTRY_GET_ITEM -> [Id, Num] = Award, [Id, trunc(Num * (100 + Add + HeroAdd) / 100)];
				 ?INDUSTRY_GET_PIECES ->
					 FragmentId = maps:get(fragment_id, tb_hero_fragment:get(HeroId)),
					 [NumList, WeightList] = Award,
					 Num = lib_equip_api:random_one_weight(NumList, WeightList),
					 ExtraNum = random_num(HeroAdd),
					 [FragmentId, Num + ExtraNum]
			end;
		?CITY_VISITING ->
			HeroAdd = lib_hero_prop:prop_add(HeroId, ?VISIT_MULTI) * 100,
			[GoalHeroId | _] = Param,
			PropName = lib_city_visiting_api:prop_the_highest(GoalHeroId),
			PropVal = maps:get(PropName, tb_hero:get(HeroId)),
			Section = maps:get(jsonvalue, tb_visiting_const:get(complete_section)),
			SectionId = lib_city_visiting_api:section(PropVal, Section),
			#{num := NumList, weight := WeightList} = tb_visiting_fragment:get(SectionId),
			Num = lib_equip_api:random_one_weight(NumList, WeightList),
			DestinyNum =
				case lib_hero_destiny:destiny_hero_destiny(GoalHeroId, HeroId) of
					true -> maps:get(value, tb_visiting_const:get(relation));
					false -> 0
				end,
			FragmentId = lib_city_visiting_api:fragment_id(GoalHeroId),
			TotalNum = DestinyNum + lib_nobility_api:privilege_add(?VISIT_GET_HERO_FRAGMENT) + Num,
			ExtraNum = random_num(HeroAdd),
			[FragmentId, TotalNum + ExtraNum]
	end
.
hero_busy_get(HeroBusyList) ->
	AllItem = [hero_busy_calc(X) || X <- HeroBusyList],
	ItemList = lib_item_api:merge_conf_item_list(AllItem),
	lib_equip_api:item(ItemList, ?ADD_HERO_BUSY_ONE_KEY, 1),
	lib_hero_busy_api:d_hero_busy(HeroBusyList)
.

request_hero_finish_incident(Msg) ->
	#'Proto10138004'{
		hero_id = HeroId,
		state = State
	} = Msg,
	?JUDGE_RETURN(lib_hero_busy_api:is_busy(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	#hero_busy{
		incident = Incident
	} = HeroBusy = lib_hero_busy_api:hero_busy(HeroId),
	?JUDGE_RETURN(Incident =/= 0, ?ERROR_TASK_NOT_FINISH),
	Conf = tb_incident_kind:get(Incident),
	Consume =
		case maps:get(type, Conf) of
			?DIRECT_GET -> maps:get(one_award, Conf);
			?BRANCH_GET ->
				case State of
					0 -> maps:get(one_award, Conf);
					_ -> maps:get(two_award, Conf)
				end
		end,
	lib_equip_api:item(Consume, ?ADD_HERO_INCIDENT, HeroId),
	lib_hero_busy_api:u_hero_busy(HeroBusy#hero_busy{incident = 0})
.

request_one_key_get() ->
	check_finish(),
	HeroBusyDict = lib_hero_busy_api:hero_busy_dict(),
	HeroBusyList = dict:fold(
		fun(_, HeroBusy, List) ->
			case HeroBusy#hero_busy.incident =:= 0 andalso HeroBusy#hero_busy.finish_tick =:= 0 of
				true -> [HeroBusy | List];
				false -> List
			end
		end, [], HeroBusyDict),
	case HeroBusyList of
		[] -> skip;
		_ -> hero_busy_get(HeroBusyList)
	end
.






