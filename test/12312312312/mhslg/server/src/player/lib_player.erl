%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player
%%% Created on : 2020/8/4 0004 11:26
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player).
-author("glendy").
-include("common.hrl").
-include("inner_city.hrl").
-include("player.hrl").
-include("vip.hrl").
-include("hero.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10111.hrl").

-define(CACHE_ETS_FLAG(ETS), {cache, ETS}).

%% API
-export([
	player_base_handler/0,
	player_base_other_handler/0,
	base_ets_init/0,
	base_build_index/0,
	other_ets_init/0,
	get_process_name/1,
	get_pid/1,
	get_player_base/0,
	put_player_base/2,
	get_player_base_other/0,
	put_player_base_other/2,
	check_update_ets_cache/2,
	set_ets_cache_flag/2,
	get_ets_cache_flag/1,
	player_show/0,
	player_show/1,
	serialize_show_role/0,
	serialize_other_player_show_role/1,
	bson_to_show_role/1,
	show_role_to_bson/1,
	get_server_prev_by_name/1,
	is_player_process_alive/1,
	client_load_complete/1,
	reset_every_day/0,
	system_refresh/1,
	hour_reset/0,
	handle_new_role/0,								%% 新角色调用初始化
	request_rename/1,
	http_role_info/0,
	get_date_map/0,
	check_player_upgrade/2,
	check_player_force/0,
	serialize_other_player_show_role_detail/1,
	serialize_show_role_detail/0
]).

-export([
	player_account/0,
	player_agent/0,
	player_sid/0,
	player_id/0,
	player_name/0,
	server_flag/0,
	server_prev/0,
	player_level/0,
	player_force/0,
	player_vip/0,
	league_id/0,
	league_name/0,
	league_level/0,
	player_country/0,
	league_position/0,
	country_position/0,
	city_id/0,
	create_tick/0,
	player_nobility/0,				%% 获取玩家爵位
	change_player_nobility/1,		%% 改变玩家爵位
	sign_in/0,
	check_reset/0,
	serialize_show_role/2
]).

player_base_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BASE,
		table_name = ?DBROLE,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player:base_ets_init/0,
		mongo_index_func = fun lib_player:base_build_index/0,
		load_func = fun db_player_base:load_player_base/1,
		save_func = fun db_player_base:save_player_base/1,
		get_func = fun lib_player:get_player_base/0,
		put_func = fun lib_player:put_player_base/2
	}.

player_base_other_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BASE_OTHER,
		table_name = ?DBROLE,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player:other_ets_init/0,
		mongo_index_func = undefined,
		load_func = fun db_player_base:load_player_base_other/1,
		save_func = fun db_player_base:save_player_base_other/1,
		get_func = fun lib_player:get_player_base_other/0,
		put_func = fun lib_player:put_player_base_other/2
	}.

