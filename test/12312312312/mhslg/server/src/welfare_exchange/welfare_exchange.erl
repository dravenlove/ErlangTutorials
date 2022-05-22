%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Sep 2021 2:18 PM
%%%-------------------------------------------------------------------
-module(welfare_exchange).
-author("123").
-include("player.hrl").
-include("ProtoClient_10157.hrl").
-include("common.hrl").
-include("ProtoPublic.hrl").
-include("welfare_exchange.hrl").
-include("pack.hrl").


%% API
-export([
  player_welfare_exchange_handler/0,
  request_welfare_exchange_trigger/1,      %%请求福利兑换触发
  request_welfare_exchange_lists/0,        %%请求福利兑换界面列表
  request_welfare_exchange_task_finish/1,  %%请求福利兑换完成事件
  reset_all/0,                             %%初始化全部数据
  sign_in/0,                             %%上线时提取上次下线的福利兑换数据
  sign_out/0,                            %%下线时保存福利兑换数据
  welfare_exchange_icon/0,                  %%福利兑换图标
  recharge_money/1
]).



get_player_welfare_exchange()->
  erlang:get(?ETS_WELFARE_EXCHANGE).

put_player_welfare_exchange(Welfare_exchange)
  when is_record(Welfare_exchange, player_welfare_exchange)  ->
  put_player_welfare_exchange(Welfare_exchange,true).


put_player_welfare_exchange(Welfare_exchange,IsSaveDb) ->
  lib_player:check_update_ets_cache(IsSaveDb, ?ETS_WELFARE_EXCHANGE),
  erlang:put(?ETS_WELFARE_EXCHANGE, Welfare_exchange).

ets_init() ->
  ets:new(?ETS_WELFARE_EXCHANGE, [?ETS_KEY_POS(#player_welfare_exchange.id) | ?ETS_OPTIONS]).

build_index() ->
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_WELFARE_EXCHANGE, {?TUPLE_INT(id, 1)}, true).

reset_all() ->
  Welfare_exchange = get_player_welfare_exchange(),
  put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{
    id = 0,             welfare_exchange_state = [0,0,0,0],
    welfare_exchange_exist_time = [0,0,0,0],
    welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],
    welfare_exchange_last_time=[0,0,0,0],icon_state = 2
  }).

sign_in() ->
  Welfare_exchange = get_player_welfare_exchange(),%%获取Ets进程
  Sign_out_time = Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,%%获取hrl文件的时间列表
  Time_difference=lists:map(fun(X)->%%获取事件存在与否列表
    case X=<0 of
      true ->
        0;
      false ->
        1
    end
    end
                             ,lists:map(fun(X) -> (X-get_os_time()) end,Sign_out_time)),%%获取现在系统时间和事件结束时间的时间差列表
  case lists:sum(Time_difference) =:=0 of %%判断事件状态
    true -> %%没有事件存在了
      put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = [0,0,0,0],
        welfare_exchange_exist_time = [0,0,0,0] ,welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],icon_state = 2}),
      Respond = #'Proto80157004'{type = 2,residual_time=0};
    false -> %%还有至少一件事件存在
      Ago_event=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,%%获取下线的时候的事件状态
      Ago_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state, %%获取下线时候的事件进度
      %%Ago_last_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_last_time,%%获取下线的时候的最后触发事件
      Result_event    =for(1,4,fun(X)->lists:nth(X,Ago_event)*lists:nth(X,Time_difference)
                     end),%%返回上线事件列表
      Result_time     =for(1,4,fun(X)->lists:nth(X,Sign_out_time)*lists:nth(X,Time_difference)
                         end),%%返回上线时间列表
      Result_state    =for(1,4,fun(X)->[lists:nth(X,Time_difference)*(lists:nth(1,lists:nth(X,Ago_state))),
        lists:nth(X,Time_difference)*(lists:nth(2,lists:nth(X,Ago_state)))] end), %%返回上线的福利兑换进度
%%      Result_last_time=for(1,4,fun(X)->lists:nth(X,Ago_last_time)*lists:nth(X,Time_difference)
%%                                end),%%返回上线最后触发事件时间列表
      put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = Result_event,
        welfare_exchange_exist_time =Result_time ,welfare_exchange_finish_state =Result_state,icon_state = 1 }),
      Less_time=get_less_exist_time(Result_time),%%返回最少的剩余时间
      Respond = #'Proto80157004'{type = 1,residual_time=Less_time}
  end,
  lib_send:respond_to_client(Respond),
  welfare_exchange_icon(),
  ?DEBUG("welfare_exchange_sign_in: ~p ~n",[Respond]).

