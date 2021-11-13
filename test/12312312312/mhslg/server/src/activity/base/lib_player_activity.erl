%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 六月 2021 17:27
%%%-------------------------------------------------------------------
-module(lib_player_activity).
-author("13661").

%% API
-export([]).

-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").
-include("ProtoClient_10150.hrl").

-define(PA_NEW_ACTIVITY, 0). %%todo
-define(PA_LOGIN, 0). %%todo

%% API
-export([
	get_player_activity/0,
	put_player_activity/1,
	put_player_activity/2,
	ets_init/0,
	build_index/0,
	player_activity_handler/0,

	remove_expire_detail/2,
	activity_to_proto/1,
	check_login_assist/2,

	fetch_activity_list/0,
	fetch_activity_list_end/2,
	update_activity/2,
	% request_activity_click/1,
	notify_activity_update/1

]).
-export([
	async_activity_apply/2,		%%异步获取活动信息apply
	async_activity_apply/3,		%%异步获取活动信息apply
	async_activity_hook/3,

	async_activity_list_apply/1,%%异步获取活动列表apply
	async_activity_list_apply/2,%%异步获取活动列表apply
	async_activity_list_hook/4,

	is_have_detail/1,			%%是否有活动detail
	get_activity_detail/1,		%%获取活动detail
	get_activity_data/1,		%%获取活动data
	update_activity_data/2,		%%更新活动data

	update_activity_display/1,	%%更新活动显示信息

	fetch_activity_by_id/1,		%%获取活动信息
	fetch_activity_by_id/2,		%%获取活动信息, 带验证
	fetch_activity_info/1		%%获取活动的信息
]).



%%异步获取活动列表后执行回调函数
%%会调用sync_activity同步校对活动数据
%%参数:
%% Fun	: 回调函数
%% Args	: 回调参数, 完整参数为[ActivityList(活动列表) | Args]
async_activity_list_apply(Fun) when is_function(Fun) ->
	async_activity_list_apply(Fun, [])
.
async_activity_list_apply(Fun, Args) when is_function(Fun) ->
	ArgMap = #{
		?ACTIVITY_SYSTEM_TYPE_INNER => [
		mod_activity_monitor, 
		fun mod_activity_monitor:player_activity_list/4, 
		[config:server_flag(), lib_player:player_id(), fun lib_player_activity:async_activity_list_hook/4, [Fun, Args]]
		]
	},
	FunMap = #{
		?ACTIVITY_SERVER_TYPE_SINGLE => fun mod_server:async_apply/3,
		?ACTIVITY_SERVER_TYPE_CLUSTER => fun lib_cluster_send:cluster_async_apply/3,
		?ACTIVITY_SERVER_TYPE_WORLD => fun lib_cluster_send:world_async_apply/3
	},

	lib_common:for(fun(ServerType) ->
		ApplyFun = maps:get(ServerType, FunMap),
        lib_common:for(fun(SystemType) ->
			ApplyArgs = maps:get(SystemType, ArgMap),
			apply(ApplyFun, ApplyArgs)
		end, ?ACTIVITY_SYSTEM_TYPE_START, ?ACTIVITY_SYSTEM_TYPE_END)
    end, ?ACTIVITY_SERVER_TYPE_START, ?ACTIVITY_SERVER_TYPE_END)
.
async_activity_list_hook(TID, ActivityList, Fun, Args) ->
	sync_activity(ActivityList),
	apply(Fun, [TID, ActivityList] ++ Args)
.

%%异步获取活动信息后执行回调函数
%%会调用sync_activity同步校对活动数据
%%参数:
%% UID	: %activity_uid
%% Fun	: 回调函数
%% Args	: 回调参数, 完整参数为[Activity(活动信息) | Args]
async_activity_apply(UID, Fun) ->
	async_activity_apply(UID, Fun, [])
.
async_activity_apply(UID, Fun, Args) ->
	ActId = UID#activity_uid.id,
	mod_activity:async_apply(UID, fun mod_activity:player_fetch_activity/5,
		[ActId, lib_player:player_id(), fun lib_player_activity:async_activity_hook/3, [Fun, Args]])
.
async_activity_hook(Activity, Fun, Args) ->
	sync_activity(Activity),
	apply(Fun, [Activity | Args])
.

get_player_activity() ->
	erlang:get(?ETS_PLAYER_ACTIVITY)
.

put_player_activity(PlayerActivity) when is_record(PlayerActivity, player_activity) ->
	put_player_activity(PlayerActivity, true)
