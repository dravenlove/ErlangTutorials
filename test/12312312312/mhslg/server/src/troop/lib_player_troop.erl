%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2021 5:36 PM
%%%-------------------------------------------------------------------
-module(lib_player_troop).
-author("lichaoyu").
-include("common.hrl").
-include("troop.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10155.hrl").

%% API
-export([
	to_proto/1
]).
-export([
	request_troop_info/1,			%% 请求玩家部队信息
	request_create_troop/1,			%% 请求创建部队
	request_troop_march/1,			%% 请求部队行军
	notice_troop/2
]).

to_proto(Troop) ->
	CombatHero = Troop#troop.combat_hero,
	Former = CombatHero#combat_hero.former,
	Latter = CombatHero#combat_hero.latter,
	#'ProtoTroop'{
		hero_id = CombatHero#combat_hero.hero_id,
		player_id = CombatHero#combat_hero.id,
		country = CombatHero#combat_hero.country,
		level = CombatHero#combat_hero.hero_level,
		star = CombatHero#combat_hero.hero_star,
		force = CombatHero#combat_hero.hero_force,
		player_name = CombatHero#combat_hero.name,
		server_flag = CombatHero#combat_hero.server_flag,
		cur_former = Former#combat_army.cur_troops,
		tot_former = Former#combat_army.troops,
		cur_latter = Latter#combat_army.cur_troops,
		tot_latter = Latter#combat_army.troops,
		city_id = Troop#troop.city_id,
		state = Troop#troop.state,
		pos = to_pos(Troop#troop.x, Troop#troop.y),
		pos_list = case Troop#troop.pos_list of [] -> undefined; PosList -> PosList end
	}
.
to_pos(X, Y) ->
	#'ProtoPos'{x = X, y = Y}
.



request_troop_info(_Msg) ->
	Pid = mod_city:pid(),
	PlayerId = lib_player:player_id(),
	TroopInfo = mod_server:sync_apply(Pid, fun mod_city:get_troop_info/1, [PlayerId]),
	TroopList = maps:values(TroopInfo),
	TotalNum = 3,
	NowNum = maps:size(TroopInfo),
	ProtoTroopList0 = [to_proto(Troop) || Troop <- TroopList],
	ProtoTroopList1 = lists:duplicate(TotalNum - NowNum, #'ProtoTroop'{}),
	ProtoTroopList = ProtoTroopList0 ++ ProtoTroopList1,
	Respond = #'Proto50155001'{
		troop_list = ProtoTroopList
	},
	lib_send:respond_to_client(Respond)
.

request_create_troop(Msg) ->
	HeroId = Msg#'Proto10155002'.hero_id,
	?JUDGE_BREAK(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Pid = mod_city:pid(),
	PlayerShow = lib_player:player_show(),
	HeroBase = lib_hero_api:hero_base_info(HeroId),
	CombatHero = lib_combat_queue_api:to_combat_hero(PlayerShow, HeroBase),
	Troop = #troop{combat_hero = CombatHero},
	Flag = mod_server:sync_apply(Pid, fun mod_city:create_troop/1, [Troop]),
	?JUDGE_BREAK(Flag, ?ERROR_CLIENT_OPERATOR),
	lib_send:respond_to_client(?MSG_RETURN_CREATE_TROOP)
.

request_troop_march(Msg) ->
	HeroId = Msg#'Proto10155003'.hero_id,
	PosList = Msg#'Proto10155003'.pos_list,
	?JUDGE_BREAK(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_BREAK(PosList =/= [], ?ERROR_HERO_NOT_EXISTENT),
	Pid = mod_city:pid(),
	PlayerId = lib_player:player_id(),
	Flag = mod_server:sync_apply(Pid, fun mod_city:troop_march/3, [PlayerId, HeroId, PosList]),
	?JUDGE_BREAK(Flag, ?ERROR_CLIENT_OPERATOR),
	lib_send:respond_to_client(?MSG_RETURN_TROOP_MARCH)
.

notice_troop(Flag, TroopList) ->
	Respond = #'Proto80155001'{
		troop_list = ?IIF(is_list(TroopList), [to_proto(Troop) || Troop <- TroopList], [#'ProtoTroop'{hero_id = TroopList}]),
		flag = Flag
	},
	lib_send:respond_to_client(Respond)
.