judge_state()->
Welfare_exchange = get_player_welfare_exchange(),%%获取Ets进程
Sign_out_time = Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,%%获取hrl文件的时间列表
Time_difference=lists:map(fun(X)->%%获取事件存在与否列表
case X=<0 of
true ->
0;
false ->
1
end
end
,lists:map(fun(X) -> (X-get_os_time()) end,Sign_out_time)),%%获取现在系统时间和事件结束时间的时间差列表
case (lists:sum(Time_difference) =:=0) of %%判断事件状态
true -> %%没有事件存在了
put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = [0,0,0,0],
welfare_exchange_exist_time = [0,0,0,0] ,welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],icon_state = 2}),
?DEBUG("{welfare_exchange_state = [0,0,0,0],
  welfare_exchange_exist_time = [0,0,0,0] ,welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],icon_state = 2}")
  ;
false -> %%还有至少一件事件存在
Ago_event=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,%%获取下线的时候的事件状态
Ago_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state, %%获取下线时候的事件进度
%%Ago_last_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_last_time,%%获取下线的时候的最后触发事件
Result_event    =for(1,4,fun(X)->lists:nth(X,Ago_event)*lists:nth(X,Time_difference)
end),%%返回上线事件列表
Result_time     =for(1,4,fun(X)->lists:nth(X,Sign_out_time)*lists:nth(X,Time_difference)
end),%%返回上线时间列表
Result_state    =for(1,4,fun(X)->[lists:nth(X,Time_difference)*(lists:nth(1,lists:nth(X,Ago_state))),
lists:nth(X,Time_difference)*(lists:nth(2,lists:nth(X,Ago_state)))] end), %%返回上线的福利兑换进度
%%Result_last_time=for(1,4,fun(X)->lists:nth(X,Ago_last_time)*lists:nth(X,Time_difference)
%%end),%%返回上线最后触发事件时间列表
put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = Result_event,
welfare_exchange_exist_time =Result_time ,welfare_exchange_finish_state =Result_state, icon_state = 1 }),
    ?DEBUG("{welfare_exchange_state = ~p,welfare_exchange_exist_time = ~p ,welfare_exchange_finish_state = ~p,icon_state = 1}",[Result_event,Result_time,Result_state])
end,
  welfare_exchange_icon().


judge_state1()->
  Welfare_exchange = get_player_welfare_exchange(),%%获取Ets进程
  Sign_out_time = Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,%%获取hrl文件的时间列表
  Time_difference=lists:map(fun(X)->%%获取事件存在与否列表
    case X=<0 of
      true ->
        0;
      false ->
        1
    end
                            end
    ,lists:map(fun(X) -> (X-get_os_time()) end,Sign_out_time)),%%获取现在系统时间和事件结束时间的时间差列表
  case (lists:sum(Time_difference) =:=0) of %%判断事件状态
    true -> %%没有事件存在了
      put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = [0,0,0,0],
        welfare_exchange_exist_time = [0,0,0,0] ,welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],icon_state = 2}),
      ?DEBUG("{welfare_exchange_state = [0,0,0,0],
  welfare_exchange_exist_time = [0,0,0,0] ,welfare_exchange_finish_state = [[0,0],[0,0],[0,0],[0,0]],icon_state = 2}")
    ;
    false -> %%还有至少一件事件存在
      Ago_event=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,%%获取下线的时候的事件状态
      Ago_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state, %%获取下线时候的事件进度
%%Ago_last_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_last_time,%%获取下线的时候的最后触发事件
      Result_event    =for(1,4,fun(X)->lists:nth(X,Ago_event)*lists:nth(X,Time_difference)
                               end),%%返回上线事件列表
      Result_time     =for(1,4,fun(X)->lists:nth(X,Sign_out_time)*lists:nth(X,Time_difference)
                               end),%%返回上线时间列表
      Result_state    =for(1,4,fun(X)->[lists:nth(X,Time_difference)*(lists:nth(1,lists:nth(X,Ago_state))),
        lists:nth(X,Time_difference)*(lists:nth(2,lists:nth(X,Ago_state)))] end), %%返回上线的福利兑换进度
