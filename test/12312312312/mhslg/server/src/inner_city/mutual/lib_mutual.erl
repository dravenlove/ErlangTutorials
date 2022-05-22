%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_mutual
%%% Created on : 2021/8/17 12:57
%%% @author leever liangxingwu@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_mutual).
-author("leever").
-include("common.hrl").
-include("inner_city.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10123.hrl").
-include("player.hrl").

%% API
-export([ %% mod_mutual进程
	request_mutual/3,
	request_mutual_list/2,
	request_do_one_mutual/3,
	request_do_player_mutual/3,
	request_do_all_mutual/2,
	request_help_all_mutual/2,
	notify_mutual/1,
	update_mutual_status/1,
	add_mutual_status/1,
	delete_mutual_status/2,
	get_respond_mutual/0,
	do_mutual/1,
	do_mutual/3
]).

%% 自动助力
do_mutual(Mutual) ->
	do_mutual(Mutual#mutual.country_id,[],Mutual).

%% 申请助力
request_mutual(ProtoShowRole,CountryId,ProtoBuilding) ->
%%	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_132), ?INFO("功能未开启")),
	#'ProtoBuilding'{id = ProtoBuildingId,level = ProtoBuildingLevel} = ProtoBuilding,
	Mutual = #'mutual'{
		proto_show_role = ProtoShowRole,
		building_id = ProtoBuildingId,	%% 建筑id
		building_lv = ProtoBuildingLevel,	%% 建筑等级
		mutual_times = 0,           %% 势力互助完成次数
		mutual_total_times = ?MUTUAL_TOTAL_TIMES,     %% 势力互助总次数
		mutual_player_list = [],    %% 助力过的玩家id列表
		is_mutual = false,			%% 是否助力过：获取时标记用
		update_tick = lib_timer:unixtime(),				%% 更新的时间戳
		country_id = CountryId					%% 势力
	},
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	mod_mutual:put_mutual(#mutual_status{mutual = [Mutual|MutualList]}),
	Msg = #'Proto50123009'{mutual_list = lib_mutual:get_respond_mutual(),building = ProtoBuilding},
	#'ProtoShowRole'{id = ProtoShowRoleId} = ProtoShowRole,
	lib_mutual_api:respond_client(ProtoShowRoleId, Msg),
	lib_mutual:notify_mutual(CountryId).

%% 请求助力列表
request_mutual_list(CountryId,PlayerId) ->
	MutualStatus  = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	CountryMutualList = lists:filter(fun(Mutual) -> #mutual{country_id = MutualCountryId} = Mutual,MutualCountryId =:= CountryId end,MutualList),
	MyMutualList = lists:filter(fun(Mutual) -> #mutual{proto_show_role = MutualProtoShowRole} = Mutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =:= PlayerId end,CountryMutualList),
	OtherMutualList = lists:filter(fun(Mutual) ->#mutual{proto_show_role = MutualProtoShowRole} = Mutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =/= PlayerId end,CountryMutualList),
	NewOtherMutualList = lists:foldl(fun(Mutual,Acc) ->
		#mutual{mutual_player_list = MutualPlayerIdList} = Mutual,
		case lists:member(PlayerId,MutualPlayerIdList) of
			true ->	TrueMutual = Mutual#mutual{is_mutual = true},[TrueMutual|Acc];
			false -> FalseMutual = Mutual#mutual{is_mutual = false},[FalseMutual|Acc]
		end
									 end,[],OtherMutualList),
	ProtoOtherMutual = lib_mutual_api:mutual_list_to_proto(NewOtherMutualList),
	ProtoMyMutual = lib_mutual_api:mutual_list_to_proto(MyMutualList),
	Respond = #'Proto50123010'{mutual_list = ProtoOtherMutual,my_mutual_list = ProtoMyMutual},
	lib_mutual_api:respond_client(PlayerId, Respond).

%% 请求对单个建筑进行助力
request_do_one_mutual(CountryId,PlayerId,Msg) ->
	#'ProtoMutual'{proto_show_role = MsgShowRole,building_id = MsgBuildingId}= Msg,
	#'ProtoShowRole'{id = MsgProtoShowRoleId }= MsgShowRole,
	MutualStatus  = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	PlayerMutualList = lists:filter(fun(ListMutual) -> #mutual{proto_show_role = MutualProtoShowRole} = ListMutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =:= MsgProtoShowRoleId end,MutualList),
	[PlayerMutual] = lists:filter(fun(ListMutual) -> #mutual{building_id = MutualBuildingId }= ListMutual,MutualBuildingId =:= MsgBuildingId end,PlayerMutualList),
	lib_mutual:do_mutual(CountryId,PlayerId,PlayerMutual),
	Respond = #'Proto50123011'{mutual_list = lib_mutual:get_respond_mutual()},
	lib_mutual_api:respond_client(PlayerId, Respond),
	lib_mutual:notify_mutual(CountryId).

%% 请求对玩家所有进行助力
request_do_player_mutual(CountryId,PlayerId,Msg) ->
	#'ProtoMutual'{proto_show_role = MsgShowRole }= Msg,
	#'ProtoShowRole'{id = MsgProtoShowRoleId }= MsgShowRole,
	MutualStatus  = mod_mutual:get_mutual(),
	PlayerMutualList = lists:filter(fun(ListMutual) -> #mutual{proto_show_role = MutualProtoShowRole} = ListMutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =:= MsgProtoShowRoleId end,MutualStatus#mutual_status.mutual),
	lists:foreach(fun(PlayerMutual) -> lib_mutual:do_mutual(CountryId,PlayerId,PlayerMutual) end,PlayerMutualList),
	Respond = #'Proto50123012'{mutual_list = lib_mutual:get_respond_mutual()},
	lib_mutual_api:respond_client(PlayerId, Respond),
	lib_mutual:notify_mutual(CountryId).

%% 请求对所有进行助力
request_do_all_mutual(CountryId,PlayerId) ->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	OtherMutualList = lists:filter(fun(Mutual) -> #mutual{proto_show_role = MutualProtoShowRole} = Mutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =/= PlayerId end,MutualList),
	case OtherMutualList =:= [] of
		true -> skip ;
		false -> lists:foreach(fun(PlayerMutual) ->
				#mutual{mutual_player_list =  MutualPlayerList} = PlayerMutual,
				case lists:member(PlayerId,MutualPlayerList) of
					true -> skip;
					false -> lib_mutual:do_mutual(CountryId,PlayerId,PlayerMutual)
				end
							   end,OtherMutualList),
			Respond = #'Proto50123013'{mutual_list = lib_mutual:get_respond_mutual()},
			lib_mutual_api:respond_client(PlayerId, Respond),
			lib_mutual:notify_mutual(CountryId)
	end.

%% 请求申请帮助
request_help_all_mutual(PlayerId,CountryId) ->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	MyMutualList = lists:filter(fun(Mutual) -> #mutual{proto_show_role = MutualProtoShowRole} = Mutual,#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,MutualProtoShowRoleId =:= PlayerId end,MutualList),
	case MyMutualList =:= [] of
		true -> skip ;
		false -> lists:foreach(fun(PlayerMutual) ->
				#mutual{building_id = BuildingId,building_lv = BuildingLevel,proto_show_role = ProtoShowRole} = PlayerMutual,
				Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_MUTUAL),
				Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_ROLE_INFO, lib_broadcast_api:show_role_to_broad_role(ProtoShowRole)),
				Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_NUM, BuildingLevel),
				Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_INNER_CITY, BuildingId),
				mod_server:async_apply(lib_player:get_pid(PlayerId),fun lib_broadcast_api:send_country_broadcast/2,[CountryId, Shout4])
						  end,MyMutualList)
	end.

%% 进行助力
do_mutual(CountryId,PlayerId,Mutual) ->
	#mutual{
		mutual_times = MutualTimes,
		proto_show_role = MsgShowRole,
		building_id = MsgBuildingId,
		mutual_player_list = MsgMutualPlayerList
	} = Mutual,
	#'ProtoShowRole'{id = MsgPlayerId} = MsgShowRole,
	case Mutual#mutual.mutual_times < ?MUTUAL_TOTAL_TIMES of
		true ->
			NewMutual = Mutual#mutual{
				mutual_times = MutualTimes+1,
				mutual_player_list = lists:merge([PlayerId] , MsgMutualPlayerList),
				update_tick = lib_timer:unixtime(),
				is_mutual = true},
			lib_mutual:update_mutual_status(NewMutual),
			MutualStatus = mod_mutual:get_mutual(),
			#mutual_status{mutual = MutualStatusList} = MutualStatus,
			PlayerMutualList = lists:filter(fun(ListMutual) -> #mutual{proto_show_role = StatusShowRole} = ListMutual,StatusShowRole#'ProtoShowRole'.id =:= MsgPlayerId	end,MutualStatusList),
			[NeedMutual] = lists:filter(fun(ListMutual) -> #mutual{building_id = ListMutualBuildingId} = ListMutual,ListMutualBuildingId =:= MsgBuildingId end,PlayerMutualList),
			#mutual{proto_show_role = NeedProtoShowRole} = NeedMutual,
			#'ProtoShowRole'{id = NeedPlayerId} = NeedProtoShowRole,
			mod_server:async_apply(lib_player:get_pid(NeedPlayerId),fun lib_mutual_api:do_mutual_upgrade/1,[NeedMutual]),
			#mutual{proto_show_role = MutualProtoShowRole} = Mutual,
			#'ProtoShowRole'{id = MutualProtoShowRoleId} = MutualProtoShowRole,
			lib_mutual:request_mutual_list(CountryId,MutualProtoShowRoleId);
		false -> ?DEBUG("该建筑助力次数已用完，无法助力！~n")
	end.

get_respond_mutual() ->
	MutualStatus  = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	lib_mutual_api:mutual_list_to_proto(MutualList).

%% 更新助力列表
update_mutual_status(NewMutual) ->
	#mutual{proto_show_role = NewMutualShowRole,building_id = MutualBuildingId} = NewMutual,
	#'ProtoShowRole'{id = NewMutualProtoShowRoleId} = NewMutualShowRole,
	delete_mutual_status(NewMutualProtoShowRoleId,MutualBuildingId),
	add_mutual_status(NewMutual).

%% 新增助力信息
add_mutual_status(Mutual) ->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	mod_mutual:put_mutual(#mutual_status{mutual = [Mutual | MutualList]}).

%% 减助力信息
delete_mutual_status(PlayerId,BuildingId)->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	lists:foreach(fun(ListMutual) ->
		#mutual{proto_show_role = MutualShowRole,building_id = MutualBuildingId} = ListMutual,
		#'ProtoShowRole'{id = MutualPlayerId} = MutualShowRole,
		if
			(MutualPlayerId =:= PlayerId) andalso (MutualBuildingId =:= BuildingId) ->
				ReMutualStatus = mod_mutual:get_mutual(),
				#mutual_status{mutual = ReMutualList} = ReMutualStatus,
				NewMutualList = lists:delete(ListMutual,ReMutualList),
				mod_mutual:put_mutual(#mutual_status{mutual = NewMutualList});
			true -> skip
		end
				  end,MutualList).

%% 互助通知势力在线成员助力
notify_mutual(CountryId) ->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	ProtoMutual = lib_mutual_api:mutual_list_to_proto(MutualList),
	Msg = #'Proto80123009'{mutual_list = ProtoMutual},
	mod_server:async_status(mod_player_manage:get_pid(),fun mod_player_manage:async_country_player_notify/3,[CountryId, Msg]).
