%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_alien).
-include("common.hrl").
-include("player.hrl").
-include("hero.hrl").
-include("chat.hrl").
-include("fight.hrl").
-include("alien.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10143.hrl").

-define(JUDGE_SEND_ERR(A, Msg, ErrCode), case (A) of false -> throw({error, Msg, ErrCode}); _ -> skip end).

-export([
    get_alien/0,
    put_alien/1,

    get_country_id/0,

    get_detail_map/0,
    put_detail_map/1,
    get_detail/1,
    put_detail/2,

    get_player_map/0,
    put_player_map/1,
    get_player/1,
    put_player/2,


    check_state/0,
    check_state/1,
    check_start_fight/0,
    check_start_fight/1,
    check_buff_refresh/0,
    check_buff_refresh/1,
    check_player_tips/0,

    notify_detail/0
]).

-export([
    request_main_info/1,
    request_join_team/3,
    request_exit_team/3,
    request_draw_reward/2,
    request_watch_fight/2,
    request_close_interface/1,
    request_convene/2,
    sign_in/1,
    sign_out/1,

    rand_buff/1 %test
]).

get_alien() ->
    mod_alien:get_alien().

put_alien(Alien) ->
    mod_alien:put_alien(Alien).

get_country_id() ->
    Alien = get_alien(),
    Alien#alien.country_id.

get_detail_map() ->
    Alien = get_alien(),
    Alien#alien.detail_map.