%%Result_last_time=for(1,4,fun(X)->lists:nth(X,Ago_last_time)*lists:nth(X,Time_difference)
%%end),%%返回上线最后触发事件时间列表
      put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state = Result_event,
        welfare_exchange_exist_time =Result_time ,welfare_exchange_finish_state =Result_state, icon_state = 1 }),
      ?DEBUG("{welfare_exchange_state = ~p,welfare_exchange_exist_time = ~p ,welfare_exchange_finish_state = ~p,icon_state = 1}",[Result_event,Result_time,Result_state])
  end.

sign_out() ->
  ?DEBUG("welfare_exchange_sign_out").
  %%Welfare_exchange = get_player_welfare_exchange().%%获取Ets进程
  %%?DEBUG("welfare_exchange_sign_in: ~p ~n",[123]).
  %%Exist_time = Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,%%获取hrl文件的剩余时间列表
  %%put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_exist_time = Exist_time}).%%将这个列表存入ets中

player_welfare_exchange_handler() ->
  #player_handler{
    ets = ?ETS_WELFARE_EXCHANGE,
    table_name = ?DBPLAYER_WELFARE_EXCHANGE,
    table_player_field = <<"id">>,
    ets_init_func = fun ets_init/0,
    mongo_index_func = fun build_index/0,
    load_func = fun db_welfare_exchange:load_welfare_exchange/1,
    save_func = fun db_welfare_exchange:save_welfare_exchange/1,
    get_func = fun get_player_welfare_exchange/0,
    put_func = fun put_player_welfare_exchange/2
  }.




%%获取福利兑换的触发条件
get_welfare_exchange_trigger_value()->
  List =
    lists:foldr(fun(K,L)->
      [{maps:get(type, tb_welfare_exchange:get(K)),
        maps:get(level, tb_welfare_exchange:get(K)),
        maps:get(trigger_val, tb_welfare_exchange:get(K)),
        maps:get(takt_time, tb_welfare_exchange:get(K)),
        maps:get(event_weight, tb_welfare_exchange:get(K)),
        maps:get(all_weight, tb_welfare_exchange:get(K))}|L]
                end,[], tb_welfare_exchange:get_list()),
  lists:usort(List).

%%根据触发类型和等级获取触发值,间隔Cd和总权重,事件权重
get_welfare_exchange_trigger_value(Type,Level) ->
    lists:filter(fun({Trigger_Type,Trigger_Level,_,_,_,_}) ->
      (Trigger_Type =:= Type) andalso (Trigger_Level =:= Level)
                 end,get_welfare_exchange_trigger_value()).



%%获取福利兑换的事件参数
get_welfare_exchange_trigger_event()->
  List =
    lists:foldr(fun(K,L)->
      [{maps:get(index_id, tb_welfare_exchange_event:get(K)),
        maps:get(param1, tb_welfare_exchange_event:get(K)),
        maps:get(param2, tb_welfare_exchange_event:get(K)),
        maps:get(time, tb_welfare_exchange_event:get(K)),
        maps:get(title, tb_welfare_exchange_event:get(K)),
        maps:get(title, tb_welfare_exchange_event:get(K))}|L]
                end,[], tb_welfare_exchange_event:get_list()),
  lists:usort(List).

%%根据事件获取参数1,参数2,弹窗时间,文本描述
get_welfare_exchange_trigger_event(Event_id) ->
    lists:filter(fun({Id,_,_,_,_,_}) ->
      (Id =:= Event_id)
                 end,get_welfare_exchange_trigger_event()).



