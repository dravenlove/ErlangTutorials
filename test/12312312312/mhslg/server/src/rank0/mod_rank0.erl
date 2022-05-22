%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 1月 2021 10:59
%%%-------------------------------------------------------------------
-module(mod_rank0).
-behavior(mod_server).

-include("common.hrl").
-include("rank0.hrl").
-include("hero.hrl").
-include("player.hrl").

-define(RANK_FRESH_TIMEOUT, 60 * 10 * 1000).
-define(RANK_SAVE_TIMEOUT, 60 * 10 * 1000).

-export([start_link/2, stop/2, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_process_name/2,
	get_pid/2,
	start_all/0,
	stop_all/0
]).
-export([
	do_load_and_refresh_rank/2
]).
-export([
	put_rank/1,
	get_rank/0
]).
-export([
	test_sort_rank/0,
	test_save_rank/0,
	player_request/4,
	rank_max_number/2
]).

put_rank(Rank) when is_record(Rank, rank) ->
	erlang:put(?MODULE, Rank).
get_rank() ->
	erlang:get(?MODULE).

get_process_name(CountryId, RankType) ->
	lib_types:to_atom("rank0_" ++ lib_types:to_list(CountryId) ++ "_" ++ lib_types:to_list(RankType)).

get_pid(CountryId, RankType) ->
	ProcessName = get_process_name(CountryId, RankType),
	erlang:whereis(ProcessName).


start_all() ->
	lists:foreach(fun(K) ->
		#{type := RankType, range := Range} = tb_rank:get(K),
		start(Range, RankType)
	end, tb_rank:get_list()).
start(?RANK_RANGE_SERVER, RankType) ->
	start_link(0, RankType);
start(?RANK_RANGE_COUNTRY, RankType) ->
	lists:map(fun(CountryId) ->
		start_link(CountryId, RankType)
	end, tb_role_country:get_list()).

start_link(CountryId, RankType) ->
	ProcessName = get_process_name(CountryId, RankType),
	mod_server:start_link({local, ProcessName}, ?MODULE, [CountryId, RankType], []).

stop(CountryId, RankType) ->
	Pid = get_pid(CountryId, RankType),
	?IIF(is_pid(Pid) andalso is_process_alive(Pid), mod_server:sync_stop(Pid), skip).

