%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 1月 2021 10:59
%%%-------------------------------------------------------------------
-module(mod_country_rank).
-behavior(mod_server).
-author("13661").

-include("common.hrl").
-include("country_rank.hrl").

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
	do_load_and_refresh_rank/2,
	do_load_level_rank_1/2,
	do_load_level_rank_2/2
]).
-export([
	put_rank/1,
	get_rank/0
]).
-export([
	test_sort_rank/0,
	test_save_rank/0,
	player_request/4,
	update_ranker_show/3
]).
put_rank(Rank) when is_record(Rank, rank) ->
	erlang:put(?MODULE, Rank)
.

get_rank() ->
	erlang:get(?MODULE)
.

get_process_name(CountryId, RankType) ->
	lib_types:to_atom("country_rank_" ++ lib_types:to_list(CountryId) ++ "_" ++ lib_types:to_list(RankType)).

get_pid(CountryId, RankType) ->
	ProcessName = get_process_name(CountryId, RankType),
	erlang:whereis(ProcessName).

start_link(CountryId, RankType) ->
	ProcessName = get_process_name(CountryId, RankType),
	mod_server:start_link({local, ProcessName}, ?MODULE, [CountryId, RankType], []).

stop(CountryId, RankType) ->
	Pid = get_pid(CountryId, RankType),
	?IIF(is_pid(Pid) andalso is_process_alive(Pid), mod_server:sync_stop(Pid), skip).

