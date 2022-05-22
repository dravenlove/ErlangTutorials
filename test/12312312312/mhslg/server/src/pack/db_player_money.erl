%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_money
%%% Created on : 2020/8/12 0012 17:25
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_money).
-author("glendy").
-include("common.hrl").

%% API
-export([
	load_player_money/1,
	save_player_money/1
]).

load_player_money(PlayerId) ->
	?DEBUG("load player money: ~w", [PlayerId]),
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_MONEY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_money(Bson);
		_ ->
			#player_money{id = PlayerId}
	end.

save_player_money(PlayerMoney) ->
	PlayerId = PlayerMoney#player_money.id,
	?DEBUG("save player money: ~w", [PlayerId]),
	Bson = player_money_to_bson(PlayerMoney),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_MONEY,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bson_to_player_money(Bson) ->
	Recharge_List = ?BSON_LIST(Bson, <<"recharge_times_map">>),
	Map = lists:foldl(fun(RechargeBson,MAP) ->
		RechargeInfo = db_player_recharge:bson_to_recharge_info(RechargeBson),
		maps:put(RechargeInfo#recharge_info.recharge_id,RechargeInfo,MAP)
	end,maps:new(),Recharge_List),
	#player_money{
		id = ?BSON_INT(Bson, <<"id">>),
		money_map = bson_list_to_money_map(?BSON_LIST(Bson, <<"money">>)),
		total_recharge_money = ?BSON_FLOAT(Bson, <<"total_recharge_money">>),
		total_recharge_gold = ?BSON_INT(Bson, <<"total_recharge_gold">>),
		recharge_map = Map,
		have_first = ?BSON_INT(Bson, <<"have_first">>),
		get_first = ?BSON_INT(Bson, <<"total_recharge_gold">>)
	}.
bson_list_to_money_map(BsonList) ->
	bson_list_to_money_map(#{}, BsonList).
bson_list_to_money_map(MoneyMap, []) ->
	MoneyMap;
bson_list_to_money_map(MoneyMap, [Bson | T]) ->
	MoneyId = ?BSON_INT(Bson, <<"id">>),
	MoneyAmount = ?BSON_INT(Bson, <<"amount">>),
	NewMoneyMap = maps:put(MoneyId, MoneyAmount, MoneyMap),
	bson_list_to_money_map(NewMoneyMap, T).

player_money_to_bson(PlayerMoney) ->
	Recharge_List = maps:fold(fun(_,Recharge,List) ->
		[db_player_recharge:recharge_info_to_bson(Recharge)|List]
	end,[],PlayerMoney#player_money.recharge_map),
	#{
		?BSONSET_INT(<<"id">>, PlayerMoney#player_money.id),
		?BSONSET_LIST(<<"money">>, money_map_to_bson_list(PlayerMoney#player_money.money_map)),
		?BSONSET_FLOAT(<<"total_recharge_money">>, PlayerMoney#player_money.total_recharge_money),
		?BSONSET_INT(<<"total_recharge_gold">>, PlayerMoney#player_money.total_recharge_gold),
		?BSONSET_LIST(<<"recharge_map">>, Recharge_List),
		?BSONSET_INT(<<"have_first">>, PlayerMoney#player_money.have_first),
		?BSONSET_INT(<<"get_first">>, PlayerMoney#player_money.get_first)
		}.

money_map_to_bson_list(MoneyMap) ->
	maps:fold(
		fun(MoneyId, MoneyAmount, AccBsonList0) ->
			Bson = #{
				?BSONSET_INT(<<"id">>, MoneyId),
				?BSONSET_INT(<<"amount">>, MoneyAmount)
			},
			[Bson | AccBsonList0]
		end, [], MoneyMap).
