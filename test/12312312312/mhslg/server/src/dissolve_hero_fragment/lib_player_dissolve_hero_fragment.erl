%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: dissolve_hero_fragment
%%% Created on : 2020/12/31 16:47
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%% 分解英雄碎片
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_dissolve_hero_fragment).
-author("yc").
-include("common.hrl").
-include("dissovle_hero_fragment.hrl").
-include("ProtoClient_10116.hrl").
-include("inner_city.hrl").
-include("nobility.hrl").

%% API
-export([
  ets_init/0,
  build_index/0,
  get_player_dissolve/0,
  put_player_dissolve/2,
  player_dissolve_handler/0,
  get_time/0  %%获取累计分解次数
]).

%% API
-export([
  else_soul/0,  %%额外将魂接口
  else_time/0  %%额外次数接口
]).

%% API
-export([
  do_change_state/1, %%改变状态
  do_dissolve_fragment/1, %%分解碎片
  do_interface/1  %%开启界面
]).

ets_init() ->
  ets:new(?ETS_PLAYER_DISSOVLE_HERO_FUAGMENT, [?ETS_KEY_POS(#player_dissolve.id) | ?ETS_OPTIONS]).

build_index() ->
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_DISSOLVE_HERO_FRAGMENT, {?TUPLE_INT(id, 1)}, true)
.

player_dissolve_handler() ->
  #player_handler{
    ets = ?ETS_PLAYER_DISSOVLE_HERO_FUAGMENT,
    table_name = ?DBPLAYER_DISSOLVE_HERO_FRAGMENT,
    table_player_field = <<"id">>,
    ets_init_func = fun lib_player_dissolve_hero_fragment:ets_init/0,
    mongo_index_func = fun lib_player_dissolve_hero_fragment:build_index/0,
    load_func = fun db_player_dissolve_hero_fragment:load_dissolve_record/1,
    save_func = fun db_player_dissolve_hero_fragment:save_dissolve_record/1,
    get_func = fun lib_player_dissolve_hero_fragment:get_player_dissolve/0,
    put_func = fun lib_player_dissolve_hero_fragment:put_player_dissolve/2
  }.

get_player_dissolve() ->
  get(?ETS_PLAYER_DISSOVLE_HERO_FUAGMENT).


put_player_dissolve(Player_dissolve_dict,IsSaveDb) ->
  lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_DISSOVLE_HERO_FUAGMENT),
  put(?ETS_PLAYER_DISSOVLE_HERO_FUAGMENT, Player_dissolve_dict).

do_interface(_Msg) ->
  #'player_dissolve'{dissolve_dict = Dict} = get_player_dissolve(),
  List = dict:fold(fun(Key,Val,Acc) ->
    [#'ProtoPairLong'{key = Key,value = Val}|Acc]
    end,[],Dict),
  Respond = #'Proto50116052'{state = List},
  ?DEBUG("Respond is ~p",[Respond]),
  lib_send:respond_to_client(Respond)
.

do_change_state(Msg) ->
  #'ProtoPairLong'{key = ItemID,value = STATE} = Msg#'Proto10116050'.item_id_state,
  MainType = ItemID div 1000000,
  SubType = (ItemID div 1000) rem 1000,
  ?JUDGE_RETURN(MainType == ?MAIN_TYPE andalso SubType == ?SUB_TYPE,?ERROR_CLIENT_OPERATOR),

  Player_dissolve = #'player_dissolve'{dissolve_dict = Dict} = get_player_dissolve(),
  New_dict = dict:store(ItemID,STATE,Dict),
  Player_Id = lib_player:player_id(),
  New_record = Player_dissolve#'player_dissolve'{id = Player_Id,dissolve_dict = New_dict},
  put_player_dissolve(New_record,true),

  #'player_dissolve'{dissolve_dict = Client_Dict} = get_player_dissolve(),
  List = dict:fold(fun(Key,Val,Acc) ->
    [#'ProtoPairLong'{key = Key,value = Val}|Acc]
                   end,[],Client_Dict),
  Respond = #'Proto50116050'{item_id_state = List},
  ?DEBUG("Respond is ~p",[Respond]),
  lib_send:respond_to_client(Respond)
.

do_dissolve_fragment(Msg) ->
  ?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_107), ?INFO("功能未开启")),
  State = Msg#'Proto10116051'.item_id_state,
  #'ProtoPairLong'{key = ItemId,value = Times} = State,
  #'player_dissolve'{dissolve_dict = Dict,time = Time} = Data = get_player_dissolve(),
  MainType = ItemId div 1000000,
  SubType = (ItemId div 1000) rem 1000,
  ?JUDGE_RETURN(MainType == ?MAIN_TYPE andalso SubType == ?SUB_TYPE,?ERROR_CLIENT_OPERATOR),
  State_checkout = ?DICT_FETCH(ItemId,Dict,0),
  ?JUDGE_RETURN(State_checkout =/= ?ONE ,?ERROR_CLIENT_OPERATOR),

  Conf = tb_item:get(ItemId),
  Hero_id = maps:get(param1,Conf),
  Hero_Conf  = tb_hero:get(Hero_id),
  Quality = maps:get(quality,Hero_Conf),  %%此品质与列表顺序由策划定的完全相同
  Cost_for_one = lists:nth(Quality,maps:get(jsonvalue, tb_const:get(decompose_use))),
  Silver_id = ?SILVER,
