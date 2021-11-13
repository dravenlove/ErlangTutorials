%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_summer_activity
%%% Created on : 6/16/2021 3:28 PM
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%		夏夜篝火所有数据由mod_season_activity进程管理
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_summer).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	firecracker_remain_times/1,
	firework_remain_times/1,
	get_player_summer_map/0,
	get_player_summer/1,
	get_summer_map/1,
	get_summer/2,
	update_summer/2,
	check_player_summer/1,
	get_campfire_list/1,
	summer_init/1,
	summer_remain_times_init/1,
	make_campfire/4,
	summer_to_proto/1,
	firecracker_award/3,
	firework_award/4,
	firework_recharge/0,
	campfire_award/4,
	summer_mail/2,
	get_country_player/0,
	put_country_player/0,
	update_country_player/1,
	summer_broadcast/1,
	get_proto_campfire_list/1,
	put_summer_map/2
]).

firecracker_remain_times(PlayerId) ->
	PlayerSummer = get_player_summer(PlayerId),
	#player_summer{summer_firecracker_remain_times = RemainTimes} = PlayerSummer,
	RemainTimes
.
firework_remain_times(PlayerId) ->
	PlayerSummer = get_player_summer(PlayerId),
	#player_summer{summer_firework_remain_times = RemainTimes} = PlayerSummer,
	RemainTimes
.
get_player_summer_map() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_summer = PlayerSummerMap} = SeasonActivity,
	PlayerSummerMap
.
get_player_summer(PlayerId) ->
	PlayerSummerMap = get_player_summer_map(),
	maps:get(PlayerId,PlayerSummerMap)
.
get_summer_map(PlayerId) ->
	PlayerSummer = get_player_summer(PlayerId),
	#player_summer{summer = SummerMap} = PlayerSummer,
	SummerMap
.
get_summer(SummerId,PlayerId) ->
	maps:get(SummerId,get_summer_map(PlayerId))
.
update_summer(Summer,PlayerId) ->
	#summer{id = SummerId} = Summer,
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_summer = PlayerSummerMap} = SeasonActivity,
	PlayerSummer = maps:get(PlayerId,PlayerSummerMap),
	#player_summer{summer = SummerMap} = PlayerSummer,
	NewSummerMap = maps:put(SummerId,Summer,SummerMap),
	NewPlayerSummerMap = maps:put(PlayerId,PlayerSummer#player_summer{summer = NewSummerMap},PlayerSummerMap),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{player_summer = NewPlayerSummerMap})
.
put_summer_map(SummerMap,PlayerId) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_summer = PlayerSummerMap} = SeasonActivity,
	PlayerSummer = maps:get(PlayerId,PlayerSummerMap),
	NewPlayerSummerMap = maps:put(PlayerId,PlayerSummer#player_summer{summer = SummerMap},PlayerSummerMap),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{player_summer = NewPlayerSummerMap})
.
check_player_summer(PlayerId) ->
	PlayerSummerMap = get_player_summer_map(),
	maps:is_key(PlayerId,PlayerSummerMap)
.
get_proto_campfire_list(PlayerId) ->
	CampfireList = lib_summer:get_campfire_list(PlayerId),
	lib_summer:summer_to_proto(CampfireList)
.
get_campfire_list(PlayerId) ->
	case check_player_summer(PlayerId) of
		true -> maps:values(lib_summer:get_summer_map(PlayerId));
		false -> lib_summer:summer_init(PlayerId),lib_summer:get_campfire_list(PlayerId)
	end
.
summer_init(PlayerId) ->
	CAMPFIRE_TOTAL_TIMES = ?TB_S_A_CONST(int,campfire_total_times),
	summer_remain_times_init(PlayerId),
	SummerMap = make_campfire(1,CAMPFIRE_TOTAL_TIMES,PlayerId,maps:new()),
	lib_summer:put_summer_map(SummerMap,PlayerId)
.
summer_remain_times_init(PlayerId) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_summer = PlayerSummerMap} = SeasonActivity,
	NewPlayerSummerMap = maps:put(PlayerId,#player_summer{summer_firecracker_remain_times = ?TB_S_A_CONST(int,firecracker_times),summer_firework_remain_times = ?TB_S_A_CONST(int,firework_times)},PlayerSummerMap),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{player_summer = NewPlayerSummerMap})
.
make_campfire(Id,CAMPFIRE_TOTAL_TIMES,PlayerId,SummerMap) ->
	case Id > 5 of
		true -> SummerMap;
		false ->
			Summer = #summer{
				id = Id,					%说明：篝火id
				is_recharging = true,	%说明：充能状态
				is_received = false,	%说明：领取状态
				received_times = 0,		%说明：已领取奖励次数
				total_times = CAMPFIRE_TOTAL_TIMES,		%说明：总奖励领取次数
				award = maps:get(award_list, tb_season_activity_summer_award:get(Id)),				%奖励id列表
				tick = lib_timer:unixtime()				%说明：时间戳
			},
			lib_summer:make_campfire(Id+1,CAMPFIRE_TOTAL_TIMES,PlayerId,maps:put(Id,Summer,SummerMap))
	end
