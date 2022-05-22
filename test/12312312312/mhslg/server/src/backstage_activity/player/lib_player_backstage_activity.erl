%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十二月 2019 16:44
%%%-------------------------------------------------------------------
-module(lib_player_backstage_activity).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").
-include("backstage_activity_player.hrl").
-include("ProtoClient_10117.hrl").

-define(PA_NEW_ACTIVITY, 0). %%todo
-define(PA_LOGIN, 0). %%todo

%% API
-export([
	get_player_activity/0,
	put_player_activity/2,
	ets_init/0,
	build_index/0,
	player_activity_handler/0,

	remove_expire_detail/1,
	activity_to_proto/1,
	check_login_assist/0,

	fetch_activity_list/0,
	fetch_activity_list_end/1,
	request_activity_click/1,
	notify_activity_update/1

]).
-export([
	async_activity_apply/2,		%%异步获取活动信息apply
	async_activity_apply/3,		%%异步获取活动信息apply
	async_activity_hook/3,

	async_activity_list_apply/1,%%异步获取活动列表apply
	async_activity_list_run/2,	%%异步获取活动列表apply
	async_activity_list_hook/3,

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
async_activity_list_apply(Fun) ->
	async_activity_list_run(Fun, [])
.
async_activity_list_run(Fun, Args) ->
	mod_backstage_activity_monitor:player_activity_list(lib_player:player_id(), fun lib_player_backstage_activity:async_activity_list_hook/3, [Fun, Args])
.
async_activity_list_hook(ActivityList, Fun, Args) ->
	sync_activity(ActivityList),
	apply(Fun, [ActivityList | Args])
.

%%异步获取活动信息后执行回调函数
%%会调用sync_activity同步校对活动数据
%%参数:
%% Fun	: 回调函数
%% Args	: 回调参数, 完整参数为[Activity(活动信息) | Args]
async_activity_apply(ActId, Fun) ->
	async_activity_apply(ActId, Fun, [])
.
async_activity_apply(ActId, Fun, Args) ->
	mod_backstage_activity:async_apply(ActId, fun mod_backstage_activity:player_fetch_activity/3,
		[lib_player:player_id(), fun lib_player_backstage_activity:async_activity_hook/3, [Fun, Args]])
.
async_activity_hook(Activity, Fun, Args) ->
	sync_activity(Activity),
	apply(Fun, [Activity | Args])
.

get_player_activity() ->
	erlang:get(?ETS_PLAYER_BACKSTAGE_ACTIVITY)
.

put_player_activity(PlayerActivity) when is_record(PlayerActivity, player_back_act) ->
	put_player_activity(PlayerActivity, true)
.
put_player_activity(PlayerActivity, IsSaveDb) when is_record(PlayerActivity, player_back_act) ->
	erlang:put(?ETS_PLAYER_BACKSTAGE_ACTIVITY, PlayerActivity),
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BACKSTAGE_ACTIVITY)
.

ets_init() ->
	ets:new(?ETS_PLAYER_BACKSTAGE_ACTIVITY, [?ETS_KEY_POS(#player_back_act.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, {?TUPLE_INT(id, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_BACKSTAGE_ACTIVITY, {?TUPLE_INT(id, 1), ?TUPLE_INT(activity_id, 1)}, false)
.

player_activity_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BACKSTAGE_ACTIVITY,
		table_name = ?DB_PLAYER_BACKSTAGE_ACTIVITY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_backstage_activity:load_player_backstage_activity/1,
		save_func = fun db_player_backstage_activity:save_player_backstage_activity/1,
		get_func = fun get_player_activity/0,
		put_func = fun put_player_activity/2
	}.

error_output(Output, Activity, Reason, Result) when is_record(Activity, activity) ->
	?ERROR("~ts, [~p] [~p] [~p] [~p] ~p:~p ~p ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Activity#activity.update_tick, Reason, Result, erlang:get_stacktrace()])
.

%%同步活动的数据
sync_activity(ActivityList) when is_list(ActivityList) ->
	lists:map(fun(Activity) -> sync_activity(Activity) end, ActivityList)
;
sync_activity(Activity) when is_record(Activity, activity) ->
	try
		ActivityId = Activity#activity.id,
		PlayerActivity = get_player_activity(),
		Detail = 
		case dict:is_key(ActivityId, PlayerActivity#player_back_act.act_detail_dict) of
			false -> new_detail(Activity);	%%新的ID, 新创建一个
			true ->
				try
					OldDetail = dict:fetch(ActivityId, PlayerActivity#player_back_act.act_detail_dict),

					%%每个活动的main_type 和 sub_type 不能被改变
					%%				case OldDetail#activity_detail.main_type =/= Activity#activity.main_type orelse
					%%					OldDetail#activity_detail.sub_type =/= Activity#activity.sub_type of
					%%					true -> throw({ok, new_detail(Activity)});	%%main_type 或 sub_type改变, 新创建一个
					%%					false -> skip
					%%				end,

					case OldDetail#activity_detail.update_tick =/= Activity#activity.update_tick of
						false ->  throw({ok, OldDetail});	%%没有改变, 返回之前的
						true -> skip
					end,

					case OldDetail#activity_detail.version =/= Activity#activity.version of
						true -> reset_detail(OldDetail, Activity);	%%版本不同, 重置现在的
						false -> modify_detail(OldDetail, Activity)	%%版本相同, 修改现在的
					end
				catch
					throw: {ok, NewDetail} -> NewDetail
				end
		end,

		update_activity_detail(Detail),
		check_new_activity_assist(ActivityId)
	catch
		throw: {error, _} -> skip;
		Reason: Result -> error_output("backstage activity player sync err", Activity, Reason, Result)
	end
.

%%是否有这个detail
is_have_detail(ActivityId) ->
	PlayerActivity = get_player_activity(),
	DetailDict = PlayerActivity#player_back_act.act_detail_dict,
	dict:is_key(ActivityId, DetailDict)
.

%%获取活动detail
get_activity_detail(ActivityId) ->
	PlayerActivity = get_player_activity(),
	DetailDict = PlayerActivity#player_back_act.act_detail_dict,
	dict:fetch(ActivityId, DetailDict)
.

%%更新活动detail
update_activity_detail(Detail) when is_record(Detail, activity_detail) ->
	PlayerActivity = get_player_activity(),
	DetailDict = PlayerActivity#player_back_act.act_detail_dict,
	NewDetailDict = dict:store(Detail#activity_detail.id, Detail, DetailDict),
	put_player_activity(PlayerActivity#player_back_act{act_detail_dict = NewDetailDict})
.

%%获取活动data
get_activity_data(ActivityId) ->
	Detail = get_activity_detail(ActivityId),
	Detail#activity_detail.data
.

%%更新活动data
update_activity_data(ActivityId, Data) ->
	Detail = get_activity_detail(ActivityId),
	NewDetail = Detail#activity_detail{data = Data},
	update_activity_detail(NewDetail)
.

%%更新活动显示
update_activity_display(ActId) ->
	mod_backstage_activity:async_apply(ActId, fun mod_backstage_activity:notify_player_activity_update/1, [lib_player:player_id()])
.

default_validate_show(Activity) when is_record(Activity, activity) ->
	try
		?JUDGE_RETURN(lib_player:player_level() >= Activity#activity.level_limit, false),
		?JUDGE_RETURN(not lib_backstage_activity:is_hide(Activity), false),

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
		Reason: Result -> error_output("backstage activity player validate show err", Activity, Reason, Result), false
	end
.

%%删除过期活动数据
remove_expire_detail(CurActIdList) when is_list(CurActIdList) ->
	PlayerActivity = get_player_activity(),
	DetailDict = PlayerActivity#player_back_act.act_detail_dict,

	NewDetailDict = dict:fold(fun(ActId, Detail, Dict) ->
		case lists:member(ActId, CurActIdList) of
			true -> dict:store(ActId, Detail, Dict);
			false -> db_player_backstage_activity:remove_detail(lib_player:player_id(), Detail)
		end
	end, dict:new(), DetailDict),
	put_player_activity(PlayerActivity#player_back_act{act_detail_dict = NewDetailDict})
.

activity_left_tick(Activity) when is_record(Activity, activity) ->
	try
		case Activity#activity.main_type of
			_ -> lib_backstage_activity:left_time(Activity)
		end
	catch
		Reason: Result -> ?ERROR("backstage activity player left_time ~p ~p~n", [Reason, Result]), 0
	end
.

activity_to_proto(Activity) when is_record(Activity, activity) ->
	ProtoActivity = lib_backstage_activity:activity_to_proto(Activity),
	ProtoActivity#'ProtoActivityBase'{
		left_time = activity_left_tick(Activity)
	}
.

%% 获取活动信息
%% ActivityId : 活动唯一ID
%% Validate : 是否进行进行中验证
%% 返回 #activity
fetch_activity_by_id(ActivityId)->
	Ret = mod_backstage_activity:sync_apply(ActivityId, fun mod_backstage_activity:fetch_activity/1, [lib_player:player_id()]),
	case Ret of
		#activity{} -> Ret;
		_ -> false
	end
.
fetch_activity_by_id(ActivityId, Validate) ->
	Ret = fetch_activity_by_id(ActivityId),
	case Validate andalso Ret =/= false of
		true ->
			case lib_backstage_activity:is_ongoing(Ret) of
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
		main_type = Activity#activity.main_type,
		sub_type = Activity#activity.sub_type,
		group_type = Activity#activity.group_type,
		is_cluster = Activity#activity.is_cluster,
		update_tick = Activity#activity.update_tick,
		version = Activity#activity.version,
		data = lib_player_backstage_activity_handle:new_data(Activity)
	}

.

%%重置detail
reset_detail(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
	Detail#activity_detail{
		group_type = Activity#activity.group_type,
		update_tick = Activity#activity.update_tick,
		version = Activity#activity.version,
		data = lib_player_backstage_activity_handle:reset_data(Detail, Activity)
	}
.

%%修改detail
modify_detail(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
	Detail#activity_detail{
		group_type = Activity#activity.group_type,
		update_tick = Activity#activity.update_tick,
		version = Activity#activity.version,
		data = lib_player_backstage_activity_handle:modify_data(Detail, Activity)
	}
.

%% 获取活动信息
%% ActivityId: 活动ID
%% 返回: #activity | false
%% 成功获取到活动信息则返回对应结构, 否则返回 false
%% 此接口一般仅在处理玩家请求的时候使用, 内部处理使用 async_activity_run 异步调用
fetch_activity_info(ActivityId) ->
	try
		Activity = fetch_activity_by_id(ActivityId, true),
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
			?JUDGE_RETURN(lib_backstage_activity:is_ongoing(Activity), false),
			?JUDGE_RETURN(validate_show(Activity), false),
			true
		catch
			throw: {error, Flag} -> Flag
		end
 	end, ActivityList),

	ShowProtoList = [ activity_to_proto(Activity) || Activity <- ShowList ],
	HideProtoList = [ activity_to_proto(Activity) || Activity <- HideList ],

	case erlang:length(ShowProtoList) > 0 of
		false -> skip;
		true -> lib_send:respond_to_client(#'Proto80117002'{act_list = ShowProtoList})
	end,

	case erlang:length(HideProtoList) > 0 of
		false -> skip;
		true -> lib_send:respond_to_client(#'Proto80117003'{act_list = HideProtoList})
	end
.

%%获取活动列表
fetch_activity_list()->
	async_activity_list_apply(fun fetch_activity_list_end/1)
.
fetch_activity_list_end(ActivityList)->
	ProtoList =
	lists:foldl(fun(Activity, List) ->
		try
			?JUDGE_RETURN(lib_backstage_activity:is_ongoing(Activity), false),
			?JUDGE_RETURN(validate_show(Activity), false),
			[activity_to_proto(Activity) | List]
		catch
			throw: {error, false} -> List
		end
	end, [], ActivityList),

	Respond = #'Proto80117001'{
		act_list = ProtoList
	},
	lib_send:respond_to_client(Respond)
.


%%检查新活动红点 (因为这个方法是在sync_activity 后才会调用, 所以不需要异步请求活动列表)
check_new_activity_assist(ActId) ->
	try
		?JUDGE_RETURN(is_have_detail(ActId), -1),

		Detail = get_activity_detail(ActId),
		MainType = Detail#activity_detail.main_type,
		SubType = Detail#activity_detail.sub_type,
		?JUDGE_RETURN(lib_backstage_activity_config:use_new_activity_assist(MainType, SubType), -1)
%%		lib_player_assist_api:back_act_update(ActId, ?PA_NEW_ACTIVITY, not Detail#activity_detail.is_click) %%TODO assist
	catch
		throw: {error, _} -> skip
	end
.

%%检查活动登陆红点 (因为这个方法是在sync_activity 后才会调用, 所以不需要异步请求活动列表)
check_login_assist() ->
	PlayerActivity = get_player_activity(),
	DetailDict = PlayerActivity#player_back_act.act_detail_dict,
	dict:map(fun(ActId, _) ->
		check_login_assist(ActId)
 	end, DetailDict)
.
check_login_assist(ActId) ->
	try
		?JUDGE_RETURN(is_have_detail(ActId), -1),

		Detail = get_activity_detail(ActId),
		MainType = Detail#activity_detail.main_type,
		SubType = Detail#activity_detail.sub_type,
		?JUDGE_RETURN(lib_backstage_activity_config:use_login_assist(MainType, SubType), -1)

%%		lib_player_assist_api:back_act_update(ActId, ?PA_LOGIN, true) %%todo assist
	catch
		throw: {error, _} -> skip
	end
.

click_activity(ActId) ->
%%	lib_player_assist_api:back_act_update(ActId, ?PA_LOGIN, false), %%todo assist

	try
		?JUDGE_RETURN(is_have_detail(ActId), -1),

		Detail = get_activity_detail(ActId),
		update_activity_detail(Detail#activity_detail{is_click = true}),

		check_new_activity_assist(ActId)
	catch
		throw: {error, _} -> skip
	end
.

request_activity_click(Msg) ->
	ActId = Msg#'Proto10117002'.act_id,
	click_activity(ActId),

	lib_send:respond_to_client(#'Proto50117002'{act_id = ActId})
.