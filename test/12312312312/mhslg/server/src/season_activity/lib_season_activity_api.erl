%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_activity
%%% Created on : 6/16/2021 2:49 PM
%%% @author leever
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_season_activity_api).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	arrive_notify/1,
	open_tick/1,
	get_award/1,
	s_a_item_insert/2,
	get_country_player/1,
	get_server_player/0,
	use_s_a_gold/2,
	%% mod_map
	send_s_a_award_mail/4
]).
send_s_a_award_mail(AwardList,MAIL_ID,Content,PlayerId) ->
	ConfList = lib_season_activity_api:get_award(AwardList),
	ItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfList),
	Mail1 = lib_mail_api:create_sys_mail(?ADD_SEASON_ACTIVITY_AWARD),
	Mail2 = lib_mail_api:add_item_list(Mail1, ItemList),
	Mail3 = lib_mail_api:set_title_content(Mail2, MAIL_ID, Content),
	lib_mail_api:send(Mail3, PlayerId)
.
s_a_item_insert(ItemList,Season) ->
	ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(ItemList),
	lib_player_pack:auto_insert(ItemObjList, ?INSERT_SERIAL(?ADD_SEASON_ACTIVITY_AWARD, Season))
.
open_tick({S,S_A_Start,S_A_End}) ->
	{Date,_Time} =lib_timer:to_localtime(lib_timer:unixtime()),
	S_A_S_Time = lib_timer:unixtime({Date,?TB_S_A_CONST(time,S_A_Start)}),
	S_A_E_Time = lib_timer:unixtime({Date,?TB_S_A_CONST(time,S_A_End)}),
	{S,S_A_S_Time,S_A_E_Time}.
%% 到达目的地时地图进程调用
arrive_notify(TroopsId) ->
	PlayerId = TroopsId div 1000,
	HeroId = TroopsId rem 1000,
	mod_server:async_apply(lib_player:get_pid(PlayerId),fun lib_season_activity:spring_forward_notify/2,[PlayerId,HeroId]),
	mod_server:async_apply(lib_player:get_pid(PlayerId),fun lib_season_activity:autumn_forward_notify/2,[PlayerId,HeroId])
.
get_award(AwardList) when is_list(AwardList) ->
	lists:foldr(fun(Award,List) -> [get_award(Award)|List] end,[],AwardList)
;
get_award(WantAwardId) ->
	[ItemId,ItemNumber] = maps:get(item, tb_season_activity_award:get((WantAwardId))),
	case is_list(ItemNumber) of
		true -> [ItemId,lib_random:rand_one(ItemNumber)];
		false -> [ItemId,ItemNumber]
	end
.
%% 势力玩家列表
get_country_player(ServerPlayer) ->
	CountryPlayer = lists:filter(fun(CheckPlayerId) -> lib_country_api:is_have_player(CheckPlayerId) end,ServerPlayer),
	lib_season_activity:async_apply(fun lib_summer:update_country_player/1,[CountryPlayer])
.
%% 单服玩家id列表
get_server_player() ->
	PlayerList = mod_server:sync_status(mod_player_manage:get_pid(), fun mod_player_manage:sync_all_player_list/1),
	lists:foldl(fun({PlayerId,_PlayerRegName},List) -> [PlayerId|List] end,[],PlayerList)
.
%% 消耗元宝
use_s_a_gold(GoldNumber,Season) ->
	GoldId = maps:get(value, tb_const:get(gold)),
	Item = lib_item_api:conf_item_to_pack_item([GoldId,GoldNumber]),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_SEASON_ACTIVITY, Season))
.