.
summer_to_proto(CampfireList) ->
	lists:foldr(fun(T,L)->
		RemainTime = ?TB_S_A_CONST(int,campfire_charge_time) - (lib_timer:unixtime() - T#summer.tick),
		[#'ProtoCampfire'{
			id = T#summer.id,								%说明：篝火id
			is_recharging = T#summer.is_recharging,	%说明：充能状态
			is_received = T#summer.is_received,					%说明：领取状态
			received_times = T#summer.received_times,		%说明：已领取奖励次数
			total_times = T#summer.total_times,			%说明：总奖励领取次数
			award = T#summer.award,						%说明：奖励id列表
			remain_time = ?IIF(RemainTime > 0,RemainTime,0)
		}|L]
				end,[],CampfireList)
.
firecracker_award(ReceivedTimes,AwardIdList,PlayerId) ->
	%% 消耗元宝
	lib_season_activity_api:use_s_a_gold(?TB_S_A_CONST(int,firecracker_cost),?SUMMER),
	%% 更新状态
	Firecracker = lib_summer:get_summer(?FIRECRACKER_ID,PlayerId),
	lib_summer:update_summer(Firecracker#summer{received_times = ReceivedTimes+1},PlayerId),
	%% 领取奖励
	ItemList = lib_season_activity_api:get_award(AwardIdList),
	lib_season_activity_api:s_a_item_insert(ItemList,?SUMMER),
	%% 势力成员奖励
	PlayerName = lib_player:player_name(),
	FirecrackerAward = ?TB_S_A_CONST(json,firecracker_award),
	summer_mail(FirecrackerAward,[PlayerName,?FIRECRACKER]),
	%% 广播
	summer_broadcast(?TB_S_A_CONST(string,firecracker_words))
.
firework_award(ReceivedTimes,AwardIdList,TotalTimes,PlayerId) ->
	case ReceivedTimes < TotalTimes of
		true ->
			%% 充值
			lib_summer:firework_recharge(),
			%% 更新状态
			Firecracker = lib_summer:get_summer(?FIRECRACKER_ID,PlayerId),
			lib_summer:update_summer(Firecracker#summer{received_times = ReceivedTimes+1},PlayerId),
			%% 领取奖励
			ItemList = lib_season_activity_api:get_award(AwardIdList),
			lib_season_activity_api:s_a_item_insert(ItemList,?SUMMER),
			%% 势力成员奖励
			PlayerName = lib_player:player_name(),
			FirecrackerAward = ?TB_S_A_CONST(json,firecracker_award),
			lib_summer:summer_mail(FirecrackerAward,[PlayerName,?FIREWORK]),
			%% 广播
			lib_summer:summer_broadcast(?TB_S_A_CONST(string,firework_words));
		false -> ?INFO("已达本次活动领取上限！")
	end
.
firework_recharge() ->
	ok
.
campfire_award(CampfireId,ReceivedTimes,AwardIdList,PlayerId) ->
	ItemList = lists:foldl(fun(AwardId,List) -> [lib_season_activity_api:get_award(AwardId)|List] end,[],AwardIdList),
	lib_season_activity_api:s_a_item_insert(ItemList,?SUMMER),
	Campfire = lib_summer:get_summer(CampfireId,PlayerId),
	case (ReceivedTimes > ?TB_S_A_CONST(int,campfire_total_times)) of
		true -> skip;
		false ->
			NewCampfire = case (ReceivedTimes =:= ?TB_S_A_CONST(int,campfire_total_times)) of
							  true -> Campfire#summer{is_received = true,received_times = ReceivedTimes};
							  false -> Campfire#summer{is_received = true,received_times = ReceivedTimes+1,is_recharging = true,tick = lib_timer:unixtime()}
						  end,
			lib_summer:update_summer(NewCampfire,PlayerId),
			lib_send:respond_to_client(#'Proto50152009'{campfire_list = lib_summer:summer_to_proto(lib_summer:get_campfire_list(lib_player:player_id()))})
	end
.
summer_mail(AwardList,Content) ->
	put_country_player(),
	PlayerList = get_country_player(),
	lists:foreach(fun(PlayerId) -> lib_season_activity_api:send_s_a_award_mail(AwardList,?SUMMER_MAIL_ID,Content,PlayerId) end,PlayerList)
.
get_country_player() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{mod_map_temp_list = SummerCountryPlayerList} = SeasonActivity,
	SummerCountryPlayerList
.
put_country_player() ->
	ServerPlayerIdList = lib_season_activity_api:get_server_player(),
	mod_server:async_apply(mod_map:get_pid(),fun lib_season_activity_api:get_country_player/1,[ServerPlayerIdList])
.
update_country_player(SummerCountryPlayerList) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	NewSeasonActivity = SeasonActivity#season_activity{mod_map_temp_list = SummerCountryPlayerList},
	mod_season_activity:put_season_activity(NewSeasonActivity)
.
%% 广播
summer_broadcast(Broadcast) ->
	Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_SEASON_ACTIVITY),
	Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_ROLE_INFO, lib_broadcast_api:player_base_to_broad_role(lib_player:get_player_base())),
	Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_ID_SEASON_ACTIVITY, Broadcast),
	lib_broadcast_api:send_country_broadcast(lib_player:player_country(), Shout3)
.