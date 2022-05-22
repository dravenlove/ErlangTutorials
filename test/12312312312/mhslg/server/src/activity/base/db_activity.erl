%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 六月 2021 18:26
%%%-------------------------------------------------------------------
-module(db_activity).
-author("13661").

-include("base.hrl").
-include("log.hrl").
-include("mongodb.hrl").
-include("activity.hrl").

%% API
-export([
	% load_backstage_activity/0,
	load_mmo_activity/2,
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

bson_to_data(MainType, Bson) ->
	case MainType of
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> db_open_server_rank:bson_to_data(Bson);
		_ -> Bson
	end
.

data_to_bson(MainType, Data) ->
	case MainType of
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> db_open_server_rank:data_to_bson(Data);
		_ -> Data
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
	DataBson = ?BSON_BSON(Bson, data),
	Data = bson_to_data(MainType, DataBson),
	#activity{
		id = ?BSON_INT(Bson, id),

        server_type = ?BSON_INT(Bson, server_type),
        system_type = ?ACTIVITY_SYSTEM_TYPE_INNER,

		main_type = ?BSON_INT(Bson, main_type),
		sub_type = ?BSON_INT(Bson, sub_type),

		conf_index = ?BSON_INT(Bson, conf_index),

		time_type = ?BSON_INT(Bson, time_type),

        start_date = ?BSON_INT(Bson, start_date),
        start_season = ?BSON_LIST(Bson, start_season),
        start_festival = ?BSON_LIST(Bson, start_festival),

        end_date = ?BSON_INT(Bson, end_data),
        end_season = ?BSON_LIST(Bson, end_season),
        duration_min = ?BSON_INT(Bson, duration_min),

		is_initialized = ?BSON_BOOL(Bson, is_initialized),
		is_started = ?BSON_BOOL(Bson, is_started),
		is_ended = ?BSON_BOOL(Bson, is_ended),
		is_closed = ?BSON_BOOL(Bson, is_closed),

        start_tick = ?BSON_INT(Bson, start_tick),
		daily_reset_tick = ?BSON_INT(Bson, daily_reset_tick),

		data = Data,
		tips_time = ?BSON_INT(Bson, <<"tips_time">>),
		tips = ?BSON_INT(Bson, <<"tips">>)
	}
.

activity_to_bson(Activity) when is_record(Activity, activity) ->
	DataBson = data_to_bson(Activity#activity.main_type, Activity#activity.data),
	#{
		?BSONSET_INT(id, Activity#activity.id),

        ?BSONSET_INT(server_type, Activity#activity.server_type),
		?BSONSET_INT(system_type, Activity#activity.system_type),

		?BSONSET_INT(main_type, Activity#activity.main_type),
		?BSONSET_INT(sub_type, Activity#activity.sub_type),

		?BSONSET_INT(conf_index, Activity#activity.conf_index),

        ?BSONSET_INT(time_type, Activity#activity.time_type),

        ?BSONSET_INT(start_date, Activity#activity.start_date),
        ?BSONSET_LIST(start_season, Activity#activity.start_season),
        ?BSONSET_LIST(start_festival, Activity#activity.start_festival),

        ?BSONSET_INT(end_date, Activity#activity.end_date),
        ?BSONSET_LIST(end_season, Activity#activity.end_season),
        ?BSONSET_INT(duration_min, Activity#activity.duration_min),

		?BSONSET_BOOL(is_initialized, Activity#activity.is_initialized),
		?BSONSET_BOOL(is_started, Activity#activity.is_started),
		?BSONSET_BOOL(is_ended, Activity#activity.is_ended),
		?BSONSET_BOOL(is_closed, Activity#activity.is_closed),

        ?BSONSET_INT(start_tick, Activity#activity.start_tick),
		?BSONSET_INT(daily_reset_tick, Activity#activity.daily_reset_tick),

		?BSONSET_BSON(data, DataBson),
		?BSONSET_INT(<<"tips_time">>, Activity#activity.tips_time),
		?BSONSET_INT(<<"tips">>, Activity#activity.tips)
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
			?INFO("load activity [~p] [~p] [~p] [~p]",
				[Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, EndMs - StartMs]),
			[Activity | List]
		catch
			_:Reason  ->
				?ERROR("bson_to_activity error: Reason ~p, ~n bson: ~p ~p", [Reason, Bson, erlang:get_stacktrace()]),
				List
		end
	end, [], BsonList),

	TotalEndMs = lib_timer:unixtime_ms(),
	?INFO("load activity total time consume [~p] [~p]", [erlang:length(BackActivityList), TotalEndMs - TotalStartMs]),

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

% load_backstage_activity() ->
% 	QueryBson = #{?BSONSET_BOOL(is_close, false)},
% 	BsonList = mongo_poolboy:find(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, QueryBson),
% 	BackActivityList = bson_list_to_activity_list(BsonList),

% 	%%因为bson_list_to_activity_list解析中会报错的bson, 所以ID列表不能用 BackActivityList, 避免解析出错活动删除
% 	BackIdList = lists:foldl(fun(ActivityBson, List) ->
% 		ActId = ?BSON_INT(ActivityBson, id),
% 		[ActId | List]
% 	end, [], BsonList),
% 	{BackActivityList, BackIdList}
% .

load_mmo_activity(ServerType, SystemType) ->
	% QueryBson = #{?BSONSET_BOOL(is_close, false)},
	QueryBson = #{
		?BSONSET_INT(server_type, ServerType),
		?BSONSET_INT(system_type, SystemType)
	},
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
	?INFO("remove activity [~p]~n", [Activity#activity.id]),

	ActivityId = Activity#activity.id,
	QueryBson = #{
		?BSONSET_INT(id, ActivityId),
		?BSONSET_INT(server_type, Activity#activity.server_type),
		?BSONSET_INT(system_type, Activity#activity.system_type)
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