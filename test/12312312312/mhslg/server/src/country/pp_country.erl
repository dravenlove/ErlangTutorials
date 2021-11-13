%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 12月 2020 17:57
%%%-------------------------------------------------------------------
-module(pp_country).
-author("13661").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_COUNTRY_POS_INFO, _, _Msg) ->
	lib_player_country:request_pos_info();
handle(?MSG_CLIENT_COUNTRY_NOTICE, _, _Msg) ->
	lib_player_country:request_notice();
handle(?MSG_CLIENT_COUNTRY_MODIFY_NOTICE, _, Msg) ->
	lib_player_country:request_modify_notice(Msg);
handle(?MSG_CLIENT_COUNTRY_APPOINT_POS, _, Msg) ->
	lib_player_country:request_appoint_pos(Msg);
handle(?MSG_CLIENT_COUNTRY_IMPEACH_INFO, _, _Msg) ->
	lib_player_country:request_impeach_info();
handle(?MSG_CLIENT_COUNTRY_IMPEACH, _, Msg) ->
	lib_player_country:request_impeach(Msg);
handle(?MSG_CLIENT_COUNTRY_IMPEACH_VOTES, _, Msg) ->
	lib_player_country:request_impeach_votes(Msg);
handle(?MSG_CLIENT_COUNTRY_OPEN_SIEGE_ORDER, _, Msg) ->
	lib_player_country:request_open_siege_order(Msg);
handle(?MSG_CLIENT_COUNTRY_OPEN_DEFENSIVE_ORDER, _, Msg) ->
	lib_player_country:request_open_defensive_order(Msg);
handle(?MSG_CLIENT_COUNTRY_OPEN_TRAIN_ORDER, _, _Msg) ->
	lib_player_country:request_open_train_order();
handle(?MSG_CLIENT_COUNTRY_OPEN_BUILD_ORDER, _, _Msg) ->
	lib_player_country:request_open_build_order();
handle(?MSG_CLIENT_COUNTRY_OPEN_PROHIBIT_ORDER, _, Msg) ->
	lib_player_country:request_open_prohibit_order(Msg);
handle(?MSG_CLIENT_COUNTRY_CITY_MASTER_INFO, _, _Msg) ->
	lib_player_country:request_city_master_info();
handle(?MSG_CLIENT_COUNTRY_APPOINT_CITY_MASTER, _, Msg) ->
	lib_player_country:request_appoint_city_master(Msg);
handle(?MSG_CLIENT_COUNTRY_OPEN_MASTER_ORDER, _, Msg) ->
	lib_player_country:request_open_master_order(Msg);
handle(?MSG_CLIENT_COUNTRY_ORDER_LIST_INFO, _, _Msg) ->
	lib_player_country:request_order_list_info();
handle(?MSG_CLIENT_COUNTRY_RANK_LIST, _, Msg) ->
	lib_player_country:request_rank_list(Msg);


%%请求国家仓库界面信息
handle(?MSG_CLIENT_COUNTRY_WAREHOUSE_INFO, _, _) ->
	lib_country_warehouse:get_country_warehouse_info();
%%请求领取国家分红红包
handle(?MSG_CLIENT_GET_COUNTRY_DIVIDENDS, _, Msg) ->
	lib_country_warehouse:get_country_dividends(Msg);

handle(?MSG_CLIENT_COUNTRY_TASK_INFO1, _, _Msg) ->
	lib_player_country_task:request_country_task_info();
handle(?MSG_CLIENT_COUNTRY_TASK_GET1, _, _Msg) ->
	lib_player_country_task:request_country_task_get();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

