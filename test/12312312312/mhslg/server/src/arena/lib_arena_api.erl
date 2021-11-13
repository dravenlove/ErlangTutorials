%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 11:27
%%%-------------------------------------------------------------------
-module(lib_arena_api).
-author("13661").

-include("common.hrl").
-include("arena.hrl").
-include("player.hrl").

%% API
-compile(export_all).

get_monitor() ->
	mod_arena:get_monitor()
.

update_monitor(Monitor) when is_record(Monitor, arena_monitor) ->
	mod_arena:put_monitor(Monitor)
.

rank_list() ->
	Monitor = get_monitor(),
	Monitor#arena_monitor.rank_list
.

set_rank_list(RankList) ->
	Monitor = get_monitor(),
	update_monitor(Monitor#arena_monitor{rank_list = RankList})
.

country_top_list() ->
	Monitor = get_monitor(),
	CountryMap = Monitor#arena_monitor.country_top_map,
	maps:fold(fun(_, Heap, List)->
		case obj_heap:empty(Heap) of
			true -> List;
			false -> 
				{Id, _Rank} = obj_heap:top(Heap),
				[Id | List]
		end
    end, [], CountryMap)
.

rank_player_id(Rank) ->
	array:get(Rank - 1, rank_list())
.

player_info(PlayerId) ->
	Monitor = get_monitor(),
	PlayerMap = Monitor#arena_monitor.player_map,
	maps:get(PlayerId, PlayerMap)
.

update_player(Player) when is_record(Player, arena_player) ->
	Monitor = get_monitor(),
	PlayerMap = Monitor#arena_monitor.player_map,

	case maps:is_key(Player#arena_player.id, PlayerMap) of
		false -> skip;
		true ->
			NewMap = maps:put(Player#arena_player.id, Player, PlayerMap),
			update_monitor(Monitor#arena_monitor{player_map = NewMap})
	end
.

register_player(Player) when is_record(Player, arena_player) ->
	Monitor = get_monitor(),
	PlayerMap = Monitor#arena_monitor.player_map,
	NewMap = maps:put(Player#arena_player.id, Player, PlayerMap),
	update_monitor(Monitor#arena_monitor{player_map = NewMap})
.

is_have_player(PlayerId) ->
	Monitor = get_monitor(),
	PlayerMap = Monitor#arena_monitor.player_map,
	maps:is_key(PlayerId, PlayerMap)
.

player_rank(PlayerId) ->
	case is_have_player(PlayerId) of
		true ->
			Player = player_info(PlayerId),
			Player#arena_player.rank;
		false -> 0
	end
.

update_player_rank(PlayerId, Rank) ->
	Player = player_info(PlayerId),
	update_player(Player#arena_player{rank = Rank}),

	Show = Player#arena_player.show,
	IsRobot = Player#arena_player.is_robot,
	Country = Show#player_show.country,

	case not IsRobot andalso tb_role_country:get(Country) =/= false of
		false -> skip;
		true ->
			Monitor = get_monitor(),
			CountryMap = Monitor#arena_monitor.country_top_map,
			Heap = maps:get(Country, CountryMap),

			NewHeap =
			case Rank > 0 of
				false -> obj_heap:erase(PlayerId, Heap);
				true -> obj_heap:update(PlayerId, Rank, Heap)
			end,

			NewMap = maps:put(Country, NewHeap, CountryMap),
			update_monitor(Monitor#arena_monitor{country_top_map = NewMap})
	end,
	case Player#arena_player.is_robot of
		true -> skip;
		false-> lib_open_server_rank:mod_add_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_4,Rank,lib_timer:unixtime())
	end
.