%%%-------------------------------------------------------------------
%%% @author 123
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Sep 2021 10:20 AM
%%%-------------------------------------------------------------------
-author("123").

-define(welfare_exchange_exist_time,0).               %%福利兑换弹窗存在时间

-define(welfare_exchange_money_event,0).              %%福利兑换银两事件
-define(welfare_exchange_provisions_event,1).         %%福利兑换粮草事件
-define(welfare_exchange_wood_event,2).               %%福利兑换木材事件
-define(welfare_exchange_iron_event,3).               %%福利兑换铁材事件

-define(welfare_exchange_event_one,1).                %%福利兑换事件一:钻石买贸易站次数
-define(welfare_exchange_event_two,2).                %%福利兑换事件二:钻石买资源
-define(welfare_exchange_event_three,3).              %%福利兑换事件三:充值送资源
-define(welfare_exchange_event_four,4).               %%福利兑换事件四:充值送资源
-define(welfare_exchange_event_five,5).               %%福利兑换事件五:充值送资源
-define(welfare_exchange_event_six,6).                %%福利兑换事件六:充值送资源

-record(player_welfare_exchange, {
  id = 0,
  welfare_exchange_state = [0,0,0,0],               %% 福利兑换类型状态(四个事件id[,,,])
  welfare_exchange_exist_time =[0,0,0,0],	        %% 福利兑换结束时间unix时间([,,,]表达四个的结束时间)
  welfare_exchange_finish_state =[[0,0],[0,0],[0,0],[0,0]], %% 福利兑换事件完成状态[[参数1,参数2],[参数1,参数2]]
  welfare_exchange_last_time = [0,0,0,0],   %% 福利兑换事件上次触发的时间+系统时间用于触发间隔CD
  icon_state = 2					                          %% 显示图标的状态(1开启或2关闭)
}).
