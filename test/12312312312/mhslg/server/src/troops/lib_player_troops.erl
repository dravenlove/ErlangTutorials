%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%	玩家对部队的操作,与客户端的交互
%%% @end
%%% Created : 05. 12月 2020 17:29
%%%-------------------------------------------------------------------
-module(lib_player_troops).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").
-include("hero.hrl").
-include("map.hrl").
-include("science.hrl").
-include("ProtoClient_10114.hrl").
-include("ProtoClient_10121.hrl").

%% API
-export([
	troops_to_proto/1
]).
-export([
%%	request_map_troops_march/0,			%% 玩家登录获取行军的部队信息
	respond_map_troops_march/1,
	request_player_troops/0,			%% 请求玩家部队信息
	respond_player_troops/1,			%% 返回玩家部队信息
	request_not_create_hero_list/0,		%% 请求未创建部队的英雄信息
	request_troops_create/1,			%% 请求创建部队
	request_troops_dissolve/1,			%% 请求解散部队
	request_troops_march_consume/1,		%% 请求行军粮草和时间计算
	request_troops_depart/1,			%% 请求部队行军出发
	request_troops_quicken/1,			%% 请求部队行军加速
	request_troops_recall/1,			%% 请求部队行军撤回
	request_troops_repair/1,			%% 请求部队补兵
	request_one_troops/1,				%% 请求单一部队信息
	respond_one_troops/1,				%% 请求单一部队信息,返回
	request_troops_extrude/1,			%% 请求部队突进
	request_troops_withdraw/1			%% 请求部队撤退

]).

-define(QUICKEN_PROP(X), 102016000 + X).

troops_to_proto(Troops) ->
	#troops{
		troops_id = TroopsId,
		combat_hero = #combat_hero{
			hero_id = HeroId,
			country = Country,
			former = #combat_army{type = FrontType, cur_troops = QianJun, troops = TotalQianJun},
			latter = #combat_army{type = BackType, cur_troops = HouJun, troops = TotalHouJun}
		},
		state = State,
		city_id = CityId
	} = Troops,
	Proto = #'ProtoTroops'{
		troops_id = TroopsId,
		hero_id = HeroId,
		state = State,
		city_id = CityId,
		qian_jun = QianJun,
		hou_jun = HouJun,
		qian_jun_total = TotalQianJun,
		hou_jun_total = TotalHouJun,
		qian_jun_all = lib_barrack_train_api:inquire_soldier_num(FrontType),
		hou_jun_all = lib_barrack_train_api:inquire_soldier_num(BackType)
	},
	case State of
		?TROOPS_FIGHTING ->
			City = lib_player_map:city(CityId),
			List =
				case City#city.country of
					Country ->City#city.defend_troops;
					_ -> City#city.attack_troops
				end,
			Proto#'ProtoTroops'{fight = lib_troops_api:index(TroopsId, List)};
		?TROOPS_MOVING ->
			#{
				city_times := CityTimes,
				city_lists := CityLists,
				depart_tick := DepartTick
			} = Troops#troops.march,
			AllTime = lists:sum(CityTimes),
			Proto#'ProtoTroops'{
				march = #'ProtoTroopsMarch'{
					city_list = CityLists,
					time_list = CityTimes,
					remaining_time = DepartTick + AllTime - lib_timer:unixtime_ms(),
					all_time = AllTime
				}
			};
		_ -> Proto
	end
.

%%request_map_troops_march() ->
%%	lib_troops_api:async(fun lib_troops_march:troops_march_go_of_country/1, [lib_player:player_country()], fun respond_map_troops_march/1)
%%.
respond_map_troops_march(TroopsList) ->
	Msg = #'Proto80114003'{
		troops_notice = [lib_troops:troops_march_to_proto(X) || X <- TroopsList]
	},
	lib_send:respond_to_client(Msg)
.

request_player_troops() ->
	lib_troops:player_troops()
.