%%获取当前系统unix时间戳
get_os_time() ->
  {H,M,_}=os:timestamp(),
  list_to_integer(erlang:integer_to_list(H)++erlang:integer_to_list(M)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%获取最少事件的存在时间,时间为0的不返回,如果全部为0则返回0
get_less_exist_time(Time)->
  case Time =:= [0,0,0,0] of
    true ->0;
    false ->
      Predicate=fun(X)->X /= 0end ,
      lists:min(lists:filter(Predicate,Time))
  end.


%%更新充值进度
recharge_money(Gold)->
  Welfare_exchange=get_player_welfare_exchange(),
  judge_state(),
  Welfare_exchange_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,
  State=lists:map(fun(X)->X rem 10 end,Welfare_exchange_state),
  Now_state=lists:map(fun(X)->lists:nth(1,X) end,Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state),%%当前进度
  All_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state,%%总进度
  Recharge_money=lists:map(fun(X)-> case X>=3 of
                       true->
                         Gold;
                         false->
                           0
                     end
            end,State),
  New_now_state=for(1,4,fun(X)->lists:nth(X,Now_state)+lists:nth(X,Recharge_money) end),
  New_all_state=for(1,4,fun(X)->lists_change(lists:nth(X,New_now_state),1,lists:nth(X,All_state)) end),
  put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_finish_state=New_all_state}).


%%获取权重抛出的事件
get_event_weight_result(List,All_weight) ->
  Size=trunc(lists:flatlength(List)/2),        %%获取事件数量
  Weight_list=lists:map(fun([_,W]) ->W end,List),  %%返回权重列表[30,30,30]
  Ran=rand:uniform(All_weight+1)-1,              %%获取0~All_weight的随机数
  New_list=for(1,Size,fun(X)-> lists:sum(lists:sublist(Weight_list,1,X)) end), %%获取范围列表[30,60,90]
  New_list1=case Size =:= 1 of                                                    %%获取范围列表[0,30,30,60,60,90]
              true ->
                [0]++New_list;
              false ->
                lists:flatten([[0, lists:nth(1,New_list)]]++for(2,Size,fun(X) ->[lists:nth((X-1),New_list),lists:nth((X),New_list)] end))
            end,
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%判断随机数在不在范围内
  lists:flatten(lists:filtermap(fun(X) -> case X of
                              [_,1]->
                                true;
                              [_,0]->
                                false
                            end end,
    for(1,Size,fun(X)->
    case Ran>=lists:nth((X*2-1),New_list1) andalso Ran<lists:nth((X*2),New_list1) of                   %%判断是不是在范围内
      true ->
        [X,1];
      false ->
        [X,0]
    end
             end))).%%返回[]或[1、2、3、4、5、6,1]


%%根据触发类型获取触发事件
get_trigger_event(Type,Result,Level,Event_state,Event_time,Event_last_time,Event_finish_state,_,Takt_time)->
  Welfare_exchange=get_player_welfare_exchange(), %%获取Ets
  [Event_weight_result,1]=Result,
  Event_id=Type*1000+Level*10+Event_weight_result,
  [{_,Param1,_,Event_exist_time,_,_}]=get_welfare_exchange_trigger_event(Event_id),

  Now_event_state=lists_change(Event_id,Type,Event_state),
  Now_event_time=lists_change(Event_exist_time+get_os_time(),Type,Event_time) ,
  Now_event_last_time=lists_change(get_os_time()+Takt_time,Type,Event_last_time),

  case (Event_weight_result =<2) of%%判断事件类型
    false->
      Now_event_finish_state=lists_change([0,Param1],Type,Event_finish_state);
    true->
      Now_event_finish_state=  lists_change([0,Param1],Type,Event_finish_state)
  end,
  %%%%%%%%%%%%%%%%%%%%%%%
  put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state=Now_event_state,welfare_exchange_exist_time = Now_event_time ,
    welfare_exchange_finish_state=Now_event_finish_state,welfare_exchange_last_time=Now_event_last_time,icon_state=1}),
  judge_state(),
  true.


