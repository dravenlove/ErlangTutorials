%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: dissovle_hero_fragment
%%% Created on : 2021/1/6 10:06
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('dissovle_hero_fragment_HRL').
-define('dissovle_hero_fragment_HRL', true).

-record(player_dissolve,{
  id = 0,                            %% 玩家id
  dissolve_dict = dict:new(),         %% 分解锁定字典   key:item_id  value:1表示锁定。0表示未锁定
  time = 0
}).

-define(GOLD,101001002).  %%金子
-define(SILVER,101001003). %%银子
-define(SOUL,102002002). %%将魂
-define(MAIN_TYPE,102).
-define(SUB_TYPE,5).
%%-define(TEN,10).
-define(ONE,1).  %%次数 或者 绑定状态

-endif.