no_create(N) ->
	lists:duplicate(N, #'ProtoTroops'{
		troops_id = 0,
		hero_id = 0,
		state = ?TROOPS_NOT_CREATED,
		index = 0,
		city_id = 0,
		qian_jun_total = 0,
		qian_jun = 0,
		hou_jun_total = 0,
		hou_jun = 0,
		qian_jun_all = 0,
		hou_jun_all = 0
	})
.

no_hero(N) ->
	lists:duplicate(N, #'ProtoTroops'{
		troops_id = 0,
		hero_id = 0,
		state = ?TROOPS_NOT_HERO,
		index = 0,
		city_id = 0,
		qian_jun_total = 0,
		qian_jun = 0,
		hou_jun_total = 0,
		hou_jun = 0,
		qian_jun_all = 0,
		hou_jun_all = 0
	})
.
to_proto(TroopsList) ->
	NewTroopsList = lists:sort(
		fun(A, B) ->
			A#troops.combat_hero#combat_hero.hero_force > B#troops.combat_hero#combat_hero.hero_force
		end, TroopsList),
	HeroIdList = [X#troops.combat_hero#combat_hero.hero_id || X <- NewTroopsList],
	lib_troops_api:u_hero_id_list(HeroIdList),
	ProtoList = [troops_to_proto(X) || X <- NewTroopsList],
	TroopsNum = length(ProtoList),
	case lib_troops_api:troops_limit() - TroopsNum of
		0 -> ProtoList;
		N ->
			ProtoList ++
			case length(lib_hero_api:hero_id_list()) of
				TroopsNum -> no_hero(N);
				_ -> no_create(N)
			end
	end
.

respond_player_troops(TroopsList) ->
	Res = #'Proto80121001'{
		troops_list = to_proto(TroopsList)
	},
	?DEBUG("~p", [Res]),
	lib_send:respond_to_client(Res)
.