do_init([CountryId, RankType]) ->
	erlang:process_flag(trap_exit, true),
	?INFO("mod_rank0 start: ~p ~p", [CountryId, RankType]),
	{ok, #rank_state{country_id = CountryId, type = RankType}}.

do_db_init(State, [CountryId, RankType]) ->
	?DEBUG("rank0 load db: ~p ~p", [CountryId, RankType]),
	Rank = db_rank0:load_rank(CountryId, RankType),
	put_rank(Rank),

	lib_rank0:refresh_rank(),

	erlang:send_after(lib_random:rand(rank_refresh_time(CountryId, RankType) * 1000), self(), fresh_timeout),
	erlang:send_after(lib_random:rand(?RANK_SAVE_TIMEOUT), self(), save_timeout),
	check_reset_rank(CountryId, RankType),

	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(fresh_timeout, #rank_state{country_id = CountryId, type = RankType} = State) ->
	erlang:send_after(rank_refresh_time(CountryId, RankType) * 1000, self(), fresh_timeout),
	% ?INFO("rank0 sort ~p ~p", [CountryId, RankType]),
	load_and_refresh_rank(CountryId, RankType),
	{noreply, State};
do_info(save_timeout, #rank_state{country_id = CountryId, type = RankType} = State) ->
	erlang:send_after(?RANK_SAVE_TIMEOUT, self(), save_timeout),
	?INFO("rank0 save ~p ~p", [CountryId, RankType]),
	db_rank0:save_rank(get_rank()),
	{noreply, State};
do_info(reset_timeout, #rank_state{country_id = CountryId, type = RankType} = State) ->
	check_reset_rank(CountryId, RankType),
	reset_rank(),
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, #rank_state{country_id = CountryId, type = RankType} = State) ->
	?INFO("country rank stop ~p ~p", [CountryId, RankType]),
	db_rank0:save_rank(get_rank()),
	State.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%% 停止所有的排行进程
stop_all() ->
	lists:foreach(fun(K) ->
		#{type := RankType, range := Range} = tb_rank:get(K),
		stop_one(Range, RankType)
	end, tb_rank:get_list()).
stop_one(?RANK_RANGE_SERVER, RankType) ->
	stop(0, RankType);
stop_one(?RANK_RANGE_COUNTRY, RankType) ->
	lists:map(fun(CountryId) ->
		stop(CountryId, RankType)
	end, tb_role_country:get_list()).

check_reset_rank(CountryId, RankType) ->
	NowTick = lib_timer:unixtime(),
	case rank_reset_type(CountryId, RankType) of
		?RANK_RESET_TYPE0 ->
			skip;
		?RANK_RESET_TYPE1 ->
			NextStartTick = lib_season_and_days_api:next_season_start_tick(),
			erlang:send_after((NextStartTick - NowTick) * 1000, self(), reset_timeout);
		?RANK_RESET_TYPE2 ->
			NextStartTick = lib_season_and_days_api:next_annual_start_tick(),
			erlang:send_after((NextStartTick - NowTick) * 1000, self(), reset_timeout)
	end.

reset_rank() ->
	Rank = get_rank(),
	put_rank(Rank#rank{
		rank_list = [],
		ranker_map = maps:new()
	}),
	load_and_refresh_rank(Rank#rank.country_id, Rank#rank.type).

load_and_refresh_rank(CountryId, RankType) ->
	SortBson =
	case RankType of
		?RANK_TYPE_FORCE ->
			[{<<"force">>, -1}, {<<"force_update_tick">>, 1}];
		?RANK_TYPE_HERO ->
			[{<<"force">>, -1}, {<<"update_tick">>, 1}];
		?RANK_TYPE_KILLS ->
			[{<<"rank0_kills">>, -1}, {<<"rank0_kills_update_tick">>, 1}];
		?RANK_TYPE_BUILD ->
			[{<<"rank0_build_val">>, -1}, {<<"rank0_build_val_update_tick">>, 1}]
	end,

	QueryBson =
	case CountryId of
		0 ->
			case rank_reset_type(CountryId, RankType) of
				?RANK_RESET_TYPE0 ->
					#{
						?BSONSET_BSON("$query", #{}),
						?BSONSET_BSON("$orderby", SortBson)
					};
				?RANK_RESET_TYPE1 ->
					StartTick = lib_season_and_days_api:cur_season_start_tick(),
					#{
						?BSONSET_BSON("$query", #{?BSONSET_BSON(rank_tick_field(RankType), #{?BSONSET_INT(<<"$gte">>, StartTick)})}),
						?BSONSET_BSON("$orderby", SortBson)
					};
				?RANK_RESET_TYPE2 ->
					StartTick = lib_season_and_days_api:cur_annual_start_tick(),
					#{
						?BSONSET_BSON("$query", #{?BSONSET_BSON(rank_tick_field(RankType), #{?BSONSET_INT(<<"$gte">>, StartTick)})}),
						?BSONSET_BSON("$orderby", SortBson)
					}
			end;
		_ ->
			case rank_reset_type(CountryId, RankType) of
				?RANK_RESET_TYPE0 ->
					#{
						?BSONSET_BSON("$query", #{?BSONSET_INT(<<"country_id">>, CountryId)}),
						?BSONSET_BSON("$orderby", SortBson)
					};
				?RANK_RESET_TYPE1 ->
					StartTick = lib_season_and_days_api:cur_season_start_tick(),
					#{
						?BSONSET_BSON("$query", #{
							?BSONSET_INT(<<"country_id">>, CountryId),
							?BSONSET_VALUE(rank_tick_field(RankType), #{?BSONSET_INT(<<"$gte">>, StartTick)})
						}),
						?BSONSET_BSON("$orderby", SortBson)
					};
				?RANK_RESET_TYPE2 ->
					StartTick = lib_season_and_days_api:cur_annual_start_tick(),
					#{
						?BSONSET_BSON("$query", #{
							?BSONSET_INT(<<"country_id">>, CountryId),
							?BSONSET_VALUE(rank_tick_field(RankType), #{?BSONSET_INT(<<"$gte">>, StartTick)})
						}),
						?BSONSET_BSON("$orderby", SortBson)
					}
			end
	end,

	MongodbTable =
	case RankType of
		?RANK_TYPE_HERO -> ?DBPLAYER_HEROS;
		_ -> ?DBPLAYER_RANK
	end,

	mongo_poolboy:async_find(?MMO_POOL, MongodbTable, QueryBson, 0, rank_max_number(CountryId, RankType), self(), fun do_load_and_refresh_rank/2, [RankType]).

rank_max_number(CountryId, RankType) ->
	Range = case CountryId of 0 -> ?RANK_RANGE_SERVER; _ -> ?RANK_RANGE_COUNTRY end,
	#{max_num := MaxNumber} = tb_rank:get(?RANK_CONFIG_KEY(Range, RankType)),
	MaxNumber.

rank_reset_type(CountryId, RankType) ->
	Range = case CountryId of 0 -> ?RANK_RANGE_SERVER; _ -> ?RANK_RANGE_COUNTRY end,
	#{reset_type := ResetType} = tb_rank:get(?RANK_CONFIG_KEY(Range, RankType)),
	ResetType.

rank_refresh_time(CountryId, RankType) ->
	Range = case CountryId of 0 -> ?RANK_RANGE_SERVER; _ -> ?RANK_RANGE_COUNTRY end,
	#{refresh_time := RefreshTime} = tb_rank:get(?RANK_CONFIG_KEY(Range, RankType)),
	max(RefreshTime, 30).

rank_tick_field(RankType) ->
	case RankType of
		?RANK_TYPE_FORCE ->
			<<"force_update_tick">>;
		?RANK_TYPE_HERO ->
			<<"update_tick">>;
		?RANK_TYPE_KILLS ->
			<<"rank0_kills_update_tick">>;
		?RANK_TYPE_BUILD ->
			<<"rank0_build_val_update_tick">>
	end.

bson_to_ranker(Bson, RankType) ->
	Value =
		case RankType of
			?RANK_TYPE_FORCE ->
				?BSON_INT(Bson, force);
			?RANK_TYPE_HERO ->
				?BSON_INT(Bson, force);
			?RANK_TYPE_KILLS ->
				?BSON_INT(Bson, rank0_kills);
			?RANK_TYPE_BUILD ->
				?BSON_INT(Bson, rank0_build_val)
		end,

	UpdateTick =
		case RankType of
			?RANK_TYPE_FORCE ->
				?BSON_INT(Bson, force_update_tick);
			?RANK_TYPE_HERO ->
				?BSON_INT(Bson, update_tick);
			?RANK_TYPE_BUILD ->
				?BSON_INT(Bson, build_val_update_tick);
			?RANK_TYPE_KILLS ->
				?BSON_INT(Bson, kills_update_tick)
		end,

	Show =
		case RankType of
			?RANK_TYPE_HERO ->
				#player_show{
					id = ?BSON_INT(Bson, id),
					name = ?BSON_STRING(Bson, name),
					country = ?BSON_INT(Bson, country_id)
				};
			_ ->
				BsonShow = ?BSON_BSON(Bson, show),
				lib_common:bson_to_player_show(BsonShow)
		end,

	HeroBase =
		case RankType of
			?RANK_TYPE_HERO ->
				bson_to_hero_base(Bson);
			_ ->
				#hero_base{}
		end,

	#ranker{
		rank_type = RankType,
		id = ?BSON_INT(Bson, id),
		show = Show,
        max_force_hero = ?BSON_INT(Bson, max_force_hero),
		hero_base = HeroBase,
		value = Value,
		update_tick = UpdateTick
	}
