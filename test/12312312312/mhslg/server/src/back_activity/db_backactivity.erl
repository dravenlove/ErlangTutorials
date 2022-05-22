%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_backactivity
%%% Created on : 2020/8/25 0025 15:21
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_backactivity).
-author("glendy").
-include("log.hrl").
-include("mongodb.hrl").
-include("back_activity.hrl").

%% API
-export([
	load_update_back_activity/0,
	save_to_backactivity_convert/1,
	load_convert_backactivity/0,
	update_convert_backactivity_flag/1,
	save_to_backactivity_active/1,
	remove_backactivity_active/1,
	load_all_backactivity_active/0,
	load_player_backactivity/1,
	save_player_backactivity/1
]).

load_update_back_activity() ->
	case mongo_poolboy:find(?BACK_POOL, ?DBBACK_ACTIVITY, #{?BSONSET_INT(<<"update_flag">>, 1)}) of
		BsonList = [_ | _] ->
			bson_list_to_backactivity_convert_bson_list(BsonList);
		_ ->
			[]
	end.

save_to_backactivity_convert([]) ->
	ok;
save_to_backactivity_convert([Bson | T]) ->
	ActIndex = ?BSON_INT(Bson, <<"act_index">>),
	?DEBUG("save backactivity convert: ~p", [ActIndex]),
	mongo_poolboy:async_update(?BACK_POOL, ?DBBACKACTIVITY_CONVERT,
		#{?BSONSET_INT(<<"act_index">>, ActIndex)},
		#{<<"$set">> => Bson}),
	mongo_poolboy:update(?BACK_POOL, ?DBBACK_ACTIVITY,
		#{?BSONSET_INT(<<"act_index">>, ActIndex)},
		#{<<"$set">> => #{?BSONSET_INT(<<"update_flag">>, 0), ?BSONSET_INT(<<"update_tick">>, lib_timer:unixtime())}}, false, false),
	save_to_backactivity_convert(T).

load_convert_backactivity() ->
	NowTick = lib_timer:unixtime(),
	QueryBson = #{
		?BSONSET_INT(<<"update_flag">>, 1),
		<<"$or">> => [
			#{?BSONSET_INT(<<"is_open">>, 0)},
			#{
				?BSONSET_BSON(<<"start_tick">>, #{?BSONSET_INT(<<"$lte">>, NowTick)}),
				?BSONSET_BSON(<<"disappear_tick">>, #{?BSONSET_INT(<<"$gt">>, NowTick)})
			}
		]
	},
	case mongo_poolboy:find(?BACK_POOL, ?DBBACKACTIVITY_CONVERT, QueryBson) of
		BsonList = [_ | _] ->
			bson_list_to_backactivity_list(BsonList);
		_ ->
			[]
	end.

%% 暂定直接删除, 如果需要可以只修改update_flag为0, 不删除记录
update_convert_backactivity_flag(ActIndex) ->
	mongo_poolboy:async_delete(?BACK_POOL, ?DBBACKACTIVITY_CONVERT, #{?BSONSET_INT(<<"act_index">>, ActIndex)}).

save_to_backactivity_active(BackActivity) ->
	Bson = backactivity_to_bson(BackActivity),
	mongo_poolboy:async_update(?MMO_POOL, ?DBBACKACTIVITY_ACTIVE,
		#{?BSONSET_INT(<<"act_index">>, BackActivity#backactivity.act_index)},
		#{<<"$set">> => Bson}).

remove_backactivity_active(Id) ->
	mongo_poolboy:async_delete(?MMO_POOL, ?DBBACKACTIVITY_ACTIVE, #{?BSONSET_INT(<<"act_index">>, Id)}).

load_all_backactivity_active() ->
	case mongo_poolboy:find(?MMO_POOL, ?DBBACKACTIVITY_ACTIVE, #{}) of
		BsonList = [_ | _] ->
			bson_list_to_backactivity_list(BsonList);
		_ ->
			[]
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_list_to_backactivity_convert_bson_list(BsonList) ->
	bson_list_to_backactivity_convert_bson_list([], BsonList).
bson_list_to_backactivity_convert_bson_list(BackActivityBsonList, []) ->
	BackActivityBsonList;
bson_list_to_backactivity_convert_bson_list(BackActivityBsonList, [Bson | T]) ->
	BackActivityBson = bson_to_backactivity_convert_bson(Bson),
	bson_list_to_backactivity_convert_bson_list([BackActivityBson | BackActivityBsonList], T).

bson_to_backactivity_convert_bson(Bson) ->
	lib_backact_base:convert_back_activity_bson(Bson).

bson_list_to_backactivity_list(BsonList) ->
	bson_list_to_backactivity_list([], BsonList).
bson_list_to_backactivity_list(BackActivityList, []) ->
	BackActivityList;
bson_list_to_backactivity_list(BackActivityList, [Bson | T]) ->
	BackActivity = bson_to_backactivity(Bson),
	bson_list_to_backactivity_list([BackActivity | BackActivityList], T).

bson_to_backactivity(Bson) ->
	#backactivity{
		act_index = ?BSON_INT(Bson, <<"act_index">>),
		state = ?BSON_INT(Bson, <<"state">>),
		is_open = ?BSON_INT(Bson, <<"is_open">>),
		start_tick = ?BSON_INT(Bson, <<"start_tick">>),
		end_tick = ?BSON_INT(Bson, <<"end_tick">>),
		disappear_tick = ?BSON_INT(Bson, <<"disappear_tick">>),
		back_update_tick = ?BSON_INT(Bson, <<"back_update_tick">>),
		config_string = ?BSON_STRING(Bson, <<"config_string">>),
		main_type = ?BSON_INT(Bson, <<"main_type">>),
		sort = ?BSON_INT(Bson, <<"sort">>),
		main_icon = ?BSON_STRING(Bson, <<"main_icon">>),
		sub_icon = ?BSON_STRING(Bson, <<"sub_icon">>),
		open_win = ?BSON_STRING(Bson, <<"open_win">>),
		title = ?BSON_STRING(Bson, <<"title">>),
		content = ?BSON_STRING(Bson, <<"content">>),
		level = ?BSON_INT(Bson, <<"level">>)
	}.

backactivity_to_bson(BackActivity) ->
	#{
		?BSONSET_INT(<<"act_index">>, BackActivity#backactivity.act_index),
		?BSONSET_INT(<<"state">>, BackActivity#backactivity.state),
		?BSONSET_INT(<<"is_open">>, BackActivity#backactivity.is_open),
		?BSONSET_INT(<<"start_tick">>, BackActivity#backactivity.start_tick),
		?BSONSET_INT(<<"end_tick">>, BackActivity#backactivity.end_tick),
		?BSONSET_INT(<<"disappear_tick">>, BackActivity#backactivity.disappear_tick),
		?BSONSET_INT(<<"back_update_tick">>, BackActivity#backactivity.back_update_tick),
		?BSONSET_STRING(<<"config_string">>, BackActivity#backactivity.config_string),
		?BSONSET_INT(<<"main_type">>, BackActivity#backactivity.main_type),
		?BSONSET_INT(<<"sort">>, BackActivity#backactivity.sort),
		?BSONSET_STRING(<<"main_icon">>, BackActivity#backactivity.main_icon),
		?BSONSET_STRING(<<"sub_icon">>, BackActivity#backactivity.sub_icon),
		?BSONSET_STRING(<<"open_win">>, BackActivity#backactivity.open_win),
		?BSONSET_STRING(<<"title">>, BackActivity#backactivity.title),
		?BSONSET_STRING(<<"content">>, BackActivity#backactivity.content),
		?BSONSET_INT(<<"level">>, BackActivity#backactivity.level)
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load_player_backactivity(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_BACKACTIVITY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_backactivity(Bson);
		_ -> #player_backactivity{id = PlayerId}
	end.

save_player_backactivity(PlayerBackActivity) ->
	PlayerId = PlayerBackActivity#player_backactivity.id,
	Bson = player_backactivity_to_bson(PlayerBackActivity),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BACKACTIVITY,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

bson_to_player_backactivity(Bson) ->
	{BackActMap, MainTypeMap} = bson_list_to_back_act_map(?BSON_LIST(Bson, <<"backact">>)),
	#player_backactivity{
		id = ?BSON_INT(Bson, <<"id">>),
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	}.

bson_list_to_back_act_map(BsonList) ->
	bson_list_to_back_act_map(#{}, #{}, BsonList).
bson_list_to_back_act_map(BackActMap, MainTypeMap, []) ->
	{BackActMap, MainTypeMap};
bson_list_to_back_act_map(BackActMap, MainTypeMap, [Bson | T]) ->
	#backact_info{
		id = ActIndex,
		main_type = MainType
	} = BackActInfo = bson_to_back_act_info(Bson),
	case maps:is_key(ActIndex, BackActMap) of
		false ->
			NewBackActMap = maps:put(ActIndex, BackActInfo, BackActMap),
			List = maps:get(MainType, MainTypeMap, []),
			NewMainTypeMap = maps:put(MainType, [ActIndex | List], MainTypeMap),
			bson_list_to_back_act_map(NewBackActMap, NewMainTypeMap, T);
		_ ->
			bson_list_to_back_act_map(BackActMap, MainTypeMap, T)
	end.

bson_to_back_act_info(Bson) ->
	MainType = ?BSON_INT(Bson, <<"main_type">>),
	BackActivity = bson_to_backactivity(?BSON_BSON(Bson, <<"backactivity">>)),
	NewBackActivity0 = BackActivity#backactivity{
		conf = lib_backact_base:dynamic_compile_backactivity_config(BackActivity#backactivity.config_string)
	},
	NewBackActivity = lib_backact_base:process_fast_load_config(NewBackActivity0),
	BackActInfo0 = #backact_info{
		id = ?BSON_INT(Bson, <<"id">>),
		main_type = MainType,
		is_new = ?BSON_INT(Bson, <<"is_new">>),
		clear_tick = ?BSON_INT(Bson, <<"clear_tick">>),
		backactivity = NewBackActivity
	},
	BackActInfo = lib_player_backactivity_listen:listen_fast_load_config(?SYNC_PLAYER_BACKACT_LOAD, BackActInfo0),
	bson_to_sub_act_info(MainType, BackActInfo, Bson).

player_backactivity_to_bson(PlayerBackActivity) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerBackActivity#player_backactivity.id),
		?BSONSET_LIST(<<"backact">>, backact_map_to_bson_list(PlayerBackActivity#player_backactivity.backact_map))
	}.

backact_map_to_bson_list(BackActMap) ->
	maps:fold(
		fun(_, BackActInfo, AccBsonList0) ->
			Bson = back_act_info_to_bson(BackActInfo),
			[Bson | AccBsonList0]
		end, [], BackActMap).

back_act_info_to_bson(BackActInfo) ->
	Bson = #{
		?BSONSET_INT(<<"id">>, BackActInfo#backact_info.id),
		?BSONSET_INT(<<"main_type">>, BackActInfo#backact_info.main_type),
		?BSONSET_INT(<<"is_new">>, BackActInfo#backact_info.is_new),
		?BSONSET_INT(<<"clear_tick">>, BackActInfo#backact_info.clear_tick),
		?BSONSET_BSON(<<"backactivity">>, backactivity_to_bson(BackActInfo#backact_info.backactivity))
	},
	sub_act_info_to_bson(BackActInfo#backact_info.main_type, Bson, BackActInfo).

%%%%%%%%%%%%%%
%% 添加新的活动类型时修改
bson_to_sub_act_info(?BACKACT_TYPE_CUMULATE_RECHARGE, BackActInfo, Bson) ->
	BackActInfo#backact_info{
		cumulate_recharge = bson_to_culumate_recharge(?BSON_BSON(Bson, <<"cumulate_recharge">>))
	};
bson_to_sub_act_info(MainType, BackActInfo, _Bson) ->
	?WARNING("no read bson by main type: ~p ~p", [MainType, BackActInfo#backact_info.id]),
	BackActInfo.

sub_act_info_to_bson(?BACKACT_TYPE_CUMULATE_RECHARGE, Bson, BackActInfo) ->
	SubBson = culumate_recharge_to_bson(BackActInfo#backact_info.cumulate_recharge),
	maps:put(<<"cumulate_recharge">>, SubBson, Bson);
sub_act_info_to_bson(MainType, Bson, BackActInfo) ->
	?WARNING("no write bson by main type: ~p ~p", [MainType, BackActInfo#backact_info.id]),
	Bson.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_culumate_recharge(Bson) ->
	#ba_cumulate_recharge{
		recharge_money = ?BSON_FLOAT(Bson, <<"recharge_money">>),
		reward_map = lib_mongodb:bson_list_to_kvmap(?BSON_LIST(Bson, <<"reward_map">>))
	}.

culumate_recharge_to_bson(CumulateRecharge) ->
	#{
		?BSONSET_FLOAT(<<"recharge_money">>, CumulateRecharge#ba_cumulate_recharge.recharge_money),
		?BSONSET_LIST(<<"reward_map">>, lib_mongodb:kvmap_to_bson_list(CumulateRecharge#ba_cumulate_recharge.reward_map))
	}.