request_not_create_hero_list() ->
	HeroIdList = lib_troops_api:hero_id_list(),
	HeroList = lists:foldl(
		fun(HeroId, Lists) ->
			lists:keydelete(HeroId, #hero.id, Lists)
		end, lib_hero_api:hero_list(), HeroIdList),
	SortHeroList = lists:keysort(#hero.force, HeroList),
	ProtoHeroList = [lib_hero_api:hero_to_proto(Hero) || Hero <- SortHeroList, not lib_hero_assist:is_assist(Hero#hero.assist)],
	[[_, BuBing], [_, QiBing], [_, GongBing], [_, FaShi]] = maps:get(jsonvalue, tb_const:get(barrack_corps)),
	Respond = #'Proto50121002'{
		hero_list = lists:reverse(ProtoHeroList),
		bu_bing = lib_barrack_train_api:inquire_soldier_num(BuBing),
		qi_bing = lib_barrack_train_api:inquire_soldier_num(QiBing),
		gong_bing = lib_barrack_train_api:inquire_soldier_num(GongBing),
		fa_shi = lib_barrack_train_api:inquire_soldier_num(FaShi)
	},
	lib_send:respond_to_client(Respond)
.

request_troops_create(Msg) ->
	HeroId = Msg#'Proto10121003'.hero_id,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_RETURN(not lib_troops_api:is_troops(HeroId), ?ERROR_TROOPS_FULL),
	?JUDGE_RETURN(not lib_hero_assist:hero_is_assist(HeroId), ?ERROR_TROOPS_ERROR),
	N = lib_troops_api:troops_limit() - length(lib_troops_api:hero_id_list()),
	?JUDGE_RETURN(N > 0, ?ERROR_TROOPS_FULL),
	#combat_hero{
		former = Former,
		latter = Latter
	} = CombatHero = lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_base_info(HeroId)),
	QianJunNum = lib_barrack_train_api:request_get_store_soldier(Former#combat_army.type, Former#combat_army.troops),
	HouJunNum = lib_barrack_train_api:request_get_store_soldier(Latter#combat_army.type, Latter#combat_army.troops),
	?JUDGE_RETURN(QianJunNum + HouJunNum > 0, ?ERROR_BARRACK_DEFICIENCY),
	Troops = #troops{
		troops_id = lib_troops_api:troops_id(HeroId),
		combat_hero = CombatHero#combat_hero{
			former = Former#combat_army{cur_troops = QianJunNum},
			latter = Latter#combat_army{cur_troops = HouJunNum}
		},
		state = ?TROOPS_FREE,
		city_id = ?COUNTRY_CAPITAL(lib_player:player_country())
	},
	lib_troops_api:u_hero_id(HeroId),
	lib_troops_api:async(fun lib_troops_api:create/1, [Troops]),
	lib_send:respond_to_client(#'Proto50121003'{flag = ?IIF(N > 1, ?SUCCESS, ?SUCCESS_STOP)}),
	lib_player_process:process_troops_create()
.

request_troops_dissolve(Msg) ->
	#'Proto10121004'{
		hero_id = HeroId,
		troops_march = TroopsMarch
	} = Msg,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	TroopsId = lib_troops_api:troops_id(HeroId),
	?JUDGE_RETURN(lib_bounty_mission_api:is_finish(lib_troops_api:sync(fun lib_troops_api:city_id/1, [TroopsId])), ?ERROR_BOUNTY_MISSION),
	Flag = lib_troops_api:sync(fun lib_troops_api:dissolve/2, [TroopsId, TroopsMarch]),
	?TROOPS_ERROR(Flag),
	lib_troops_api:d_hero_id(HeroId),
	{QianJun, HouJun} = Flag,
	FrontType = lib_hero_api:hero_front_corps(HeroId),
	BackType = lib_hero_api:hero_back_corps(HeroId),
	lib_barrack_train:request_return_store_soldier(FrontType, QianJun),
	lib_barrack_train:request_return_store_soldier(BackType, HouJun),
	lib_send:respond_to_client(#'Proto50121004'{flag = ?SUCCESS})
.

request_troops_march_consume(Msg) ->
	#'Proto10121005'{
		hero_troops_march = HeroTroopsMarch
	} = Msg,
	TroopsMarchList = [march_consume(X) || X <- HeroTroopsMarch],
	Add = {lib_player_science_api:get_effect_value(?EFFECT_MARCH_SPEED_ADD), lib_player_science_api:get_effect_value(?EFFECT_MARCH_COST_REDUCE)},
	Flag = lib_troops_api:sync(fun lib_troops_api:consume/2, [TroopsMarchList, Add]),
	?TROOPS_ERROR(Flag),
	{Time, Foodstuff} = lib_troops:calculate_foodstuff_and_time(Flag),
	ConsumeList = [#'ProtoTroopsConsume'{
		hero_id = maps:get(id, X) rem 1000,
		time = lists:sum(maps:get(city_times, X)),
		foodstuff = maps:get(foodstuff, X)
	} || X <- Flag],
	Res = #'Proto50121005'{
		consume_time = Time,
		consume_foodstuff = Foodstuff,
		consume_list = ConsumeList
	},
	lib_send:respond_to_client(Res)
.
march_consume(Proto) ->
	HeroId = Proto#'ProtoTroopsHero'.hero_id,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	CityLists = Proto#'ProtoTroopsHero'.troops_march,
	?JUDGE_RETURN(length(CityLists) >= 2, ?ERROR_CLIENT_OPERATOR),
	#{
		id => lib_troops_api:troops_id(HeroId),
		city_lists => CityLists
	}
.

