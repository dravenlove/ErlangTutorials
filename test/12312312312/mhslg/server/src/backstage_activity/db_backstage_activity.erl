%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十二月 2019 11:44
%%%-------------------------------------------------------------------
-module(db_backstage_activity).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").

%% API
-export([
	load_backstage_activity/0,
	load_mmo_activity/0,
	save_mmo_activity/2,
	save_mmo_activity_list/2,
	remove_activity/1,
	remove_all_close_activity/0,
	data_map_to_config/3
]).
-export([
	bson_list_to_activity_list/1,
	bson_list_to_activity_list/2
]).

bson_to_data(MainType, Bson, _ActivityId) ->
	case MainType of
		_ -> Bson
	end
.

data_to_bson(MainType, Data, _ActivityId) ->
	case MainType of
		_ -> Data
	end
.

bson_to_extra(MainType, Bson, _ActivityId) ->
	case MainType of
		_ -> Bson
	end
.

extra_to_bson(MainType, ExtraValue, _ActivityId) ->
	case MainType of
		_ -> ExtraValue
	end
.

key_value_map(DataMap, FloatToInt) ->
	maps:fold(fun(K, V, Map) ->
		Value = maps:get(value, V),
		Value1 = case FloatToInt andalso is_float(Value) andalso erlang:trunc(Value) == Value of
			false -> Value;
			true -> erlang:trunc(Value)
		end,
		maps:put(K, Value1, Map)
  	end, maps:new(), DataMap)
.

data_map_to_config(MainType, DataMap, _ConfigBson) ->
	case MainType of
		_ -> key_value_map(DataMap, true)
	end
.

