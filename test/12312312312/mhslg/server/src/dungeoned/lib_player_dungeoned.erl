%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_player_dungeoned).
-include("common.hrl").
-include("hero.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").
-include("dungeoned.hrl").
-include("ProtoClient_10134.hrl").
-include("inner_city.hrl").

-export([
    get_player_dungeoned/0,
    put_player_dungeoned/1,
    put_player_dungeoned/2,
    ets_init/0,
    build_index/0,
    player_dungeoned_handler/0
]).

%% API
-export([
    sign_in/0,
    update_state/4,
    update_floor/1,
    begin_fight/1,
    reset_every_day/0,
    reset_use_times/0,

    request_fight/1,
    request_reward/0,
    request_buy_times/0,
    request_rank_list/0,
    notify_info/0,

    season_index/0,
    test/0
]).

get_player_dungeoned() ->
    erlang:get(?ETS_PLAYER_DUNGEONED).

put_player_dungeoned(PlayerDungeoned) ->
    put_player_dungeoned(PlayerDungeoned, true).
put_player_dungeoned(PlayerDungeoned, IsSaveDb) ->
    lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_DUNGEONED),
    erlang:put(?ETS_PLAYER_DUNGEONED, PlayerDungeoned).

ets_init() ->
    ets:new(?ETS_PLAYER_DUNGEONED, [?ETS_KEY_POS(#player_dungeoned.id) | ?ETS_OPTIONS]).

build_index() ->
    mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_DUNGEONED, {?TUPLE_INT(id, 1)}, true).

player_dungeoned_handler() ->
    #player_handler{
        ets = ?ETS_PLAYER_DUNGEONED,
        table_name = ?DBPLAYER_DUNGEONED,
        table_player_field = <<"id">>,
        ets_init_func = fun ets_init/0,
        mongo_index_func = fun build_index/0,
        load_func = fun db_player_dungeoned:load_player_dungeoned/1,
        save_func = fun db_player_dungeoned:save_player_dungeoned/1,
        get_func = fun get_player_dungeoned/0,
        put_func = fun put_player_dungeoned/2
    }.

reset_use_times() ->
    PlayerDungeoned = get_player_dungeoned(),
    put_player_dungeoned(PlayerDungeoned#player_dungeoned{
        use_times = 0
    }),notify_info()
.

sign_in() ->
    check_season_update(),
    fetch_state().

fetch_state() ->
    try
        PlayerDungeoned = get_player_dungeoned(),
        ?JUDGE_RETURN(PlayerDungeoned#player_dungeoned.state =/= ?FIGHT_STATE_REWARD, 0),
        mod_dungeoned:async_apply(fun lib_dungeoned:player_state/1, [lib_player:player_id()])
    catch
        _:_  ->notify_info()
    end.

update_state(State, CombatId, CurFloor, Reward) ->
    try
        case State =:= ?FIGHT_STATE_REWARD of
            true -> lib_inner_city_api:update_building_state(?BUILDING_EXPEDITIONARY_FORCE_DEPARTMENT,?BUILDING_GET_ITEM);
            false -> skip
        end,
        PlayerDungeoned = get_player_dungeoned(),
        ?JUDGE_RETURN(PlayerDungeoned#player_dungeoned.state =/= ?FIGHT_STATE_REWARD, 0),
        %CurFloor = case State of ?FIGHT_STATE_FIGHTING -> PlayerDungeoned#player_dungeoned.cur_floor; _ -> 0 end,
        put_player_dungeoned(PlayerDungeoned#player_dungeoned{
            state = State,
            combat_id = CombatId,
            reward = Reward,
            cur_floor = CurFloor
        }),
        notify_info()
    catch
        _:_  -> ok
    end.

update_floor(CurFloor) ->
    try
        PlayerDungeoned = get_player_dungeoned(),
        put_player_dungeoned(PlayerDungeoned#player_dungeoned{
            cur_floor = CurFloor
        }),
        notify_info()
    catch
        _:_  -> ok
    end.

begin_fight(CombatId) ->
    PlayerDungeoned = get_player_dungeoned(),
    put_player_dungeoned(PlayerDungeoned#player_dungeoned{
        state = ?FIGHT_STATE_FIGHTING,
        combat_id = CombatId,
        use_times = PlayerDungeoned#player_dungeoned.use_times + 1
    }),
    lib_combat_queue_api:join_watching(CombatId, lib_player:get_player_base()),
    notify_info().


