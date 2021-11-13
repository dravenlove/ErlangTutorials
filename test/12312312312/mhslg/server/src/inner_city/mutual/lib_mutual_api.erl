%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_mutual_api
%%% Created on : 2021/8/19 11:46
%%% @author leever liangxingwu@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_mutual_api).
-author("leever").
-include("common.hrl").
-include("inner_city.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10123.hrl").
-include("player.hrl").

%% API
-export([
	mutual_list_to_proto/1,
	respond_client/2,
	do_mutual_upgrade/1,
	mutual_done/1,
	sign_in/0
]).

sign_in() ->
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:notify_mutual/1,[CountryId]).

%%
respond_client(PlayerId, Respond) ->
	Player_pid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(Player_pid, Respond).

%% 进行助力升级
do_mutual_upgrade(Mutual) ->
	#mutual{building_id = Building_id} = Mutual,
	Inner_city = lib_inner_city:get_player_inner_city(),
	#inner_city{buildings_dict = Buildings} = Inner_city,
	Building = dict:fetch(Building_id,Buildings),
	#building{upgrade_tick = Upgrade_tick,remaining_time = Remaining_time} = Building,
	Now_time = lib_timer:unixtime(),
	Remaining_upgrade_time = Remaining_time - (Now_time - Upgrade_tick),
	Accelerate_time = (?MUTUAL_ACCELERATE_TIME div ?MUTUAL_TOTAL_TIMES) - ?MUTUAL_AUTO_TIME,
	New_upgrade_need_time = case (Remaining_upgrade_time - Accelerate_time) =< 0 of
								true -> 0;
								false-> Remaining_upgrade_time - Accelerate_time
							end,
	?DEBUG("第~p次自动助力，升级剩余时间：~p！！！！！！！！！！",[Mutual#mutual.mutual_times,New_upgrade_need_time]),
	case New_upgrade_need_time =:= 0 of
		true ->
			lib_inner_city:upgrade_ok(Building),
			PlayerId = lib_player:player_id(),
			?MUTUAL_ASYNC_APPLY(fun lib_mutual:delete_mutual_status/2,[PlayerId,Building_id]);
		false -> lib_inner_city:update_inner_building(Building#building{building_id = Building_id,remaining_time = New_upgrade_need_time})
	end,
	lib_inner_city_api:building_state_to_client(Building_id).

%% 结束
mutual_done(BuildId) ->
	Building = lib_inner_city_api:building_info(BuildId),
	lib_inner_city:update_inner_building(Building#building{is_mutual = false}),
	PlayerId = lib_player:player_id(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:delete_mutual_status/2,[PlayerId,BuildId]).

mutual_list_to_proto(MutualStatus) ->
	lists:foldr(fun(Mutual,Acc) ->
		#mutual{proto_show_role = MutualProtoShowRole} = Mutual,
		[#'ProtoMutual'{
			proto_show_role = MutualProtoShowRole,
			building_id = Mutual#mutual.building_id,			%% 建筑id
			building_lv = Mutual#mutual.building_lv,			%% 建筑等级
			mutual_times = Mutual#mutual.mutual_times,           %% 势力互助完成次数
			mutual_total_times = Mutual#mutual.mutual_total_times,     %% 势力互助总次数
			is_mutual = Mutual#mutual.is_mutual			%% 是否助力过：获取时标记用
		}|Acc]
				end,[],MutualStatus).
