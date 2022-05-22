%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Feb 2021 5:42 PM
%%%-------------------------------------------------------------------
-module(lib_hero_busy_api).
-author("lichaoyu").
-include("common.hrl").
-include("hero_busy.hrl").

%% API
-export([		%% 通用
	incident_limit/1,			%% 玩家每日类型事件触发上限
	random_incident/1			%% 随机获取事件
]).

-export([		%% 玩家调用
	pasture_limit/0,
	incident_time/0,
	hero_busy_dict/0,
	hero_busy/1,		%% 英雄忙碌信息
	is_limit/1,			%% 牧场作业是否被限制
	is_busy/1,			%% 是否忙碌中
	is_correct/4,		%% 是否符合忙碌条件
	incident/1,			%% 获取一个事件id

	u_pasture_limit/1,	%% 更新英雄限制列表
	u_incident_time/2,	%% 更新事件触发次数
	u_hero_busy/1,		%% 更新英雄忙碌
	d_hero_busy/1		%% 删除英雄忙碌
]).

incident_limit(Type) ->
	maps:get(limit, tb_hero_incident:get(Type))
.

random_incident(Type) ->
	#{incident := Incident, weight := WeightList} = tb_hero_incident:get(Type),
	lib_equip_api:random_one_weight(Incident, WeightList)
.

player_hero_busy() ->
	lib_player_hero_busy:get_hero_busy()
.

pasture_limit() ->
	PlayerHeroBusy = player_hero_busy(),
	PlayerHeroBusy#player_hero_busy.pasture_limit
.

incident_time() ->
	PlayerHeroBusy = player_hero_busy(),
	PlayerHeroBusy#player_hero_busy.incident_time
.

hero_busy_dict() ->
	PlayerHeroBusy = player_hero_busy(),
	PlayerHeroBusy#player_hero_busy.hero_busy_dict
.

hero_busy(HeroId) ->
	dict:fetch(HeroId, hero_busy_dict())
.

is_limit(HeroId) ->
	lists:member(HeroId, pasture_limit())
.

is_busy(HeroId) ->
	dict:is_key(HeroId, hero_busy_dict())
.

is_correct(HeroId, Type, CityId, Param) ->
	HeroBusyDict = hero_busy_dict(),
	dict:map(
		fun(_, #hero_busy{hero_id = H, type = T, city_id = C, param = P}) ->
			case Type =:= T of
				false -> skip;
				true ->
					?JUDGE_RETURN(H =/= HeroId, ?ERROR_CITY_BUILDING_HERO),
					case Type of
						?CITY_BUILDING ->
							[Param1 | _] = P,
							?JUDGE_RETURN(C =/= CityId orelse Param1 =/= Param, ?ERROR_CITY_BUILDING_IN);
						?CITY_INDUSTRY ->
							?JUDGE_RETURN(C =/= CityId, ?ERROR_CITY_INDUSTRY_WORK);
						?CITY_VISITING ->
							?JUDGE_RETURN(C =/= CityId, ?ERROR_CITY_VISITING_IN);
						_ -> skip
					end
			end
		end, HeroBusyDict)
.

incident(Type) ->
	Time = maps:get(Type, incident_time(), 0),
	Limit = incident_limit(Type),
	case Time < Limit of
		false -> 0;
		true ->
			case random_incident(Type) of
				0 -> 0;
				Random -> u_incident_time(Type, Time + 1),Random
			end
	end
.

u_pasture_limit(HeroIdList) ->
	PlayerHeroBusy = player_hero_busy(),
	u_player_hero_busy(PlayerHeroBusy#player_hero_busy{pasture_limit = HeroIdList})
.

u_incident_time(Type, IncidentTime) ->
	#player_hero_busy{incident_time = IncidentTimeMaps} = PlayerHeroBusy = player_hero_busy(),
	u_player_hero_busy(PlayerHeroBusy#player_hero_busy{incident_time = maps:put(Type, IncidentTime, IncidentTimeMaps)})
.

u_hero_busy(HeroBusy) when is_record(HeroBusy, hero_busy) -> u_hero_busy([HeroBusy]);
u_hero_busy(HeroBusyList) ->
	HeroBusyDict = hero_busy_dict(),
	NewHeroBusyDict = lists:foldl(
		fun(HeroBusy, Dict) ->
			dict:store(HeroBusy#hero_busy.hero_id, HeroBusy, Dict)
		end, HeroBusyDict, HeroBusyList),
	lib_player_hero_busy:notice_hero_busy_info(?NOTICE_HERO_BUSY_UPDATE, HeroBusyList),
	u_hero_busy_dict(NewHeroBusyDict)
.

u_hero_busy_dict(HeroBusyDict) ->
	PlayerHeroBusy = player_hero_busy(),
	u_player_hero_busy(PlayerHeroBusy#player_hero_busy{hero_busy_dict = HeroBusyDict})
.

u_player_hero_busy(PlayerHeroBusy) ->
	lib_player_hero_busy:put_hero_busy(PlayerHeroBusy)
.

d_hero_busy(HeroIdList) ->
	HeroBusyDict = hero_busy_dict(),
	NewHeroBusyDict = lists:foldl(
		fun(#hero_busy{hero_id = HeroId}, Dict) ->
			dict:erase(HeroId, Dict)
		end, HeroBusyDict, HeroIdList),
	lib_player_hero_busy:notice_hero_busy_info(?NOTICE_HERO_BUSY_DELETE, HeroIdList),
	u_hero_busy_dict(NewHeroBusyDict)
.








