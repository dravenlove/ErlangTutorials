%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 1月 2021 16:56
%%%-------------------------------------------------------------------
-module(lib_player_science).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("science.hrl").
-include("inner_city.hrl").
-include("ProtoClient_10135.hrl").

-define(SCIENCE_ID(STAGE_ID, INDEX), STAGE_ID * 1000 + INDEX).
-define(LEVEL_ID(SCIENCE_ID, LEVEL), SCIENCE_ID * 1000 + LEVEL).

%% API
-export([
	get_player_science/0,
	put_player_science/1,
	put_player_science/2,
	ets_init/0,
	build_index/0,
	player_science_handler/0,

	sign_in/0,
	process_system_refresh/0,
	process_prop_effect_update/0,
	check_science_timeout/0,

	science_to_hero_proto/2,
	calc_science_prop/1
]).
-export([
	get_effect_list/1,
	science_info/1
]).
-export([
	request_science_list/0,
	request_science_info/1,
	request_upgrade/1,
	request_accelerate/1,
	request_receive_item/0,
	request_active_science/1
]).
-export([
	test_active_science/2			%% 快速激活命令
]).

get_player_science() ->
	erlang:get(?ETS_PLAYER_SCIENCE)
.

put_player_science(Info) when is_record(Info, player_science) ->
	put_player_science(Info, true)
.
put_player_science(Info, IsSaveDb) when is_record(Info, player_science) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_SCIENCE),
	erlang:put(?ETS_PLAYER_SCIENCE, Info)
.