do_init([CountryId, RankType]) ->
	erlang:process_flag(trap_exit, true),
	?INFO("mod_country_rank start: ~p ~p", [CountryId, RankType]),
	{ok, #rank_state{country_id = CountryId, type = RankType}}.

do_db_init(State, [CountryId, RankType]) ->
	?DEBUG("country rank load db: ~p ~p", [CountryId, RankType]),
	Rank = db_country_rank:load_rank(CountryId, RankType),
	put_rank(Rank),

	lib_country_rank:refresh_rank(),

	CountryNumber = length(tb_role_country:get_list()),
	RankNumber = length(?RANK_TYPE_LIST),

	%% 避免同时刷新
	AddTime = max(?RANK_FRESH_TIMEOUT div (CountryNumber * RankNumber) * ((CountryId - 1) * RankNumber + RankType), 0),
	erlang:send_after(?RANK_FRESH_TIMEOUT + AddTime, self(), fresh_timeout),
	erlang:send_after(?RANK_SAVE_TIMEOUT + AddTime, self(), save_timeout),

	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(fresh_timeout, #rank_state{country_id = CountryId, type = RankType} = State) ->
	erlang:send_after(?RANK_FRESH_TIMEOUT, self(), fresh_timeout),
	?INFO("country rank sort ~p ~p", [CountryId, RankType]),
	load_and_refresh_rank(CountryId, RankType),
	{noreply, State};
do_info(save_timeout, #rank_state{country_id = CountryId, type = RankType} = State) ->
	erlang:send_after(?RANK_SAVE_TIMEOUT, self(), save_timeout),
	?INFO("country rank save ~p ~p", [CountryId, RankType]),
	db_country_rank:save_rank(get_rank()),
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, #rank_state{country_id = CountryId, type = RankType} = State) ->
	?INFO("country rank stop ~p ~p", [CountryId, RankType]),
	db_country_rank:save_rank(get_rank()),
	State.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%% 启动所有的排行进程
start_all() ->
	lists:map(fun(CountryId) ->
		lists:map(fun(RankType) ->
			start_link(CountryId, RankType)
	  	end, ?RANK_TYPE_LIST)
  	end, tb_role_country:get_list())
.

%% 停止所有的排行进程
stop_all() ->
	lists:map(fun(CountryId) ->
		lists:map(fun(RankType) ->
			stop(CountryId, RankType)
	  	end, ?RANK_TYPE_LIST)
  	end, tb_role_country:get_list())
.

%%load_and_refresh_rank(CountryId, ?RANK_TYPE_LEVEL) ->
%%	SortBson = #{
%%		?BSONSET_INT(level, -1),
%%		?BSONSET_INT(is_online, -1),
%%		?BSONSET_INT(sign_in_tick, 1)
%%	},
%%	QueryBson = #{
%%		?BSONSET_BSON("$query", #{?BSONSET_INT(<<"country_id">>, CountryId)}),
%%		?BSONSET_BSON("$orderby", SortBson)
%%	},
%%
%%	mongo_poolboy:async_find(?MMO_POOL, ?DBPLAYER_RANK, QueryBson, 0, ?RANK_MAX_NUMBER, self(), fun do_load_level_rank_1/2, [CountryId])
%%;
load_and_refresh_rank(CountryId, RankType) ->
%%	SortBson =
%%	case RankType of
%%		?RANK_TYPE_LEVEL ->
%%			#{?BSONSET_INT(<<"level">>, -1), ?BSONSET_INT(<<"level_update_tick">>, 1)};
%%		?RANK_TYPE_FORCE ->
%%			#{?BSONSET_INT(<<"force">>, -1), ?BSONSET_INT(<<"force_update_tick">>, 1)};
%%		?RANK_TYPE_BUILD ->
%%			#{?BSONSET_INT(<<"build_val">>, -1), ?BSONSET_INT(<<"build_val_update_tick">>, 1)};
%%		?RANK_TYPE_KILLS ->
%%			#{?BSONSET_INT(<<"kills">>, -1), ?BSONSET_INT(<<"kills_update_tick">>, 1)};
%%		?RANK_TYPE_BE_KILLS ->
%%			#{?BSONSET_INT(<<"be_kills">>, -1), ?BSONSET_INT(<<"be_kills_update_tick">>, 1)}
%%	end,
	SortBson =
	case RankType of
		?RANK_TYPE_LEVEL ->
			[{<<"level">>, -1}, {<<"level_update_tick">>, 1}];
		?RANK_TYPE_FORCE ->
			[{<<"force">>, -1}, {<<"force_update_tick">>, 1}];
		?RANK_TYPE_BUILD ->
			[{<<"build_val">>, -1}, {<<"build_val_update_tick">>, 1}];
		?RANK_TYPE_KILLS ->
			[{<<"kills">>, -1}, {<<"kills_update_tick">>, 1}];
		?RANK_TYPE_BE_KILLS ->
			[{<<"be_kills">>, -1}, {<<"be_kills_update_tick">>, 1}]
	end,

	QueryBson = #{
%%		?BSONSET_BSON("$query", #{?BSONSET_INT(<<"country_id">>, CountryId)}),
		?BSONSET_BSON("$query", {<<"country_id">>, CountryId}),
		?BSONSET_BSON("$orderby", SortBson)
	},
	mongo_poolboy:async_find(?MMO_POOL, ?DBPLAYER_RANK, QueryBson, 0, ?RANK_MAX_NUMBER, self(), fun do_load_and_refresh_rank/2, [RankType])
.

do_load_level_rank_1(Res, CountryId) ->
	SortBson = #{
		?BSONSET_INT(level, -1),
		?BSONSET_INT(is_online, 1),
		?BSONSET_INT(sign_out_tick, -1)
	},
	QueryBson = #{
		?BSONSET_BSON("$query", #{?BSONSET_INT(<<"country_id">>, CountryId)}),
		?BSONSET_BSON("$orderby", SortBson)
	},
	mongo_poolboy:async_find(?MMO_POOL, ?DBPLAYER_RANK, QueryBson, 0, ?RANK_MAX_NUMBER, self(), fun do_load_level_rank_2/2, [Res])
.
do_load_level_rank_2(Res1, Res2) ->
	do_load_and_refresh_rank(Res1 ++ Res2, ?RANK_TYPE_LEVEL)
.

bson_to_ranker(Bson, RankType) ->
	IsOnline = ?BSON_INT(Bson, is_online),

	Value1 =
		case RankType of
			?RANK_TYPE_LEVEL ->
				?BSON_INT(Bson, level);
			?RANK_TYPE_FORCE ->
				?BSON_INT(Bson, force);
			?RANK_TYPE_BUILD ->
				?BSON_INT(Bson, build_val);
			?RANK_TYPE_KILLS ->
				?BSON_INT(Bson, kills);
			?RANK_TYPE_BE_KILLS ->
				?BSON_INT(Bson, be_kills)
		end,

	Value2 =
		case RankType of
			_ -> 0
		end,

	UpdateTick =
		case RankType of
			?RANK_TYPE_LEVEL ->
				?BSON_INT(Bson, level_update_tick);
			?RANK_TYPE_FORCE ->
				?BSON_INT(Bson, force_update_tick);
			?RANK_TYPE_BUILD ->
				?BSON_INT(Bson, build_val_update_tick);
			?RANK_TYPE_KILLS ->
				?BSON_INT(Bson, kills_update_tick);
			?RANK_TYPE_BE_KILLS ->
				?BSON_INT(Bson, be_kills_update_tick)
		end,

	BsonShow = ?BSON_BSON(Bson, show),
	#ranker{
		rank_type = RankType,
		id = ?BSON_INT(Bson, id),
		show = lib_common:bson_to_player_show(BsonShow),
		value1 = Value1,
		value2 = Value2,
		update_tick = UpdateTick,
		is_online = lib_types:to_bool(IsOnline),
		sign_in_tick = ?BSON_INT(Bson, sign_in_tick),
		sign_out_tick = ?BSON_INT(Bson, sign_out_tick)
	}
.

do_load_and_refresh_rank(ResList, RankType) ->
	RankerMap =
	lists:foldl(fun(Res, Map) ->
		Ranker = bson_to_ranker(Res, RankType),
		maps:put(Ranker#ranker.id, Ranker, Map)
	end, maps:new(), ResList),
	lib_country_rank:update_ranker_map(RankerMap),
	lib_country_rank:refresh_rank()
.

test_sort_rank() ->
	CountryId = lib_country_rank:country_id(),
	RankType = lib_country_rank:rank_type(),
	?INFO("test country rank sort ~p ~p", [CountryId, RankType]),

	load_and_refresh_rank(CountryId, RankType)
.

test_save_rank() ->
	CountryId = lib_country_rank:country_id(),
	RankType = lib_country_rank:rank_type(),
	?INFO("test country rank sort ~p ~p", [CountryId, RankType]),

	db_country_rank:save_rank(get_rank())
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
	end
.

update_ranker_show(CountryId, PlayerId, Show) ->
	lists:map(fun(RankType) ->
		mod_server:sync_apply(mod_country_rank:get_pid(CountryId, RankType), fun lib_country_rank:process_player_show_update/2, [PlayerId, Show])
   	end, ?RANK_TYPE_LIST)
.