bson_to_activity(Bson) ->
	MainType = ?BSON_INT(Bson, main_type),

	%%这里会把配置解析成代码加载到内存, 注意模块名不要和已有模块冲突

	ConfigStr = ?BSON_STRING(Bson, config_string),

	DataMap =
	case ConfigStr =:= "" of
		true -> #{};
		false ->
			{Mod,Code} = dynamic_compile:from_string(ConfigStr),
			code:purge(Mod),
			code:load_binary(Mod, Mod, Code),
			KeyList = Mod:get_list(),
			lists:foldl(fun(Key, Map) ->
				Val = Mod:get(Key),
				maps:put(Key, Val, Map)
		  	end, maps:new(), KeyList)
	end,

	ConfigBson = ?BSON_BSON(Bson, config_bson),
	Config = data_map_to_config(MainType, DataMap, ConfigBson),

	DataBson = ?BSON_BSON_DEFAULT(Bson, data, #{}),
	Data = bson_to_data(MainType, DataBson, ?BSON_INT(Bson, id)),

	ExtraBson = ?BSON_BSON_DEFAULT(Bson, extra_value, #{}),
	Extra = bson_to_extra(MainType, ExtraBson, ?BSON_INT(Bson, id)),

	#activity{
		id = ?BSON_INT(Bson, id),
		main_type = ?BSON_INT(Bson, main_type),
		sub_type = ?BSON_INT(Bson, sub_type),
		group_type = ?BSON_INT(Bson, group_type),
		is_cluster = config:is_cluster(),

		title = ?BSON_STRING(Bson, title),
		content = ?BSON_STRING(Bson, content),
		icon = ?BSON_STRING(Bson, icon),

		level_limit = ?BSON_INT(Bson, level_limit),

		time_type = ?BSON_INT(Bson, time_type),
		start_day = ?BSON_INT(Bson, start_day),
		end_day = ?BSON_INT(Bson, end_day),
		start_tick = ?BSON_INT(Bson, start_tick),
		end_tick = ?BSON_INT(Bson, end_tick),
		update_tick = ?BSON_INT(Bson, update_tick),

		version = ?BSON_INT(Bson, version),
		sort = ?BSON_INT(Bson, sort),

		is_initialized = ?BSON_BOOL_DEFAULT(Bson, is_initialized, false),
		is_started = ?BSON_BOOL_DEFAULT(Bson, is_started, false),
		is_ended = ?BSON_BOOL_DEFAULT(Bson, is_ended, false),
		is_close = ?BSON_BOOL(Bson, is_close),

		is_hide = ?BSON_BOOL_DEFAULT(Bson, is_hide, false),

		daily_reset_tick = ?BSON_INT_DEFAULT(Bson, daily_reset_tick, 0),

		is_open_timeout = ?BSON_BOOL_DEFAULT(Bson, is_open_timeout, false),
		timeout_tick = ?BSON_INT_DEFAULT(Bson, timeout_tick, 0),

		extra_value = Extra,
		client_value = ?BSON_INT_DEFAULT(Bson, client_value, 0),

		config_str = ConfigStr,
		config_bson = ConfigBson,
		config = Config,
		data = Data
	}
.

activity_to_bson(Activity) when is_record(Activity, activity) ->
	DataBson = data_to_bson(Activity#activity.main_type, Activity#activity.data, Activity#activity.id),
	ExtraBson = extra_to_bson(Activity#activity.main_type, Activity#activity.extra_value, Activity#activity.id),
	#{
		?BSONSET_INT(id, Activity#activity.id),
		?BSONSET_INT(main_type, Activity#activity.main_type),
		?BSONSET_INT(sub_type, Activity#activity.sub_type),
		?BSONSET_INT(group_type, Activity#activity.group_type),

		?BSONSET_STRING(title, Activity#activity.title),
		?BSONSET_STRING(content, Activity#activity.content),
		?BSONSET_STRING(icon, Activity#activity.icon),

		?BSONSET_INT(level_limit, Activity#activity.level_limit),

		?BSONSET_INT(time_type, Activity#activity.time_type),
		?BSONSET_INT(start_day, Activity#activity.start_day),
		?BSONSET_INT(end_day, Activity#activity.end_day),
		?BSONSET_INT(start_tick, Activity#activity.start_tick),
		?BSONSET_INT(end_tick, Activity#activity.end_tick),
		?BSONSET_INT(update_tick, Activity#activity.update_tick),

		?BSONSET_INT(version, Activity#activity.version),
		?BSONSET_INT(sort, Activity#activity.sort),

		?BSONSET_BOOL(is_initialized, Activity#activity.is_initialized),
		?BSONSET_BOOL(is_started, Activity#activity.is_started),
		?BSONSET_BOOL(is_ended, Activity#activity.is_ended),
		?BSONSET_BOOL(is_close, Activity#activity.is_close),

		?BSONSET_BOOL(is_hide, Activity#activity.is_hide),

		?BSONSET_INT(daily_reset_tick, Activity#activity.daily_reset_tick),

		?BSONSET_BOOL(is_open_timeout, Activity#activity.is_open_timeout),
		?BSONSET_INT(timeout_tick, Activity#activity.timeout_tick),

		?BSONSET_BSON(extra_value, ExtraBson),
		?BSONSET_INT(client_value, Activity#activity.client_value),

		?BSONSET_STRING(config_string, Activity#activity.config_str),
		?BSONSET_BSON(config_bson, Activity#activity.config_bson),
		?BSONSET_BSON(data, DataBson)
	}
.

bson_list_to_activity_list(BsonList) when is_list(BsonList) ->
	TotalStartMs = lib_timer:unixtime_ms(),

	BackActivityList =
	lists:foldl(fun(Bson, List) ->
		StartMs = lib_timer:unixtime_ms(),

		try
			Activity = bson_to_activity(Bson),
			EndMs = lib_timer:unixtime_ms(),
			?INFO("load backstage activity [~p] [~p] [~p] [~p] [~p]",
				[Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Activity#activity.update_tick, EndMs - StartMs]),
			[Activity | List]
		catch
			_:Reason  ->
				?ERROR("bson_to_activity error: Reason ~p, ~n bson: ~p ~p", [Reason, Bson, erlang:get_stacktrace()]),
				List
		end
	end, [], BsonList),

	TotalEndMs = lib_timer:unixtime_ms(),
	?INFO("load backstage activity total time consume [~p] [~p]", [erlang:length(BackActivityList), TotalEndMs - TotalStartMs]),

	BackActivityList
.
bson_list_to_activity_list(BsonList, UpdateDict) ->
	NewBsonList =
	lists:filter(fun(Bson) ->
		ActId = ?BSON_INT(Bson, id),
		UpdateTick = ?BSON_INT(Bson, update_tick),

		%%新活动或者update_tick有变化
		not dict:is_key(ActId, UpdateDict) orelse dict:fetch(ActId, UpdateDict) =/= UpdateTick
 	end, BsonList),
	ActivityList = bson_list_to_activity_list(NewBsonList),
	ActIdList = [?BSON_INT(Bson, id) || Bson <- BsonList],
	{ActivityList, ActIdList}
.

load_backstage_activity() ->
	QueryBson = #{?BSONSET_BOOL(is_close, false)},
	BsonList = mongo_poolboy:find(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, QueryBson),
	BackActivityList = bson_list_to_activity_list(BsonList),

	%%因为bson_list_to_activity_list解析中会报错的bson, 所以ID列表不能用 BackActivityList, 避免解析出错活动删除
	BackIdList = lists:foldl(fun(ActivityBson, List) ->
		ActId = ?BSON_INT(ActivityBson, id),
		[ActId | List]
	end, [], BsonList),
	{BackActivityList, BackIdList}
.

load_mmo_activity() ->
	QueryBson = #{?BSONSET_BOOL(is_close, false)},
	BsonList = mongo_poolboy:find(?MMO_POOL, ?DB_MMO_ACTIVITY, QueryBson),
	bson_list_to_activity_list(BsonList)
.

save_mmo_activity(Activity, Block) when is_record(Activity, activity) ->
	ActivityBson = activity_to_bson(Activity),
	case Block of
		true ->
			mongo_poolboy:async_update(?MMO_POOL, ?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson);
%%			lib_gamedb_api:noreply_update(?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson);
		false ->
			mongo_poolboy:async_update(?MMO_POOL, ?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson)
%%			lib_gamedb_api:noreply_update(?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson)
	end,
	?INFO("save activity [~p] ~n", [Activity#activity.id])
.

save_mmo_activity_list([], _Block) ->
	ok
;
save_mmo_activity_list([Activity | List], Block) when is_record(Activity, activity) ->
	save_mmo_activity(Activity, Block),
	save_mmo_activity_list(List, Block)
.

remove_activity(Activity) when is_record(Activity, activity) ->
	?INFO("remove backstage activity [~p]~n", [Activity#activity.id]),

	ActivityId = Activity#activity.id,
	UpdateTick = Activity#activity.update_tick,
	QueryBson = #{
		?BSONSET_INT(id, ActivityId),
		?BSONSET_INT(update_tick, UpdateTick)
	},

%%	lib_gamedb_api:task_delete_one(noreply, 0, ?DB_MMO_ACTIVITY, QueryBson),
%%	lib_backdb_api:task_delete_one(noreply, 0, ?DB_BACKSTAGE_ACTIVITY, QueryBson)
	mongo_poolboy:async_delete_one(?MMO_POOL, ?DB_MMO_ACTIVITY, QueryBson),
	mongo_poolboy:async_delete_one(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, QueryBson)
.

remove_all_close_activity() ->
	QueryBson = #{
		?BSONSET_BOOL(is_close, true)
	},

%%	lib_backdb_api:task_delete(noreply, 0, ?DB_BACKSTAGE_ACTIVITY, QueryBson)
	mongo_poolboy:async_delete(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, QueryBson)
.