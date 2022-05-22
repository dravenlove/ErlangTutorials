%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 11:27
%%%-------------------------------------------------------------------
-module(lib_arena).
-author("13661").

-include("common.hrl").
-include("arena.hrl").
-include("player.hrl").
-include("hero.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("chat.hrl").
-include("ProtoClient_10102.hrl").

-define(RANK_MAIL_ID, 1012).
-define(FIRST_MAIL_ID, 0).
-define(BROAD_FIRST_CHANGE, 1019).
-define(BROAD_FIRST_LOGIN, 1020).

-export([
	build_index/0
]).
%% API
-export([
	player_sign_in/1,
	process_fight_result/3,

	start/0,
	check_send_rank_reward/0,
	send_rank_reward/0
]).

get_monitor() ->
	mod_arena:get_monitor()
.

update_monitor(Monitor) when is_record(Monitor, arena_monitor) ->
	mod_arena:put_monitor(Monitor)
.

start() ->
	init_country_top(),
	check_init_robot(),
	check_send_rank_reward()
.

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_ARENA_PLAYER, {?TUPLE_INT(id, 1)}, true)
.

check_init_robot() ->
	Monitor = get_monitor(),
	case Monitor#arena_monitor.is_init of
		false -> init_robot();
		true -> skip
	end
.

init_robot() ->
	Ary = array:new([{default, 0}]),
	IndexList = tb_arena_robot:get_list(),

	ArenaMaxNumber = lib_arena_setting:get_const_int(rank_number),

	{_, RankList, PlayerMap} =
	lists:foldl(fun(Index, {Rank, Array, Map}) ->
		Conf = tb_arena_robot:get(Index),
		Min = maps:get(min, Conf, 0),
		Max = min(maps:get(max, Conf, 0), ArenaMaxNumber),
		Country = maps:get(country, Conf, 0),
		Heads = maps:get(heads, Conf),
		Heros = maps:get(heros, Conf),
		HeroNumber = maps:get(hero_number, Conf),

		HeroBaseList = [lib_robot_api:get_monster(MonsterId) || MonsterId <- Heros],

		{Array2, Map2} =
		lib_common:fold(fun(I, {Array1, Map1}) ->
			Rank1 = Rank + I - Min,
			HeroList = lib_common:random_list(HeroBaseList, HeroNumber),
			Force = lists:foldl(fun(HeroBase, Total) -> Total + HeroBase#hero_base.force end, 0, HeroList),
			PlayerShow = #player_show{
				is_robot = true,
				id = Rank1,
				country = Country,
				name = lib_common:random_name(0),
				head_icon = lib_common:random_one(Heads),
				force = Force
			},

			Player = #arena_player{
				is_robot = true,
				id = Rank1,
				show = PlayerShow,
				hero_list = HeroList,
				force = Force,
				rank = Rank1
			},
			{array:set(Rank1 - 1, Rank1, Array1), maps:put(Rank1, Player, Map1)}
        end, {Array, Map}, Min, Max),

		{Rank + max(Max - Min + 1, 0), Array2, Map2}
    end, {1, Ary, maps:new()}, IndexList),

	Monitor = get_monitor(),
	update_monitor(Monitor#arena_monitor{
		rank_list = RankList,
		player_map = PlayerMap,
		is_init = true
	})
.