request_fight(Msg) ->
    #'Proto10134001'{hero_list = HeroIdList} = Msg,
    ?JUDGE_RETURN(lists:any(fun(Hero_id)-> lib_hero_assist:hero_is_assist(Hero_id) end,HeroIdList) =/= true,?ERROR_CLIENT_OPERATOR),
    HeroNumber = length(HeroIdList),
    ?JUDGE_RETURN(0 < HeroNumber, ?ERROR_HERO_NOT_EXISTENT),
    lists:foldl(fun(HeroId, Sets) ->
        ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
        ?JUDGE_RETURN(not sets:is_element(HeroId, Sets), ?ERROR_CLIENT_OPERATOR),
        sets:add_element(HeroId, Sets)
    end, sets:new(), HeroIdList),
    HeroList = lib_combat_queue_api:hero_id_list_to_fighters(HeroIdList),
    Conf = tb_magic_tower:get(season_index()),
    ?JUDGE_RETURN(lib_player:player_level() >= maps:get(open_level, Conf, 0), ?ERROR_CLIENT_OPERATOR),
    PlayerDungeoned = get_player_dungeoned(),
    HaveTimes = maps:get(free_time, Conf, []) + PlayerDungeoned#player_dungeoned.buy_times,
    ?JUDGE_RETURN(PlayerDungeoned#player_dungeoned.use_times < HaveTimes, ?ERROR_CLIENT_OPERATOR),
    Robots = combat_hero_list(),
    mod_dungeoned:async_apply(fun lib_dungeoned:fight/3, [lib_player:player_show(), HeroList, Robots]),
    lib_player_process:process_dungeoned_challenge(),
    lib_send:respond_to_client(?MSG_RETURN_DUNGEONED_FIGHT).

request_reward() ->
    PlayerDungeoned = get_player_dungeoned(),
    ?JUDGE_RETURN(PlayerDungeoned#player_dungeoned.state =:= ?FIGHT_STATE_REWARD, ?ERROR_CLIENT_OPERATOR),
    reward(PlayerDungeoned#player_dungeoned.reward),
    put_player_dungeoned(PlayerDungeoned#player_dungeoned{
        state = ?FIGHT_STATE_NOTHING,
        reward = maps:new(),
        cur_floor = 0
    }),
    mod_dungeoned:async_apply(fun lib_dungeoned:player_reward/1, [lib_player:player_id()]),
    notify_info(),
    lib_send:respond_to_client(?MSG_RETURN_DUNGEONED_REWARD),
    lib_inner_city_api:update_building_state(?BUILDING_EXPEDITIONARY_FORCE_DEPARTMENT,?BUILDING_LEISURE)
.

request_buy_times() ->
    Conf = tb_magic_tower:get(season_index()),
    PlayerDungeoned = get_player_dungeoned(),
    MaxBuyTimes = erlang:length(maps:get(buy_consume, Conf, [])),
    ?JUDGE_RETURN(PlayerDungeoned#player_dungeoned.buy_times < MaxBuyTimes, ?ERROR_CLIENT_OPERATOR),
    ItemConf = lists:nth(PlayerDungeoned#player_dungeoned.buy_times + 1, maps:get(buy_consume, Conf, [])),
    Item = lib_item_api:conf_item_to_pack_item(ItemConf),
    Ret = lib_player_pack:validate_remove(Item),
    ?PACK_IS_SUCCESS(Ret),
    lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_DUNGEONED_BUY_TIMES, PlayerDungeoned#player_dungeoned.buy_times + 1)),
    put_player_dungeoned(PlayerDungeoned#player_dungeoned{
        buy_times = PlayerDungeoned#player_dungeoned.buy_times + 1
    }),
    notify_info(),
    lib_send:respond_to_client(?MSG_RETURN_DUNGEONED_BUY_TIMES).

request_rank_list() ->
    mod_dungeoned:async_apply(fun lib_dungeoned:rank_list/2, [lib_player:player_id(), lib_player:player_show()]).

reward(RewardMap) ->
    ItemList = get_item_list(RewardMap),
    lib_player_pack:auto_insert(ItemList, #serial_obj{insert_serial_type = ?ADD_DUNGEONED_REWARD}).

get_item_list(RewardMap) ->
    maps:fold(fun(DropId, Num, Acc) ->
        Conf = tb_drop_reward:get(DropId),
        ItemId = maps:get(item_id, Conf),
        ItemAmount = maps:get(amount, Conf) * Num,
        [#item{
            item_id = ItemId,
            amount = ItemAmount
        } | Acc]

    end, [], RewardMap).

combat_hero_list() ->
    {FormerType, LatterType} = army_type(),
    ?INFO("~p ~p~n", [FormerType, LatterType]),
    Conf = tb_magic_tower:get(season_index()),
    lists:foldr(fun(Wave,List) ->
        RobotId = robot_id(Wave),
        Show = lib_robot_api:robot_player_show(RobotId),
        MonsterId = lib_random:rand_one(maps:get(monster_id_list,tb_robot:get(RobotId))),
        HeroBase = lib_robot_api:get_monster(MonsterId,FormerType,LatterType,RobotId),
        PropBase0 = lib_fight_prop:hero_base_to_prop_base(HeroBase),
        PropBase = PropBase0#prop_base{front_corps = FormerType, back_corps = LatterType},
        CombatHero = lib_combat_queue_api:to_combat_hero(Show, HeroBase, PropBase),
        Former = CombatHero#combat_hero.former,
        Latter = CombatHero#combat_hero.latter,
        [CombatHero#combat_hero{
            is_robot = true,
            former = Former#combat_army{type = FormerType},
            latter = Latter#combat_army{type = LatterType}}|List]
    end,[],lists:seq(1,maps:get(max_floor,Conf)))
.

%% 随机前军后军类型
army_type() ->
    Tick = lib_timer:current_zero_unixtime(),
    {StateMap, _} = rand:seed(exs64),
    FormerList = [?CORPS_TYPE_INFANTRY, ?CORPS_TYPE_CAVALRY],
    LatterList = [?CORPS_TYPE_ARCHER, ?CORPS_TYPE_MAGICIAN],
    {RandNumber1, State} = rand:uniform_s(erlang:length(FormerList), {StateMap, Tick}),
    {RandNumber2, _} = rand:uniform_s(erlang:length(LatterList), State),
    {lists:nth(RandNumber1, FormerList), lists:nth(RandNumber2, LatterList)}.


max_day() ->
    Conf = tb_magic_tower:get(season_index()),
    maps:get(max_day, Conf, []).

robot_id(Wave) ->
    NowDay = lib_season_and_days_api:get_season_day(),
    SeasonDay = case NowDay > max_day() of true -> max_day();false -> NowDay end,
    Season = season_index(),
    Key = (Season + 1) * 1000000 + SeasonDay * 1000 + Wave,
    maps:get(robot_id, tb_magic_tower_floor:get(Key)).



season_index() ->
    try
        Season = lib_season_and_days_api:get_season(),
        List = tb_magic_tower:get_list(),
        lists:foldl(fun(Index, _) ->
            case Season =< Index of
                true -> throw(Index);
                _ -> Index
            end
        end, 0, List)
    catch
        throw:ThrowIndex  -> ThrowIndex
    end
.



notify_info() ->
    PlayerDungeoned = get_player_dungeoned(),
    {FormerType, LatterType} = army_type(),
    Notify = #'Proto80134003'{
        state = PlayerDungeoned#player_dungeoned.state,
        combat_id = PlayerDungeoned#player_dungeoned.combat_id,
        use_times = PlayerDungeoned#player_dungeoned.use_times,
        buy_times = PlayerDungeoned#player_dungeoned.buy_times,
        cur_floor = PlayerDungeoned#player_dungeoned.cur_floor,
        former_type = FormerType,
        latter_type = LatterType
    },
    lib_send:respond_to_client(Notify)
.

check_season_update() ->
    try
        PlayerDungeoned = get_player_dungeoned(),
        Season = lib_season_and_days_api:get_season(),
        ?JUDGE_RETURN(Season =/= PlayerDungeoned#player_dungeoned.cur_season, 0),
        put_player_dungeoned(PlayerDungeoned#player_dungeoned{
            cur_season = Season,
            use_times = 0,
            buy_times = 0,
            state = 0,
            combat_id = 0,
            reward = maps:new()
        })
    catch
        _:_  -> ok
    end.

reset_every_day() ->
    PlayerDungeoned = get_player_dungeoned(),
    put_player_dungeoned(PlayerDungeoned#player_dungeoned{
        use_times = 0,
        buy_times = 0
    }).

test() ->
    [Robots|_] = combat_hero_list(),
    ?INFO("Robots ~p",[Robots])
.