%%判断能不能触发
is_can_trigger(Trigger_type) ->
  Welfare_exchange=get_player_welfare_exchange(), %%获取Ets
  judge_state1(),
  Level=lib_player:player_level(), %%获取领主等级
  Event_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,%%判断时的事件状态
  Event_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,%%判断时的事件时间
  Event_last_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_last_time,%%上一次触发事件时间
  Event_finish_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state,%%上一次的事件完成状态
  Player_diamond=lib_player_pack:count_by_id(101001002),%%获取玩家当前钻石
  Type=Trigger_type,
  case Level>=6 of  %%触发开启条件 等级大于6
    true->
  %%case lists:nth(3,Trigger_type_val) of
    %%0-> %%判断不是必然触发
      case Type of
        1->
      Resource1=lib_player_pack:count_by_id(101001003),
      [{_,_,Trigger_val,Takt_time,All_weight,Event_weight}]=get_welfare_exchange_trigger_value(1,Level),            %%返回[触发值,间隔CD,事件和权重列表,总权重]
         Case2=((Resource1 <Trigger_val) andalso ((get_os_time()-lists:nth(1,Event_last_time)) >= 0) andalso (lists:nth(1,Event_state)=:=0)),
      case Case2 of  %%判断达到触发值和CD外
          true ->
              Result=get_event_weight_result(All_weight,Event_weight), %%获取触发事件;
              case Result of
                []->
                    false;
                [_,1]->
                  get_trigger_event(Type,Result,Level,Event_state,Event_time,Event_last_time,Event_finish_state,Player_diamond,Takt_time)
                end;

          false ->
              false
        end;
        2->
      Resource2=lib_player_pack:count_by_id(101001004),%%获取玩家当前粮食
      [{_,_,Trigger_val,Takt_time,All_weight,Event_weight}]=get_welfare_exchange_trigger_value(2,Level),            %%返回[触发值,间隔CD,事件和权重列表,总权重]
          Case2=((Resource2 <Trigger_val) andalso (get_os_time()-lists:nth(2,Event_last_time) >= 0) andalso (lists:nth(2,Event_state)=:=0)),
      case Case2 of  %%判断达到触发值和CD外
             true ->
               Result=get_event_weight_result(All_weight,Event_weight), %%获取触发事件;
               case Result of
                 []->
                   false;
                 [_,1]->
                   get_trigger_event(Type,Result,Level,Event_state,Event_time,Event_last_time,Event_finish_state,Player_diamond,Takt_time)
                 end;
        false ->
          false
      end;
    3->
      Resource3=lib_player_pack:count_by_id(101001005),%%获取玩家当前木材
      [{_,_,Trigger_val,Takt_time,All_weight,Event_weight}]=get_welfare_exchange_trigger_value(3,Level),            %%返回[触发值,间隔CD,事件和权重列表,总权重]
      Case2=((Resource3 <Trigger_val) andalso (get_os_time()-lists:nth(3,Event_last_time) >= 0) andalso (lists:nth(3,Event_state)=:=0)),
      case Case2 of  %%判断达到触发值和CD外
        true ->
          Result=get_event_weight_result(All_weight,Event_weight), %%获取触发事件
          case Result of
            []->
              false;
            [_,1]->
              get_trigger_event(Type,Result,Level,Event_state,Event_time,Event_last_time,Event_finish_state,Player_diamond,Takt_time)
            end;
        false ->
          false
      end;
    4->
      Resource4=lib_player_pack:count_by_id(101001006),%%获取玩家当前生铁
      [{_,_,Trigger_val,Takt_time,All_weight,Event_weight}]=get_welfare_exchange_trigger_value(4,Level),            %%返回[触发值,间隔CD,事件和权重列表,总权重]
      Case2 = ((Resource4 <Trigger_val) andalso (get_os_time()-lists:nth(4,Event_last_time) >=0) andalso (lists:nth(4,Event_state)=:=0)),
      case Case2 of  %%判断达到触发值和CD外
        true ->
          Result=get_event_weight_result(All_weight,Event_weight), %%获取触发事件
          case Result of
            []->
              false;
            [_,1]->
              get_trigger_event(Type,Result,Level,Event_state,Event_time,Event_last_time,Event_finish_state,Player_diamond,Takt_time)
          end;
        false ->
          false
          end
      end;
          %%end;