ets_init() ->
	ets:new(?ETS_PLAYER_SCIENCE, [?ETS_KEY_POS(#player_science.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_SCIENCE, {?TUPLE_INT(id, 1)}, true)
.

player_science_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_SCIENCE,
		table_name = ?DBPLAYER_SCIENCE,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_science:load_player_science/1,
		save_func = fun db_player_science:save_player_science/1,
		get_func = fun get_player_science/0,
		put_func = fun put_player_science/2
	}.

get_upgrading_list() ->
	Info = get_player_science(),
	gb_sets:to_list(Info#player_science.upgrading_set)
.

insert_upgrading_id(ScienceId) ->
	Info = get_player_science(),
	NewSet = gb_sets:add_element(ScienceId, Info#player_science.upgrading_set),
	put_player_science(Info#player_science{upgrading_set = NewSet})
.

remove_upgrading_id(ScienceId) ->
	Info = get_player_science(),
	NewSet = gb_sets:del_element(ScienceId, Info#player_science.upgrading_set),
	put_player_science(Info#player_science{upgrading_set = NewSet})
.

science_info(Id) ->
	Info = get_player_science(),
	maps:get(Id, Info#player_science.science_map, #science{id = Id})
.

update_science(Science) ->
	update_science(Science, true)
.
update_science(Science, IsNotify) when is_record(Science, science) ->
	Info = get_player_science(),
	NewMap = maps:put(Science#science.id, Science, Info#player_science.science_map),
	put_player_science(Info#player_science{science_map = NewMap}),

	case IsNotify of
		false -> skip;
		true -> notify_science(Science)
	end
.

get_is_received() ->
	Info = get_player_science(),
	Info#player_science.is_received
.
set_is_received(Flag) ->
	Info = get_player_science(),
	put_player_science(Info#player_science{is_received = Flag}),

	Notify = #'Proto80135002'{is_received = Flag},
	lib_send:respond_to_client(Notify)
.

get_effect_list(Type) ->
	ScienceIdList = tb_science:get_list(),
	lib_common:list_foldl(fun(ScienceId, List) ->
		ScienceConf = tb_science:get(ScienceId),
		?JUDGE_CONTINUE(ScienceConf =/= false, List),

		ConfType = maps:get(type, ScienceConf, 0),
		?JUDGE_CONTINUE(Type =:= ConfType, List),

		Science = science_info(ScienceId),
		EffectId = LevelId = ?LEVEL_ID(ScienceId, Science#science.level),

		LevelConf = tb_science_level:get(LevelId),
		?JUDGE_CONTINUE(LevelConf =/= false, List),

		[EffectId | List]
    end, [], ScienceIdList)
.

-define(COND_TYPE_UNDEF,    0).
-define(COND_TYPE_AND,      1).
-define(COND_TYPE_OR,       2).

validate_upgrade_cond(ScienceId, Level) ->
	ScienceConf = tb_science:get(ScienceId),
	?JUDGE_RETURN(ScienceConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	LevelConf = tb_science_level:get(?LEVEL_ID(ScienceId, Level)),
	?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	CondType = maps:get(cond_type, LevelConf, ?COND_TYPE_UNDEF),
	CondList = maps:get(cond_list, LevelConf, []),

	LevelFunction = fun([Id, NeedLevel]) ->
		try
			?JUDGE_RETURN(tb_science:get(Id) =/= false, false),
			Science = science_info(Id),
			Science#science.level >= NeedLevel
		catch
		    throw: {error, Flag} -> Flag
		end
	end,

	case CondType of
		?COND_TYPE_UNDEF -> false;
		?COND_TYPE_AND -> lists:all(LevelFunction, CondList);
		?COND_TYPE_OR -> lists:any(LevelFunction, CondList)
	end
.

%% 获取科技学习时间减少百分比
upgrade_time_reduce() ->
	lib_player_science_api:get_effect_value(?EFFECT_SCIENCE_UPGRADE_TIME_REDUCE)
.

%% 获取学习科技道具减少百分比
upgrade_item_reduce(ItemId) ->
	lib_player_science_api:get_effect_value(?EFFECT_SCIENCE_UPGRADE_COST_REDUCE, ItemId)
.

sign_in() ->
	check_science_timeout()
.

process_system_refresh() ->
	case lib_function_open:function_is_open(?CONDITION_ID_110) of
		true ->
			Science = science_info(1001),
			#science{level = Level} = Science,
			case Level > 0 of
				true ->
					set_is_received(false);
				false -> skip
			end;
		false -> skip
	end
.

process_prop_effect_update() ->
	lib_hero_prop:update_all_hero_prop()
.

check_science_timeout() ->
	CurTick = lib_timer:unixtime(),

	UpgradingList = get_upgrading_list(),
	lists:map(fun(ScienceId) -> check_science_upgrade_finish(ScienceId, CurTick) end, UpgradingList)
.

check_science_upgrade_finish(ScienceId) ->
	check_science_upgrade_finish(ScienceId, lib_timer:unixtime())
.
check_science_upgrade_finish(ScienceId, CurTick) ->
	Science = science_info(ScienceId),
	#science{
		level = Level,
		state = State,
		accelerate_time = AccelerateTime,
		start_tick = StartTick
	} = Science,

	try
		?JUDGE_RETURN(State =:= ?SCIENCE_STATE_UPGRADE, false),

		LevelConf = tb_science_level:get(?LEVEL_ID(ScienceId, Level)),
		?JUDGE_RETURN(LevelConf =/= false, false),
		SrcNeedTime = maps:get(time, LevelConf, 0),
		NeedTimeReduce = upgrade_time_reduce(),
		NeedTime = util:floor(SrcNeedTime * (1 - NeedTimeReduce)),

		CurTick = lib_timer:unixtime(),
		IsFinish = CurTick >= StartTick + (NeedTime - AccelerateTime) * lib_timer:minute_second(),

		?JUDGE_RETURN(IsFinish, false),
		update_science(Science#science{
			state = ?SCIENCE_STATE_FINISH
		}),
		remove_upgrading_id(ScienceId),
%%		process_science_upgrade(ScienceId, Level + 1),
		true
	catch
	    throw: {error, Flag} -> Flag
	end
.

calc_hero_effect_list(#hero{id = HeroId, star = Star}) ->
	HeroType = lib_hero_api:hero_type(HeroId),
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	HeroColor = lib_hero_api:hero_color(Star),
	HeroQuality = lib_hero_api:hero_quality(HeroId),
	HeroSex = lib_hero_api:hero_sex(HeroId),

	List1 = lib_player_science_api:get_effect_id_list(?EFFECT_TYPE_HERO_PROP, HeroType),
	List2 = lib_player_science_api:get_effect_id_list(?EFFECT_ARMS_HERO_PROP, [FrontType, BackType]),
	List3 = lib_player_science_api:get_effect_id_list(?EFFECT_COLOR_HERO_PROP, HeroColor),
	List4 = lib_player_science_api:get_effect_id_list(?EFFECT_QUALITY_HERO_PROP, [HeroQuality,HeroSex]),
	lists:merge([List1, List2, List3, List4])
.

science_to_hero_proto(Proto, Hero) ->
	EffectIdList = calc_hero_effect_list(Hero),
	Proto#'ProtoHero'{
		science_effect_list = EffectIdList
	}
.

calc_science_prop(#hero{id = HeroId, star = Star}) ->
	HeroType = lib_hero_api:hero_type(HeroId),
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	HeroColor = lib_hero_api:hero_color(Star),
	HeroQuality = lib_hero_api:hero_quality(HeroId),
	HeroSex = lib_hero_api:hero_sex(HeroId),

	Prop1 = lib_player_science_api:get_effect_value(?EFFECT_TYPE_HERO_PROP, HeroType),
	Prop2 = lib_player_science_api:get_effect_value(?EFFECT_ARMS_HERO_PROP, [FrontType, BackType]),
	Prop3 = lib_player_science_api:get_effect_value(?EFFECT_COLOR_HERO_PROP, HeroColor),
	Prop4 = lib_player_science_api:get_effect_value(?EFFECT_QUALITY_HERO_PROP, [HeroQuality,HeroSex]),

	lib_fight_prop:increase_prop([Prop1, Prop2, Prop3, Prop4])
.

process_science_upgrade(ScienceId, _Level) ->
	Conf = tb_science:get(ScienceId),

	EffectType = ?IIF(Conf =/= false, maps:get(type, Conf, 0), 0),

	lib_player_process:process_science_effect_update(EffectType)
.

notify_science(Science) ->
    Notify = #'Proto80135001'{
	    science_list = [science_to_proto(Science)]
    },
	lib_send:respond_to_client(Notify)
.

science_to_proto(Science) when is_record(Science, science) ->
	#'ProtoScience'{
		id = Science#science.id,
		level = Science#science.level,
		state = Science#science.state,
		start_tick = Science#science.start_tick,
		accelerate_time = Science#science.accelerate_time
	}
.

request_science_list() ->
	check_science_timeout(),

	Info = get_player_science(),

	ProtoScienceList = maps:fold(fun(_, Science, List) -> [science_to_proto(Science) | List] end, [], Info#player_science.science_map),

	Respond = #'Proto50135001'{
		science_list = ProtoScienceList,
		is_received = Info#player_science.is_received
	},
	lib_send:respond_to_client(Respond)
.

request_science_info(Msg) ->
	ScienceId = Msg#'Proto10135002'.science_id,

	Conf = tb_science:get(ScienceId),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	check_science_upgrade_finish(ScienceId),

	Science = science_info(ScienceId),

	Respond = #'Proto50135002'{
		science = science_to_proto(Science)
	},
	lib_send:respond_to_client(Respond)
.

-define(UPGRADE_TYPE_SKIP,  1).
-define(UPGRADE_TYPE_TIME,  2).

request_upgrade(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_110), ?INFO("功能未开启")),
	?JUDGE_RETURN(lib_inner_city_api:building_state(?BUILDING_SCIENCE) =:= ?BUILDING_LEISURE, ?INFO("建筑升级中，不能学习")),
	#'Proto10135003'{
		stage = Stage,
		index = Index,
		science_id = ScienceId,
		type = Type
	} = Msg,

	?JUDGE_RETURN(Type =:= ?UPGRADE_TYPE_SKIP orelse Type =:= ?UPGRADE_TYPE_TIME, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(?SCIENCE_ID(Stage, Index) =:= ScienceId, ?ERROR_INVALID_PARAM),

	ScienceConf = tb_science:get(ScienceId),
	?JUDGE_RETURN(ScienceConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	Science = science_info(ScienceId),
	?JUDGE_RETURN(Science#science.state =:= ?SCIENCE_STATE_NONE, ?ERROR_CLIENT_OPERATOR),

	MaxLevel = maps:get(max_level, ScienceConf, 0),
	CurLevel = Science#science.level,
	?JUDGE_RETURN(MaxLevel > CurLevel, ?ERROR_CLIENT_OPERATOR),

	LevelConf = tb_science_level:get(?LEVEL_ID(ScienceId, CurLevel)),
	?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	StageConf = tb_science_stage:get(Stage),
	?JUDGE_RETURN(StageConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	BuildingLevel = lib_inner_city_api:building_level(?BUILDING_SCIENCE),
	NeedBuildingLevel = maps:get(need_level, StageConf, 0),
	?JUDGE_RETURN(BuildingLevel >= NeedBuildingLevel, ?ERROR_CLIENT_OPERATOR),

	?JUDGE_RETURN(validate_upgrade_cond(ScienceId, CurLevel), ?ERROR_CLIENT_OPERATOR),

	SrcCostList = maps:get(cost, LevelConf, []),
	CostList =
	lists:foldl(fun([ItemId, SrcAmount], List) ->
		Reduce = upgrade_item_reduce(ItemId),
		Amount = util:floor(SrcAmount * (1 - Reduce)),
		[[ItemId, Amount] | List]
    end, [], SrcCostList),

	CostItemList =
	case Type of
		?UPGRADE_TYPE_SKIP ->
			SkipCostList = maps:get(skip_cost, LevelConf, []),
			TotalCostList = lib_item_api:merge_conf_item_list(CostList, SkipCostList),
			lib_item_api:conf_item_list_to_item_obj_list(TotalCostList);
		?UPGRADE_TYPE_TIME ->
			lib_item_api:conf_item_list_to_item_obj_list(CostList)
	end,

	%% 开服冲榜处理
	lib_player_open_server_rank:update_player_grade(?OPEN_SERVER_TASK_TYPE_6,CostItemList),

	Ret = lib_player_pack:auto_remove(CostItemList, ?REMOVE_SERIAL(?USE_SCIENCE_UPGRADE, ScienceId)),
	?PACK_IS_SUCCESS(Ret),

	case Type of
		?UPGRADE_TYPE_SKIP ->
			update_science(Science#science{state = ?SCIENCE_STATE_FINISH});
%%			process_science_upgrade(ScienceId, CurLevel + 1);
		?UPGRADE_TYPE_TIME ->
			update_science(Science#science{
				state = ?SCIENCE_STATE_UPGRADE,
				start_tick = lib_timer:unixtime()
			}),
			insert_upgrading_id(ScienceId)
	end,

	Respond = #'Proto50135003'{
		stage = Stage,
		index = Index,
		science_id = ScienceId,
		type = Type
	},
	lib_send:respond_to_client(Respond)
.

-define(ACCELERATE_TYPE_SKIP,   1).
-define(ACCELERATE_TYPE_ITEM,   2).

request_accelerate(Msg) ->
	#'Proto10135004'{
		science_id = ScienceId,
		type = Type,
		item_id = ItemId,
		amount = Amount
	} = Msg,

	?JUDGE_RETURN(Type =:= ?ACCELERATE_TYPE_SKIP orelse Type =:= ?ACCELERATE_TYPE_ITEM, ?ERROR_INVALID_PARAM),

	ScienceConf = tb_science:get(ScienceId),
	?JUDGE_RETURN(ScienceConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	CurTick = lib_timer:unixtime(),
	IsUpgrade = check_science_upgrade_finish(ScienceId, CurTick),
	?JUDGE_RETURN(not IsUpgrade, ?ERROR_INVALID_INDEX), %%todo errcode

	Science = science_info(ScienceId),
	#science{
		level = Level,
		state = State,
		accelerate_time = AccelerateTime,
		start_tick = StartTick
	} = Science,
	?JUDGE_RETURN(State =:= ?SCIENCE_STATE_UPGRADE, ?ERROR_CLIENT_OPERATOR),

	LevelConf = tb_science_level:get(?LEVEL_ID(ScienceId, Level)),
	?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	SrcNeedTime = maps:get(time, LevelConf, 0),
	NeedTimeReduce = upgrade_time_reduce(),
	NeedTime = util:floor(SrcNeedTime * (1 - NeedTimeReduce)),

	ItemConf = tb_science_accelerate_item:get(ItemId),

	CostItem =
	case Type of
		?ACCELERATE_TYPE_SKIP ->
			LeftSec = StartTick + (NeedTime - AccelerateTime) * lib_timer:minute_second() - CurTick,
			LeftMin = max(util:ceil(LeftSec / lib_timer:minute_second()), 0),
			?JUDGE_RETURN(LeftMin > 0, ?ERROR_INVALID_INDEX), %%todo errcode

			SingleMin = lib_const_api:get_const_int(science_accelerate_min, 0),
			?JUDGE_RETURN(SingleMin > 0, ?ERROR_CONFIG_ERROR),

			CostNumber = util:ceil(LeftMin / SingleMin),

			SingleItem = lib_const_api:get_const_list(science_accelerate_item, [0, 0]),
			lib_item_api:conf_item_to_item_obj(lib_item_api:multi_conf_item(SingleItem, CostNumber));
		?ACCELERATE_TYPE_ITEM ->
			?JUDGE_RETURN(ItemConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
			?ITEM_OBJ(ItemId, Amount)
	end,

	Ret = lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_SCIENCE_ACCELERATE, ScienceId)),
	?PACK_IS_SUCCESS(Ret),

	case Type of
		?ACCELERATE_TYPE_SKIP ->
			update_science(Science#science{
%%				level = Level + 1,
				state = ?SCIENCE_STATE_FINISH
			});
%%			process_science_upgrade(ScienceId, Level + 1);
		?ACCELERATE_TYPE_ITEM ->
			SingleAccelerateTime = maps:get(time, ItemConf, 0),
			update_science(Science#science{
				accelerate_time = AccelerateTime + SingleAccelerateTime * Amount
			}),

			check_science_upgrade_finish(ScienceId, CurTick)
	end,

	Respond = #'Proto50135004'{
		science_id = ScienceId,
		type = Type,
		item_id = ItemId,
		amount = Amount
	},
	lib_send:respond_to_client(Respond)
.

request_receive_item() ->
	?JUDGE_RETURN(not get_is_received(), ?ERROR_CLIENT_OPERATOR),
	PlayerScience = get_player_science(),
	#player_science{science_map = ScienceMap} = PlayerScience,
	ScienceMapKeys = maps:keys(ScienceMap),
	CondList = lists:foldr(fun(ScienceId,List) ->
		ScienceConf = tb_science:get(ScienceId),
		case maps:get(type, ScienceConf) =:= ?EFFECT_SCIENCE_ITEM_REWARD of
			true -> lists:merge(maps:get(cond_list, ScienceConf),List);
			false -> List
		end
				end,[],ScienceMapKeys),
	ConfItemList = lib_player_science_api:get_effect_value(?EFFECT_SCIENCE_ITEM_REWARD,CondList),
	ItemList = lib_item_api:conf_item_list_to_item_obj_list(ConfItemList),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_SCIENCE_REWARD, 0)),
	set_is_received(true),
	Respond = #'Proto50135005'{},
	lib_send:respond_to_client(Respond)
.

request_active_science(Msg) ->
	ScienceId = Msg#'Proto10135006'.science_id,

	check_science_upgrade_finish(ScienceId),

	Science = science_info(ScienceId),
	#science{
		state = State,
		level = Level
	} = Science,
	?JUDGE_RETURN(State =:= ?SCIENCE_STATE_FINISH, ?ERROR_CLIENT_OPERATOR),

	update_science(Science#science{
		state = ?SCIENCE_STATE_NONE,
		level = Level + 1,
		accelerate_time = 0
	}),

	Respond = #'Proto50135006'{
		science_id = ScienceId
	},
	lib_send:respond_to_client(Respond),

	process_science_upgrade(ScienceId, Level + 1),

	lib_player_science_api:update_hero_prop()
.

test_active_science(ScienceId,Level) ->
	Science = science_info(ScienceId),
	update_science(Science#science{
		state = ?SCIENCE_STATE_NONE,
		level = Level,
		accelerate_time = 0
	}),

	process_science_upgrade(ScienceId, Level)
.