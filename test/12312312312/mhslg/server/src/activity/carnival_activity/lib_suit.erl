%%%-------------------------------------------------------------------
%%% @author yuexiao
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 8月 2021 16:31
%%%-------------------------------------------------------------------
-module(lib_suit).
-author("yuexiao").

-include("common.hrl").
-include("ProtoClient_10150.hrl").
-include("activity.hrl").
-include("activity_player.hrl").

-define(STATE_NO_RECEIVE,   0).
-define(STATE_CAN_RECEIVE,  1).
-define(STATE_RECEIVED,     2).

%%-include("").
%% API
-export([
%%    check_activity_open/0,
    data_to_bson/1,
    bson_to_data/1,
    tips/1,
    process_recharge/2,

    request_info/1,
    request_receive/1
]).

%活动已充值数目，累计充值数目，各个奖励物品id和领取状态

bson_to_data(Bson) ->
  BsonGradeList = ?BSON_LIST(Bson, grade_map),

  GradeMap =
    lists:foldl(fun(BsonGrade, Map) ->
      Grade = #mars_suit_grade{
        index = ?BSON_INT(BsonGrade, index),
        recharge_number = ?BSON_INT(BsonGrade, recharge_number),
        state = ?BSON_INT(BsonGrade, state)
      },
      maps:put(Grade#mars_suit_grade.index, Grade, Map)
                end, maps:new(), BsonGradeList),

  #cumulatice_recharge{
    acc = ?BSON_INT(Bson, acc),
    grade_map = GradeMap
  }