%%    1->  %%必定触发
%%      Type=lists:last(Trigger_type_val),
%%      [{_,_,_,Takt_time,All_weight,Event_weight}]=get_welfare_exchange_trigger_value(Type,Level),            %%返回[_,间隔CD,事件和权重列表,总权重]
%%      Case3=((get_os_time()-lists:nth(Type,Event_last_time) >= 0) andalso (lists:nth(Type,Event_state)=:=0)),
%%      case Case3 of
%%        true->
%%          Result=get_event_weight_result(All_weight,Event_weight), %%获取触发事件
%%          case Result of
%%            []->
%%              false;
%%            [_,1]->
%%              [Event_weight_result,1]=Result, %%触发的事件1、2、3、4、5、6
%%
%%              Event_id=Type*10000+Type*1000+Level*10+Event_weight_result,
%%              [{_,Param1,_,Event_exist_time,_,_}]=get_welfare_exchange_trigger_event(Event_id),
%%              Now_event_state=lists_change(Event_id,Type,Event_state),
%%              Now_event_time=lists_change(Event_exist_time+get_os_time(),Type,Event_time) ,
%%              Now_event_last_time=lists_change(get_os_time()+Takt_time,Type,Event_last_time),
%%              case (Event_weight_result  =<2) of%%判断事件类型
%%                false->
%%                  Now_event_finish_state=lists_change([0,Param1],Type,Event_finish_state);
%%                true->
%%                  Now_event_finish_state=lists_change([Player_diamond,Param1],Type,Event_finish_state)
%%              end,
%%              put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state=Now_event_state,welfare_exchange_exist_time = Now_event_time ,
%%                welfare_exchange_finish_state=Now_event_finish_state,welfare_exchange_last_time=Now_event_last_time,icon_state=1}),
%%              true
%%            end;
%%        false->
%%          false
%%      end
%%  end;
  false -> false  %%不触发
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%请求福利兑换触发
request_welfare_exchange_trigger(Msg)->
  ?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_160), ?INFO("功能未开启")), %%判断福利兑换功能开启
  ?DEBUG("触发福利兑换"),
  #'Proto10157001'{trigger_type =  Trigger_type} = Msg,
  case (Trigger_type =< 4) of
  true->

  case is_can_trigger(Trigger_type) of
    true ->
      ?DEBUG("触发福利兑换成功"),
    Respond = #'Proto50157001'{trigger_status=1};
    false ->
      ?DEBUG("触发福利兑换失败1"),
      Respond = #'Proto50157001'{trigger_status=0}
  end,
    lib_send:respond_to_client(Respond);

  false ->
      ?DEBUG("触发福利兑换失败2"),
      Respond = #'Proto50157001'{trigger_status=0},
    lib_send:respond_to_client(Respond)
  end.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%请求福利兑换列表
request_welfare_exchange_lists()->
  ?DEBUG("接收到福利兑换列表请求"),
  Welfare_exchange=get_player_welfare_exchange(), %%获取Ets
  judge_state(),
  Exist_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,
  Time=lists:map(fun(Y) ->
  case Y=<0 of
    true ->
      0;
    false ->
      Y
  end
  end
    ,lists:map(fun(X) -> (X-get_os_time()) end,Exist_time)),
  State=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,
  Now_state=lists:map(fun(X)->lists:nth(1,X) end,Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state),%%现在进度
  Target_state=lists:map(fun(X)->lists:nth(2,X) end,Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state),%%目标进度
  Event_all_lists=for(1,4,fun(X)->[lists:nth(X,State)]++[lists:nth(X,Time)]++[lists:nth(X,Now_state)]++[lists:nth(X,Target_state)]end),
  Even_lists=lists:filter(fun(X)-> (lists:nth(2,X)  =/=0 ) end,Event_all_lists),
  case (lists:flatlength(Even_lists) =:= 0) of
    false->
  All_lists=welfare_to_proto(Even_lists),
  Respond = #'Proto50157002'{welfare_event_list=All_lists},
  lib_send:respond_to_client(Respond),
  ?DEBUG("welfare_exchange_lists: ~p ~n",[Respond]);
    true->
      ?DEBUG("welfare_exchange_lists is empty")
end.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2\3\4触发后没有放进ets表

