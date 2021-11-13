%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_counter
%%% Created on : 2020/8/4 0004 16:28
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_counter).
-author("glendy").
-include("log.hrl").
-include("ets.hrl").
-include("mongodb.hrl").

%% ID宏定义
-define(COUNTER_PLAYER_ID,	counter_player_id).
-define(COUNTER_VOICE_ID, 	counter_voice_id).
-define(COUNTER_MAIL_ID, counter_mail_id).
-define(COUNTER_LEAGUE_ID, counter_league_id).
-define(COUNTER_ORDER_ID, counter_order_id).
-define(COUNTER_CLUSTER_GROUP_ID, counter_cluster_group_id).
-define(COUNTER_COMBAT_QUEUE_ID,counter_combat_queue_id).
-define(COUNTER_COUNTRY_UUID, counter_country_uuid).
-define(COUNTER_COUNTRY_ROLE(Country),lib_types:to_list(counter_country_role)++lib_types:to_list(Country)).
-define(COUNTER_FIGHT_RECORD_ID,counter_fight_record_id).

%% API
-export([
	init/0,
	get_player_id/0,
	get_voice_id/0,
	get_mail_id/0,
	get_league_id/0,
	get_order_id/0,
	get_cluster_group_id/0,
	get_combat_queue_id/0,
	get_country_uuid/0,
	get_fight_record_id/0,


	get_country_role/1,
	add_country_role/1
]).

init() ->
	ets:new(?ETS_COUNTER, ?ETS_OPTIONS_KEYPOS1),
	mongo_poolboy:ensure_index(?MMO_POOL, ?DBGLOBAL, {?TUPLE_INT(<<"key">> , 1)}, true),
	InitList = [
		?COUNTER_PLAYER_ID,
		?COUNTER_VOICE_ID,
		?COUNTER_MAIL_ID,
		?COUNTER_LEAGUE_ID,
		?COUNTER_ORDER_ID,
		?COUNTER_CLUSTER_GROUP_ID,
		?COUNTER_COMBAT_QUEUE_ID,
		?COUNTER_COUNTRY_UUID,
		?COUNTER_FIGHT_RECORD_ID
	],
	init_id(InitList),
	init_country(),
	ok.

init_id([Key | T]) ->
	Serverid = config:server_id(),
	case mongo_poolboy:find_one(?MMO_POOL, ?DBGLOBAL, #{<<"key">> => lib_types:to_binary(Key)}) of
		Bson = #{} ->
			Value = ?BSON_INT(Bson, <<"value">>),
			ConvertVal = lib_types:int_to_long(Serverid, Value),
			?INFO("counter init: ~p ~p ~p ~n", [Key, Value, ConvertVal]),
			ets:insert(?ETS_COUNTER, {Key, Value});
		undefined ->
			mongo_poolboy:async_update(?MMO_POOL, ?DBGLOBAL, #{<<"key">> => lib_types:to_binary(Key)}, #{<<"$set">> => #{<<"value">> => 0}}),
			ConvertVal = lib_types:int_to_long(Serverid, 0),
			?INFO("counter init: ~p ~p ~p ~n", [Key, 0, ConvertVal]),
			ets:insert(?ETS_COUNTER,{Key, 0});
		Reason ->
			?INFO("~p~n", [Reason]),
			error(lib_counter_init_error)
	end,
	init_id(T);
init_id([]) -> ok.

init_country() ->
	lists:foreach(fun(CountryId) ->
%%		case mongo_poolboy:find_one(?MMO_POOL, ?DBGLOBAL, #{<<"key">> => lib_types:to_binary(?COUNTER_COUNTRY_ROLE(CountryId))}) of
%%			Bson = #{} ->
%%				Value = ?BSON_INT(Bson, <<"value">>),
%%				ets:insert(?ETS_COUNTER, {?COUNTER_COUNTRY_ROLE(CountryId), Value});
%%			_ ->
%%				mongo_poolboy:async_update(?MMO_POOL, ?DBGLOBAL, #{<<"key">> => lib_types:to_binary(?COUNTER_COUNTRY_ROLE(CountryId))},
%%					#{<<"$set">> => #{<<"value">> => 0}}),
%%				ets:insert(?ETS_COUNTER,{?COUNTER_COUNTRY_ROLE(CountryId), 0})
%%		end
		Count = mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{<<"country">> => CountryId}),
		ets:insert(?ETS_COUNTER,{?COUNTER_COUNTRY_ROLE(CountryId), Count})
	end, tb_role_country:get_list()).

get_global_id(KeyName) ->
	Num = ets:update_counter(?ETS_COUNTER,KeyName,1),  %% 返回加1后的值
	mongo_update_id(KeyName, Num),
	Serverid = config:server_id(),
	lib_types:int_to_long(Serverid, Num).

%%get_global_id(KeyName, Prev, MaxBase) ->
%%	Num = ((ets:update_counter(?ETS_COUNTER,KeyName,1)) rem MaxBase),  %% 返回加1后的值
%%	mongo_update_id(KeyName, Num),
%%	Serverid = config:server_id(),
%%	lib_types:int_to_long(Serverid, Num + Prev).

mongo_update_id(KeyName, Num) ->
	mongo_poolboy:async_update(?MMO_POOL, ?DBGLOBAL,
		#{<<"key">> => lib_types:to_binary(KeyName), <<"value">> => #{<<"$lt">> => Num}},
		#{<<"$set">> => #{<<"value">> => Num}}).

get_player_id() ->
	get_global_id(?COUNTER_PLAYER_ID).

get_voice_id() ->
	get_global_id(?COUNTER_VOICE_ID).

get_mail_id() ->
	get_global_id(?COUNTER_MAIL_ID).

get_league_id() ->
	get_global_id(?COUNTER_LEAGUE_ID).

get_order_id() ->
	get_global_id(?COUNTER_ORDER_ID).

get_cluster_group_id() ->
	get_global_id(?COUNTER_CLUSTER_GROUP_ID).

get_combat_queue_id() ->
	get_global_id(?COUNTER_COMBAT_QUEUE_ID).

get_country_uuid() ->
	get_global_id(?COUNTER_COUNTRY_UUID).

get_country_role(CountryId) ->
	[{_,Num}] = ets:lookup(?ETS_COUNTER,?COUNTER_COUNTRY_ROLE(CountryId)),
	Num.
add_country_role(CountryId) ->
%%	Num = ets:update_counter(?ETS_COUNTER,?COUNTER_COUNTRY_ROLE(CountryId),1),
%%	mongo_update_id(?COUNTER_COUNTRY_ROLE(CountryId), Num).
	ets:update_counter(?ETS_COUNTER,?COUNTER_COUNTRY_ROLE(CountryId),1).

get_fight_record_id() ->
	get_global_id(?COUNTER_FIGHT_RECORD_ID).
