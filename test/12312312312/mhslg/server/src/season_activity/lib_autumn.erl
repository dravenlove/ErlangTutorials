%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_autumn_activity
%%% Created on : 6/16/2021 3:29 PM
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_autumn).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	update_autumn/1,
	autumn_to_proto/1,
	autumn_map/0,
	industry_type/1,
	industry_level/1,
	is_forward/1,
	get_autumn_list/1,
	autumn_init/0,
	make_autumn/3
]).
update_autumn(Autumn) ->
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	NewAutumn = maps:put(Autumn#autumn.id, Autumn, PlayerSeasonActivity#player_season_activity.autumn),
	lib_player_season_activity:put_player_season_activity(PlayerSeasonActivity#player_season_activity{autumn = NewAutumn})
.
get_autumn_list(PlayerId) ->
	AutumnMap = lib_autumn:autumn_map(),
	AutumnKeys = maps:keys(AutumnMap),
	case length(AutumnKeys) =:= ?TB_S_A_CONST(int,autumn_mission_number) of
		true -> lists:foldr(fun(AutumnKey,List) -> [maps:get(AutumnKey,AutumnMap)|List] end,[],AutumnKeys);
		false -> lib_autumn:autumn_init(),lib_autumn:get_autumn_list(PlayerId)
	end
.
autumn_init() ->
	AUTUMN_MISSION_NUMBER = ?TB_S_A_CONST(int,autumn_mission_number),
	CountryCityList = lib_player_map:country_city(lib_player:player_country()),
	?JUDGE_CONTINUE(CountryCityList =/= []),
	CITY_INDUSTRY_ALL = get_country_industry_list(CountryCityList),
	?JUDGE_CONTINUE(CITY_INDUSTRY_ALL =/= []),
	CityIndustryList = get_player_industry_list(),
	IndustryList = ?IIF(lib_city_industry_api:now_num() > AUTUMN_MISSION_NUMBER, CityIndustryList,CountryCityList),
	make_autumn(1,AUTUMN_MISSION_NUMBER,IndustryList),
	?DEBUG("autumn_init ~n !! CountryCityList: ~p ~n CITY_INDUSTRY_ALL: ~p ~n CountryCityList: ~p ~n !!",[CountryCityList,CITY_INDUSTRY_ALL,CountryCityList])
.
get_country_industry_list(CountryCityList) ->
	lib_player_city_industry:check_reset(),
	lib_player_city_industry:all_city_industry_info(CountryCityList)
.
get_player_industry_list() ->
	lib_player_city_industry:check_reset(),
	util:dict_values(lib_city_industry_api:city_industry_dict())
.
make_autumn(Id,AUTUMN_MISSION_NUMBER,IndustryList) ->
	case Id > AUTUMN_MISSION_NUMBER of
		true -> skip ;
		false ->
			CityIndustryId = lib_random:rand_one(IndustryList),
			AUTUMN = #autumn{
				id = Id,					%说明：篝火id
				industry = CityIndustryId,		%说明：目标产业
				industry_level = industry_level(CityIndustryId),	%说明：产业等级
				robber = 0,			%说明：盗贼信息
				is_forward = is_forward(CityIndustryId),	%说明：是否需要前往
				is_arrived = false,		%是否到达目标地
				is_display = ?IIF(Id =:= 1,true,false),	%说明：任务是否刷出
				is_received = false,%说明：领取状态
				last_time = 0,		%说明：上个任务刷新时间
				award = maps:get(award_list, tb_season_activity_autumn_award:get(Id)),			%奖励id列表
				is_completed = false,%说明：是否完成
				hero_id = 0			%英雄id：申请做任务时用
			},
			lib_autumn:update_autumn(AUTUMN),
			lib_autumn:make_autumn(Id+1,AUTUMN_MISSION_NUMBER,IndustryList)
	end
.
autumn_to_proto(AutumnList) ->
	lists:foldr(fun(T,L)->
		[#'ProtoAutumnMission'{
			id = T#autumn.id,							%说明：第几个
			industry = T#autumn.industry,				%说明：目标产业
			industry_level = T#autumn.industry_level,	%说明：产业等级
			robber = T#autumn.robber,					%说明：盗贼信息
			is_forward = T#autumn.is_forward,			%说明：是否需要前往
			is_display = T#autumn.is_display,			%说明：任务是否刷出
			is_received = T#autumn.is_received,			%说明：领取状态
			last_time = T#autumn.last_time,				%说明：上个任务刷新时间
			award = T#autumn.award,						%说明：奖励
			is_completed = T#autumn.is_completed			%说明：是否完成
		}|L]
				end,[],AutumnList)
.
autumn_map() ->
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	#player_season_activity{autumn = AutumnMap} = PlayerSeasonActivity,
	AutumnMap
.
industry_type(CityIndustryId) ->
	CityIndustryId div 100
.
industry_level(CityIndustryId) ->
	CityIndustryId rem 10
.
is_forward(CityIndustryId) ->
	lib_city_industry_api:is_industry(CityIndustryId)
.