init_country_top() ->
	RankList = lib_arena_api:rank_list(),
	CountryMap1 =
	lists:foldl(fun(Country, Map) ->
		maps:put(Country, obj_heap:new([],fun obj_heap:val_compare_less/2), Map)
    end, maps:new(), tb_role_country:get_list()),

	CountryMap2 =
	lib_common:fold(fun(Rank, Map) ->
		PlayerId = array:get(Rank - 1, RankList),
		?JUDGE_CONTINUE(lib_arena_api:is_have_player(PlayerId), Map),

		Player = lib_arena_api:player_info(PlayerId),
		?JUDGE_CONTINUE(not Player#arena_player.is_robot),

		Show = Player#arena_player.show,
		Country = Show#player_show.country,
		?JUDGE_CONTINUE(tb_role_country:get(Country) =/= false),

		Heap = maps:get(Country, Map),
		NewHeap = obj_heap:push(PlayerId, Rank, Heap),
		maps:put(Country, NewHeap, Map)
    end, CountryMap1, 1, array:size(RankList)),

	Monitor = get_monitor(),
	update_monitor(Monitor#arena_monitor{country_top_map = CountryMap2})
.

swap_rank(Same, Same) ->
	skip
;
swap_rank(LPlayerId, RPlayerId) ->
	LRank = lib_arena_api:player_rank(LPlayerId),
	RRank = lib_arena_api:player_rank(RPlayerId),

	lib_arena_api:update_player_rank(LPlayerId, RRank),
	lib_arena_api:update_player_rank(RPlayerId, LRank),

	RankList = lib_arena_api:rank_list(),
	NewRankList =
	if
		LRank =< 0, RRank =< 0 -> RankList;
		LRank =< 0 ->
			array:set(RRank - 1, LPlayerId, RankList);
		RRank =< 0 ->
			array:set(LRank - 1, RPlayerId, RankList);
		true ->
			RankList2 = array:set(RRank - 1, LPlayerId, RankList),
			array:set(LRank - 1, RPlayerId, RankList2)
	end,
	lib_arena_api:set_rank_list(NewRankList),
	mod_player:async_apply(LPlayerId, fun lib_player_task_new:process_update_task/3, [?COND_ARENA_RANK, 0, RRank]),
	mod_player:async_apply(RPlayerId, fun lib_player_task_new:process_update_task/3, [?COND_ARENA_RANK, 0, LRank])
.

player_sign_in(PlayerId) ->
	case lib_arena_api:is_have_player(PlayerId) of
		false -> skip;
		true ->
			Player = lib_arena_api:player_info(PlayerId),
			case Player#arena_player.rank =:= 1 of
				false -> skip;
				true ->
					Shout1 = lib_broadcast_api:create_broadcast(?BROAD_FIRST_LOGIN),
					Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_ROLE_INFO, Player#arena_player.show),
					lib_broadcast_api:send_all_system(Shout2)
			end
	end
.

process_fight_result(Result,_L_Length,_R_Length) ->
	Data = Result#combat_callback.callback_data,
	WinType = Data#callback_data0.win_type,
	IsWin = WinType =:= ?FIGHTER_TYPE_L,
	{Type, {PlayerId, HeroList}, {TagId, TagHeroList}} = Result#combat_callback.params,
	FightResultList = Data#callback_data0.fight_result,
	ResultList =
	lib_common:list_foldl(fun(FightResult, List) ->
		[FightResult#fight_result.win_type | List]
    end, [], FightResultList),

	Player = lib_arena_api:player_info(PlayerId),
	TagPlayer = lib_arena_api:player_info(TagId),

	Rank = Player#arena_player.rank,
	TagRank = TagPlayer#arena_player.rank,

	Record = #arena_record{
		first_show = Player#arena_player.show,
		second_show = TagPlayer#arena_player.show,
		first_hero_list = HeroList,
		second_hero_list = TagHeroList,
		result_list = ResultList,
		first_rank = Rank,
		second_rank = TagRank,
		win_type = WinType,
		tick = lib_timer:unixtime()
	},

	HistoryList = Player#arena_player.history_list,
	RecordNumber = lib_arena_setting:get_const_int(record_number),
	NewHistoryList = lists:sublist([Record | HistoryList], RecordNumber),
	lib_arena_api:update_player(Player#arena_player{history_list = NewHistoryList}),

	ItemList =
	case IsWin of
		false -> [];
		true ->
			case TagRank > 0 andalso (Rank =:= 0 orelse Rank > TagRank) of
				false -> skip;
				true -> swap_rank(PlayerId, TagId)
			end,

			NewPlayer = lib_arena_api:player_info(PlayerId),
			NewRank = NewPlayer#arena_player.rank,
			TopRank = NewPlayer#arena_player.top_rank,

			case NewRank =:= 1 of
				false -> skip;
				true ->
					Shout1 = lib_broadcast_api:create_broadcast(?BROAD_FIRST_CHANGE),
					Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_ROLE_INFO, NewPlayer#arena_player.show),
					Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, TagPlayer#arena_player.show),
					lib_broadcast_api:send_all_system(Shout3)
			end,

			case NewRank > 0 andalso (TopRank =:= 0 orelse NewRank < TopRank) of
				false -> [];
				true ->
					lib_arena_api:update_player(NewPlayer#arena_player{top_rank = NewRank}),
					calc_first_reward(PlayerId, TopRank, NewRank)
			end
	end,
	Have_first = case ItemList =/= [] of
					 true -> 1;
					 false-> 0
				 end,
	FightMsg = Data#callback_data0.msg,
	ResultMsg = Data#callback_data0.result_msg#'Proto80102007'{
		param1 = Rank,
		param2 = TagRank,
		param3 = Type,
		param4 = Have_first
	},
	{FightMsg, ResultMsg, ItemList}
.

calc_first_reward(_PlayerId, OldRank, NewRank) ->
	?INFO("arena send first reward, ~p => ~p", [OldRank, NewRank]),

	ArenaMaxNumber = lib_arena_setting:get_const_int(rank_number),

	Left = NewRank,
	Right =
	case OldRank of
		0 -> ArenaMaxNumber;
		_ -> OldRank - 1
	end,

	IndexList = tb_arena_first_reward:get_list(),
%%	ConfList =
	lib_common:list_foldl(fun(Index, List) ->
		Conf = tb_arena_first_reward:get(Index),
		Min = maps:get(min, Conf),
		Max = maps:get(max, Conf),

		?JUDGE_CONTINUE(not (Min > Right orelse Max < Left), List),
		L = max(Min, Left),
		R = min(Max, Right),

		Number = R - L + 1,
		?JUDGE_CONTINUE(Number > 0, List),

		ConfList = maps:get(reward, Conf, []),
		lib_item_api:multi_conf_item_list(ConfList, Number) ++ List
    end, [], IndexList)
%%
%%	ItemList = lib_item_api:conf_item_list_to_pack_item_list(lib_item_api:merge_conf_item_list(ConfList)),
%%	ItemList
%%	Mail1 = lib_mail_api:create_sys_mail(?ADD_ARENA_FIRST_REWARD),
%%	Mail2 = lib_mail_api:add_item_list(Mail1, ItemList),
%%	Mail3 = lib_mail_api:set_title_content(Mail2, ?FIRST_MAIL_ID, []), %%todo
%%	lib_mail_api:send(Mail3, PlayerId)
.

check_send_rank_reward() ->
	Monitor = get_monitor(),
	CurTick = lib_timer:unixtime(),
	SettlementTick = Monitor#arena_monitor.rank_settlement_tick,
	SendHour = lib_arena_setting:get_const_int(rank_reward_hour, 11),
	HourTick = lib_timer:cur_hour_unixtime(SendHour, CurTick),
	case not lib_timer:is_same_day(HourTick, SettlementTick) andalso CurTick >= HourTick of
		false -> skip;
		true ->
			update_monitor(Monitor#arena_monitor{rank_settlement_tick = HourTick}),
			send_rank_reward()
	end
.

send_rank_reward() ->
	?INFO("arena send rank reward"),

	RankList = lib_arena_api:rank_list(),
	IndexList = tb_arena_rank_reward:get_list(),

	Mail1 = lib_mail_api:create_sys_mail(?ADD_ARENA_RANK_REWARD),

	lib_common:list_map(fun(Index) ->
		Conf = tb_arena_rank_reward:get(Index),
		Min = maps:get(min, Conf),
		Max = maps:get(max, Conf),

		ConfList = maps:get(reward, Conf, []),
		ItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfList),
		Mail2 = lib_mail_api:add_item_list(Mail1, ItemList),
		lib_common:for(fun(Rank) ->
			PlayerId = array:get(Rank - 1, RankList),
			?JUDGE_CONTINUE(lib_arena_api:is_have_player(PlayerId)),

			Player = lib_arena_api:player_info(PlayerId),
			?JUDGE_CONTINUE(not Player#arena_player.is_robot),

			Mail3 = lib_mail_api:set_title_content(Mail2, ?RANK_MAIL_ID, [Rank]),
			lib_mail_api:send(Mail3, PlayerId)
        end, Min, Max)
    end, IndexList)
.