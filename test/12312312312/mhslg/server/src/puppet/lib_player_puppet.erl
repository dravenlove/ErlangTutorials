%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. 3月 2021 10:09
%%%-------------------------------------------------------------------
-module(lib_player_puppet).
-author("xuyonghui").

-include("puppet.hrl").
-include("common.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("hero.hrl").
-include("clearing.hrl").
-include("science.hrl").
-include("ProtoClient_10146.hrl").

-define(PUPPET_ID(Level), 105000 + Level).
-define(PUPPET_UNLOCK,	0).
-define(PUPPET_LOCK,	1).

%% API
-export([
	ets_init/0,
	put_player_puppet/1,
	put_player_puppet/2,
	get_player_puppet/0,
	build_index/0,
	player_puppet_handler/0,

	find_puppet/1,
	update_puppet/1,
	is_max_free_refresh/0,			%% 判断是否达到最大免费刷新次数,true为是
	add_today_refresh_times/1,		%% 增加今日刷新次数
	respond_puppet_challenge/2,		%% 处理战斗结果
	reset_everyday/0,				%% 每日重置
	refresh_all_puppet/0,			%% 刷新全部傀儡
	sign_in/0,						%% 登陆游戏处理

	request_puppet_info/1,			%% 请求界面信息
	request_puppet_refresh/1,		%% 请求刷新
	request_puppet_lock/1,			%% 请求锁定
	request_puppet_challenge/1,		%% 请求挑战
	request_puppet_challenge_buy/1	%% 请求购买挑战次数
]).

ets_init() ->
	ets:new(?ETS_PLAYER_PUPPET, [?ETS_KEY_POS(#player_puppet.id) | ?ETS_OPTIONS]).
put_player_puppet(PlayerPuppet) when is_record(PlayerPuppet, player_puppet) ->
	put_player_puppet(PlayerPuppet, false).
put_player_puppet(PlayerPuppet, IsSaveDb) when is_record(PlayerPuppet, player_puppet) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_PUPPET),
	erlang:put(?ETS_PLAYER_PUPPET, PlayerPuppet).

get_player_puppet() ->
	erlang:get(?ETS_PLAYER_PUPPET).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PUPPET, {?TUPLE_INT(<<"id">>, 1)}, true).

player_puppet_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_PUPPET,
		table_name = ?DBPLAYER_PUPPET,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_puppet:ets_init/0,
		mongo_index_func = fun lib_player_puppet:build_index/0,
		load_func = fun db_player_puppet:load_player_puppet/1,
		save_func = fun db_player_puppet:save_player_puppet/1,
		get_func = fun lib_player_puppet:get_player_puppet/0,
		put_func = fun lib_player_puppet:put_player_puppet/2
	}.

find_puppet(CityId) ->
	PlayerPuppet = get_player_puppet(),
	Puppet = PlayerPuppet#player_puppet.puppet,
	case dict:find(CityId,Puppet) of
		{ok, Value} -> Value;
		error -> error
	end
.

update_puppet(Puppet) when is_record(Puppet,puppet)->
	PlayerPuppet = get_player_puppet(),
	NewPuppet = dict:store(Puppet#puppet.city_id, Puppet, PlayerPuppet#player_puppet.puppet),
	put_player_puppet(PlayerPuppet#player_puppet{puppet = NewPuppet})
.

is_max_free_refresh() ->
	Times = maps:get(value, tb_const:get(puppet_times)),
	PlayerPuppet = get_player_puppet(),
	PlayerPuppet#player_puppet.today_use_fresh_times >= Times
.

add_today_refresh_times(AddTimes) ->
	PlayerPuppet = get_player_puppet(),
	OldTimes = PlayerPuppet#player_puppet.today_use_fresh_times,
	put_player_puppet(PlayerPuppet#player_puppet{today_use_fresh_times = OldTimes + AddTimes})
.

add_today_use_times(AddTimes) ->
	lib_player_process:process_puppet_times(AddTimes),
	PlayerPuppet = get_player_puppet(),
	OldTimes = PlayerPuppet#player_puppet.today_use_times,
	put_player_puppet(PlayerPuppet#player_puppet{today_use_times = OldTimes + AddTimes})
.

add_today_buy_times(AddTimes) ->
	PlayerPuppet = get_player_puppet(),
	OldTimes = PlayerPuppet#player_puppet.today_buy_times,
	put_player_puppet(PlayerPuppet#player_puppet{today_buy_times = OldTimes + AddTimes})
.

sign_in() ->
	activate_puppet_refresh_info()
.

reset_everyday() ->
	PlayerPuppet = get_player_puppet(),
	NewPlayerPuppet = PlayerPuppet#player_puppet{
		today_use_times = 0,
		today_buy_times = 0,
		today_use_fresh_times = 0
	},
	put_player_puppet(NewPlayerPuppet)
.

refresh_all_puppet() ->
	try
		PlayerPuppet = get_player_puppet(),
		CityList = lib_player_map:country_city(lib_player:player_country()),
		{PuppetDict, HeroIdSet, NewCityList} = dict:fold(
			fun(CityId, Puppet, {Dict, Sets, List}) ->
				case Puppet#puppet.is_lock of
					0 ->
						lib_map_clearing_api:d_clearing(Puppet#puppet.clear_id),
						{Dict, Sets, List};
					1 -> {dict:store(CityId, Puppet, Dict), sets:add_element(Puppet#puppet.hero_id, Sets), lists:delete(CityId, List)}
				end
			end, {dict:new(), sets:new(), CityList}, PlayerPuppet#player_puppet.puppet),
		Amount = maps:get(value, tb_const:get(puppet_max)) - dict:size(PuppetDict),
		{NewPuppetDict, NewHeroIdSet} = refresh_puppet(Amount, NewCityList, PlayerPuppet#player_puppet.refresh_time_tick, {PuppetDict, HeroIdSet}),
		put_player_puppet(PlayerPuppet#player_puppet{
			puppet = NewPuppetDict,
			hero_id_set = NewHeroIdSet,
			refresh_time_tick = lib_timer:next_hour_unixtime(lib_timer:unixtime())
		}),
		activate_puppet_refresh_info()
	catch
		_:_Res -> skip%%,?INFO("~p", [Res])
	end
.
refresh_puppet(0, _, _, T) ->
	T
;
refresh_puppet(_, [], _, T) ->
	T
;
refresh_puppet(Amount, CityList, Tick, {PuppetDict, HeroIdSet} = T) ->
	CityId = lib_random:rand_one(CityList),
	HeroId = random_hero_id(HeroIdSet),
	Level = lib_player:player_level(),
	{RobotId, HeroBase} = random_robot([Level - 1, Level, Level + 1], HeroId),
	RewardId = random_reward_id(HeroId),
	ClearingId = lib_map_clearing_api:city_task(CityId, ?TYPE_PUPPET, [HeroBase#hero_base.id, Tick]),
	NewCityList = lists:delete(CityId, CityList),
	case ClearingId of
		false -> refresh_puppet(Amount, NewCityList, Tick, T);
		_ ->
			NewPuppet = #puppet{
				city_id = CityId,
				clear_id = ClearingId,
				robot_id = RobotId,
				hero_base = HeroBase,
				hero_id = HeroId,
				reward_id = RewardId
			},
			NewPuppetDict = dict:store(CityId, NewPuppet, PuppetDict),
			NewHeroIdSet = sets:add_element(HeroId, HeroIdSet),
			refresh_puppet(Amount - 1, NewCityList, Tick, {NewPuppetDict, NewHeroIdSet})
	end
.

random_hero_id(HeroIdSet) ->
	HeroWeightList = lists:foldl(
		fun(HeroId, AccList) ->
			case sets:is_element(HeroId, HeroIdSet) orelse maps:get(is_basics, tb_hero:get(HeroId), 0) =/= 1 of
				true -> AccList;
				false ->
					Conf = tb_puppet_robot:get(HeroId),
					Weight = maps:get(weight, Conf),
					[{Weight, HeroId} | AccList]
			end
		end, [], tb_puppet_robot:get_list()),
	util:weight_rand(HeroWeightList)
.
random_robot([], _HeroId) ->
	throw(-1)
;
random_robot(LevelList, HeroId) ->
	Index = lib_random:rand_one(LevelList),
	case tb_puppet_monster_group:get(Index) of
		false -> random_robot(lists:delete(Index, LevelList), HeroId);
		Conf ->
			LevelIndex = maps:get(monster_list, Conf),
			MapConf = tb_puppet_monster_random:get(LevelIndex),
			ListConf = maps:to_list(MapConf),
			MonsterWeight = lists:foldl(
				fun({_K, V}, L) ->
					[{maps:get(power, V), maps:get(monster_id, V)} | L]
				end, [], ListConf),
			MonsterId = util:weight_rand(MonsterWeight),
			HeroBase = lib_robot_api:get_monster(MonsterId),
			FormerType = HeroBase#hero_base.former_type,
			LatterType = HeroBase#hero_base.latter_type,
			SkillList = skill_list(HeroId, Index, FormerType, LatterType),
			{robot_id(HeroId, Index), HeroBase#hero_base{skill_list = SkillList}}
	end
.
random_reward_id(HeroId) ->
	RewardList = maps:get(random_reward, tb_puppet_robot:get(HeroId)),
	RewardWeight = lists:foldl(
		fun([RewardId, Weight], List) ->
			[{Weight, RewardId} | List]
		end, [], RewardList),
	util:weight_rand(RewardWeight)
.

combat_hero(RobotId, HeroBase) ->
	RobotShow = lib_robot_api:robot_player_show(RobotId),
	[lib_combat_queue_api:to_combat_hero(RobotShow, HeroBase)]
.
robot_id(HeroId, Level) ->
	(105000 + Level) * 1000 + HeroId
.

skill_list(HeroId, Level, FormerType, LatterType) ->
	HeroCfg = tb_hero:get(HeroId),
	HeroType = maps:get(hero_type, HeroCfg),
	Sex = maps:get(sex, HeroCfg),
	BaseSkillList = maps:get(skill_list, HeroCfg, []),
	HeroSkillIndex = hero_skill_index(HeroType, Sex, Level),
	SkillList =  maps:get(skill_list, tb_puppet_robot_skill:get(HeroSkillIndex), []),
	FormerSkillIndex = soldier_skill_index(FormerType, Level),
	FormerSkillList = maps:get(skill_id, tb_puppet_soldier_skill:get(FormerSkillIndex), 0),
	LatterSkillIndex = soldier_skill_index(LatterType, Level),
	LatterSkillList = maps:get(skill_id, tb_puppet_soldier_skill:get(LatterSkillIndex), 0),
	ALLSkill = lists:append([BaseSkillList, SkillList, FormerSkillList, LatterSkillList]),
	lib_combat_queue_api:get_skill_list(ALLSkill)
.

hero_skill_index(HeroType, Sex, Level) ->
	HeroType * 10000 + Sex * 1000 + Level
.

soldier_skill_index(Type, Level) ->
	Type * 1000 + Level
.

make_item_conf_list(RewardId) ->
	ConfMap = tb_puppet_robot_reward:get(RewardId),
	ConfList = maps:to_list(ConfMap),
	[maps:get(item_list, V) || {_K, V} <- ConfList]
.

request_puppet_info(Msg) when is_record(Msg,'Proto10146001') ->
	CityId = Msg#'Proto10146001'.city_id,
	request_puppet_info(CityId);
request_puppet_info(CityId) ->
	Puppet = find_puppet(CityId),
	?JUDGE_RETURN(Puppet =/= error, ?ERROR_PUPPET_NO_FIND),

	PlayerPuppet = get_player_puppet(),
	Times = maps:get(value, tb_const:get(puppet_times))
		+ lib_player_science_api:get_effect_value(?EFFECT_PUPPET_CHALLENGE_TIMES_ADD)
		+ PlayerPuppet#player_puppet.today_buy_times,
	IsMaxFreeRefreshTimes = PlayerPuppet#player_puppet.today_use_fresh_times >= maps:get(value, tb_const:get(puppet_times)),
	ItemConfList = make_item_conf_list(Puppet#puppet.reward_id),
	ItemList = lib_item_api:conf_item_list_to_proto_obj_list(ItemConfList),
	HeroBase = Puppet#puppet.hero_base,
	RobotId = Puppet#puppet.robot_id,
	Robots = combat_hero(RobotId, HeroBase),
	HeroIdList = lib_troops_api:hero_id_list(),
	PredictList = [
		begin
			CombatCallBack = lib_troops:to_fighting(?CALL_FIGHT_TYPE_PUPPET, [lib_troops_api:troops_id(HeroId)], Robots),
			CallBackData0 = CombatCallBack#combat_callback.callback_data,
			FightResultList = CallBackData0#callback_data0.fight_result,
			Loss = loss(FightResultList),
			#'ProtoKeyValue'{key = HeroId, value = Loss}
		end || HeroId <- HeroIdList],

	Respond = #'Proto50146001'{
		city_id = CityId,
		robot_id = HeroBase#hero_base.id,
		times = Times,
		left_times = Times - PlayerPuppet#player_puppet.today_use_times,
		is_lock = Puppet#puppet.is_lock,
		refresh_time_tick = PlayerPuppet#player_puppet.refresh_time_tick,
		is_max_free_refresh_times = IsMaxFreeRefreshTimes,
		item_list = ItemList,
		predict = PredictList,
		hero_base = lib_hero_api:hero_base_to_proto(HeroBase)
	},
	lib_send:respond_to_client(Respond)
.
loss(FightResultList) ->
	loss(FightResultList, 0)
.
loss([FightResult | FightResultList], Loss) ->
	LWastage = FightResult#fight_result.l_wastage,
	NewLoss = LWastage#fight_wastage.back_loss + LWastage#fight_wastage.front_loss + Loss,
	loss(FightResultList, NewLoss)
;
loss([], Loss) ->
	Loss
.

request_puppet_refresh(Msg) ->
	CityId = Msg#'Proto10146002'.city_id,
	IsFree = Msg#'Proto10146002'.is_free,
	Puppet = find_puppet(CityId),
	?JUDGE_RETURN(Puppet =/= error, ?ERROR_PUPPET_NO_FIND),
	?JUDGE_RETURN(Puppet#puppet.is_lock =:= ?PUPPET_UNLOCK, ?ERROR_PUPPET_NO_FIND),
	case IsFree of
		 0 ->
			 #{jsonvalue := Cost} = tb_const:get(puppet_refresh_cost),
			 Item = lib_item_api:conf_item_to_pack_item(Cost),
			 Ret = lib_player_pack:validate_remove(Item),
			 ?PACK_IS_SUCCESS(Ret),
			 lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_PUPPET_REFRESH, 0));
		 1 ->
			 ?JUDGE_RETURN(is_max_free_refresh() =/= true, ?ERROR_NO_FREE_REFRESH_TIMES)
	end,
	ClearId = Puppet#puppet.clear_id,
	lib_map_clearing_api:d_clearing(ClearId),
	PlayerPuppet = get_player_puppet(),
	PuppetDict = dict:erase(Puppet#puppet.city_id, PlayerPuppet#player_puppet.puppet),
	CityList = lib_player_map:country_city(lib_player:player_country()),
	{NewPuppetDict, NewHeroSet0} = refresh_puppet(1, CityList, PlayerPuppet#player_puppet.refresh_time_tick, {PuppetDict, PlayerPuppet#player_puppet.hero_id_set}),
	NewHeroSet = sets:del_element(Puppet#puppet.hero_id, NewHeroSet0),
	put_player_puppet(PlayerPuppet#player_puppet{hero_id_set = NewHeroSet, puppet = NewPuppetDict}),
	add_today_refresh_times(1),
	request_puppet_info(CityId),
	activate_puppet_refresh_info()
.

request_puppet_lock(Msg) ->
	CityId = Msg#'Proto10146003'.city_id,
	Type = Msg#'Proto10146003'.type,
	Puppet = find_puppet(CityId),
	?JUDGE_RETURN(Puppet =/= error, ?ERROR_PUPPET_NO_FIND),
	?JUDGE_RETURN(Type =/= Puppet#puppet.is_lock, ?ERROR_CLIENT_OPERATOR),
	case Type of
		?PUPPET_UNLOCK -> skip;
		?PUPPET_LOCK ->
			#{jsonvalue := Cost} = tb_const:get(puppet_lock_cost),
			Item = lib_item_api:conf_item_to_pack_item(Cost),
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_PUPPET_LOCK, 0))
	end,
	NewPuppet = Puppet#puppet{
		is_lock = Type
	},
	update_puppet(NewPuppet),
	request_puppet_info(CityId)
.

request_puppet_challenge(Msg) ->
	CityId = Msg#'Proto10146004'.city_id,
	HeroId = Msg#'Proto10146004'.hero_id,
	Puppet = find_puppet(CityId),
	?JUDGE_RETURN(Puppet =/= error, ?ERROR_PUPPET_NO_FIND),
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	PlayerPuppet = get_player_puppet(),
	LeftTimes = maps:get(value, tb_const:get(puppet_times))
		+ lib_player_science_api:get_effect_value(?EFFECT_PUPPET_CHALLENGE_TIMES_ADD)
		+ PlayerPuppet#player_puppet.today_buy_times - PlayerPuppet#player_puppet.today_use_times,
	?JUDGE_RETURN(LeftTimes > 0,?ERROR_PUPPET_NO_CHALLENGE),
	TroopsIdList = [lib_troops_api:troops_id(HeroId)],
	PlayerId = lib_player:player_id(),
	Robots = combat_hero(Puppet#puppet.robot_id, Puppet#puppet.hero_base),
	Params = {?CALL_FIGHT_TYPE_PUPPET, PlayerId, CityId},
	IsCross = lib_troops_api:is_cross(?CALL_FIGHT_TYPE_PUPPET),
	F = lib_troops_api:sync(fun lib_troops_api:to_fighting/6, [?CALL_FIGHT_TYPE_PUPPET, Params, TroopsIdList, Robots, CityId, IsCross]),
	?JUDGE_RETURN(F =/= 0, ?ERROR_TROOPS_ERROR),
	add_today_use_times(1)
.

respond_puppet_challenge(CityId, CallBackData) ->
	ResultMsg =
		case CallBackData#callback_data0.win_type of
			?FIGHTER_TYPE_L ->
				PlayerPuppet = get_player_puppet(),
				PuppetDict = PlayerPuppet#player_puppet.puppet,
				Puppet = dict:fetch(CityId, PuppetDict),
				lib_map_clearing_api:d_clearing(Puppet#puppet.clear_id),
				RewardConf = make_item_conf_list(Puppet#puppet.reward_id),
				RewardList = lib_item_api:conf_item_list_to_item_obj_list(RewardConf),
				lib_player_pack:auto_insert(RewardList, ?INSERT_SERIAL(?ADD_PUPPET_CHALLENGE, 0), true, ?PACK_TIPS0),
				HeroSet = sets:del_element(Puppet#puppet.hero_id, PlayerPuppet#player_puppet.hero_id_set),
				NewPuppetDict0 = dict:erase(Puppet#puppet.city_id, PuppetDict),
				CityList = lib_player_map:country_city(lib_player:player_country()) -- dict:fetch_keys(NewPuppetDict0),
				{NewPuppetDict, NewHeroSet} = refresh_puppet(1, CityList, PlayerPuppet#player_puppet.refresh_time_tick, {NewPuppetDict0, HeroSet}),
				put_player_puppet(PlayerPuppet#player_puppet{puppet = NewPuppetDict, hero_id_set = NewHeroSet}),
				activate_puppet_refresh_info(),
				lib_combat_queue_api:result_msg_add_reward(CallBackData#callback_data0.result_msg, RewardConf);
			_ ->
				CallBackData#callback_data0.result_msg
		end,
	lib_send:respond_to_client(CallBackData#callback_data0.msg),
	lib_send:respond_to_client(ResultMsg)
.

request_puppet_challenge_buy(Msg) ->
	CityId = Msg#'Proto10146005'.city_id,
	PlayerPuppet = get_player_puppet(),
	TodayBuyTimes = PlayerPuppet#player_puppet.today_buy_times,
	CostList = maps:get(jsonvalue, tb_const:get(puppet_buy_times_cost)),
	?JUDGE_RETURN(TodayBuyTimes < length(CostList), ?ERROR_TODAY_MAX_BUY_TIMES),
	Cost = lists:nth(TodayBuyTimes + 1, CostList),
	Item = lib_item_api:conf_item_to_pack_item(Cost),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_PUPPET_BUY_TIMES, 0)),
	add_today_buy_times(1),
	request_puppet_info(CityId)
.

activate_puppet_refresh_info() ->
	PlayerPuppet = get_player_puppet(),
	PuppetList = dict:fold(
		fun(CityId, Puppet, List) ->
			[#'ProtoKeyValue'{
				key = CityId,
				value = Puppet#puppet.hero_base#hero_base.id
			} | List]
		end, [],PlayerPuppet#player_puppet.puppet),
	Respond = #'Proto80146001'{
		puppet_list = PuppetList
	},
	lib_send:respond_to_client(Respond)
.