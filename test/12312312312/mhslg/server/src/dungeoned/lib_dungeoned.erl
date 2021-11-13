%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_dungeoned).
-include("common.hrl").
-include("player.hrl").
-include("fight.hrl").
-include("dungeoned.hrl").
-include("combat_queue.hrl").
-include("season_and_day.hrl").
-include("ProtoClient_10134.hrl").

-export([
    get_dungeoned/0,
    put_dungeoned/1,

    get_rank_list/0,
    put_rank_list/1,

    get_fight_map/0,
    put_fight_map/1,

    get_sort_rank/0,
    put_sort_rank/1,

    get_is_settle/0,
    put_is_settle/1,

    new_round/0
]).

-export([
    player_state/1,
    player_reward/1,
    fight/3,
    fight_callback/1,
    sort_rank/0,
    settle_rank/0,
    rank_list/2,
    get_drop_id/2,
    assist_drop_map/1,
    get_drop_id_list/0
]).

get_dungeoned() ->
    erlang:get(?MODULE).

put_dungeoned(Dungeoned) ->
    erlang:put(?MODULE, Dungeoned).

get_rank_list() ->
    Dungeoned = get_dungeoned(),
    Dungeoned#dungeoned.rank_list.

put_rank_list(RankList) ->
    Dungeoned = get_dungeoned(),
    put_dungeoned(Dungeoned#dungeoned{rank_list = RankList}).

get_fight_map() ->
    Dungeoned = get_dungeoned(),
    Dungeoned#dungeoned.fight_map.

put_fight_map(FightMap) ->
    Dungeoned = get_dungeoned(),
    put_dungeoned(Dungeoned#dungeoned{fight_map = FightMap}).

get_sort_rank() ->
    Dungeoned = get_dungeoned(),
    Dungeoned#dungeoned.sort_rank.

put_sort_rank(Flag) ->
    Dungeoned = get_dungeoned(),
    put_dungeoned(Dungeoned#dungeoned{sort_rank = Flag}).

get_is_settle() ->
    Dungeoned = get_dungeoned(),
    Dungeoned#dungeoned.is_settle.

put_is_settle(Flag) ->
    Dungeoned = get_dungeoned(),
    put_dungeoned(Dungeoned#dungeoned{is_settle = Flag}).

new_round() ->
    Dungeoned = get_dungeoned(),
    put_dungeoned(Dungeoned#dungeoned{
        rank_list = [],
        is_settle = false
    }).

player_state(PlayerId) ->
    try
        FightMap = get_fight_map(),
        ?JUDGE_RETURN(maps:is_key(PlayerId, FightMap), 0),
        Self = maps:get(PlayerId, FightMap),
        Reward = case Self#dungeoned_fight.state of ?FIGHT_STATE_REWARD -> Self#dungeoned_fight.reward; _ -> maps:new() end,
        State = Self#dungeoned_fight.state,
        CombatId = Self#dungeoned_fight.combat_id,
        CurFloor = Self#dungeoned_fight.cur_floor,
        player_async_apply(PlayerId, fun lib_player_dungeoned:update_state/4, [State, CombatId, CurFloor, Reward])
    catch
        _:_  -> player_async_apply(PlayerId, fun lib_player_dungeoned:update_state/4, [?FIGHT_STATE_NOTHING, 0, 0, maps:new()])
    end.

player_reward(PlayerId) ->
    try
        FightMap = get_fight_map(),
        ?JUDGE_RETURN(maps:is_key(PlayerId, FightMap), 0),
        put_fight_map(maps:remove(PlayerId, FightMap))
    catch
        _:_  -> ok
    end.

fight(Show, Fighters, Robots) ->
    PlayerId = Show#player_show.id,
    ?INFO("dungeoned fight ~p~n", [PlayerId]),
    lib_combat_queue_api:async_cast_fight(#req_combat_queue{
        type = ?CALL_FIGHT_TYPE_DUNGEONED,
        fight_type = ?FIGHT_TYPE1,
        params = PlayerId,
        l_fighters = Fighters,
        r_fighters = Robots,
        have_drop = true
    }),
    RankList = get_rank_list(),
    case lists:keymember(PlayerId, #dungeoned_rank.id, RankList) of
        true ->
            skip;
        _ ->
            put_rank_list(lists:append(RankList, [#dungeoned_rank{id = PlayerId, show = Show}]))
    end.

fight_callback(CallbackData) ->
    try
        ?INFO("callback_type ~p~n", [CallbackData#combat_callback.callback_type]),
        fight_callback(CallbackData#combat_callback.callback_type, CallbackData)
    catch
        _:_  -> ok
    end.

fight_callback(?COMBAT_QUEUE_CALLBACK_TYPE1, CallbackData) ->
    PlayerId = CallbackData#combat_callback.params,
    FightMap = get_fight_map(),
    put_fight_map(maps:put(PlayerId, #dungeoned_fight{
        state = ?FIGHT_STATE_FIGHTING,
        combat_id = CallbackData#combat_callback.combat_id,
        cur_floor = 0
    }, FightMap)),
    player_async_apply(PlayerId, fun lib_player_dungeoned:begin_fight/1, [CallbackData#combat_callback.combat_id]);
fight_callback(?COMBAT_QUEUE_CALLBACK_TYPE2, CallbackData) ->
    Data = CallbackData#combat_callback.callback_data,
    Result = Data#callback_data2.fight_result,
    PlayerId = CallbackData#combat_callback.params,
    FightMap = get_fight_map(),
    SelfInfo = maps:get(PlayerId, FightMap),
    LWastage = Result#fight_result.l_wastage,
    case LWastage#fight_wastage.is_win andalso SelfInfo#dungeoned_fight.cur_floor < (max_cur_floor() - 1) of
        true ->
            put_fight_map(maps:put(PlayerId, #dungeoned_fight{
                state = ?FIGHT_STATE_FIGHTING,
                cur_floor = SelfInfo#dungeoned_fight.cur_floor + 1
            }, FightMap)),
            player_async_apply(PlayerId, fun lib_player_dungeoned:update_floor/1, [SelfInfo#dungeoned_fight.cur_floor + 1]);
        false -> skip
    end,
    ?JUDGE_RETURN(not get_is_settle(), 0),
    RankList = get_rank_list(),
    SelfRank = lists:keyfind(PlayerId, #dungeoned_rank.id, RankList),
    Wastage = Result#fight_result.r_wastage,
    Kills = Wastage#fight_wastage.front_loss + Wastage#fight_wastage.back_loss,
    NewSelfRank = SelfRank#dungeoned_rank{kills = SelfRank#dungeoned_rank.kills + Kills, tick = lib_timer:unixtime()},
    put_rank_list(lists:keyreplace(PlayerId, #dungeoned_rank.id, RankList, NewSelfRank)),
    put_sort_rank(true);
fight_callback(?COMBAT_QUEUE_CALLBACK_TYPE3, CallbackData) ->
    PlayerId = CallbackData#combat_callback.params,
    Data = CallbackData#combat_callback.callback_data,
    FightMap = get_fight_map(),
    Self0 = maps:get(PlayerId, FightMap),
    State = case Self0#dungeoned_fight.cur_floor of 0 -> ?FIGHT_STATE_NOTHING; _ -> ?FIGHT_STATE_REWARD end,
    put_fight_map(maps:put(PlayerId, Self0#dungeoned_fight{
        state = State,
        combat_id = 0,
        reward = maps:get(PlayerId, Data#callback_data3.drop_map, maps:new())
    }, FightMap)),
    PlayerPid = lib_player:get_pid(PlayerId),
    case erlang:is_pid(PlayerPid) andalso erlang:is_process_alive(PlayerPid) of
        true ->
            Self = maps:get(PlayerId, get_fight_map()),
            Reward = Self#dungeoned_fight.reward,
            State = Self#dungeoned_fight.state,
            CombatId = Self#dungeoned_fight.combat_id,
            CurFloor = Self#dungeoned_fight.cur_floor,
            player_async_apply(PlayerId, fun lib_player_dungeoned:update_state/4, [State, CombatId, CurFloor, Reward]);
        _ ->
            skip
    end;
fight_callback(_, _) ->
    skip.

max_cur_floor() ->
    Conf = tb_magic_tower:get(lib_player_dungeoned:season_index()),
    maps:get(max_floor,Conf)
.

sort_rank() ->
    try
        ?JUDGE_RETURN(get_sort_rank(), 0),
        RankList = get_rank_list(),
        put_rank_list(lists:sort(fun sort_rank/2, RankList)),
        put_sort_rank(false)
    catch
        _:_  -> ok
    end.

sort_rank(L, R) ->
    case L#dungeoned_rank.kills =:= R#dungeoned_rank.kills of
        true ->
            L#dungeoned_rank.tick =< R#dungeoned_rank.tick;
        _ ->
            L#dungeoned_rank.kills > R#dungeoned_rank.kills
    end.

settle_rank() ->
    try
        ?JUDGE_RETURN(lib_season_and_days_api:get_season_info() =:= ?SUMMER,  ?INFO("error1 ~n")),
        ?INFO("get_is_settle() ~p~n", [get_is_settle()]),
        ?JUDGE_RETURN(not get_is_settle(),  ?INFO("error2 ~n")),
        ?INFO("dungeoned settle done ~n"),
        sort_rank(),
        %erlang:send_after(lib_timer:hour_second() * 1000 * 3, self(), clean_rank),
        lists:foldl(fun(Ranker, Rank) ->
            send_rank_reward(Ranker, Rank),
            Rank + 1
        end, 1, get_rank_list()),
        put_is_settle(true),
        erlang:send_after(lib_timer:hour_second() * 3 * 1000, self(), new_round)
    catch
        _:_  -> ok
    end.

send_rank_reward(Ranker, Rank) ->
    Conf = get_reward_config(Rank),
    lib_mail_api:fast_send_mail(Ranker#dungeoned_rank.id, ?DUNGEONED_RANK_REWARD_MAIL_ID, [Rank],
        lib_item_api:conf_item_list_to_pack_item_list(Conf), ?ADD_DUNGEONED_RANK_REWARD).

get_reward_config(Rank) ->
    %% 此处配置格式为策划需求且不愿意更改，策划保证不修改。
    Conf = tb_magic_tower_rank_reward:get(get_conf_key(Rank)),
    Conf1 =
        case maps:is_key(reward1_id, Conf) of
            true ->
                [[maps:get(reward1_id, Conf), maps:get(reward1_amount, Conf)]];
            _ -> []
        end,
    Conf2 =
        case maps:is_key(reward2_id, Conf) of
            true ->
                [[maps:get(reward2_id, Conf), maps:get(reward2_amount, Conf)] | Conf1];
            _ -> Conf1
        end,
    Conf3 =
        case maps:is_key(reward3_id, Conf) of
            true ->
                [[maps:get(reward3_id, Conf), maps:get(reward3_amount, Conf)] | Conf2];
            _ -> Conf2
        end,
    Conf4 =
        case maps:is_key(reward4_id, Conf) of
            true ->
                [[maps:get(reward4_id, Conf), maps:get(reward4_amount, Conf)] | Conf3];
            _ -> Conf3
        end,
    case maps:is_key(reward5_id, Conf) of
        true ->
            [[maps:get(reward5_id, Conf), maps:get(reward5_amount, Conf)] | Conf4];
        _ -> Conf4
    end.
get_conf_key(Rank) ->
    try
        lists:foreach(fun(Key) ->
            Conf = tb_magic_tower_rank_reward:get(Key),
            L = maps:get(rank_l, Conf),
            R = maps:get(rank_r, Conf),
            case L =< Rank andalso Rank =< R of
                true -> throw({ok, Key});
                _ -> skip
            end
        end, tb_magic_tower_rank_reward:get_list())
    catch
        throw:{ok, RelKey}  -> RelKey
    end .

rank_list(PlayerId, Show) ->
    {RankProtoList, _, MyRank, MyInfo} =
    lists:foldl(fun(Ranker, {Acc, Rank, SelfRank, SelfInfo}) ->
        ShowProto = lib_common:player_show_to_proto(Ranker#dungeoned_rank.show),
        case Ranker#dungeoned_rank.id =:= PlayerId of
            true ->
                {[#'ProtoDungeonedRank'{
                    show = ShowProto#'ProtoShowRole'{value = Rank},
                    kills = Ranker#dungeoned_rank.kills,
                    tick = Ranker#dungeoned_rank.tick
                } | Acc], Rank + 1, Rank, Ranker};
            _ ->
                {[#'ProtoDungeonedRank'{
                    show = ShowProto#'ProtoShowRole'{value = Rank},
                    kills = Ranker#dungeoned_rank.kills,
                    tick = Ranker#dungeoned_rank.tick
                } | Acc], Rank + 1, SelfRank, SelfInfo}
        end
    end, {[], 1, 0, #dungeoned_rank{}}, get_rank_list()),
    SelfProto = lib_common:player_show_to_proto(Show),
    lib_send:respond_to_player(PlayerId, #'Proto50134005'{
        rank_list = RankProtoList,
        self = SelfProto#'ProtoShowRole'{value = MyRank},
        self_kills = MyInfo#dungeoned_rank.kills
    }).

%%rank_list_to_proto() ->
%%    lists:foldl(fun(Ranker, Acc) ->
%%        [#'ProtoDungeonedRank'{
%%            show = lib_common:player_show_to_proto(Ranker#dungeoned_rank.show),
%%            kills = Ranker#dungeoned_rank.kills,
%%            tick = Ranker#dungeoned_rank.tick
%%        } | Acc]
%%    end, [], get_rank_list()).



player_async_apply(PlayerId, Fun, Args) ->
    mod_player:async_apply(PlayerId, Fun, Args).


assist_drop_map(CombatDetail) ->
    try
        ?JUDGE_RETURN(CombatDetail#combat_queue_detail.drop_assist_map =:= maps:new(), 0),
        CombatDetail#combat_queue_detail{
            drop_assist_map = init_assist_map()
        }
    catch
        _:_  -> CombatDetail
    end.
init_assist_map() ->
    lists:foldl(fun(DropId, Acc) ->
        Conf = tb_drop_reward:get(DropId),
        case maps:is_key(certain_times, Conf) of
            true ->
                maps:put(DropId, 0, Acc);
            _ ->
                Acc
        end
    end, maps:new(), get_drop_id_list()).

get_drop_id(PlayerId, CombatDetail) ->
    DropMap = maps:get(PlayerId, CombatDetail#combat_queue_detail.drop_map, maps:new()),
    DropAssistMap = maps:get(PlayerId, CombatDetail#combat_queue_detail.drop_assist_map, maps:new()),
    get_drop_id(get_drop_id_list(), DropMap, DropAssistMap).

get_drop_id(DropIdList, DropMap, DropAssistMap) ->
    Weight = get_weight(DropIdList, DropMap),
    Rand = lib_random:rand(Weight),
    try
        lists:foldl(fun(DropId, Acc) ->
            check_certain_times(DropId, DropMap, DropAssistMap),
            rand_drop_id(Acc, DropId, DropMap)
        end, Rand, DropIdList)
    catch
        throw:{error, RelDropId}  -> RelDropId
    end.

get_drop_id_list() ->
    Day = lib_season_and_days_api:get_season_day(),
    maps:fold(fun(_, Conf, Acc) ->
        case maps:get(season_day_left, Conf) =< Day andalso  Day =< maps:get(season_day_right, Conf) of
            true ->
                [maps:get(drop_id, Conf) | Acc];
            _ ->
                Acc
        end
    end, [], tb_magic_tower_reward:get(lib_season_and_days_api:get_season())).

get_weight(DropIdList, DropMap) ->
    lists:foldl(fun(DropId, Acc) ->
        Conf = tb_drop_reward:get(DropId),
        case maps:is_key(max_times, Conf) of
            true ->
                NowTimes = maps:get(DropId, DropMap),
                case NowTimes >= maps:get(max_times, Conf) of
                    true ->
                        Acc;
                    _ ->
                        Acc + maps:get(weight, Conf)
                end;
            _ ->
                Acc + maps:get(weight, Conf)
        end
    end, 0, DropIdList).

check_certain_times(DropId, DropMap, DropAssistMap) ->
    Conf = tb_drop_reward:get(DropId),
    case (maps:is_key(certain_times, Conf) andalso maps:get(DropId, DropAssistMap, 0) >= maps:get(certain_times, Conf)) andalso
        (not maps:is_key(max_times, Conf) orelse maps:get(DropId, DropMap, 0) < maps:get(max_times, Conf, 0)) of
        true ->
            throw({error, DropId});
        _ -> skip
    end.

rand_drop_id(Rand, DropId, DropMap) ->
    Conf = tb_drop_reward:get(DropId),
    Weight = maps:get(weight, Conf),
    case maps:is_key(max_times, Conf) of
        true ->
            NowTimes = maps:get(DropId, DropMap),
            case NowTimes >= maps:get(max_times, Conf) of
                true ->
                    Rand;
                _ ->
                    ?JUDGE_RETURN(Rand - Weight > 0, DropId),
                    Rand - Weight
            end;
        _ ->
            ?JUDGE_RETURN(Rand - Weight > 0, DropId),
            Rand - Weight
    end.