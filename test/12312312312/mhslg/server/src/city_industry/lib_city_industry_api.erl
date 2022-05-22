%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 4:12 PM
%%%-------------------------------------------------------------------
-module(lib_city_industry_api).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("science.hrl").
-include("city_industry.hrl").

-define(MUL, 100).

%% API
-export([		%% 通用
	type/1,					%% 产业类型
	level/1,				%% 产业类型
	industry_id/1,			%% 获取产业id
	industry_id_list/1,		%% 获取该城池的产业idList
	calc_num/2,				%% 计算数量
	calc_time_award/2		%% 计算一段时间奖励
]).

-export([		%% 玩家调用
	city_industry_dict/0,		%% 已占领的产业dict
	city_industry/1,			%% 产业信息
	city_industry_num/1,		%% 获取已占领该等级产业的数量
	add/1,						%% 加成百分比
	is_industry/1,				%% 产业是否已占领
	is_vacancy/0,				%% 产业数量是否有空位
	now_num/0,					%% 已占领数量
	hold_num/0,					%% 可拥有产业数量
	work_num/0,					%% 可作业次数上限

	total_time/1,				%% 获取类型产业作业次数
	u_total_time/1,				%% 更新产业作业次数
	u_city_industry/1,
	d_city_industry/1
]).

type(CityId) ->
	Conf = tb_world_city:get(CityId),
	maps:get(attacktype, Conf)
.
industry_id(CityId) ->
	case tb_world_city:get(CityId) of
		false -> false;
		Data ->
			case maps:get(type, Data) =:= ?AFFILIATE_OBJECT of
				false -> false;
				true ->
					#{attacktype := AttackType, canattacklv := CanAttackLv} = Data,
					AttackType * 100 + CanAttackLv
			end
	end
.

level(CityId) ->
	Conf = tb_world_city:get(CityId),
	maps:get(canattacklv, Conf)
.

industry_id_list(CityId) ->
	i(CityId * 100 + 1, [])
.
i(CityId, List) ->
	case industry_id(CityId) of
		false -> List;
		_ -> i(CityId + 1, [CityId | List])
	end
.
calc_num(CityId, Time) ->
	lists:last(calc_time_award(CityId, Time))
.
calc_time_award(CityId, Time) ->
	LimitTime = maps:get(value, tb_const:get(industry_award_time)),
	EveryTime = maps:get(value, tb_const:get(industry_waive_time)),
	IndustryId = industry_id(CityId),
	[[ItemId, ItemNum] | _] = maps:get(base_award, tb_industry_kind:get(IndustryId)),
	if
		Time > LimitTime -> [ItemId, (LimitTime div EveryTime) * ItemNum];
		Time > EveryTime -> [ItemId, (Time div EveryTime) * ItemNum];
		true -> [false, 0]
	end
.

player_city_industry() ->
	lib_player_city_industry:get_city_industry()
.
city_industry_dict() ->
	PlayerCityIndustry = player_city_industry(),
	PlayerCityIndustry#player_city_industry.city_industry
.
city_industry(Id) ->
	CityIndustryDict = city_industry_dict(),
	util:dict_get(Id, CityIndustryDict, false)
.

city_industry_num(Level) ->
	dict:fold(
		fun(CityId, _, Acc) ->
			case industry_id(CityId) rem 100 >= Level of
				true -> Acc + 1;
				false -> Acc
			end
		end, 0, city_industry_dict())
.

is_industry(Id) ->
	CityIndustryDict = city_industry_dict(),
	dict:is_key(Id, CityIndustryDict)
.
add(Id) ->
	Type = type(Id),
	lib_nobility_api:privilege_add(?OCCUPY_INDUSTRY_EARNINGS) * 100 + lib_player_science_api:get_effect_value(?EFFECT_MAP_YIELD_HOUR_REWARD_ADD, Type)
.
is_vacancy() ->
	hold_num() - now_num() > 0
.
now_num() ->
	dict:size(city_industry_dict())
.
hold_num() ->
	maps:get(value, tb_const:get(initial_hold_industry)) + lib_nobility_api:privilege_add(?OCCUPY_INDUSTRY_INCREASE)
.
work_num() ->
	maps:get(value, tb_const:get(initial_industry_work)) %% todo 成就系统加成
.
total_time(Type) ->
	TotalMap = (player_city_industry())#player_city_industry.total_map,
	maps:get(Type, TotalMap, 0)
.
u_total_time(Type) ->
	#player_city_industry{
		total_map = TotalMap
	} = PlayerCityIndustry = player_city_industry(),
	NewTotalMap = maps:put(Type, maps:get(Type, TotalMap, 0) + 1, TotalMap),
	lib_player_city_industry:put_city_industry(PlayerCityIndustry#player_city_industry{total_map = NewTotalMap})
.

u_city_industry(CityIndustry) when is_record(CityIndustry, city_industry) ->
	u_city_industry([CityIndustry]);
u_city_industry(CityIndustryList) ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = PlayerCityIndustry = player_city_industry(),
	NewCityIndustryDict = lists:foldl(
		fun(CityIndustry, Dict) ->
			dict:store(CityIndustry#city_industry.id, CityIndustry, Dict)
		end, CityIndustryDict, CityIndustryList),
	lib_player_city_industry:put_city_industry(PlayerCityIndustry#player_city_industry{city_industry = NewCityIndustryDict}),
	lib_player_city_industry:notice_map_industry(?CITY_INDUSTRY_UPDATE, CityIndustryList)
.
d_city_industry(Id) ->
	#player_city_industry{
		city_industry = CityIndustryDict
	} = PlayerCityIndustry = player_city_industry(),
	NewCityIndustryDict = dict:erase(Id, CityIndustryDict),
	lib_player_city_industry:put_city_industry(PlayerCityIndustry#player_city_industry{city_industry = NewCityIndustryDict}),
	lib_player_city_industry:notice_map_industry(?CITY_INDUSTRY_DELETE, [Id])
.