put_detail_map(DetailMap) ->
    Alien = get_alien(),
    put_alien(Alien#alien{detail_map = DetailMap}).

get_detail(Floor) ->
    maps:get(Floor, get_detail_map(), #alien_detail{}).
put_detail(Floor, Detail) ->
    put_detail_map(maps:put(Floor, Detail, get_detail_map())).


get_player_map() ->
    Alien = get_alien(),
    Alien#alien.player_map.
put_player_map(PlayerMap) ->
    Alien = get_alien(),
    put_alien(Alien#alien{player_map = PlayerMap}).
get_player(PlayerId) ->
    maps:get(PlayerId, get_player_map(), #alien_player{role_id = PlayerId}).
put_player(Player) ->
    put_player(Player#alien_player.role_id, Player).
put_player(PlayerId, Player) ->
    put_player_map(maps:put(PlayerId, Player, get_player_map())).


get_reward_cooling_time(Floor) ->
    Conf = tb_alien:get(Floor),
    maps:get(reward_cooling_time, Conf).

update_fighter(PlayerShow) ->
    [PlayerShow].%todo

update_open_flag(PlayerId, Flag) ->
    Player = get_player(PlayerId),
    put_player(PlayerId, Player#alien_player{
        on_show = Flag
    }).

notify_event_info(PlayerId) ->
    Player = get_player(PlayerId),
    case Player#alien_player.on_show of
        false -> skip;
        true -> lib_send:respond_to_player(PlayerId, ?MSG_ACTIVE_ALIEN_CHANGE)
    end
%%        ?JUDGE_RETURN(Player#alien_player.on_line, 0),
%%        Respond = #'Proto80143008'{
%%            reward_list = get_reward_list_proto(PlayerId),
%%            use_hero_list = Player#alien_player.use_hero_list
%%        },
%%        %%?INFO("~p~n", [Respond]),
%%        lib_send:respond_to_player(PlayerId, Respond),
.

notify_detail() ->
    notify_player(?MSG_ACTIVE_ALIEN_CHANGE)
%%    try
%%        ProtoDetailList =
%%        lib_common:map_fold(fun(Floor, Detail, Acc) ->
%%            ?JUDGE_CONTINUE(Detail#alien_detail.is_notify),
%%            put_detail(Floor, Detail#alien_detail{
%%                is_notify = false
%%            }),
%%            [detail_to_proto(Detail) | Acc]
%%        end, [], get_detail_map()),
%%
%%        ?JUDGE_RETURN(erlang:length(ProtoDetailList) > 0, 0),
%%
%%
%%    catch
%%        _:_  -> ok
%%    end
.

notify_player(Respond) ->
    PlayerMap = get_player_map(),
    PlayerList = maps:values(PlayerMap),
    notify_player(PlayerList, Respond)
.
notify_player([Player | List], Respond) ->
    case Player#alien_player.on_show of
        true -> lib_send:respond_to_player(Player#alien_player.role_id, Respond);
        false -> skip
    end,
    notify_player(List, Respond)
;
notify_player([], _Respond) ->
    ok
.


open_floor(Floor) ->
    try
        ?JUDGE_RETURN(lists:member(Floor, tb_alien:get_list()), 0),
        Detail = get_detail(Floor),
        put_detail(Floor, Detail#alien_detail{
            open_state = 1
        })
    catch
        _:_  -> ok
    end.

start_fight(Floor) ->
    Detail = get_detail(Floor),
    RobotId = Detail#alien_detail.robot_id,
    RobotShow = lib_robot_api:robot_player_show(RobotId),
    Monster = lib_combat_queue_api:to_combat_hero(RobotShow, Detail#alien_detail.hero_base),
    Result = lib_combat_queue_api:sync_call_fight(#req_combat_queue{
        type = ?CALL_FIGHT_TYPE_ALIEN,
        l_fighters = lists:reverse(Detail#alien_detail.fighters),
        r_fighters = [Monster],
        r_buff_list = Detail#alien_detail.buff_list,
        fight_type = ?FIGHT_TYPE1
    }),
    process_fight_result(Floor, Result).

process_fight_result(Floor, Result) ->
    Detail = get_detail(Floor),
    Data = Result#combat_callback.callback_data,
    IsWin = Data#callback_data0.win_type =:= ?FIGHTER_TYPE_L,

    case IsWin of
        true ->
            open_floor(Floor + 1),
            add_reward(Detail);
        _ -> skip
    end,
    process_add_player_alien_challenge_times(Detail),

    put_detail(Floor, Detail#alien_detail{
        state = ?ALIEN_TEAM_STATE_2,
        fight_msg = Data#callback_data0.msg,
        result_msg = Data#callback_data0.result_msg,
        fight_tick = lib_timer:unixtime()
    }),
    notify_detail().

add_reward(Detail) ->
    Conf = tb_alien:get(Detail#alien_detail.floor),
    RewardConf = lib_random:rand_one(maps:get(reward, Conf)),
    ItemId = lists:nth(1, RewardConf),
    Amount = lists:nth(2, RewardConf),
    lists:foldl(fun(Fighter, Acc) ->
        case lists:member(Fighter#combat_hero.id, Acc) of
            false ->
                player_add_reward(Detail#alien_detail.floor, Fighter#combat_hero.id, ItemId, Amount),
                [Fighter#combat_hero.id | Acc];
            _ ->
                Acc
        end
    end, [], Detail#alien_detail.fighters).

player_add_reward(Floor, PlayerId, ItemId, Amount) ->
    Player = get_player(PlayerId),
    RewardList = lists:append(Player#alien_player.reward_list, [#alien_reward{
        item_id = ItemId,
        amount = Amount,
        floor = Floor,
        get_tick = lib_timer:unixtime()
    }]),
    put_player(PlayerId, Player#alien_player{
        reward_list = lists:sublist(RewardList, ?ALIEN_PLAYER_REWARD_SIZE)
    }),
    notify_event_info(PlayerId).

player_add_count(PlayerId, Count) ->
    Player = get_player(PlayerId),
    put_player(PlayerId, Player#alien_player{
        count = Player#alien_player.count + Count
    })
.

check_state() ->
    maps:fold(fun(Floor, _, _) ->
        check_state(Floor)
    end, 0, get_detail_map()).

check_state(Floor) ->
    try
        Detail = get_detail(Floor),
        ?JUDGE_RETURN(Detail#alien_detail.state =:= ?ALIEN_TEAM_STATE_2, 0),
        WTime = maps:get(watching_time, tb_alien:get(Detail#alien_detail.floor)),
        ?JUDGE_RETURN(Detail#alien_detail.fight_tick + WTime =< lib_timer:unixtime(), 0),
%%        lists:foreach(fun(Fighter) ->
%%            Player = get_player(Fighter#combat_hero.id),
%%            notify_event_info(Fighter#combat_hero.id),
%%            put_player(Player#alien_player{
%%                use_hero_list = lists:delete(Fighter#combat_hero.hero_id, Player#alien_player.use_hero_list)
%%            })
%%        end, Detail#alien_detail.fighters),
%%        put_detail(Floor, Detail#alien_detail{
%%            state = ?ALIEN_TEAM_STATE_0,
%%            is_notify = true,
%%            fighters = []
%%        }),
        dissolve_team(Floor),
        check_buff_refresh(Floor),
        notify_detail()
    catch
        _:_  -> skip
    end.

check_dissolve_team(Floor) ->
    Conf = tb_alien:get(Floor),
    Detail = get_detail(Floor),
    CurSize = erlang:length(Detail#alien_detail.fighters),
    LimitSize = maps:get(fighter_min_size, Conf, 0),
    %%?INFO("refresh check_dissolve_team Floor(~p) : ~p >= ~p", [Floor, CurSize, LimitSize]),
    case CurSize >= LimitSize of
        true -> start_fight(Floor);
        _ -> dissolve_team(Floor), check_buff_refresh(Floor)
    end.

dissolve_team(Floor) ->
    Detail = get_detail(Floor),
    lists:foreach(fun(Fighter) ->
        Player = get_player(Fighter#combat_hero.id),
        put_player(Player#alien_player{
            use_hero_list = lists:delete(Fighter#combat_hero.hero_id, Player#alien_player.use_hero_list),
            floor_list = lists:delete(Floor, Player#alien_player.floor_list)
        }) end, Detail#alien_detail.fighters),
    Conf = tb_alien:get(Detail#alien_detail.floor),
    BuffNum = case rand:uniform() >= maps:get(buff_rate, Conf) of true -> ?ALIEN_TWO_BUFF; _ -> ?ALIEN_ONE_BUFF end,
    BuffList = rand_buff(BuffNum),
    RobotId = lib_random:rand_one(maps:get(robot_list, Conf, [])),
    put_detail(Floor, Detail#alien_detail{
        state = ?ALIEN_TEAM_STATE_0,
        buff_list = BuffList,
        fighters = [],
        robot_id = RobotId,
        hero_base = lib_robot_api:get_monster(lib_robot_api:random_monster_id(RobotId))
    }),
    notify_detail().

check_start_fight() ->
    maps:fold(fun(Floor, _, _) ->
        check_start_fight(Floor)
    end, 0, get_detail_map()).
check_start_fight(Floor) ->
    Detail = get_detail(Floor),
    Conf = tb_alien:get(Floor),
    CurNum = erlang:length(Detail#alien_detail.fighters),
    MaxNum = maps:get(max_hero, Conf),
    StartTick = Detail#alien_detail.build_up_tick + maps:get(start_time, Conf),
    case (CurNum =:= MaxNum orelse lib_timer:unixtime() >= StartTick)
        andalso Detail#alien_detail.state =:= ?ALIEN_TEAM_STATE_1 andalso CurNum > 0 of
        true ->
            start_fight(Floor);
        _ ->
            skip
    end.

check_buff_refresh() ->
    maps:fold(fun(Floor, _, _) ->
        check_buff_refresh(Floor)
    end, 0, get_detail_map()).
check_buff_refresh(Floor) ->
    try
        Detail = get_detail(Floor),
        %?JUDGE_RETURN(Detail#alien_detail.state =:= ?ALIEN_TEAM_STATE_0, 0),
        ?JUDGE_RETURN(lib_timer:unixtime() >= Detail#alien_detail.buff_refresh_tick, 0),
        case Detail#alien_detail.state of
            ?ALIEN_TEAM_STATE_0 -> skip;
            ?ALIEN_TEAM_STATE_1 -> check_dissolve_team(Floor), throw(error);
            _ -> throw(error)
        end,
        Conf = tb_alien:get(Detail#alien_detail.floor),
        BuffNum = case rand:uniform() >= maps:get(buff_rate, Conf) of true -> ?ALIEN_TWO_BUFF; _ -> ?ALIEN_ONE_BUFF end,
        BuffList = rand_buff(BuffNum),
        RobotId = lib_random:rand_one(maps:get(robot_list, Conf, [])),
        put_detail(Floor, Detail#alien_detail{
            buff_list = BuffList,
            buff_refresh_tick = lib_timer:unixtime() + lib_timer:next_hour_time(),
            robot_id = RobotId,
            hero_base = lib_robot_api:get_monster(lib_robot_api:random_monster_id(RobotId))
        }),
        notify_detail()
    catch
        _:_  -> ok
    end.

rand_buff(?ALIEN_ONE_BUFF) ->
    BuffId = get_rand_buff(weight1, []),
    ?DEBUG("ALIEN_ONE_BUFF ~p~n", [BuffId]),
    [BuffId];
rand_buff(?ALIEN_TWO_BUFF) ->
    BuffId1 = get_rand_buff(weight2, []),
    #{group := Group} = tb_alien_buff:get(BuffId1),
    BuffId2 = get_rand_buff(weight3, [Group]),
    ?DEBUG("ALIEN_TWO_BUFF ~p ~p~n", [BuffId1, BuffId2]),
    [BuffId1, BuffId2];
rand_buff(_) ->
    [].

get_rand_buff(FieldName, OutsideGroup) ->
    TotalWeight = get_total_weight(FieldName, OutsideGroup),
    Weight = lib_random:rand(TotalWeight),
    lib_common:list_foldl(fun(BuffId, Acc) ->
        Conf = tb_alien_buff:get(BuffId),
        ?JUDGE_CONTINUE(not lists:member(maps:get(group, Conf), OutsideGroup), Acc),
        CurWeight = Acc + maps:get(FieldName, Conf),
        ?JUDGE_BREAK(CurWeight < Weight, BuffId),
        Acc + maps:get(FieldName, Conf)
    end, 0, tb_alien_buff:get_list()).
get_total_weight(FieldName, OutsideGroup) ->
    lib_common:list_foldl(fun(BuffId, Acc) ->
        Conf = tb_alien_buff:get(BuffId),
        ?JUDGE_CONTINUE(not lists:member(maps:get(group, Conf), OutsideGroup), Acc),
        Acc + maps:get(FieldName, Conf)
    end, 0, tb_alien_buff:get_list()).

check_player_tips() ->
    maps:map(fun(_, Player) ->
        check_player_tips(Player)
    end, get_player_map()).
check_player_tips(Player) ->
    try
        ?JUDGE_RETURN(Player#alien_player.on_line, 0),
        NowTick = lib_timer:unixtime(),
        lists:foreach(fun(Reward) ->
            DrawTick = Reward#alien_reward.get_tick + get_reward_cooling_time(Reward#alien_reward.floor),
            case NowTick >= DrawTick andalso (DrawTick + ?REWARD_CHECK_TIME) > NowTick of
                true ->
                    throw({tips});
                _ -> skip
            end
        end, Player#alien_player.reward_list)
    catch
        throw:{tips} -> notify_event_info(Player#alien_player.role_id);
        _:_ -> skip
    end.


exit_team(PlayerId, HeroId, Floor) ->
    Detail = get_detail(Floor),
    Player = get_player(PlayerId),
    put_player(PlayerId, Player#alien_player{
        use_hero_list = lists:delete(HeroId, Player#alien_player.use_hero_list),
        floor_list = lists:delete(Floor, Player#alien_player.floor_list)
    }),
    Fighter = lists:filter(fun(Fighter) ->
        Fighter#combat_hero.id =/= PlayerId orelse HeroId =/= Fighter#combat_hero.hero_id
    end, Detail#alien_detail.fighters),
    put_detail(Floor, Detail#alien_detail{
        fighters = Fighter,
        state = case erlang:length(Fighter) > 0 of true -> ?ALIEN_TEAM_STATE_1; _ -> ?ALIEN_TEAM_STATE_0 end
    }),
    notify_detail().

validation_exit_team(PlayerId, HeroId, Floor) ->
    Detail = get_detail(Floor),
    Player = get_player(PlayerId),
    ?JUDGE_SEND_ERR(lists:member(HeroId, Player#alien_player.use_hero_list), ?MSG_RETURN_ALIEN_EXIT_TEAM, ?ERROR_INVALID_PARAM),
    ?JUDGE_SEND_ERR(Detail#alien_detail.state =:= ?ALIEN_TEAM_STATE_1, ?MSG_RETURN_ALIEN_EXIT_TEAM, ?ERROR_INVALID_PARAM),
    ?JUDGE_SEND_ERR(get_self_hero_index(PlayerId, HeroId, Detail#alien_detail.fighters) > 0, ?MSG_RETURN_ALIEN_EXIT_TEAM, ?ERROR_INVALID_PARAM).

get_self_hero_index(PlayerId, HeroId, Fighters) ->
    try
        lists:foldl(fun(Fighter, Acc) ->
            case Fighter#combat_hero.id =:= PlayerId andalso Fighter#combat_hero.hero_id =:= HeroId of
                true -> throw({ok, Acc + 1});
                _ -> Acc + 1
            end
        end, 0, Fighters)
    catch
        throw:{ok, RIndex} -> RIndex
    end.


join_team(PlayerShow, HeroBaseList, Floor) ->
    Detail = get_detail(Floor),
    PlayerId = PlayerShow#player_show.id,
    Player = get_player(PlayerId),
    UseHeroList = Player#alien_player.use_hero_list,
    FloorList = Player#alien_player.floor_list,
    Fighters = Detail#alien_detail.fighters,
    {NewFighters, NewUseHeroList, NewFloorList} = lists:foldl(
        fun(HeroBase, {F, U, Fl}) ->
            {[lib_combat_queue_api:to_combat_hero(PlayerShow, HeroBase) | F], [HeroBase#hero_base.id | U], [Floor | Fl]}
        end, {Fighters, UseHeroList, FloorList}, HeroBaseList),
    Tick = case Detail#alien_detail.state of ?ALIEN_TEAM_STATE_0 -> lib_timer:unixtime(); _ -> Detail#alien_detail.build_up_tick end,
    put_detail(Floor, Detail#alien_detail{
        state = ?ALIEN_TEAM_STATE_1,
        fighters = NewFighters,
        build_up_tick = Tick
    }),
    put_player(PlayerId, Player#alien_player{
        use_hero_list = NewUseHeroList,
        floor_list = NewFloorList
    }),
    check_start_fight(Floor),
    notify_detail().


validation_join_team(PlayerShow, HeroBaseList, Floor) ->
    Player = get_player(PlayerShow#player_show.id),
    Conf = tb_alien:get(Floor),
    UseHeroList = Player#alien_player.use_hero_list,
    LimitForce = maps:get(limit_force, Conf),
    Flag = lists:all(
        fun(HeroBase) ->
            not lists:member(HeroBase#hero_base.id, UseHeroList) andalso
            HeroBase#hero_base.force >= LimitForce
        end, HeroBaseList),
    HeroNum = length(HeroBaseList),
    ?JUDGE_SEND_ERR(Flag, ?MSG_RETURN_ALIEN_JOIN_TEAM, ?ERROR_INVALID_PARAM),
    Detail = get_detail(Floor),
    ?JUDGE_SEND_ERR(Detail#alien_detail.open_state =:= 1, ?MSG_RETURN_ALIEN_JOIN_TEAM, ?ERROR_INVALID_PARAM),
    ?JUDGE_SEND_ERR(Detail#alien_detail.state =/= ?ALIEN_TEAM_STATE_2, ?MSG_RETURN_ALIEN_JOIN_TEAM, ?ERROR_INVALID_PARAM),
    ?JUDGE_SEND_ERR(erlang:length(Detail#alien_detail.fighters) + HeroNum =< maps:get(max_hero, Conf), ?MSG_RETURN_ALIEN_JOIN_TEAM, ?ERROR_INVALID_PARAM),
    SelfNum = get_self_hero_num(PlayerShow#player_show.id, Detail#alien_detail.fighters),
    ?JUDGE_SEND_ERR(SelfNum + HeroNum =< maps:get(player_max_hero, Conf), ?MSG_RETURN_ALIEN_JOIN_TEAM, ?ERROR_INVALID_PARAM).

get_self_hero_num(PlayerId, Fighters) ->
    lists:foldl(fun(Fighter, Acc) ->
        case Fighter#combat_hero.id =:= PlayerId of
            true -> Acc + 1;
            _ -> Acc
        end
    end, 0, Fighters).



request_main_info(PlayerShow) ->
    update_fighter(PlayerShow),
    PlayerId = PlayerShow#player_show.id,
    update_open_flag(PlayerId, true),
    Player = get_player(PlayerId),
    Respond = #'Proto50143001'{
        detail_list = get_detail_map_proto(),
        reward_list = get_reward_list_proto(Player#alien_player.reward_list),
        floor_list = lib_api:list_del_excess(Player#alien_player.floor_list)
    },
    %%?INFO("~p~n", [Respond]),
    lib_send:respond_to_player(PlayerShow#player_show.id, Respond).

request_join_team(PlayerShow, HeroBaseList, Floor) ->
    validation_join_team(PlayerShow, HeroBaseList, Floor),
    join_team(PlayerShow, HeroBaseList, Floor),
    Detail = get_detail(Floor),
    Respond = #'Proto50143002'{
        fighters = fighters_to_proto(Detail#alien_detail.fighters)
    },
    %%?INFO("~p~n", [Respond]),
    lib_send:respond_to_player(PlayerShow#player_show.id, Respond).

request_exit_team(PlayerId, HeroId, Floor) ->
    validation_exit_team(PlayerId, HeroId, Floor),
    exit_team(PlayerId, HeroId, Floor),
    Detail = get_detail(Floor),
    Respond = #'Proto50143003'{
        fighters = fighters_to_proto(Detail#alien_detail.fighters)
    },
    %%?INFO("~p~n", [Respond]),
    lib_send:respond_to_player(PlayerId, Respond).

request_draw_reward(PlayerId, Index) ->
    Player = get_player(PlayerId),
    ?JUDGE_SEND_ERR(erlang:length(Player#alien_player.reward_list) >= Index andalso Index > 0, ?MSG_RETURN_ALIEN_DRAW_REWARD, ?ERROR_INVALID_PARAM),
    Reward = lists:nth(Index, Player#alien_player.reward_list),
    DrawTick = Reward#alien_reward.get_tick + get_reward_cooling_time(Reward#alien_reward.floor),
    ?JUDGE_SEND_ERR(DrawTick =< lib_timer:unixtime(), ?MSG_RETURN_ALIEN_DRAW_REWARD, ?ERROR_INVALID_PARAM),
    RewardList = lists:filter(fun(K) ->
        K#alien_reward.floor =/= Reward#alien_reward.floor orelse K#alien_reward.get_tick =/= Reward#alien_reward.get_tick
    end, Player#alien_player.reward_list),
    put_player(PlayerId, Player#alien_player{
        reward_list = RewardList
    }),
    ?DEBUG("~p~n~p~n", [Player#alien_player.reward_list, RewardList]),
    player_apply(PlayerId, fun lib_player_alien:draw_reward/1, [Reward]),
    notify_event_info(PlayerId),
    Respond = #'Proto50143004'{
        reward_list = get_reward_list_proto(PlayerId)
    },
    lib_send:respond_to_player(PlayerId, Respond).

request_watch_fight(PlayerId, Floor) ->
    Detail = get_detail(Floor),
    lib_send:respond_to_player(PlayerId, Detail#alien_detail.fight_msg),
    lib_send:respond_to_player(PlayerId, Detail#alien_detail.result_msg).

request_close_interface(PlayerId) ->
    Player = get_player(PlayerId),
    put_player(Player#alien_player{
        on_show = false
    }).

request_convene(PlayerId, Floor) ->
    Detail = get_detail(Floor),
    Conf = tb_alien:get(Floor),
    ?JUDGE_SEND_ERR(Detail#alien_detail.state =:= ?ALIEN_TEAM_STATE_1, ?MSG_RETURN_ALIEN_CONVENE, ?ERROR_CLIENT_OPERATOR),
    ?JUDGE_SEND_ERR(lists:keymember(PlayerId, #combat_hero.id, Detail#alien_detail.fighters),
        ?MSG_RETURN_ALIEN_CONVENE, ?ERROR_CLIENT_OPERATOR),
    ?JUDGE_SEND_ERR(lib_timer:unixtime() >= Detail#alien_detail.convene_tick, ?MSG_RETURN_ALIEN_CONVENE, ?ERROR_CLIENT_OPERATOR),
    put_detail(Floor, Detail#alien_detail{
        convene_tick = lib_timer:unixtime() + maps:get(convene_cool, Conf, 0)
    }),
    notify_detail(),
%%    #{robot_name := RobotName} = tb_robot:get(Detail#alien_detail.robot_id),
%%    player_apply(PlayerId, fun lib_player_alien:convene/2, [Floor, RobotName]).
    broadcast(Floor, Detail#alien_detail.robot_id).

broadcast(Floor, RobotId) ->
    Create = lib_broadcast_api:create_broadcast(?ALIEN_BROAD),
    ShoutMsg0 = lib_broadcast_api:push_broad_arg(Create, ?BROAD_TYPE_NUM, Floor),
    ShoutMsg = lib_broadcast_api:push_broad_arg(ShoutMsg0, ?BROAD_TYPE_ROBOT_ID, RobotId),
    ?DEBUG("alien broadcast ~p~n", [ShoutMsg]),
    lib_broadcast_api:send_country_broadcast(get_country_id(), ShoutMsg).


sign_out(PlayerId) ->
    Player = get_player(PlayerId),
    put_player(Player#alien_player{
        on_show = false,
        on_line = false
    }).

sign_in(PlayerId) ->
    Player = get_player(PlayerId),
    put_player(Player#alien_player{
        on_line = true,
        count = 0
    }),
    player_apply(PlayerId, fun lib_player_task_new:process_update_task/3, [?COND_ALIEN_CHALLENGE, 0, Player#alien_player.count]),
    notify_event_info(PlayerId)
.

get_detail_map_proto() ->
    FloorList = tb_alien:get_list(),
    [detail_to_proto(get_detail(Floor)) || Floor <- FloorList]
.
detail_to_proto(Detail) ->
    NowTick = lib_timer:unixtime(),
    Conf = tb_alien:get(Detail#alien_detail.floor),
    RobotBase = Detail#alien_detail.hero_base,
    #'ProtoAlienDetail'{
        floor = Detail#alien_detail.floor,
        open_state = Detail#alien_detail.open_state,
        state = Detail#alien_detail.state,
        buff_list = Detail#alien_detail.buff_list,
        buff_refresh_tick = max(0, Detail#alien_detail.buff_refresh_tick - NowTick),
        robot_id = Detail#alien_detail.robot_id,
        hero_id = RobotBase#hero_base.robot_base_id,
        start_fight_time = max(0, Detail#alien_detail.build_up_tick + maps:get(start_time, Conf) - NowTick),
        fighters = fighters_to_proto(Detail#alien_detail.fighters),
        convene_time = max(0, Detail#alien_detail.convene_tick - NowTick),
        force = RobotBase#hero_base.force
    }.
fighters_to_proto(Fighters) ->
    lists:foldl(fun(Fighter, Acc) ->
        [lib_fight_parsing:fighter_to_proto(Fighter) | Acc]
    end, [], Fighters).

get_reward_list_proto(RewardList) ->
    NowTick = lib_timer:unixtime(),
    [#'ProtoAlienReward'{
        item = #'ProtoItemObj'{item_id = Reward#alien_reward.item_id, amount = Reward#alien_reward.amount},
        left_tick = max(Reward#alien_reward.get_tick + get_reward_cooling_time(Reward#alien_reward.floor) - NowTick, 0)
    } || Reward <- RewardList].

player_apply(PlayerId, Fun, Args) ->
    mod_server:async_apply(lib_player:get_pid(PlayerId), Fun, Args).

process_add_player_alien_challenge_times(Detail) ->
    PlayerIdList0 = [CombatHero#combat_hero.id || CombatHero <- Detail#alien_detail.fighters],
    PlayerIdList = lib_api:list_del_excess(PlayerIdList0),
    [
        begin
            case lib_player:is_player_process_alive(PlayerId) of
                true -> player_apply(PlayerId, fun lib_player_task_new:process_update_task/3, [?COND_ALIEN_CHALLENGE, 0, 1]);
                false -> player_add_count(PlayerId, 1)
            end
        end || PlayerId <- PlayerIdList]
.