%% 完成福利兑换请求                                                         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%有问题啊
request_welfare_exchange_task_finish(Msg) ->
  ?DEBUG("完成福利兑换请求"),
  Welfare_exchange=get_player_welfare_exchange(), %%获取Ets
  judge_state1(),
  #'Proto10157003'{award_id =  Award_id} = Msg,
  Type=Award_id div 1000,%%福利兑换判断的福利类型
  [{_,Param1,Param2,_,_,_}]=get_welfare_exchange_trigger_event(Award_id),
  Item=lib_item_api:conf_item_list_to_pack_item_list([[101001002+Type,Param2]]), %%Item_list=[id,数量]
  %%Diamond=lib_item_api:conf_item_list_to_pack_item_list([[101001002,Param1]]),  %%Item_list=[id,数量]
  Welfare_exchange_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_state,
  Welfare_exchange_exist_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,
  Welfare_exchange_finish_state=Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state,
  Event=Award_id rem 10,  %%福利兑换请求事件
  [Now_state,Target_state]=lists:nth(Type,Welfare_exchange#player_welfare_exchange.welfare_exchange_finish_state),
  case (lists:nth(Type,Welfare_exchange_state) =:= 0) of
      false->
      case (Event)<3 of %%判断事件为消耗钻石和充值钻石两种事件
        true->%%消耗钻石的事件
          case (lib_player_pack:get_all_diamond()>=Target_state) of
            true->
              lib_player_pack:auto_remove_diamond(Param1,?USE_WELFARE_EXCHANGE,Award_id),
            %%lib_player_pack:auto_remove(Diamond, ?REMOVE_SERIAL(?USE_WELFARE_EXCHANGE, Award_id)),%%支付钻石
          New_Welfare_exchange_state=lists_change(0,Type,Welfare_exchange_state),
          New_Welfare_exchange_exist_time=lists_change(0,Type,Welfare_exchange_exist_time),
          New_Welfare_exchange_finish_state=lists_change([0,0],Type,Welfare_exchange_finish_state),
              put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state=New_Welfare_exchange_state,welfare_exchange_exist_time = New_Welfare_exchange_exist_time ,
            welfare_exchange_finish_state=New_Welfare_exchange_finish_state}),


              case (lists:sum(Welfare_exchange#player_welfare_exchange.welfare_exchange_state) =:= 0) of
            true->%%判断图标
              put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{icon_state=2});
              false->ok
          end,
          case Event of
           1->
             lib_logistics_center:add_buy_times(Type+4,Param2);
          2->%%直接买钻石事件
          lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?USE_WELFARE_EXCHANGE, Award_id))%%获得资源
          end;
          false->?DEBUG("未达到福利兑换条件：~p",[Award_id])
          end;
          false ->%%充值钻石的事件
            case Now_state>=Target_state of
              true->
            lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_WELFARE_EXCHANGE, Award_id)),%%获得资源
            New_Welfare_exchange_state=lists_change(0,Type,Welfare_exchange_state),
            New_Welfare_exchange_exist_time=lists_change(0,Type,Welfare_exchange_exist_time),
            New_Welfare_exchange_finish_state=lists_change([0,0],Type,Welfare_exchange_finish_state),

      put_player_welfare_exchange(Welfare_exchange#player_welfare_exchange{welfare_exchange_state=New_Welfare_exchange_state,welfare_exchange_exist_time = New_Welfare_exchange_exist_time ,
        welfare_exchange_finish_state=New_Welfare_exchange_finish_state});
                false->?DEBUG("未达到福利兑换条件：~p",[Award_id])
          end

      end;
      true->?DEBUG("重复领取福利兑换奖励")
end,
  judge_state().


%%福利兑换图标
welfare_exchange_icon() ->
  Welfare_exchange = get_player_welfare_exchange(),
  case Welfare_exchange#player_welfare_exchange.icon_state of
    2 ->
      Respond = #'Proto80157004'{type = 2,residual_time = 0};
    1 ->
      Exist_time=Welfare_exchange#player_welfare_exchange.welfare_exchange_exist_time,
      Exist_time1=for(1,4,fun(X)-> lists:nth(X,Exist_time)-get_os_time() end),
      Time=lists:map(fun(X)->
        case X=<0 of
          true->0;
          false->
            X
        end
                     end,Exist_time1),
      Respond = #'Proto80157004'{type = 1,residual_time = get_less_exist_time(Time)}
  end,
  lib_send:respond_to_client(Respond),
  ?DEBUG("welfare_exchange_icon: ~p ~n",[Respond]).

for(N,N,F)->
  [F(N)];
for(L,N,F)->
  [F(L)|for(L+1,N,F)].

lists_change(R,N,L)->case lists:split(N-1, L) of
{F, [_|T]} -> F ++ [R|T] end.

welfare_to_proto(List) ->
  lists:foldr(fun(T,L)->
    [#'ProtoWelfareExchange'{
      event_id = lists:nth(1,T),							%事件类型
      time = lists:nth(2,T),				          %时间
      current_schedule = lists:nth(3,T),	    %当前值
      target_schedule = lists:nth(4,T)				%目标值
    }|L]
              end,[],List).