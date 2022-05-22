%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_player_alien).
-include("common.hrl").
-include("hero.hrl").
-include("chat.hrl").
-include("alien.hrl").
-include("ProtoClient_10143.hrl").

%% API
-export([
    sign_in/0,
    sign_out/0,
    request_main_info/0,
    request_join_team/1,
    request_exit_team/1,
    request_draw_reward/1,
    request_watch_fight/1,
    request_close_interface/0,
    request_convene/1,

    draw_reward/1,
    convene/2
]).

request_main_info() ->
    mod_alien:async_apply(fun lib_alien:request_main_info/1, [lib_player:player_show()]).

request_join_team(Msg) ->
    ?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_121), ?INFO("功能未开启")),
    #'Proto10143002'{floor = Floor, hero_id = HeroIdList} = Msg,
    ?JUDGE_RETURN(lists:all(fun lib_hero_api:is_have_hero/1, HeroIdList), ?ERROR_INVALID_PARAM),
    HeroBaseList = [lib_hero_api:hero_base_info(HeroId) || HeroId <- HeroIdList],
    mod_alien:async_apply(fun lib_alien:request_join_team/3, [lib_player:player_show(), HeroBaseList, Floor]).

request_exit_team(Msg) ->
    #'Proto10143003'{floor = Floor, hero_id = HeroId} = Msg,
    mod_alien:async_apply(fun lib_alien:request_exit_team/3, [lib_player:player_id(), HeroId, Floor]).

request_draw_reward(Msg) ->
    #'Proto10143004'{index = Index} = Msg,
    ?DEBUG("alien draw_reward ~p~n", [Index]),
    mod_alien:async_apply(fun lib_alien:request_draw_reward/2, [lib_player:player_id(), Index]).

request_watch_fight(Msg) ->
    #'Proto10143005'{floor = Floor} = Msg,
    mod_alien:async_apply(fun lib_alien:request_watch_fight/2, [lib_player:player_id(), Floor]).

request_close_interface() ->
    mod_alien:async_apply(fun lib_alien:request_close_interface/1, [lib_player:player_id()]).

request_convene(Msg) ->
    #'Proto10143009'{floor = Floor} = Msg,
    mod_alien:async_apply(fun lib_alien:request_convene/2, [lib_player:player_id(), Floor]).

sign_out() ->
    mod_alien:async_apply(fun lib_alien:sign_out/1, [lib_player:player_id()]).

sign_in() ->
    mod_alien:async_apply(fun lib_alien:sign_in/1, [lib_player:player_id()]).

draw_reward(Reward) ->
    ItemConf = tb_item:get(Reward#alien_reward.item_id),
    MainType = maps:get(main_type, ItemConf, 0),
    PackItems =
        case MainType of
            ?ITEM_MAIN_TYPE_FIXED ->
                lib_use_item:process_use_fixed_gift(Reward#alien_reward.item_id, Reward#alien_reward.amount);
            ?ITEM_MAIN_TYPE_RANDOM ->
                lib_use_item:process_use_random_gift(Reward#alien_reward.item_id, Reward#alien_reward.amount);
            ?ITEM_MAIN_TYPE_HYBRID ->
                lib_use_item:process_use_hybrid_gift(Reward#alien_reward.item_id, Reward#alien_reward.amount);
            _ ->
                [#item{item_id = Reward#alien_reward.item_id, amount = Reward#alien_reward.amount}]
        end,
    lib_player_pack:auto_insert(PackItems, #serial_obj{insert_serial_type = ?ADD_ALIEN_REWARD, insert_sub_type = Reward#alien_reward.item_id}).

convene(Floor, RobotName) ->
    Conf = tb_alien:get(Floor),
    ConveneStr = io_lib:format(maps:get(convene, Conf, "~p"), [RobotName]),
    lib_player_chat:send_chat(?CHANNEL_COUNTRY, ConveneStr).