%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2020 2:34 PM
%%%-------------------------------------------------------------------
-module(pp_inner_city).
-author("df").
-include("common.hrl").

%% API
-export([
	handle/3
]).

%%请求内城信息
handle(?MSG_CLIENT_INNER_CITY_INFO, _, _) ->
	lib_inner_city:request_inner_city_info();

%% 请求单个建筑升级
handle(?MSG_CLIENT_BUILDING_UPGRADE, _, Msg) ->
	lib_inner_city:request_building_upgrade(Msg);

%% 请求单个建筑升级加速
handle(?MSG_CLIENT_ACCELERATE_UPGRADE, _, Msg) ->
	lib_inner_city:request_building_upgrade_accelerate(Msg);

%%请求领取资源建筑资源
handle(?MSG_CLIENT_GET_RESOURCE_BUILDING_ITEM, _, Msg) ->
	lib_inner_city:request_get_resource_building_item(Msg);

%%请求开启建筑
handle(?MSG_CLIENT_OPEN_BUILDING, _, Msg) ->
	lib_inner_city:request_open_building(Msg);

handle(?MSG_CLIENT_ONE_BUILDING, _, Msg) ->
	lib_inner_city:request_one_building(Msg);

%% 申请势力互助
handle(?MSG_CLIENT_MUTUAL, _, Msg) ->
	lib_inner_city:request_mutual(Msg);

%% 请求势力互助列表
handle(?MSG_CLIENT_MUTUAL_LIST, _, _Msg) ->
	lib_inner_city:request_mutual_list();

%% 请求进行单个助力
handle(?MSG_CLIENT_DO_ONE_MUTUAL, _, Msg) ->
	lib_inner_city:request_do_one_mutual(Msg);

%% 请求进行玩家助力
handle(?MSG_CLIENT_DO_PLAYER_MUTUAL, _, Msg) ->
	lib_inner_city:request_do_player_mutual(Msg);

%% 请求进行所有助力
handle(?MSG_CLIENT_DO_ALL_MUTUAL, _, Msg) ->
	lib_inner_city:request_do_all_mutual(Msg);

%% 请求申请帮助
handle(?MSG_CLIENT_HELP_ALL_MUTUAL, _, _Msg) ->
	lib_inner_city:request_help_all_mutual();

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.