%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_fight
%%% Created on : 2020/8/15 0015 11:25
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		玩家战斗相关的技能和属性等信息的处理模块
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_fight).
-author("glendy").
-include("common.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10102.hrl").
-include("player.hrl").
%% API
-export([
    request_fight/1,
    fight_record/1,

    request_kill_rank/1,
    request_join_watching/1,
    request_quit_watching/1,
    request_fight_record/1,
    request_test_fight_record/0,
    delete_test_fight_record/0
]).

request_fight(Msg) ->
    #'Proto10102001'{type = Type, hero_list = HeroList} = Msg,
    lists:foldl(fun(HeroId, Sets) ->
        ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
        ?JUDGE_RETURN(sets:is_element(HeroId, Sets), ?ERROR_CLIENT_OPERATOR),
        sets:add_element(HeroId, Sets)
    end, sets:new(), HeroList),
    ?INFO("request_fight ~p~n", [Type]),
    fight(Type, Msg),
    lib_send:respond_to_client(?MSG_RETURN_BEGIN_FIGHT).

request_kill_rank(Msg) ->
    #'Proto10102006'{combat_id = CombatId} = Msg,
    ?JUDGE_RETURN(CombatId > 0, ?ERROR_CLIENT_OPERATOR),
    lib_combat_queue_api:request_rank(CombatId, lib_player:player_id()).

request_join_watching(Msg) ->
    #'Proto10102008'{combat_id = CombatId} = Msg,
    ?JUDGE_RETURN(CombatId > 0, 0),
    lib_combat_queue_api:join_watching(CombatId, lib_player:get_player_base()),
    lib_send:respond_to_client(?MSG_RETURN_FIGHT_IN_WATCHING).

request_quit_watching(Msg) ->
    #'Proto10102009'{combat_id = CombatId} = Msg,
    ?JUDGE_RETURN(CombatId > 0, 0),
    lib_combat_queue_api:quit_watching(CombatId, lib_player:player_id()),
    lib_send:respond_to_client(?MSG_RETURN_FIGHT_OUT_WATCHING).

fight(Type, _Msg) ->
    ?ERROR("request_fight error type:~p~n", [Type]),
    throw({error, ?ERROR_CLIENT_OPERATOR}).

request_fight_record(Msg) ->
    #'Proto10102010'{record_id = RecordId} = Msg,
    fight_record(RecordId).

request_test_fight_record() ->
    Player_base = lib_player:get_player_base(),
    Proto = maps:fold(fun(_Key,Value,List) ->
        [#'ProtoRecordID'{
            tick = Value#fight_record.tick,
            id = Value#fight_record.record_id,
            type = Value#fight_record.fight_type
        }|List]
    end,[],Player_base#player_base.fight_record),
    Respond = #'Proto50102011'{info = Proto},
    lib_send:respond_to_client(Respond),
    ?DEBUG("request_test_fight_record ~p",[Respond])
.

delete_test_fight_record() ->
    Player_base = lib_player:get_player_base(),
    maps:fold(fun(_Key,Value,_List) ->
        RecordId = Value#fight_record.record_id,
        db_fight:delete_fight_record(RecordId)
    end,[],Player_base#player_base.fight_record),
    lib_player:put_player_base(Player_base#player_base{fight_record = maps:new()},true),
    lib_send:respond_to_client(?MSG_RETURN_DELETE_TEST_FIGHT_RECORD),
    ?DEBUG("delete_test_fight_record ")
.

fight_record(RecordId) ->
    Data = db_fight:load_fight_record(RecordId),
    Sid = lib_player:player_sid(),
    lib_send:send_by_sid(Sid, Data#callback_data0.msg),
    lib_send:send_by_sid(Sid, Data#callback_data0.result_msg).