.
data_to_bson(Data) ->
  GradeMap = Data#cumulatice_recharge.grade_map,
  BsonGradeList =
    maps:fold(fun(_, Grade, List) ->
      BsonGrade = #{
        ?BSONSET_INT(index, Grade#mars_suit_grade.index),
        ?BSONSET_INT(recharge_number, Grade#mars_suit_grade.recharge_number),
        ?BSONSET_INT(state, Grade#mars_suit_grade.state)
      },
      [BsonGrade | List]
              end, [], GradeMap),

  #{
    ?BSONSET_INT(acc, Data#cumulatice_recharge.acc),
    ?BSONSET_LIST(grade_map, BsonGradeList)
  }
.

grade_to_proto(Grade) when is_record(Grade, mars_suit_grade) ->
  #'ProtoMarsSuitGrade'{
    index = Grade#mars_suit_grade.index,
    recharge_number = Grade#mars_suit_grade.recharge_number,
    state = Grade#mars_suit_grade.state
  }
.

tips(UID) ->
  Data = lib_player_activity:get_activity_data(UID),
  GradeMap = Data#cumulatice_recharge.grade_map,
  maps:fold(
    fun(_, R, Acc) ->
      case R#mars_suit_grade.state of
        ?STATE_CAN_RECEIVE -> Acc + 1;
        _ -> Acc
      end
    end, 0, GradeMap)
.

grade_info(UID, Index) ->
  Data = lib_player_activity:get_activity_data(UID),
  GradeMap = Data#cumulatice_recharge.grade_map,
  maps:get(Index, GradeMap, #mars_suit_grade{index = Index})
.
get_acc(UID) ->
  Data = lib_player_activity:get_activity_data(UID),
  Data#cumulatice_recharge.acc
.
update_acc(UID, Acc) ->
  Data = lib_player_activity:get_activity_data(UID),
  lib_player_activity:update_activity_data(UID, Data#cumulatice_recharge{acc = Data#cumulatice_recharge.acc + Acc})
.
update_grade(UID, Grade) when is_record(Grade, mars_suit_grade) ->
  Data = lib_player_activity:get_activity_data(UID),
  GradeMap = Data#cumulatice_recharge.grade_map,
  NewGradeMap = maps:put(Grade#mars_suit_grade.index, Grade, GradeMap),
  lib_player_activity:update_activity_data(UID, Data#cumulatice_recharge{grade_map = NewGradeMap})
.

get_recharge_number(UID, Index) ->
  Grade = grade_info(UID, Index),
  Grade#mars_suit_grade.recharge_number
.

set_recharge_number(UID, Index, Number) ->
  Grade = grade_info(UID, Index),
  update_grade(UID, Grade#mars_suit_grade{recharge_number = Number})
.

get_state(UID, Index) ->
  Grade = grade_info(UID, Index),
  Grade#mars_suit_grade.state
.

set_state(UID, Index, State) ->
  Grade = grade_info(UID, Index),
  update_grade(UID, Grade#mars_suit_grade{state = State})
.

is_have_conf(ConfIndex) ->
  tb_godofwar_suit:get(ConfIndex) =/= false
.
is_have_conf(ConfIndex, Index) ->
  Conf = tb_godofwar_suit:get(ConfIndex),
  Conf =/= false andalso maps:is_key(Index, Conf)
.

grade_rewards(ConfIndex, Index) ->
  Conf = tb_godofwar_suit:get(ConfIndex),
  GradeConf = maps:get(Index, Conf),
  maps:get(rewards, GradeConf, [])
.

process_recharge(Activity, Gold) ->
  UID = lib_activity_api:uid(Activity),
  ConfIndex = Activity#activity.conf_index,

  try
    ?JUDGE_RETURN(is_have_conf(ConfIndex), -1),
    GradeMap = tb_godofwar_suit:get(ConfIndex),
    LastTips = tips(UID),
    update_acc(UID, Gold),
    lib_common:map_map(fun(Index, GradeConf) ->
      ?JUDGE_CONTINUE(get_state(UID, Index) =:= ?STATE_NO_RECEIVE),
      RechargeNumber = get_recharge_number(UID, Index) + Gold,
      NeedRecharge = maps:get(need_recharge, GradeConf, 0),

      set_recharge_number(UID, Index, min(NeedRecharge, RechargeNumber)),
      ?JUDGE_CONTINUE(RechargeNumber >= NeedRecharge),
      set_state(UID, Index, ?STATE_CAN_RECEIVE)
                       end, GradeMap),
    case tips(UID) of
      LastTips -> skip;
      _ -> lib_player_activity:update_activity(lib_activity_api:tid(UID), [Activity])
    end
  catch
    throw: {error, _} -> skip
  end
.

request_info(Msg) ->
  UID = lib_activity_api:uid(Msg#'Proto10150105'.uid),
  Activity = lib_player_activity:fetch_activity_info(UID),
  ?JUDGE_RETURN(Activity =/= false, ?ERROR_ACTIVITY_NO_EXIST),

  ConfIndex = Activity#activity.conf_index,
  ?JUDGE_RETURN(is_have_conf(ConfIndex), ?ERROR_CONFIG_NOT_EXISTENT),

  GradeMap = tb_godofwar_suit:get(ConfIndex),
  GradeList = maps:to_list(GradeMap),
  ProtoGradeList = [grade_to_proto(grade_info(UID, Index)) || {Index, _GradeConf} <- GradeList],

  Respond = #'Proto50150105'{
    act = lib_activity_api:activity_to_proto(Activity),
    acc = get_acc(UID),
    grade_list = ProtoGradeList
  },
  lib_send:respond_to_client(Respond),
  ?DEBUG("~p", [Respond])
.

request_receive(Msg) ->
  ProtoUID = Msg#'Proto10150102'.uid,
  UID = lib_activity_api:uid(ProtoUID),
  Index = Msg#'Proto10150102'.grade,

  Activity = lib_player_activity:fetch_activity_info(UID),
  ?JUDGE_RETURN(Activity =/= false, ?ERROR_ACTIVITY_NO_EXIST),

  ConfIndex = Activity#activity.conf_index,
  ?JUDGE_RETURN(is_have_conf(ConfIndex, Index), ?ERROR_CONFIG_NOT_EXISTENT),

  ?JUDGE_RETURN(get_state(UID, Index) =:= ?STATE_CAN_RECEIVE, ?ERROR_CLIENT_OPERATOR),
  set_state(UID, Index, ?STATE_RECEIVED),

  ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(grade_rewards(ConfIndex, Index)),
  lib_player_pack:auto_insert(ItemObjList, ?INSERT_SERIAL(?ADD_ACC_RECHARGE, Index)),

  TID = lib_activity_api:tid(Activity),
  lib_player_activity:update_activity(TID, [Activity]),

  Respond = #'Proto50150102'{
    uid = ProtoUID,
    grade = Index
  },
  lib_send:respond_to_client(Respond)
.