.

do_load_and_refresh_rank(ResList, RankType) ->
	RankerMap =
	lists:foldl(fun(Res, Map) ->
		Ranker = bson_to_ranker(Res, RankType),
		maps:put(Ranker#ranker.id, Ranker, Map)
	end, maps:new(), ResList),
	lib_rank0:update_ranker_map(RankerMap),
	lib_rank0:refresh_rank()
.

test_sort_rank() ->
	CountryId = lib_rank0:country_id(),
	RankType = lib_rank0:rank_type(),
	?INFO("test rank0 sort ~p ~p", [CountryId, RankType]),

	load_and_refresh_rank(CountryId, RankType)
.

test_save_rank() ->
	CountryId = lib_rank0:country_id(),
	RankType = lib_rank0:rank_type(),
	?INFO("test rank0 sort ~p ~p", [CountryId, RankType]),

	db_rank0:save_rank(get_rank())
.

player_request(Recogn, PlayerId, Fun, Args) ->
	try
		erlang:apply(Fun, [PlayerId] ++ Args)
	catch
		throw: {respond, ErrCode, Line} when is_integer(ErrCode) ->
			ResRecogn = lib_msg:request_code_to_respond_code(Recogn),
			lib_send:respond_to_player(PlayerId, ResRecogn, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p", [PlayerId, ResRecogn, ErrCode, Line]);
		throw: {respond, Body, _Line} ->
			lib_send:respond_to_player(PlayerId, Body);
		throw: {respond, Msg, ErrCode, Line} when is_integer(Msg) andalso is_integer(ErrCode) ->
			lib_send:respond_to_player(PlayerId, Msg, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p", [PlayerId, Msg, ErrCode, Line])
	end.

bson_to_hero_base(Bson) ->
	BsonHeroEquipList = ?BSON_LIST(Bson, equip_item),
	HeroEquipDict = lists:foldl(
		fun(BsonHeroEquip, Dict) ->
			EquipItem = db_player_pack:bson_to_pack_item(BsonHeroEquip),
			dict:store(EquipItem#item.unique_id, EquipItem, Dict)
		end, dict:new(), BsonHeroEquipList),

	#hero_base{
		id = ?BSON_INT(Bson, hero_id),
		level = ?BSON_INT(Bson, level),
		star = ?BSON_INT(Bson, star),
		front_level = ?BSON_INT(Bson, front_level),
		back_level = ?BSON_INT(Bson, back_level),
		front_stage = ?BSON_INT(Bson, front_stage),
		back_stage = ?BSON_INT(Bson, back_stage),
		force = ?BSON_INT(Bson, force),
		equip_item_dict = HeroEquipDict,
		skill_list = ?BSON_LIST(Bson, skill_list),
		prop_dict = lib_fight_prop:bson_to_prop_dict(?BSON_BSON(Bson, prop_dict)),
		honor_title = db_player_hero:bson_to_honor_title(?BSON_BSON(Bson, honor_title))
	}.