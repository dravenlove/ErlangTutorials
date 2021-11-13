%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 16:45
%%%-------------------------------------------------------------------
-module(lib_country_api).
-author("13661").

-include("base.hrl").
-include("country.hrl").
-include("player.hrl").
-include("map.hrl").
-include("ProtoClient_10128.hrl").

%% API
-export([
	validate_authority/2,		%% 验证官职权限
	validate_appoint_pos/2		%% 验证是否能任命
]).

-export([
	generate_uuid/0,		%% 生成一个UUID

	country_info/1,			%% 获取国家信息
	update_country/1,		%% 更新国家信息

	is_have_player/1,		%% 是否有这个玩家
	player_info/1,			%% 获取玩家信息
	update_player/1,		%% 更新玩家信息

	impeach_info/1,			%% 获取弹劾信息
	update_impeach/2,		%% 更新弹劾信息
	is_in_impeach/1,		%% 是否在弹劾中

	get_king_change_tick/1,	%% 获取国王变更时间
	set_king_change_tick/2,	%% 设置国王变更时间

	player_can_appoint_master/1, %% 获取玩家功能是否开启

	pos_name/1,				%% 通过官职名ID获取官职名
	pos_name_id_to_pos/1,	%% 官职名ID到官职ID
	player_pos/1,			%% 获取玩家官职
	player_pos_name_id/1,	%% 获取玩家官职名ID
	player_country_id/1,	%% 获取玩家国家ID

	pos_player/2,			%% 获取某个官职上的玩家
	appoint_pos/3,			%% 更新某个官职上的玩家

	player_city/1,			%% 获取玩家担任城主的城池ID
	update_player_city/2,	%% 更新玩家担任城主的城池ID

	country_king_id/1,		%% 获取国王ID

	order_info/2,			%% 获取兵令信息
	update_order/2,			%% 更新兵令信息
	order_open_times/2,		%% 获取兵令开启次数
	order_is_in_open/2,		%% 兵令是否在开启中
	appoint_city_master/2,	%% 任命城主

	country_cur_stage/1,	%% 获取国家当前阶段
	country_max_stage/1		%% 获取国家最大阶段
]).
-export([
	calc_pos_name_id/3
]).

validate_authority(Pos, Type) ->
	Conf = tb_country_pos:get(Pos),
	case Conf of
		false -> false;
		_ ->
			maps:get(Type, Conf, 0) =:= 1
	end
.

validate_appoint_pos(Pos, TagPos) ->
	?JUDGE_RETURN(validate_authority(Pos, ?AUTHORITY_APPOINT_POS), false),
	Conf = tb_country_appoint:get(Pos),
	?JUDGE_RETURN(Conf =/= false, false),

	maps:get(lib_types:to_atom(TagPos), Conf, 0) =:= 1
.

generate_uuid() ->
	lib_counter:get_country_uuid()
.

