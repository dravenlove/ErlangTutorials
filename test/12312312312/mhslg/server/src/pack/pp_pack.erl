%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_item
%%% Created on : 2020/8/13 0013 19:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_pack).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_PACK_INFO, _, Msg) ->
	lib_player_pack:request_pack_info(Msg);
handle(?MSG_CLIENT_USE_ITEM, _, Msg) ->
	lib_use_item:request_use_pack_item(Msg);
handle(?MSG_CLIENT_USE_ITEM_ONEKEY, _, _) ->
	lib_use_item:request_use_one_key();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
