%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_recharge
%%% Created on : 2020/8/28 0028 16:06
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_recharge).
-author("glendy").
-include("common.hrl").

%% API
-export([
	save_test_order/5,
	fetch_all_recharge_order/1,
	update_recharge_order_flag/4,

	bson_to_recharge_info/1,
	recharge_info_to_bson/1
]).

save_test_order(PlayerId, ConfId, MoneyType, Money, Gold) ->
	OrderId = lib_types:to_list(lib_counter:get_order_id()),
	Bson = #{
		?BSONSET_STRING(<<"order_id">>, OrderId),
		?BSONSET_INT(<<"role_id">>, PlayerId),
		?BSONSET_INT(<<"flag">>, 0),
		?BSONSET_INT(<<"money_type">>, MoneyType),
		?BSONSET_FLOAT(<<"money">>, Money),
		?BSONSET_INT(<<"gold">>, Gold),
		?BSONSET_INT(<<"conf_id">>, ConfId),
		?BSONSET_INT(<<"is_test">>, 1),
		?BSONSET_INT(<<"time">>, lib_timer:unixtime())
	},
	mongo_poolboy:async_update(?BACK_POOL, ?DBBACK_ORDER,
		#{?BSONSET_STRING(<<"order_id">>, OrderId)},
		#{<<"$set">> => Bson}).

fetch_all_recharge_order(PlayerId) ->
	case mongo_poolboy:find(?BACK_POOL, ?DBBACK_ORDER, #{?BSONSET_INT(<<"role_id">>, PlayerId), ?BSONSET_INT(<<"flag">>, 0)}) of
		BsonList = [_ | _] ->
			BsonList;
		_ ->
			[]
	end.

update_recharge_order_flag(OrderId, AgentCode, Market, ServerFlag) ->
	Bson = #{
		?BSONSET_INT(<<"flag">>, 1),
		?BSONSET_INT(<<"agent">>, AgentCode),
		?BSONSET_INT(<<"market">>, Market),
		?BSONSET_STRING(<<"server_flag">>, ServerFlag),
		?BSONSET_INT(<<"recharge_tick">>, lib_timer:unixtime())
	},
	mongo_poolboy:update(?BACK_POOL, ?DBBACK_ORDER,
		#{?BSONSET_STRING(<<"order_id">>, OrderId), ?BSONSET_INT(<<"flag">>, 0)},
		#{<<"$set">> => Bson}, false, false).


bson_to_recharge_info(Bson) ->
	#recharge_info{
		recharge_id = ?BSON_INT(Bson, <<"recharge_id">>),
		buy_time = ?BSON_INT(Bson, <<"buy_time">>),
		refresh_tick = ?BSON_INT(Bson, <<"refresh_tick">>),
		total_by_time = ?BSON_INT(Bson, <<"total_by_time">>)
	}
.
recharge_info_to_bson(Recharge) ->
	#{
		?BSONSET_STRING(<<"recharge_id">>, Recharge#recharge_info.recharge_id),
		?BSONSET_INT(<<"buy_time">>,  Recharge#recharge_info.buy_time),
		?BSONSET_INT(<<"refresh_tick">>,  Recharge#recharge_info.refresh_tick),
		?BSONSET_INT(<<"total_by_time">>,  Recharge#recharge_info.total_by_time)
	}
.