.
put_player_activity(PlayerActivity, IsSaveDb) when is_record(PlayerActivity, player_activity) ->
	erlang:put(?ETS_PLAYER_ACTIVITY, PlayerActivity),
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_ACTIVITY)
.

ets_init() ->
	ets:new(?ETS_PLAYER_ACTIVITY, [?ETS_KEY_POS(#player_activity.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?ETS_PLAYER_ACTIVITY, {?TUPLE_INT(id, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?ETS_PLAYER_ACTIVITY, {?TUPLE_INT(id, 1), ?TUPLE_INT(activity_id, 1)}, false)
.

player_activity_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_ACTIVITY,
		table_name = ?ETS_PLAYER_ACTIVITY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_activity:load_player_activity/1,
		save_func = fun db_player_activity:save_player_activity/1,
		get_func = fun get_player_activity/0,
		put_func = fun put_player_activity/2
	}.

error_output(Output, Activity, Reason, Result) when is_record(Activity, activity) ->
	?ERROR("~ts, [~p] [~p] [~p] ~p:~p ~p ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Reason, Result, erlang:get_stacktrace()])
.

%%同步活动的数据
sync_activity(ActivityList) when is_list(ActivityList) ->
	lists:map(fun(Activity) -> sync_activity(Activity) end, ActivityList)
;
sync_activity(Activity) when is_record(Activity, activity) ->
	try
		UID = lib_activity_api:uid(Activity),
		Detail = 
		case is_have_detail(UID) of
			false -> new_detail(Activity);	%%新的ID, 新创建一个
			true ->
				try
					get_activity_detail(UID)
					% _OldDetail = maps:get(ActivityId, PlayerActivity#player_activity.act_detail_map),
					%%每个活动的main_type 和 sub_type 不能被改变
					%%				case OldDetail#activity_detail.main_type =/= Activity#activity.main_type orelse
					%%					OldDetail#activity_detail.sub_type =/= Activity#activity.sub_type of
					%%					true -> throw({ok, new_detail(Activity)});	%%main_type 或 sub_type改变, 新创建一个
					%%					false -> skip
					%%				end,

					% case OldDetail#activity_detail.update_tick =/= Activity#activity.update_tick of
					% 	false ->  throw({ok, OldDetail});	%%没有改变, 返回之前的
					% 	true -> skip
					% end,

					% case OldDetail#activity_detail.version =/= Activity#activity.version of
					% 	true -> reset_detail(OldDetail, Activity);	%%版本不同, 重置现在的
					% 	false -> modify_detail(OldDetail, Activity)	%%版本相同, 修改现在的
					% end
				catch
					throw: {ok, NewDetail} -> NewDetail
				end
		end,

		update_activity_detail(Detail),
		check_new_activity_assist(lib_activity_api:uid(Activity))
	catch
		throw: {error, _} -> skip;
		Reason: Result -> error_output("activity player sync err", Activity, Reason, Result)
	end
.

get_detail_map(TID) when is_record(TID, activity_tid) ->
	PlayerActivity = get_player_activity(),
	TypeMap = PlayerActivity#player_activity.act_detail_map,
	maps:get(TID, TypeMap, maps:new())
.

update_detail_map(TID, DetailMap) when is_record(TID, activity_tid) ->
	PlayerActivity = get_player_activity(),
	TypeMap = PlayerActivity#player_activity.act_detail_map,
	NewTypeMap = maps:put(TID, DetailMap, TypeMap),
	put_player_activity(PlayerActivity#player_activity{act_detail_map = NewTypeMap})
.

%%是否有这个detail
is_have_detail(UID) ->
    ActId = UID#activity_uid.id,
    DetailMap = get_detail_map(lib_activity_api:tid(UID)),
	maps:is_key(ActId, DetailMap)
.

%%获取活动detail
get_activity_detail(UID) ->
    ActId = UID#activity_uid.id,
    DetailMap = get_detail_map(lib_activity_api:tid(UID)),
	maps:get(ActId, DetailMap)
.

%%更新活动detail
update_activity_detail(Detail) when is_record(Detail, activity_detail) ->
	ActId = Detail#activity_detail.id,
	TID = lib_activity_api:tid(Detail),
	
	DetailMap = get_detail_map(TID),
	NewDetailMap = maps:put(ActId, Detail, DetailMap),
	update_detail_map(TID, NewDetailMap)
.

%%获取活动data
get_activity_data(UID) ->
	Detail = get_activity_detail(UID),
	Detail#activity_detail.data
.

%%更新活动data
update_activity_data(UID, Data) ->
	Detail = get_activity_detail(UID),
	NewDetail = Detail#activity_detail{data = Data},
	update_activity_detail(NewDetail)
.

%%更新活动显示
update_activity_display(UID) ->
	mod_activity:async_apply(UID, fun mod_activity:notify_player_activity_update/1, [lib_player:player_id()])
.

default_validate_show(Activity) when is_record(Activity, activity) ->
	try
		% ?JUDGE_RETURN(lib_player:player_level() >= Activity#activity.level_limit, false),
		% ?JUDGE_RETURN(not lib_activity:is_hide(Activity), false),

		true
	catch
		throw: {error, Flag} -> Flag
	end
.

validate_show(Activity) ->
	try
		?JUDGE_RETURN(default_validate_show(Activity) =:= true, false),
		case Activity#activity.main_type of
			_ -> true
		end
	catch
		throw : {error, Flag} -> Flag;
		Reason: Result -> error_output("activity player validate show err", Activity, Reason, Result), false
	end
.

%%删除过期活动数据 %%TODO
remove_expire_detail(TID, ActivityMap) when is_map(ActivityMap) ->
	DetailMap = get_detail_map(TID),

	NewDetailMap = maps:fold(fun(ActId, Detail, Map) ->
		case maps:is_key(ActId, ActivityMap) of
			true -> maps:put(ActId, Detail, Map);
			false -> 
                db_player_activity:remove_detail(lib_player:player_id(), Detail),
                Map
		end
	end, maps:new(), DetailMap),
	update_detail_map(TID, NewDetailMap)
.

% activity_left_tick(Activity) when is_record(Activity, activity) ->
% 	try
% 		case Activity#activity.main_type of
% 			_ -> lib_activity:left_time(Activity)
% 		end
% 	catch
% 		Reason: Result -> ?ERROR("activity player left_time ~p ~p~n", [Reason, Result]), 0
% 	end
% .

activity_to_proto(Activity) when is_record(Activity, activity) ->
	lib_activity_api:activity_to_proto(Activity)
.

%% 获取活动信息
%% UID : #activity_uid
%% Validate : 是否进行进行中验证
%% 返回 #activity
fetch_activity_by_id(UID)->
	Ret = mod_activity:sync_apply(UID, fun mod_activity:fetch_activity/1, [UID#activity_uid.id]),
	?INFO("~p", [Ret]),
	case Ret of
		#activity{} -> Ret;
		_ -> false
	end
.
fetch_activity_by_id(UID, Validate) ->
	Ret = fetch_activity_by_id(UID),
	case Validate andalso Ret =/= false of
		true ->
			case lib_activity_api:is_ongoing(Ret) of
				false -> false;
				true -> Ret
			end;
		false -> Ret
	end
.

%%创建新detail
new_detail(Activity) when is_record(Activity, activity) ->
	#activity_detail{
		id = Activity#activity.id,
        server_type = Activity#activity.server_type,
        system_type = Activity#activity.system_type,
		main_type = Activity#activity.main_type,
		sub_type = Activity#activity.sub_type,
		% group_type = Activity#activity.group_type,
		% is_cluster = Activity#activity.is_cluster,
		% update_tick = Activity#activity.update_tick,
		% version = Activity#activity.version,
		data = lib_player_activity_handle:new_data(Activity)
	}

.

%%重置detail
% reset_detail(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
% 	Detail#activity_detail{
% 		group_type = Activity#activity.group_type,
% 		update_tick = Activity#activity.update_tick,
% 		version = Activity#activity.version,
% 		data = lib_player_activity_handle:reset_data(Detail, Activity)
% 	}
% .

% %%修改detail
% modify_detail(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
% 	Detail#activity_detail{
% 		group_type = Activity#activity.group_type,
% 		update_tick = Activity#activity.update_tick,
% 		version = Activity#activity.version,
% 		data = lib_player_activity_handle:modify_data(Detail, Activity)
% 	}
% .

%% 获取活动信息
%% UID: #activity_uid
%% 返回: #activity | false
%% 成功获取到活动信息则返回对应结构, 否则返回 false
%% 此接口一般仅在处理玩家请求的时候使用, 内部处理使用 async_activity_run 异步调用
fetch_activity_info(UID) ->
	try
		Activity = fetch_activity_by_id(UID, true),
		?JUDGE_RETURN(Activity =/= false, false),
		sync_activity(Activity),
		Activity
	catch
		throw: {error, Ret} -> Ret
	end
.

%%通知活动更新
notify_activity_update(ActivityList) when is_list(ActivityList) ->
	sync_activity(ActivityList),

	{ShowList, HideList} = lists:partition(fun(Activity) ->
		try
			?JUDGE_RETURN(lib_activity_api:is_ongoing(Activity), false),
			?JUDGE_RETURN(validate_show(Activity), false),
			true
		catch
			throw: {error, Flag} -> Flag
		end
 	end, ActivityList),

	ShowProtoList = [ activity_to_proto(Activity) || Activity <- ShowList ],
	HideProtoList = [ activity_to_proto(Activity) || Activity <- HideList ],

	Notify = #'Proto80150002'{
		add_list = ShowProtoList,
		del_list = HideProtoList
	},
	lib_send:respond_to_client(Notify)
.

%%获取活动列表
fetch_activity_list()->
	async_activity_list_apply(fun fetch_activity_list_end/2)
.
fetch_activity_list_end(TID, ActivityList) ->
	ProtoList =
	lists:foldl(fun(Activity, List) ->
		try
			?JUDGE_RETURN(lib_activity_api:is_ongoing(Activity), false),
			?JUDGE_RETURN(validate_show(Activity), false),
			[activity_to_proto(Activity) | List]
		catch
			throw: {error, false} -> List
		end
	end, [], ActivityList),

	Respond = #'Proto50150001'{
		tid = lib_activity_api:tid_to_proto(TID),
		act_list = ProtoList
	},
	?INFO("~p", [Respond]),
	lib_send:respond_to_client(Respond)
.

update_activity(TID, ActivityList) ->
	ProtoList = lists:foldl(
		fun(Activity, List) ->
			try
				?JUDGE_RETURN(lib_activity_api:is_ongoing(Activity), false),
				?JUDGE_RETURN(validate_show(Activity), false),
				[activity_to_proto(Activity) | List]
			catch
				throw: {error, false} -> List
			end
		end, [], ActivityList),

	Respond = #'Proto80150001'{
		tid = lib_activity_api:tid_to_proto(TID),
		act_list = ProtoList
	},
	?INFO("update ~p", [Respond]),
	lib_send:respond_to_client(Respond)
.

%%检查新活动红点 (因为这个方法是在sync_activity 后才会调用, 所以不需要异步请求活动列表)
check_new_activity_assist(UID) ->
	try
		?JUDGE_RETURN(is_have_detail(UID), -1),

		Detail = get_activity_detail(UID),
		MainType = Detail#activity_detail.main_type,
		SubType = Detail#activity_detail.sub_type,
		?JUDGE_RETURN(lib_activity_config:use_new_activity_assist(MainType, SubType), -1)
%%		lib_player_assist_api:back_act_update(ActId, ?PA_NEW_ACTIVITY, not Detail#activity_detail.is_click) %%TODO assist
	catch
		throw: {error, _} -> skip
	end
.

%%检查活动登陆红点 (因为这个方法是在sync_activity 后才会调用, 所以不需要异步请求活动列表)
check_login_assist(_TID, ActivityList) ->
	lists:map(fun(Activity) -> 
		check_login_assist(lib_activity_api:uid(Activity))	
	end, ActivityList)
.
check_login_assist(UID) ->
	try
		?JUDGE_RETURN(is_have_detail(UID), -1),

		Detail = get_activity_detail(UID),
		MainType = Detail#activity_detail.main_type,
		SubType = Detail#activity_detail.sub_type,
		?JUDGE_RETURN(lib_activity_config:use_login_assist(MainType, SubType), -1)

%%		lib_player_assist_api:back_act_update(ActId, ?PA_LOGIN, true) %%todo assist
	catch
		throw: {error, _} -> skip
	end
.

% click_activity(UID) ->
% %%	lib_player_assist_api:back_act_update(ActId, ?PA_LOGIN, false), %%todo assist

% 	try
% 		?JUDGE_RETURN(is_have_detail(UID), -1),

% 		Detail = get_activity_detail(UID),
% 		update_activity_detail(Detail#activity_detail{is_click = true}),

% 		check_new_activity_assist(UID)
% 	catch
% 		throw: {error, _} -> skip
% 	end
% .

% request_activity_click(Msg) ->
% 	ActId = Msg#'Proto10117002'.act_id,
% 	click_activity(ActId),

% 	lib_send:respond_to_client(#'Proto50117002'{act_id = ActId})
% .