%%  case Times of
%%    Times ->
      Amount = lib_player_pack:count_by_id(ItemId),
      ?JUDGE_RETURN(Amount >= Times,?ERR_PACK_AMOUNT),
      Silver_amount = lib_player_pack:count_by_id(Silver_id),
      ?JUDGE_RETURN(Silver_amount >= (Times * Cost_for_one),?ERR_MONEY_AMOUNT),

      Prime_soul = maps:get(param2, tb_item:get(ItemId)),
      Final_soul = lists:foldl(fun(_Key,Acc) ->
        final_soul(Prime_soul) + Acc  %%单次最终将魂
      end,0,lists:seq(1,Times)),
      SoulItem = #item_obj{item_id = ?SOUL,amount = util:to_integer(Final_soul)},  %%将魂item

      PackItems = process_use_random_dissolve(ItemId, Times), %%随机道具奖励
      List = [[ItemObj#item_obj.item_id,ItemObj#item_obj.amount]|| ItemObj <- PackItems],
      NewPackItems = lib_item_api:conf_item_list_to_item_obj_list(lib_item_api:merge_conf_item_list(List)), %% 合并相同道具
      Final_packItem = [SoulItem|NewPackItems],  %%所有加入背包道具

      Cost_item = [[Silver_id,(Times * Cost_for_one)],[ItemId,Times]],
      ?DEBUG("cost item ~p ",[Cost_item]),
      Item = lib_item_api:conf_item_list_to_pack_item_list(Cost_item),
      Ret = lib_player_pack:validate_remove(Item),
      ?PACK_IS_SUCCESS(Ret),
      lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE__DISSOLVE_HERO_FRAGMENT, 0)),

      Ret = lib_player_pack:auto_insert(Final_packItem, ?INSERT_SERIAL(?ADD_DISSOLVE_HERO_FRAGMENT, 0)),
      ?JUDGE_RETURN(Ret =:= true, Ret),

      Item_dict = lists:foldl(fun(Key,Acc) ->
        #item_obj{item_id = Item_list_new,amount = Amount_list} = Key,
        case dict:is_key(Item_list_new,Acc) of
          true ->
            Item_from_dict = dict:fetch(Item_list_new,Acc),
            Old_amount = Item_from_dict#item_obj.amount,
            dict:store(Item_list_new,Item_from_dict#item_obj{amount = Old_amount + Amount_list},Acc);
          false ->
            dict:store(Item_list_new,Key,Acc)
        end
        end,dict:new(),PackItems),
      List_client = dict:fold(fun(_key,Val,Acc) ->
        [Val|Acc]
          end,[],Item_dict),

      Final_Proto_item = [lib_item_api:conf_item_to_proto_obj([?SOUL,util:to_integer(Final_soul)])|lib_item_api:item_obj_list_to_proto_obj_list(List_client)],
      Respond = #'Proto50116051'{item_list = Final_Proto_item},

      put_player_dissolve(Data#'player_dissolve'{time = Time + Times},true),%%记录次数
      lib_player_process:process_dissolve_hero_fragment(Times),

%%      ?DEBUG("Respond is ~p",[Respond]),
      lib_send:respond_to_client(Respond)
%%    ;
%%    ?ONE ->
%%      Amount = lib_player_pack:count_by_id(ItemId),
%%      ?JUDGE_RETURN(Amount >= ?ONE,?ERR_PACK_AMOUNT),
%%      Silver_amount = lib_player_pack:count_by_id(Silver_id),
%%      ?JUDGE_RETURN(Silver_amount >= (?ONE * Cost_for_one),?ERR_MONEY_AMOUNT),
%%
%%      Prime_soul = maps:get(param2, tb_item:get(ItemId)),
%%      Final_soul = lists:foldl(fun(_Key,Acc) ->
%%        final_soul(Prime_soul) + Acc  %%单次最终将魂
%%                               end,0,lists:seq(1,Times)),
%%      SoulItem = #item_obj{item_id = ?SOUL,amount = util:to_integer(Final_soul)},  %%将魂item
%%
%%      PackItems = process_use_random_dissolve(ItemId, Times), %%随机道具奖励
%%      ?DEBUG("PackItems is ~p ",[PackItems]),
%%      Final_packItem = [SoulItem|PackItems],  %%所有加入背包道具
%%
%%      Cost_item = [[Silver_id,(Times * Cost_for_one)],[ItemId,Times]],
%%      ?DEBUG("cost item ~p ",[Cost_item]),
%%      Item = lib_item_api:conf_item_list_to_pack_item_list(Cost_item),
%%      ?DEBUG("conf_item_list_to_pack_item_list item ~p ",[Item]),
%%      Ret = lib_player_pack:validate_remove(Item),
%%      ?PACK_IS_SUCCESS(Ret),
%%      lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE__DISSOLVE_HERO_FRAGMENT, 0)),
%%
%%      Ret = lib_player_pack:auto_insert(Final_packItem, ?INSERT_SERIAL(?ADD_DISSOLVE_HERO_FRAGMENT, 0)),
%%      ?JUDGE_RETURN(Ret =:= true, Ret),
%%
%%      Item_dict = lists:foldl(fun(Key,Acc) ->
%%        ?DEBUG("Key is ~p",[Key]),
%%        Item_list_new = Key#item_obj.item_id,
%%        Amount_list = Key#item_obj.amount,
%%        case dict:is_key(Item_list_new,Acc) of
%%          true ->
%%            Item_from_dict = dict:fetch(Item_list_new,Acc),
%%            Old_amount = Item_from_dict#item_obj.amount,
%%            dict:store(Item_list_new,Item_from_dict#item_obj{amount = Old_amount + Amount_list},Acc);
%%          false ->
%%            dict:store(Item_list_new,Key,Acc)
%%        end
%%                              end,dict:new(),PackItems),
%%      List_client = dict:fold(fun(_key,Val,Acc) ->
%%        [Val|Acc]
%%                              end,[],Item_dict),
%%
%%      Final_Proto_item = [lib_item_api:conf_item_to_proto_obj([?SOUL,util:to_integer(Final_soul)])|lib_item_api:item_obj_list_to_proto_obj_list(List_client)],
%%
%%      lib_nobility_api:add_condition_num(?DISSOLVE_HERO_FRAGMENT,?ONE), %%记录次数
%%
%%      Respond = #'Proto50116051'{item_list = Final_Proto_item},
%%%%      ?DEBUG("Respond is ~p",[Respond]),
%%      lib_send:respond_to_client(Respond)
%%    ;
%%    _ -> ?RETURN(?ERROR_CLIENT_OPERATOR)
%%  end
  .



process_use_random_dissolve(GiftId, UseAmount) ->
  Conf = tb_item:get(GiftId),
  [RewardId,Prime_Time] = maps:get(param_json, Conf, []),
  ?JUDGE_RETURN(RewardId > 0, ?ERROR_CONFIG_NOT_EXISTENT),
  lists:foldl(fun(_Key,List) ->
        Final_time = finally_item_time(Prime_Time),
        PackItems = get_rand_good(RewardId,Final_time),
        lists:foldl(fun(PackItem0, Acc) ->
            [PackItem0#item_obj{amount = PackItem0#item_obj.amount} | Acc]
        end, [], PackItems) ++ List
  end,[],lists:seq(1,UseAmount)).


get_rand_good(DropId,Time) ->
  DropGroupList = lib_config_api:get_hero_dissolve_fragment_group_list(DropId),
  _list = lists:foldl(fun(_Key,Val) ->
   List = lists:foldl(fun(ID, Acc) ->
      try
        Conf = tb_hero_fragment_group:get(ID),
        DropRand = maps:get(drop_rate, Conf, 0),
        case rand:uniform() =< DropRand of
          true ->
            PackItem = get_rand_good_by_drop_id(ID),
            [PackItem | Acc];
          _ ->
            Acc
        end
      catch
        _:SelPackItem -> [SelPackItem | Acc]
      end
                end, [], DropGroupList),
    List ++ Val
    end,[],lists:seq(1,Time)).

get_rand_good_by_drop_id(RewardId) ->
  DropRewardList = lib_config_api:get_hero_dissolve_fragment_reward_list(RewardId),
  TotalWeight = lib_config_api:get_hero_dissolve_fragment_weight(RewardId),
  get_rand_good_by_drop_weight(TotalWeight, DropRewardList).
get_rand_good_by_drop_weight(TotalWeight, DropRewardList) ->
  RandWeight = util:rand(TotalWeight) - 1,
  lists:foldl(fun(ID, WeightAcc) ->
    #{'item_id' := ItemId, 'item_amount' := ItemAmount, 'weight' := Weight} = tb_hero_fragment_reward:get(ID),
    case RandWeight < (WeightAcc + Weight) of
      true ->
        throw(#item_obj{item_id = ItemId, amount = ItemAmount});
      false ->
        WeightAcc + Weight
    end
              end, 0, DropRewardList).


%%最终将魂
final_soul(Prime_soul) ->
  Prime_soul + n_percent(Prime_soul) + else_soul()
.
%%占星台建筑加成
n_percent(Prime_soul) ->
  (lib_inner_city_api:building_level(?BUILDING_GENERAL_STATION) )* 0.1 *Prime_soul
.
%%其他未知活动增加将魂接口
else_soul() ->
  0
.

finally_item_time(Times) ->
  Times + else_time()
.
%%其他未知活动增加抽奖次数接口
else_time() ->
  0
.

get_time() ->
 Data = get_player_dissolve(),
  Data#'player_dissolve'.time
.