base_ets_init() ->
	ets:new(?ETS_PLAYER_BASE, [?ETS_KEY_POS(#player_base.id) | ?ETS_OPTIONS]).

other_ets_init() ->
	ets:new(?ETS_PLAYER_BASE_OTHER, [?ETS_KEY_POS(#player_base_other.id) | ?ETS_OPTIONS]).

base_build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBROLE, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBROLE, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBROLE, {?TUPLE_INT(<<"name">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBROLE, {?TUPLE_INT(<<"country">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBROLE, {?TUPLE_INT(<<"account">>, 1), ?TUPLE_INT(<<"server_flag">>, 1)}, false),
	ok.

get_process_name(PlayerId) ->
	lib_types:to_atom("player_" ++ lib_types:to_list(PlayerId)).
get_pid(PlayerId) ->
	ProcessName = get_process_name(PlayerId),
	erlang:whereis(ProcessName).

get_player_base() ->
	erlang:get(?ETS_PLAYER_BASE).
put_player_base(PlayerBase, IsSaveDb) ->
	check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BASE),
	erlang:put(?ETS_PLAYER_BASE, PlayerBase).

get_player_base_other() ->
	erlang:get(?ETS_PLAYER_BASE_OTHER).
put_player_base_other(PlayerBaseOther, IsSaveDb) ->
	check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BASE_OTHER),
	erlang:put(?ETS_PLAYER_BASE_OTHER, PlayerBaseOther).

check_update_ets_cache(IsSaveDb, Ets) ->
	if
		IsSaveDb =:= true -> set_ets_cache_flag(Ets, 1);
		true -> skip
	end.

set_ets_cache_flag(Ets, Val) ->
	erlang:put(?CACHE_ETS_FLAG(Ets), Val).

get_ets_cache_flag(Ets) ->
	case erlang:get(?CACHE_ETS_FLAG(Ets)) of
		undefined -> 0;
		Val -> Val
	end.

player_show() ->
	PlayerBase = lib_player:get_player_base(),
	player_show(PlayerBase).
player_show(PlayerBase) ->
	#player_show{
		id = PlayerBase#player_base.id,
		is_robot = false,
		name = PlayerBase#player_base.name,
		level = PlayerBase#player_base.level,
		sex = PlayerBase#player_base.sex,
		country = PlayerBase#player_base.country,
		head_icon = PlayerBase#player_base.head_icon,
		server_flag = PlayerBase#player_base.server_flag,
		force = PlayerBase#player_base.force,
		country_pos = PlayerBase#player_base.country_pos,
		city_id = PlayerBase#player_base.city_id,
		nobility = PlayerBase#player_base.nobility
	}
.

serialize_show_role() ->
	PlayerBase = lib_player:get_player_base(),
	PlayerVip = lib_player_vip:get_player_vip(),
	PlayerChatState = lib_player_chat_block:get_state(),
	serialize_show_role(PlayerBase, PlayerVip,PlayerChatState).

serialize_show_role_detail() ->
	RoleShow = serialize_show_role(),
	HeroProto = serialize_other_hero_list(lib_hero_api:hero_list()),
	#'ProtoRoleShowInfo'{
		role_show = RoleShow,
		hero_list = HeroProto
	}.

serialize_other_hero_list(HeroList) ->
	#{value := Num0} = tb_const:get(max_show_hero),
	HeroList1 = lists:sort(fun sort_hero/2, HeroList),
	Num = min(Num0, erlang:length(HeroList1)),
	{List, _} = lists:split(Num, HeroList1),
	HeroBaseList = [lib_hero_api:hero_to_hero_base(Hero) || Hero <- List],
	[lib_hero_api:hero_base_to_proto(HeroBase) || HeroBase <- HeroBaseList].

%% 注意：此接口不能直接取玩家进程字典的数据,有可能不在玩家进程里调用
serialize_show_role(PlayerBase, PlayerVip) ->
	#player_base{
		id = PlayerId,
		name = Name,
		country = Country,
		level = Level,
		area = Area,
		force = Force,
		market = Market,
		agent_code = AgentCode,
		server_flag = ServerFlag,
		server_name = ServerName,
		server_prev = ServerPrev,
		head_icon = HeadIcon,
		sex = Sex,
		country_pos = CountryPos,
		city_id = CityId,
		nobility = Nobility
	} = PlayerBase,
	#'ProtoShowRole'{
		id = PlayerId,
		name = Name,
		country = Country,
		level = Level,
		vip = PlayerVip#player_vip.vip_level,
		force = Force,
		area = Area,
		market = Market,
		agent_code = AgentCode,
		server_flag = ServerFlag,
		server_name = ServerName,
		server_prev = ServerPrev,
		head_icon = HeadIcon,
		sex = Sex,
		country_pos = CountryPos,
		city_id = CityId,
		nobility = Nobility
	}.

%% 注意：此接口不能直接取玩家进程字典的数据,有可能不在玩家进程里调用
serialize_show_role(PlayerBase, PlayerVip,PlayerChatState) ->
	#player_base{
		id = PlayerId,
		name = Name,
		country = Country,
		level = Level,
		area = Area,
		force = Force,
		market = Market,
		agent_code = AgentCode,
		server_flag = ServerFlag,
		server_name = ServerName,
		server_prev = ServerPrev,
		head_icon = HeadIcon,
		sex = Sex,
		country_pos = CountryPos,
		city_id = CityId,
		nobility = Nobility
	} = PlayerBase,
	#'ProtoShowRole'{
		id = PlayerId,
		name = Name,
		country = Country,
		level = Level,
		vip = PlayerVip#player_vip.vip_level,
		force = Force,
		area = Area,
		market = Market,
		agent_code = AgentCode,
		server_flag = ServerFlag,
		server_name = ServerName,
		server_prev = ServerPrev,
		head_icon = HeadIcon,
		sex = Sex,
		country_pos = CountryPos,
		city_id = CityId,
		nobility = Nobility,
		chat_type = PlayerChatState
	}.

%% 获取其他玩家的ProtoShowRole信息
serialize_other_player_show_role(PlayerId) ->
	PlayerBase = lib_game_cache:get_player_cache(?ETS_PLAYER_BASE, PlayerId),
	PlayerVip = lib_game_cache:get_player_cache(?ETS_PLAYER_VIP, PlayerId),
	serialize_show_role(PlayerBase, PlayerVip).

%% 获取其他玩家的ProtoShowRoleInfo信息
serialize_other_player_show_role_detail(PlayerId) ->
	RoleShow = serialize_other_player_show_role(PlayerId),
	PlayerHero = lib_game_cache:get_player_cache(?ETS_PLAYER_HERO, PlayerId),
	HeroProto = serialize_other_hero_list(dict:fold(fun(_HeroId, Hero, List) -> [Hero | List] end, [], PlayerHero#player_hero.hero_dict)),
	#'ProtoRoleShowInfo'{
		role_show = RoleShow,
		hero_list = HeroProto
	}.

bson_to_show_role(Bson) ->
	#'ProtoShowRole'{
		id = ?BSON_INT(Bson, <<"id">>),
		name = ?BSON_STRING(Bson, <<"name">>),
		country = ?BSON_INT(Bson, <<"country">>),
		level = ?BSON_INT(Bson, <<"level">>),
		vip = ?BSON_INT(Bson, <<"vip">>),
		force = ?BSON_INT(Bson, <<"force">>),
		area = ?BSON_STRING(Bson, <<"area">>),
		market = ?BSON_INT(Bson, <<"market">>),
		agent_code = ?BSON_INT(Bson, <<"agent_code">>),
		server_flag = ?BSON_STRING(Bson, <<"server_flag">>),
		server_name = ?BSON_STRING(Bson, <<"server_name">>),
		server_prev = ?BSON_STRING(Bson, <<"server_prev">>)
	}.

show_role_to_bson(ShowRole) ->
	#{
		?BSONSET_INT(<<"id">>, ShowRole#'ProtoShowRole'.id),
		?BSONSET_STRING(<<"name">>, ShowRole#'ProtoShowRole'.name),
		?BSONSET_INT(<<"country">>, ShowRole#'ProtoShowRole'.country),
		?BSONSET_INT(<<"level">>, ShowRole#'ProtoShowRole'.level),
		?BSONSET_INT(<<"vip">>, ShowRole#'ProtoShowRole'.vip),
		?BSONSET_INT(<<"force">>, ShowRole#'ProtoShowRole'.force),
		?BSONSET_STRING(<<"area">>, ShowRole#'ProtoShowRole'.area),
		?BSONSET_INT(<<"market">>, ShowRole#'ProtoShowRole'.market),
		?BSONSET_INT(<<"agent_code">>, ShowRole#'ProtoShowRole'.agent_code),
		?BSONSET_STRING(<<"server_flag">>, ShowRole#'ProtoShowRole'.server_flag),
		?BSONSET_STRING(<<"server_name">>, ShowRole#'ProtoShowRole'.server_name),
		?BSONSET_STRING(<<"server_prev">>, ShowRole#'ProtoShowRole'.server_prev)
	}.

get_server_prev_by_name(ServerName) ->
	get_server_prev_by_name(ServerName, []).
get_server_prev_by_name([], PrevList) ->
	lists:reverse(PrevList);
get_server_prev_by_name([Chr | T], PrevList) ->
	if
		Chr =:= $_ -> get_server_prev_by_name([], PrevList);
		true -> get_server_prev_by_name(T, [Chr | PrevList])
	end.

%% 判断玩家进程是否存活
is_player_process_alive(PlayerId) ->
	PlayerPid = get_pid(PlayerId),
	(erlang:is_pid(PlayerPid) =:= true andalso erlang:is_process_alive(PlayerPid) =:= true).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

player_account() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.account.

player_agent() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.agent.

player_sid() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.sid.

player_id() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.id.

player_name() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.name.

server_flag() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.server_flag.

server_prev() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.server_prev.

player_level() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.level.

player_country() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.country.

%% 玩家战力
player_force() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.force.

player_vip() ->
	lib_player_vip:vip_level().

league_id() ->
	lib_player_league:league_id().
league_name() ->
	lib_player_league:league_name().
league_level() ->
	lib_player_league:league_level().
league_position() ->
	lib_player_league:league_position().
country_position() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.country_pos.
city_id() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.city_id.
player_nobility() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.nobility.
change_player_nobility(NobilityId) ->
	PlayerBase = get_player_base(),
	put_player_base(PlayerBase#player_base{nobility = NobilityId}, true).

create_tick() ->
	PlayerBase = get_player_base(),
	PlayerBase#player_base.create_tick
.

client_load_complete(_Sid) ->
	lib_player_process:client_load_complete().

reset_every_day() ->
	CurTick = lib_timer:unixtime(),
	#player_base{reset_everyday_tick = ResetTick} = PlayerBase = get_player_base(),
	case lib_timer:is_same_day(ResetTick, CurTick) of
		false ->
			put_player_base(PlayerBase#player_base{reset_everyday_tick = CurTick}, true),
			?INFO("lib player reset every day.~n"),
			lib_player_process:process_reset_everyday();

		true ->
			skip
	end
.
%% 系统通用刷新
system_refresh(CurTick) ->
	#player_base{system_refresh_tick = Last_reset_tick} = PlayerBase = get_player_base(),
	Refresh_time = maps:get(timevalue, tb_const:get(refresh_time)),
	Tick = Last_reset_tick + lib_timer:day_second(),
	Refresh_tick = lib_timer:current_zero_unixtime(Tick) + Refresh_time,
	A = lib_timer:is_same_day(Last_reset_tick,CurTick),
	?DEBUG("A  ~p",[A]),

	?DEBUG("Last_reset_tick  ~p",[Last_reset_tick]),
	?DEBUG("CurTick  ~p",[CurTick]),
	?DEBUG("Refresh_tick  ~p",[Refresh_tick]),
	case not lib_timer:is_same_day(Last_reset_tick,CurTick) andalso (CurTick >= Refresh_tick)  of
		true ->

			T = (lib_timer:current_zero_unixtime(CurTick) + Refresh_time),
			Now_Refresh_tick =
			case CurTick >= T of
				  true -> T;
				  false-> lib_timer:current_zero_unixtime(CurTick - lib_timer:day_second()) + Refresh_time
			end,
			?DEBUG("Now_Refresh_tick  ~p",[Now_Refresh_tick]),
			put_player_base(PlayerBase#player_base{system_refresh_tick = Now_Refresh_tick}, true),
			?INFO("lib player system refresh.~n"),
			lib_player_process:process_system_refresh();
		false ->
			skip
	end
.



%% 整点更新
hour_reset() ->
	hour_reset(23)
.
hour_reset(Hour) ->
	Last_reset_tick = get_hour_reset_tick(Hour),
	CurTick = lib_timer:unixtime(),
	case (Last_reset_tick + 86400) =< CurTick of
		true  ->lib_integral_point_reset:player_integral_point_resat(Hour),
				Second = lib_timer:next_time_second(Hour * 3600),
				Tick = CurTick + Second - 86400,
				update_hour_reset_tick(Hour,Tick);
		false ->skip
	end,
	case Hour =:= 0 of
		false-> hour_reset(Hour - 1);
		true -> skip
end
.
update_hour_reset_tick(Hour, Tick) ->
	PlayerBase = get_player_base(),
	Reset_tick = PlayerBase#player_base.hour_reset_tick,
	NewMap = maps:put(Hour, Tick, Reset_tick),
	put_player_base(PlayerBase#player_base{hour_reset_tick = NewMap}, true)
.
get_hour_reset_tick(Hour) ->
	PlayerBase = get_player_base(),
	maps:get(Hour, PlayerBase#player_base.hour_reset_tick, 0)

.

handle_new_role() ->
	try
		PlayerBase = get_player_base(),
	    ?JUDGE_RETURN(PlayerBase#player_base.is_new =:= true, 0),
		put_player_base(PlayerBase#player_base{is_new = false}, true),
		system_active_hero(),
		system_active_head(),
		system_weak_country_reward(),
		lib_head_icon:new_role_init(),
		lib_barrack_train_api:initial_soldiers(),
		ok
	catch
	    _:_  -> ok
	end.

system_active_hero() ->
	?DEBUG("system_active_hero"),
	#{jsonvalue := List} = tb_const:get(new_role_hero),
	lists:foreach(fun(Id) ->
		lib_hero_api:active_hero(Id, ?HERO_ACTIVE_TYPE_SYSTEM)
	end, List).
system_active_head() ->
	?DEBUG("system_active_head"),
	#{jsonvalue := List} = tb_const:get(new_role_head),
	lists:foreach(fun(Id) ->
		lib_head_icon:active_head(Id)
	end, List).
system_weak_country_reward() ->
	?DEBUG("system_weak_country_reward"),
	try
	    PlayerBase = get_player_base(),
		?JUDGE_RETURN(PlayerBase#player_base.is_weak_country, 0),
		Conf = tb_role_country:get(PlayerBase#player_base.country),
		Reward = maps:get(reward, Conf, []),
		?JUDGE_RETURN(Reward =/= [], 0),
	    Item = lib_item_api:conf_item_to_pack_item(Reward),
		lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_WEAK_COUNTRY, PlayerBase#player_base.country))
	catch
	    _:_ -> ok
	end.

request_rename(Msg) ->
	#'Proto10111003'{name = Name} = Msg,
	PlayerBase = get_player_base(),
	NowTick = lib_timer:unixtime(),
	#{value := Cool} = tb_const:get(rename_cool_times),
	?JUDGE_RETURN(erlang:length(Name) =< ?MAX_NAME_LENGTH, ?ERROR_NAME_LENGTH),
	?JUDGE_RETURN(mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"name">>, Name)}) =< 0, ?ERROR_ROLE_NAME_EXISTS),
	case PlayerBase#player_base.rename_tick + Cool > NowTick of
		true ->
			Respond = #'Proto50111003'{
				name = Name,
				value = 1,
				cool_time = PlayerBase#player_base.rename_tick + Cool - NowTick
			},
			lib_send:respond_to_client(Respond);
		_ ->
			#{jsonvalue := Cost} = tb_const:get(rename_cost),
			ItemList = lib_item_api:conf_item_list_to_pack_item_list(Cost),
			Ret = lib_player_pack:validate_remove(ItemList),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(ItemList, ?INSERT_SERIAL(?USE_ITEM_RENAME, 0)),
			NewHeroBase = PlayerBase#player_base{name = Name, rename_tick = NowTick},
			put_player_base(NewHeroBase, true),
			lib_player_process:process_player_rename(NewHeroBase),
			Respond = #'Proto50111003'{
				name = Name,
				value = 0
			},
			lib_send:respond_to_client(Respond)
	end.

get_date_map() ->
	#{
		func => roleInfo,
		role_id => player_id(),
		role_name => unicode:characters_to_binary(player_name()),
		server => unicode:characters_to_binary(server_flag()),
		level => player_level(),
		fighting => player_force(),
		account => unicode:characters_to_binary(player_account()),
		package => unicode:characters_to_binary(""),
		channel => unicode:characters_to_binary(player_agent()),
		career => 0
	}
.

http_role_info() ->
	DataMap = get_date_map(),
	lib_http_api:async_post(config:get_post_url(), DataMap)
.

check_player_upgrade(BuildingId, BuildingLevel) ->
	try
		PlayerBase = get_player_base(),
	    ?JUDGE_RETURN(BuildingId =:= ?BUILDING_LORD_MANSION, 0),
		put_player_base(PlayerBase#player_base{level = BuildingLevel}, true),
		?INFO("player upgrade : ~p~n", [BuildingLevel]),
		lib_player_process:process_player_upgrade(BuildingLevel)
	catch
	    _:_  -> ok
	end.

check_player_force() ->
	try
		Num = get_force_hero_num(),
		HeroList = lists:sort(fun sort_hero/2, lib_hero_api:hero_list()),
		check_update_max_force_hero(HeroList),
		Num0 = min(Num, erlang:length(HeroList)),
		{List, _} = lists:split(Num0, HeroList),
		Force = lists:foldl(fun(Hero, Acc) -> Hero#hero.force + Acc end, 0, List),
		PlayerBase = get_player_base(),
		?JUDGE_RETURN(Force =/= PlayerBase#player_base.force, 0),
		put_player_base(PlayerBase#player_base{force = Force}, true),
		?INFO("player force upgrade : ~p~n", [Force]),
		lib_player_process:process_player_force_upgrade(Force)
	catch
	    _:_  -> ok
	end.
sort_hero(LHero, RHero) ->
	LHero#hero.force >= RHero#hero.force.
get_force_hero_num() ->
	PlayerBase = get_player_base(),
	Conf = tb_role_level:get(PlayerBase#player_base.level),
	maps:get(open_num, Conf, 0).

check_update_max_force_hero(HeroList) ->
	try
		PlayerBase = get_player_base(),
		Hero = lists:nth(1, HeroList),
		?JUDGE_RETURN(PlayerBase#player_base.max_force_hero =/= Hero#hero.id, 0),
		put_player_base(PlayerBase#player_base{max_force_hero = Hero#hero.id}, false),
		lib_player_country:process_player_hero_update(lib_hero_api:hero_to_hero_base(Hero)),
		lib_player_rank:update_max_force_hero(Hero#hero.id)
	catch
	    _:_  -> ok
	end.


sign_in() ->
	PlayerBase = get_player_base(),
	PlayerHero = lib_hero:get_player_hero(),
	lib_hero:put_player_hero(PlayerHero#player_hero{
		country = PlayerBase#player_base.country,
		name = PlayerBase#player_base.name
	}).

check_reset() ->
	check_annual_reset(),
	check_season_reset().

check_annual_reset() ->
	try
		PlayerBase = get_player_base(),
		?JUDGE_RETURN(lib_timer:unixtime() >= PlayerBase#player_base.annual_reset_tick, 0),
		put_player_base(PlayerBase#player_base{
			annual_reset_tick = lib_season_and_days_api:next_annual_start_tick()
		}, false),
		lib_player_process:process_annual_reset()
	catch
		_:_  -> ok
	end.

check_season_reset() ->
	try
		PlayerBase = get_player_base(),
		?JUDGE_RETURN(lib_timer:unixtime() >= PlayerBase#player_base.season_reset_tick, 0),
		put_player_base(PlayerBase#player_base{
			season_reset_tick = lib_season_and_days_api:next_season_start_tick()
		}, false),
		lib_player_process:process_season_reset()
	catch
		_:_  -> ok
	end.