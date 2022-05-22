%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_spring_activity
%%% Created on : 6/16/2021 3:08 PM
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_spring).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	get_spring_list/1,
	update_spring/1,
	spring_to_proto/1,
	proto_to_spring/1,
	spring_map/0,
	get_hero_condition/0,
	make_mission_list/0,
	sign_in/0,
	sign_out/0,
	get_spring_list/0
]).
-export([ %% mod_season_activity
	award_of_spring_unreceived/0,
	put_spring_offline/1,
	update_spring_offline/2,
	reset_spring_offline/2,
	get_spring_offline/0
]).
sign_in() ->
%%	mod_server:async_apply(fun mod_season_activity:reset_spring_offline/2,[lib_player:player_id(),#spring{}])
ok
.
sign_out() ->
%%	SpringList = get_spring_list(),
%%	lists:foreach(fun(Spring) ->
%%		#spring{is_received = IsReceived,is_arrived = IsArrived,is_forwarding = IsForwarding} = Spring,
%%		if
%%			((IsReceived =:= false) andalso (IsArrived =:= true)) -> mod_server:async_apply(fun mod_season_activity:update_spring_offline/2,[lib_player:player_id(),Spring]);
%%			((IsForwarding =:= true)) -> mod_server:async_apply(fun mod_season_activity:update_spring_offline/2,[lib_player:player_id(),Spring]);
%%			true -> skip
%%		end
%%				  end,SpringList)
ok
.
get_spring_offline() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{spring_doing_offline = SpringDoingOfflineMap} = SeasonActivity,
	SpringDoingOfflineMap
.
put_spring_offline(NewSpringDoingOfflineMap) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{spring_doing_offline = NewSpringDoingOfflineMap})
.
reset_spring_offline(PlayerId,NewSpringMap) ->
	SpringDoingOfflineMap = lib_spring:get_spring_offline(),
	NewSpringDoingOfflineMap = maps:put(PlayerId,NewSpringMap,SpringDoingOfflineMap),
	put_spring_offline(NewSpringDoingOfflineMap)
.
update_spring_offline(PlayerId,Spring) ->
	SpringDoingOfflineMap =	lib_spring:get_spring_offline(),
	SpringMap = maps:get(PlayerId,SpringDoingOfflineMap),
	NewSpringMap = maps:put(Spring#spring.id,Spring,SpringMap),
	reset_spring_offline(PlayerId,NewSpringMap)
.
award_of_spring_unreceived() ->
	SpringDoingOfflineMap =	lib_spring:get_spring_offline(),
	maps:map(fun(SpringDoingOffline) ->
		#spring_doing_offline{id = PlayerId,spring = SpringMap} = SpringDoingOffline,
		maps:map(fun(Spring) ->
			#spring{id = MissionId,is_arrived = IsArrived} = Spring,
			case IsArrived of
				true ->
					AwardList = maps:get(award_list, tb_season_activity_spring_award:get(MissionId)),
					lib_season_activity_api:send_s_a_award_mail(AwardList,?SPRING_MAIL_ID,[MissionId],PlayerId);
				false -> skip
			end
				 end,SpringMap)
			 end,SpringDoingOfflineMap)
.
update_spring(Spring) ->
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	NewSpring = maps:put(Spring#spring.id, Spring, PlayerSeasonActivity#player_season_activity.spring),
	lib_player_season_activity:put_player_season_activity(PlayerSeasonActivity#player_season_activity{spring = NewSpring})
.
get_spring_list() ->
	get_spring_list(lib_player:player_id())
.
get_spring_list(PlayerId) ->
	SpringMap = lib_spring:spring_map(),
	SpringKeys = maps:keys(SpringMap),
	case length(SpringKeys) =:= ?TB_S_A_CONST(int,spring_mission_number) of
		true ->	lists:foldr(fun(SpringKey,List) -> [maps:get(SpringKey,SpringMap)|List] end,[],SpringKeys);
		false ->
			[lib_spring:update_spring(NewMission)||NewMission <- lib_spring:make_mission_list()],
			get_spring_list(PlayerId)
	end
.
spring_map() ->
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	#player_season_activity{spring = SpringMap} = PlayerSeasonActivity,
	SpringMap
.
make_mission_list() ->
	CityList = lib_player_map:country_city(lib_player:player_country()),
	make_mission([],1,CityList)
.
make_mission(MissionList,Id,CityList) ->
	case (length(MissionList) =/= ?TB_S_A_CONST(int,spring_mission_number)) of
		true->
			make_mission([#spring{
				id = Id,							%说明：任务id
				hero_condition = get_hero_condition(),	%说明：英雄条件
				target_city = lib_random:rand_one(CityList),			%说明：目标城池
				award = get_award_id(Id),			%说明：奖励
				is_display = ?IIF(Id =:= 1,true,false)		%任务是否刷出
			}|MissionList],Id+1,CityList);
		false ->	MissionList
	end
.
get_award_id(N) ->
	SpringAwardList = maps:get(award_list, tb_season_activity_spring_award:get(N)),
	lib_random:rand_one(SpringAwardList)
.
get_hero_condition() ->
	HeroIdList = lib_hero_api:hero_id_list(),
	HeroNumber = erlang:length(HeroIdList),
	RANDOM_HERO_SEX_LINE = ?TB_S_A_CONST(int,random_hero_sex_line),
	RANDOM_HERO_LINE = ?TB_S_A_CONST(int,random_hero_line),
	if
		(HeroNumber > RANDOM_HERO_SEX_LINE) -> lib_random:rand_one(?CONDITION_SEX_TYPE_CORPS_LIST);
		(HeroNumber > RANDOM_HERO_LINE) -> lib_random:rand_one(?CONDITION_TYPE_CORPS_LIST);
		true ->	?CONDITION_ALL_HERO
	end
.
spring_to_proto(Spring) when not is_list(Spring) ->
	spring_to_proto([Spring])
;
spring_to_proto(SpringList) ->
	lists:foldr(fun(T,L)->
		[#'ProtoSpringMission'{
			id = T#spring.id,							%说明：任务id
			hero_condition = T#spring.hero_condition,	%说明：英雄条件
			target_city = T#spring.target_city,			%说明：目标城池
			award = T#spring.award,						%说明：奖励
			is_completed = T#spring.is_completed,		%说明：任务是否完成
			is_received = T#spring.is_received,			%说明：领取状态
			is_display = T#spring.is_display,			%说明：任务是否刷出
			is_forward = T#spring.is_forward,			%说明：是否需要前往
			hero_id = T#spring.hero_id
		}|L]
				end,[],SpringList).

proto_to_spring(ProtoSpringMission) when not is_list(ProtoSpringMission) ->
	spring_to_proto([ProtoSpringMission])
;
proto_to_spring(ProtoSpringMissionList) ->
	lists:foldr(fun(T,L)->
		[#'ProtoSpringMission'{
			id = T#'ProtoSpringMission'.id,							%说明：任务id
			hero_condition = T#'ProtoSpringMission'.hero_condition,	%说明：英雄条件
			target_city = T#'ProtoSpringMission'.target_city,			%说明：目标城池
			award = T#'ProtoSpringMission'.award,						%说明：奖励
			is_completed = T#'ProtoSpringMission'.is_completed,		%说明：任务是否完成
			is_received = T#'ProtoSpringMission'.is_received,			%说明：领取状态
			is_display = T#'ProtoSpringMission'.is_display,			%说明：任务是否刷出
			is_forward = T#'ProtoSpringMission'.is_forward,			%说明：是否需要前往
			hero_id = T#'ProtoSpringMission'.hero_id
		}|L]
				end,[],ProtoSpringMissionList)
.