country_info(CountryId) ->
	Monitor = lib_country:get_country_monitor(),
	maps:get(CountryId, Monitor#country_monitor.country_map)
.

update_country(Country) when is_record(Country, country) ->
	Monitor = lib_country:get_country_monitor(),
	CountryMap = Monitor#country_monitor.country_map,
	NewMap = maps:put(Country#country.id, Country, CountryMap),
	lib_country:put_country_monitor(Monitor#country_monitor{country_map = NewMap})
.

is_have_player(PlayerId) ->
	Monitor = lib_country:get_country_monitor(),
	maps:is_key(PlayerId, Monitor#country_monitor.player_map)
.

player_info(PlayerId) ->
	Monitor = lib_country:get_country_monitor(),
	maps:get(PlayerId, Monitor#country_monitor.player_map)
.

update_player(Player) when is_record(Player, country_player) ->
	Monitor = lib_country:get_country_monitor(),
	CountryMap = Monitor#country_monitor.player_map,
	NewMap = maps:put(Player#country_player.id, Player, CountryMap),
	lib_country:put_country_monitor(Monitor#country_monitor{player_map = NewMap})
.

impeach_info(CountryId) ->
	Country = country_info(CountryId),
	Country#country.impeach_info
.

update_impeach(CountryId, Impeach) when is_record(Impeach, impeach) ->
	Country = country_info(CountryId),
	update_country(Country#country{impeach_info = Impeach})
.

is_in_impeach(CountryId) ->
	ImpeachInfo = impeach_info(CountryId),
	ImpeachInfo#impeach.is_in_impeach
.

get_king_change_tick(CountryId) ->
	Country = country_info(CountryId),
	Country#country.king_change_tick
.

set_king_change_tick(CountryId, Tick) ->
	Country = country_info(CountryId),
	update_country(Country#country{king_change_tick = Tick})
.

player_can_appoint_master(PlayerId) ->
	Player = player_info(PlayerId),
	Player#country_player.can_appoint_master
.

pos_name(PosNameId) ->
	Conf = tb_country_pos_name:get(PosNameId),
	?IIF(Conf =/= false, maps:get(name, Conf, ""), "")
.

pos_name_id_to_pos(PosNameId) ->
	PosNameId rem 1000
.

player_pos(PlayerId) ->
	Player = player_info(PlayerId),
	Player#country_player.pos
.

player_pos_name_id(PlayerId) ->
	Player = player_info(PlayerId),
	Player#country_player.pos_name_id
.

player_country_id(PlayerId) ->
	Player = player_info(PlayerId),
	Player#country_player.country_id
.

pos_player(CountryId, Pos) ->
	Country = country_info(CountryId),
	maps:get(Pos, Country#country.pos_map, 0)
.

calc_pos_name_id(CountryId, Stage, Pos) ->
	?IIF(Pos =/= 0, CountryId * 1000000 + Stage * 1000 + Pos, 0)
.

update_player_pos(PlayerId, Pos) ->
	Player = player_info(PlayerId),

	CountryId = player_country_id(PlayerId),
	Stage = country_cur_stage(CountryId),

	PosNameId = calc_pos_name_id(CountryId, Stage, Pos),

	update_player(Player#country_player{pos = Pos, pos_name_id = PosNameId}),
	lib_country:sync_player_pos_name(PlayerId)
.

update_pos_player(CountryId, Pos, PlayerId) ->
	Country = country_info(CountryId),
	PosMap = Country#country.pos_map,
	NewMap = maps:put(Pos, PlayerId, PosMap),
	update_country(Country#country{pos_map = NewMap})
.

appoint_pos(CountryId, Pos, PlayerId) ->
	OldPlayerId = pos_player(CountryId, Pos),
	case OldPlayerId =/= 0 of
		false -> skip;
		true -> update_player_pos(OldPlayerId, ?COUNTRY_POS_NONE)
	end,

	OldPos = player_pos(PlayerId),
	case OldPos =/= ?COUNTRY_POS_NONE of
		false -> skip;
		true -> update_pos_player(CountryId, OldPos, 0)
	end,

	update_player_pos(PlayerId, Pos),
	update_pos_player(CountryId, Pos, PlayerId)
.

player_city(PlayerId) ->
	Player = player_info(PlayerId),
	Player#country_player.city_id
.

update_player_city(PlayerId, CityId) ->
	Player = player_info(PlayerId),
	update_player(Player#country_player{city_id = CityId}),
	lib_country:sync_player_city_id(PlayerId)
.

country_king_id(CountryId) ->
	pos_player(CountryId, ?COUNTRY_POS_KING)
.

order_info(CountryId, Type) ->
	Country = lib_country_api:country_info(CountryId),
	maps:get(Type, Country#country.order_map, #military_orders{type = Type})
.

update_order(CountryId, Order) when is_record(Order, military_orders) ->
	Country = lib_country_api:country_info(CountryId),
	NewMap = maps:put(Order#military_orders.type, Order, Country#country.order_map),
	update_country(Country#country{order_map = NewMap}),

	Notify = #'Proto80128004'{
		order_list = [lib_country_request:order_to_proto(CountryId, Order)]
	},
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Notify])
.

order_open_times(CountryId, Type) ->
	Order = order_info(CountryId, Type),
	Order#military_orders.open_times
.

order_is_in_open(CountryId, Type) ->
	Order = order_info(CountryId, Type),
	Order#military_orders.is_in_open
.

appoint_city_master(CityId, PlayerId) ->
	OldMasterId = lib_map_api:master_id(CityId),
	case OldMasterId =/= 0 of
		false -> skip;
		true -> update_player_city(OldMasterId, 0)
	end,

	OldCityId = player_city(PlayerId),
	case lib_map_api:is_cityId(OldCityId) of
		false -> skip;
		true -> lib_map_api:u_city_player(OldCityId, #player_base{})
	end,

	Player = player_info(PlayerId),
	#country_player{
		show = Show,
		recv_tax_revenue_tick = RecvTick
	} = Player,
	Show = Player#country_player.show,
	Base = #player_base{
		id = PlayerId,
		name = Show#player_show.name,
		country = Show#player_show.country
	},

	lib_map_api:u_city_player(CityId, Base),
	update_player_city(PlayerId, CityId),

	%% 发送税收
	City = lib_map_api:city(CityId),
	#city{
		send_tax_revenue_map = SendMap,
		tax_revenue_send_tick = SendTick
	} = City,

	CurTick = lib_timer:unixtime(),
	{_, {CurHour,_,_}} = lib_timer:to_localtime(CurTick),

	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),

	try
		?JUDGE_RETURN(StartHour =< CurHour andalso CurHour =< EndHour, -1),
		?JUDGE_RETURN(not lib_timer:is_same_day(CurTick, SendTick), -1),
		?JUDGE_RETURN(not lib_timer:is_same_day(CurTick, RecvTick), -1),

		lib_country:send_tax_revenue_mail(CityId, PlayerId, SendMap)
	catch
	    throw: {error, _} -> skip
	end,

	lib_map_api:u_city(City#city{
		send_tax_revenue_map = maps:new(),
		tax_revenue_send_tick = lib_timer:current_zero_unixtime(CurTick)
	})
.

country_cur_stage(CountryId) ->
	Country = country_info(CountryId),
	Country#country.cur_stage
.

country_max_stage(CountryId) ->
	Country = country_info(CountryId),
	Country#country.max_stage
.