request_troops_depart(Msg) ->
	#'Proto10121006'{
		hero_troops_march = HeroTroopsMarch
	} = Msg,
	TroopsMarchList = [march_consume(X) || X <- HeroTroopsMarch],
	ProvisionsNum = lib_player_pack:count_by_id(?PROVISIONS_ID),
	Add = {lib_player_science_api:get_effect_value(?EFFECT_MARCH_SPEED_ADD), lib_player_science_api:get_effect_value(?EFFECT_MARCH_COST_REDUCE)},
	Flag = lib_troops_api:sync(fun lib_troops_api:depart/3, [TroopsMarchList, ProvisionsNum, Add]),
	?TROOPS_ERROR(Flag),
	lib_equip_api:item([?PROVISIONS_ID, Flag], ?USE_TROOPS_MARCH, 1),
	lib_send:respond_to_client(#'Proto50121006'{flag = ?SUCCESS})
.

request_troops_quicken(Msg) ->
	#'Proto10121007'{
		hero_id = HeroId,
		prop_id = PropId
	} = Msg,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	TroopsId = lib_troops_api:troops_id(HeroId),
	Ret = lib_player_pack:validate_remove(?ITEM_OBJ(?QUICKEN_PROP(PropId), 1)),
	?PACK_IS_SUCCESS(Ret),
	Rate = case tb_item:get(?QUICKEN_PROP(PropId)) of false -> throw({error, ?ERROR_CLIENT_OPERATOR}); _ -> 1 - PropId * 0.25 end,
	Flag = lib_troops_api:sync(fun lib_troops_api:quicken/2, [TroopsId, Rate]),
	?TROOPS_ERROR(Flag),
	lib_equip_api:item([?QUICKEN_PROP(PropId), 1], ?USE_TROOPS_MARCH, TroopsId),
	lib_send:respond_to_client(#'Proto50121007'{flag = Flag})
.

request_troops_recall(Msg) ->
	#'Proto10121008'{
		hero_id = HeroId
	} = Msg,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	TroopsId = lib_troops_api:troops_id(HeroId),
	Flag = lib_troops_api:sync(fun lib_troops_api:recall/1, [TroopsId]),
	?TROOPS_ERROR(Flag),
	lib_send:respond_to_client(#'Proto50121008'{flag = Flag, troops_id = TroopsId})
.

request_one_troops(Msg) ->
	#'Proto10121009'{
		troops_id = TroopsId
	} = Msg,
	lib_troops_api:async(fun lib_troops_api:troops/1, [TroopsId], fun respond_one_troops/1)
.
respond_one_troops(Troops) ->
	lib_send:respond_to_client(#'Proto50121009'{troops = troops_to_proto(Troops)})
.

request_troops_repair(Msg) ->
	#'Proto10121010'{
		hero_id = HeroId,
		type = Type
	} = Msg,
	case Type of
		2 -> one_key();
		_ ->
			?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
			TroopsId = lib_troops_api:troops_id(HeroId),
			?JUDGE_RETURN(lib_bounty_mission_api:is_finish(lib_troops_api:sync(fun lib_troops_api:city_id/1, [TroopsId])), ?ERROR_BOUNTY_MISSION),
			FrontType = lib_hero_api:hero_front_corps(HeroId),
			BackType = lib_hero_api:hero_back_corps(HeroId),
			Param = case Type of
				0 ->%%正常补兵
					TotalQianJunNum = lib_barrack_train_api:inquire_soldier_num(FrontType),
					TotalHouJunNum = lib_barrack_train_api:inquire_soldier_num(BackType),
					{TotalQianJunNum, TotalHouJunNum};
				1 ->%%元宝补兵
					GoldNum = lib_player_pack:count_by_id(?GOLD_ID),
					?JUDGE_RETURN(GoldNum =/= 0, ?ERROR_GOLD_AMOUNT),
					GoldNum
			end,
			Flag = lib_troops_api:sync(fun lib_troops_api:repair/2, [TroopsId, Param]),
			?TROOPS_ERROR(Flag),
			case Flag of
				{QianJunNum, HouJunNum, CostGoldNum} ->
					lib_barrack_train_api:request_get_store_soldier(FrontType, QianJunNum),
					lib_barrack_train_api:request_get_store_soldier(BackType, HouJunNum),
					A = lib_barrack_train_api:inquire_soldier_num(FrontType),
					B = lib_barrack_train_api:inquire_soldier_num(BackType),
					Res = #'Proto50121010'{gold = CostGoldNum, hero_id = HeroId},
					case A =/= 0 andalso B =/= 0 of
						true -> lib_send:respond_to_client(Res);
						false -> lib_send:respond_to_client(Res, ?ERROR_BARRACK_DEFICIENCY)
					end;
				CostGoldNum ->
					lib_equip_api:item([?GOLD_ID, CostGoldNum], ?USE_TROOPS_REPAIR, TroopsId)
			end
	end
