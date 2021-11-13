%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_base
%%% Created on : 2020/8/4 0004 11:50
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_base).
-author("glendy").
-include("common.hrl").
-include("player.hrl").

%% API
-export([
	load_player_base/1,
	load_player_base_other/1,
	save_player_base/1,
	save_player_base_other/1,
	player_base_to_bson/1,
	bson_to_player_base/1,
	bson_to_player_base_other/1,
	player_base_other_to_bson/2,
	all_player_offline/0,
	is_exists_player/1,
	get_player_id_by_name/1,
	get_player_id_by_account/1,
	get_player_id_by_ip/1,
	get_account_by_ip/1,
	get_account_by_id/1
]).

load_player_base(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_base(Bson);
		_ -> #player_base{id = PlayerId}
	end.

load_player_base_other(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_base_other(Bson);
		_ -> #player_base_other{id = PlayerId}
	end.

save_player_base(PlayerBase) ->
	Bson = player_base_to_bson(PlayerBase),
	mongo_poolboy:async_update(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerBase#player_base.id)}, #{<<"$set">> => Bson}),
	mongo_poolboy:async_update(?BACK_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerBase#player_base.id)}, #{<<"$set">> => Bson}),
	?INFO("save player_base: ~p", [PlayerBase#player_base.id]).

save_player_base_other(PlayerBaseOther) ->
	Bson = player_base_other_to_bson(#{}, PlayerBaseOther),
	mongo_poolboy:async_update(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerBaseOther#player_base_other.id)}, #{<<"$set">> => Bson}),
	BackBson = player_base_other_to_back_bson(#{}, PlayerBaseOther),
	mongo_poolboy:async_update(?BACK_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerBaseOther#player_base_other.id)}, #{<<"$set">> => BackBson}),
	?INFO("save player_base_other: ~p", [PlayerBaseOther#player_base_other.id]).

bson_to_player_base(Bson) ->
	BsonTickList = ?BSON_LIST(Bson, <<"hour_reset_tick">>, []),
	TickMap = lib_common:bson_list_to_map(BsonTickList),
	BsonRecordList = ?BSON_LIST(Bson, <<"fight_record">>, []),
	RecordMap = lists:foldl(fun(Bson1, Map) -> Key = ?BSON_VALUE(Bson1, tick), maps:put(Key, bson_to_fight_record(Bson1), Map) end, maps:new(), BsonRecordList),
	#player_base{
		id = ?BSON_INT(Bson, <<"id">>),
		account = ?BSON_STRING(Bson, <<"account">>),
		name = ?BSON_STRING(Bson, <<"name">>),
		rename_tick = ?BSON_INT(Bson, <<"rename_tick">>),
		level = ?BSON_INT(Bson, <<"level">>),
		sex = ?BSON_INT(Bson, <<"sex">>),
		country = ?BSON_INT(Bson, <<"country">>),
		head_icon = ?BSON_INT(Bson, <<"head_icon">>),
		session = ?BSON_STRING(Bson, <<"session">>),
		server_flag = ?BSON_STRING(Bson, <<"server_flag">>),
		server_name = ?BSON_STRING(Bson, <<"server_name">>),
		server_prev = ?BSON_STRING(Bson, <<"server_prev">>),
		agent = ?BSON_STRING(Bson, <<"agent">>),
		agent_code = ?BSON_INT(Bson, <<"agent_code">>),
		market = ?BSON_INT(Bson, <<"market">>),
		area = ?BSON_STRING(Bson, <<"area">>),
		create_tick = ?BSON_INT(Bson, create_tick),
		login_tick = ?BSON_INT(Bson, <<"login_tick">>),
		logout_tick = ?BSON_INT(Bson, <<"logout_tick">>),
		online = ?BSON_INT(Bson, <<"online">>),
		force = ?BSON_INT(Bson, <<"force">>),
		max_force_hero = ?BSON_INT(Bson, <<"max_force_hero">>),
		is_new = lib_types:to_atom(?BSON_STRING(Bson, <<"is_new">>)),
		is_weak_country = lib_types:to_atom(?BSON_STRING(Bson, <<"is_weak_country">>)),
		reset_everyday_tick = ?BSON_INT(Bson, <<"reset_everyday_tick">>),
		system_refresh_tick = ?BSON_INT(Bson, <<"system_refresh_tick">>),
		hour_reset_tick = TickMap,
		nobility = ?BSON_INT(Bson, <<"nobility">>),
		annual_reset_tick = ?BSON_INT(Bson, <<"annual_reset_tick">>),
		season_reset_tick = ?BSON_INT(Bson, <<"season_reset_tick">>),
		fight_record = RecordMap
	}.



player_base_to_bson(PlayerBase) ->
	BsonTickList = lib_common:map_to_bson_list(PlayerBase#player_base.hour_reset_tick),
	BsonRecordList = maps:fold(fun(_Key, Fight_record, List) -> [fight_record_to_bson(Fight_record) | List] end, [], PlayerBase#player_base.fight_record),
	#{
		?BSONSET_INT(<<"id">>, PlayerBase#player_base.id),
		?BSONSET_STRING(<<"account">>, PlayerBase#player_base.account),
		?BSONSET_STRING(<<"name">>, PlayerBase#player_base.name),
		?BSONSET_INT(<<"level">>, PlayerBase#player_base.level),
		?BSONSET_INT(<<"sex">>, PlayerBase#player_base.sex),
		?BSONSET_INT(<<"rename_tick">>, PlayerBase#player_base.rename_tick),
		?BSONSET_INT(<<"country">>, PlayerBase#player_base.country),
		?BSONSET_INT(<<"head_icon">>, PlayerBase#player_base.head_icon),
		?BSONSET_STRING(<<"session">>, PlayerBase#player_base.session),
		?BSONSET_STRING(<<"server_flag">>, PlayerBase#player_base.server_flag),
		?BSONSET_STRING(<<"server_name">>, PlayerBase#player_base.server_name),
		?BSONSET_STRING(<<"server_prev">>, PlayerBase#player_base.server_prev),
		?BSONSET_STRING(<<"agent">>, PlayerBase#player_base.agent),
		?BSONSET_INT(<<"agent_code">>, PlayerBase#player_base.agent_code),
		?BSONSET_INT(<<"market">>, PlayerBase#player_base.market),
		?BSONSET_STRING(<<"area">>, PlayerBase#player_base.area),
		?BSONSET_INT(create_tick, PlayerBase#player_base.create_tick),
		?BSONSET_INT(<<"login_tick">>, PlayerBase#player_base.login_tick),
		?BSONSET_INT(<<"logout_tick">>, PlayerBase#player_base.logout_tick),
		?BSONSET_INT(<<"online">>, PlayerBase#player_base.online),
		?BSONSET_INT(<<"force">>, PlayerBase#player_base.force),
		?BSONSET_INT(<<"max_force_hero">>, PlayerBase#player_base.max_force_hero),
		?BSONSET_STRING(<<"is_new">>, PlayerBase#player_base.is_new),
		?BSONSET_STRING(<<"is_weak_country">>, PlayerBase#player_base.is_weak_country),
		?BSONSET_INT(<<"reset_everyday_tick">>, PlayerBase#player_base.reset_everyday_tick),
		?BSONSET_INT(<<"system_refresh_tick">>, PlayerBase#player_base.system_refresh_tick),
		?BSONSET_LIST(<<"hour_reset_tick">>, BsonTickList),
		?BSONSET_INT(<<"nobility">>, PlayerBase#player_base.nobility),
		?BSONSET_INT(<<"annual_reset_tick">>, PlayerBase#player_base.annual_reset_tick),
		?BSONSET_INT(<<"season_reset_tick">>, PlayerBase#player_base.season_reset_tick),
		?BSONSET_LIST(<<"fight_record">>, BsonRecordList)
	}.

bson_to_player_base_other(Bson) ->
	#player_base_other{
		id = ?BSON_INT(Bson, <<"id">>),
		create_tick = ?BSON_INT(Bson, <<"create_tick">>),
		create_server_flag = ?BSON_STRING(Bson, <<"create_server_flag">>),
		create_server_name = ?BSON_STRING(Bson, <<"create_server_name">>),
		create_agent = ?BSON_STRING(Bson, <<"create_agent">>),
		create_agent_code = ?BSON_INT(Bson, <<"create_agent_code">>),
		create_market = ?BSON_INT(Bson, <<"create_market">>),
		create_net_type = ?BSON_STRING(Bson, <<"create_net_type">>),
		create_sys_version = ?BSON_STRING(Bson, <<"create_sys_version">>),
		create_sys_model = ?BSON_STRING(Bson, <<"create_sys_model">>),
		create_mac = ?BSON_STRING(Bson, <<"create_mac">>),
		create_client_type = ?BSON_INT(Bson, <<"create_client_type">>),
		net_type = ?BSON_STRING(Bson, <<"net_type">>),
		sys_version = ?BSON_STRING(Bson, <<"sys_version">>),
		sys_model = ?BSON_STRING(Bson, <<"sys_model">>),
		mac = ?BSON_STRING(Bson, <<"mac">>),
		client_type = ?BSON_INT(Bson, <<"client_type">>),
		sdk_sid = ?BSON_STRING(Bson, <<"sdk_sid">>),
		msg_tocken = ?BSON_STRING(Bson, <<"msg_tocken">>),
		device = ?BSON_STRING(Bson, <<"device">>)
	}.

player_base_other_to_bson(Bson, PlayerBaseOther) ->
	Bson#{
		?BSONSET_INT(<<"id">>, PlayerBaseOther#player_base_other.id),
		?BSONSET_STRING(<<"ip">>, PlayerBaseOther#player_base_other.ip),
		?BSONSET_INT(<<"create_tick">>, PlayerBaseOther#player_base_other.create_tick),
		?BSONSET_STRING(<<"create_server_flag">>, PlayerBaseOther#player_base_other.create_server_flag),
		?BSONSET_STRING(<<"create_server_name">>, PlayerBaseOther#player_base_other.create_server_name),
		?BSONSET_STRING(<<"create_agent">>, PlayerBaseOther#player_base_other.create_agent),
		?BSONSET_INT(<<"create_agent_code">>, PlayerBaseOther#player_base_other.create_agent_code),
		?BSONSET_INT(<<"create_market">>, PlayerBaseOther#player_base_other.create_market),
		?BSONSET_STRING(<<"create_net_type">>, PlayerBaseOther#player_base_other.create_net_type),
		?BSONSET_STRING(<<"create_sys_version">>, PlayerBaseOther#player_base_other.create_sys_version),
		?BSONSET_STRING(<<"create_sys_model">>, PlayerBaseOther#player_base_other.create_sys_model),
		?BSONSET_STRING(<<"create_mac">>, PlayerBaseOther#player_base_other.create_mac),
		?BSONSET_INT(<<"create_client_type">>, PlayerBaseOther#player_base_other.create_client_type),
		?BSONSET_STRING(<<"net_type">>, PlayerBaseOther#player_base_other.net_type),
		?BSONSET_STRING(<<"sys_version">>, PlayerBaseOther#player_base_other.sys_version),
		?BSONSET_STRING(<<"sys_model">>, PlayerBaseOther#player_base_other.sys_model),
		?BSONSET_STRING(<<"mac">>, PlayerBaseOther#player_base_other.mac),
		?BSONSET_INT(<<"client_type">>, PlayerBaseOther#player_base_other.client_type),
		?BSONSET_STRING(<<"sdk_sid">>, PlayerBaseOther#player_base_other.sdk_sid),
		?BSONSET_STRING(<<"msg_tocken">>, PlayerBaseOther#player_base_other.msg_tocken),
		?BSONSET_STRING(<<"device">>, PlayerBaseOther#player_base_other.device)
	}.

player_base_other_to_back_bson(Bson, PlayerBaseOther) ->
	Bson#{
		?BSONSET_INT(<<"id">>, PlayerBaseOther#player_base_other.id),
		?BSONSET_STRING(<<"ip">>, PlayerBaseOther#player_base_other.ip),
		?BSONSET_STRING(<<"net_type">>, PlayerBaseOther#player_base_other.net_type),
		?BSONSET_STRING(<<"sys_version">>, PlayerBaseOther#player_base_other.sys_version),
		?BSONSET_STRING(<<"sys_model">>, PlayerBaseOther#player_base_other.sys_model),
		?BSONSET_STRING(<<"mac">>, PlayerBaseOther#player_base_other.mac),
		?BSONSET_INT(<<"client_type">>, PlayerBaseOther#player_base_other.client_type),
		?BSONSET_STRING(<<"sdk_sid">>, PlayerBaseOther#player_base_other.sdk_sid),
		?BSONSET_STRING(<<"msg_tocken">>, PlayerBaseOther#player_base_other.msg_tocken),
		?BSONSET_STRING(<<"device">>, PlayerBaseOther#player_base_other.device)
	}.

bson_to_fight_record(Bson) ->
	#fight_record{
		tick = ?BSON_INT(Bson, <<"tick">>),
		record_id = ?BSON_INT(Bson, <<"record_id">>),
		fight_type = ?BSON_INT(Bson, <<"fight_type">>)
	}
.
fight_record_to_bson(Fight_record) ->
	#{
		?BSONSET_INT(<<"tick">>, Fight_record#fight_record.tick),
		?BSONSET_INT(<<"record_id">>, Fight_record#fight_record.record_id),
		?BSONSET_INT(<<"fight_type">>, Fight_record#fight_record.fight_type)
	}
.





%% 把所有玩家的数据库在线标识重置为下线状态0
all_player_offline() ->
	mongo_poolboy:update(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"online">>, 1)},
		#{<<"$set">> => #{?BSONSET_INT(<<"online">>, 0), ?BSONSET_INT(<<"logout_tick">>, lib_timer:unixtime())}}, false, true),
	mongo_poolboy:update(?BACK_POOL, ?DBROLE, #{?BSONSET_INT(<<"online">>, 1)},
		#{<<"$set">> => #{?BSONSET_INT(<<"online">>, 0), ?BSONSET_INT(<<"logout_tick">>, lib_timer:unixtime())}}, false, true).

is_exists_player(PlayerId) ->
	(mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}) > 0).

%% 根据角色ID返回角色id
get_player_id_by_name(Name) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"name">>, Name)}) of
		Bson = #{} ->
			?BSON_INT(Bson, <<"id">>);
		_ -> 0
	end.

get_player_id_by_account(Account) ->
	case mongo_poolboy:find(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"account">>, Account)}) of
		BsonList = [_ | _] ->
			lists:foldl(
				fun(Bson, AccList0) ->
					Id = ?BSON_INT(Bson, <<"id">>),
					[Id | AccList0]
				end, [], BsonList);
		_ ->
			[]
	end.

get_player_id_by_ip(Ip) ->
	case mongo_poolboy:find(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"ip">>, Ip)}) of
		BsonList = [_ | _] ->
			lists:foldl(
				fun(Bson, AccList0) ->
					Id = ?BSON_INT(Bson, <<"id">>),
					[Id | AccList0]
				end, [], BsonList);
		_ ->
			[]
	end.

get_account_by_ip(Ip) ->
	case mongo_poolboy:find(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"ip">>, Ip)}) of
		BsonList = [_ | _] ->
			lists:usort(lists:foldl(
				fun(Bson, AccList0) ->
					Account = ?BSON_STRING(Bson, <<"account">>),
					[Account | AccList0]
				end, [], BsonList));
		_ ->
			[]
	end.

get_account_by_id(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			?BSON_STRING(Bson, <<"account">>);
		_ -> ""
	end.
