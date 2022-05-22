%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: chat_block
%%% Created on : 2021/1/22 16:33
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('chat_block_HRL').
-define('chat_block_HRL', true).

-define(NO_BLOCK,0).
-define(BLOCK,1).
-define(COUNTRY_1,1).
-define(COUNTRY_2,2).
-define(COUNTRY_3,3).

-record(chat_block,{
  player_block = dict:new(), %%key:player_id, val:[]玩家id列表
  player_no_speak_dict = dict:new() %%key:country_id val:[]玩家id列表
}).




-endif.