.
one_key() ->
	TroopsIdList = lib_troops_api:troops_id_list(),
	Param = lists:foldl(
		fun([_, X], M) ->
			maps:put(X, lib_barrack_train_api:inquire_soldier_num(X), M)
		end, maps:new(), maps:get(jsonvalue, tb_const:get(barrack_corps))),
	Flag = lib_troops_api:sync(fun lib_troops_api:repair/2, [TroopsIdList, Param]),
	?TROOPS_ERROR(Flag),
	maps:fold(
		fun(X, N, _) ->
			lib_barrack_train_api:request_get_store_soldier(X, N - maps:get(X, Flag))
		end, ok, Param),
	lib_send:respond_to_client(#'Proto50121010'{hero_id = 0})
.

request_troops_extrude(Msg) ->
	#'Proto10121011'{
		hero_id = HeroId,
		city_id = CityId
	} = Msg,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	?JUDGE_RETURN(lib_nobility_api:privilege_add(?COUNTRY_WAR_QUEUE_UP_CHARGE) =:= 1, ?ERROR_PRIVILEGE_ID),
	TroopsId = lib_troops_api:troops_id(HeroId),
	ProvisionsNum = lib_player_pack:count_by_id(?PROVISIONS_ID),
	Add = {lib_player_science_api:get_effect_value(?EFFECT_MARCH_SPEED_ADD), lib_player_science_api:get_effect_value(?EFFECT_MARCH_COST_REDUCE)},
	Flag = lib_troops_api:sync(fun lib_troops_api:extrude/5, [TroopsId, CityId, ProvisionsNum, lib_player:player_show(), Add]),
	?TROOPS_ERROR(Flag),
	lib_equip_api:item([?PROVISIONS_ID, Flag], ?USE_TROOPS_MARCH, 1),
	lib_send:respond_to_client(#'Proto50121011'{flag = ?SUCCESS})
.

request_troops_withdraw(Msg) ->
	#'Proto10121012'{
		hero_id = HeroId,
		city_id = CityId
	} = Msg,
	?JUDGE_RETURN(lib_troops_api:is_troops(HeroId), ?ERROR_NO_TROOPS),
	?JUDGE_RETURN(lib_nobility_api:privilege_add(?NO_JOIN_COUNTRY_WAR_WITHDRAW) =:= 1, ?ERROR_PRIVILEGE_ID),
	TroopsId = lib_troops_api:troops_id(HeroId),
	ProvisionsNum = lib_player_pack:count_by_id(?PROVISIONS_ID),
	Add = {lib_player_science_api:get_effect_value(?EFFECT_MARCH_SPEED_ADD), lib_player_science_api:get_effect_value(?EFFECT_MARCH_COST_REDUCE)},
	Flag = lib_troops_api:sync(fun lib_troops_api:withdraw/5, [TroopsId, CityId, ProvisionsNum, lib_player:player_show(), Add]),
	?TROOPS_ERROR(Flag),
	lib_equip_api:item([?PROVISIONS_ID, Flag], ?USE_TROOPS_MARCH, 1),
	lib_send:respond_to_client(#'Proto50121012'{flag = ?SUCCESS})
.

