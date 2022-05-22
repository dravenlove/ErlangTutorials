%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 11:23
%%%-------------------------------------------------------------------
-module(lib_player_arena).
-author("13661").

-include("common.hrl").
-include("arena.hrl").
-include("fight.hrl").
-include("ProtoClient_10102.hrl").
-include("ProtoClient_10137.hrl").

-export([
	get_player_arena/0,
	put_player_arena/1,
	put_player_arena/2,
	ets_init/0,
	build_index/0,
	player_arena_handler/0,

	sign_in/0,
	async_request/2,
	sync_request/2,
	reset_everyday/0
]).

%% API
-export([
	request_info/0,
	request_challenge/1,
	request_buy_times/0,
	request_refresh/0,
	request_history/0,
	request_rank_list/1,
	request_times_info/0
]).

get_player_arena() ->
	erlang:get(?ETS_PLAYER_ARENA)
.

put_player_arena(Info) when is_record(Info, player_arena) ->
	put_player_arena(Info, true)
.
put_player_arena(Info, IsSaveDb) when is_record(Info, player_arena) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_ARENA),
	erlang:put(?ETS_PLAYER_ARENA, Info)
.

ets_init() ->
	ets:new(?ETS_PLAYER_ARENA, [?ETS_KEY_POS(#player_arena.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_ARENA, {?TUPLE_INT(id, 1)}, true)
.

player_arena_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_ARENA,
		table_name = ?DB_PLAYER_ARENA,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_arena:load_player_arena/1,
		save_func = fun db_player_arena:save_player_arena/1,
		get_func = fun get_player_arena/0,
		put_func = fun put_player_arena/2
	}.

async_request(F, A) ->
	mod_arena:async_apply(fun mod_arena:do_player_request/4, [erlang:get(recogn), lib_player:player_id(), F, A])
.

sync_request(F, A) ->
	mod_arena:sync_apply(F, [lib_player:player_id() | A])
.

challenge_times() ->
	Info = get_player_arena(),
	Info#player_arena.challenge_times
.

add_challenge_times(Times) ->
	lib_player_process:process_arena_times(Times),
	Info = get_player_arena(),
	OldTimes = Info#player_arena.challenge_times,
	put_player_arena(Info#player_arena{challenge_times = OldTimes + Times})
.

buy_times() ->
	Info = get_player_arena(),
	Info#player_arena.buy_times
.

add_buy_times(Times) ->
	Info = get_player_arena(),
	OldTimes = Info#player_arena.buy_times,
	put_player_arena(Info#player_arena{buy_times = OldTimes + Times})
.

free_times() ->
	VipLevel = 0, %%todo
	Conf = tb_arena_vip:get(VipLevel),
	?IIF(Conf =/= false, maps:get(free_times, Conf, 0), 0)
.

left_times() ->
	SingleBuyTimes = lib_arena_setting:get_const_int(single_buy_times, 0),
	buy_times() * SingleBuyTimes + free_times() - challenge_times()
.

get_refresh_tick() ->
	Info = get_player_arena(),
	Info#player_arena.refresh_tick
.

set_refresh_tick(Tick) ->
	Info = get_player_arena(),
	put_player_arena(Info#player_arena{refresh_tick = Tick})
.

sign_in() ->
	async_request(fun lib_arena:player_sign_in/1, [])
.

reset_everyday() ->
	Info = get_player_arena(),
	put_player_arena(Info#player_arena{
		challenge_times = 0,
		buy_times = 0
	})
.

request_info() ->
	async_request(fun lib_arena_request:request_info/4, [lib_player:player_show(), buy_times(), challenge_times()])
.

-define(CHALLENGE_TYPE_PLAY, 1).
-define(CHALLENGE_TYPE_SKIP, 2).
request_challenge(Msg) ->
	#'Proto10137002'{
		type = Type,
		hero_list = HeroList,
		index = Index,
		tag_id = TagId,
		tag_rank = TagRank
	} = Msg,
	HeroNumber = length(HeroList),

	?JUDGE_RETURN(Type =:= ?CHALLENGE_TYPE_PLAY orelse Type =:= ?CHALLENGE_TYPE_SKIP, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(TagId > 0, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(TagId =/= lib_player:player_id(), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(TagRank > 0, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(HeroNumber > 0, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(Index >= 1 andalso Index =< 4, ?ERROR_INVALID_INDEX),
	?JUDGE_RETURN(left_times() > 0, ?ERROR_CLIENT_OPERATOR),

	Conf = tb_arena_hero_num:get(HeroNumber),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	NeedLevel = maps:get(level, Conf, 0),
	?JUDGE_RETURN(lib_player:player_level() >= NeedLevel, ?ERROR_CLIENT_OPERATOR),

	HeroBaseList =
	lists:foldr(fun(HeroId, List) ->
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
		[lib_hero_api:hero_base_info(HeroId) | List]
    end, [], HeroList),

	Show = lib_player:player_show(),
	{Flag, Ret} = sync_request(fun lib_arena_request:request_challenge/7, [Show, Type, HeroBaseList, Index, TagId, TagRank]),
	?JUDGE_RETURN(Flag, Ret),

	add_challenge_times(1),

	{FightMsg, ResultMsg, FirstConfList} = Ret,

	case Type of
		?CHALLENGE_TYPE_PLAY -> lib_send:respond_to_client(FightMsg);
		?CHALLENGE_TYPE_SKIP -> skip
	end,

	Respond = #'Proto50137002'{
		type = Type,
		hero_list = HeroList,
		index = Index,
		tag_id = TagId,
		tag_rank = TagRank
	},
	lib_send:respond_to_client(Respond),

	#'Proto80102007'{
		win_type = WinType,
		param2 = TrueTagRank
	} = ResultMsg,
	IsWin = WinType =:= ?FIGHTER_TYPE_L,

	IndexList = tb_arena_challenge_reward:get_list(),
	ConfList =
	lib_common:list_foldl(fun(ConfIndex, List) ->
		RewardConf = tb_arena_challenge_reward:get(ConfIndex),
		Min = maps:get(min, RewardConf),
		Max = maps:get(max, RewardConf),
		?JUDGE_CONTINUE(Min =< TrueTagRank andalso TrueTagRank =< Max, List),

		?BREAK(maps:get(reward, RewardConf, []))
	end, [], IndexList),

	RewardItemList =
	case IsWin of
		false -> ConfList;
		true -> FirstConfList ++ ConfList
	end,

	ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(RewardItemList),
	lib_player_pack:auto_insert(ItemObjList, ?INSERT_SERIAL(?ADD_ARENA_CHALLENGE, TrueTagRank), true, ?PACK_TIPS0),

	FightRespond = lib_combat_queue_api:result_msg_add_reward(ResultMsg, RewardItemList),
	lib_send:respond_to_client(FightRespond)
.

request_buy_times() ->
	VipLevel = 0, %%todo
	Conf = tb_arena_vip:get(VipLevel),
	MaxBuyTimes = ?IIF(Conf =/= false, maps:get(buy_times, Conf, 0), 0),
	CurBuyTimes = buy_times(),

	?JUDGE_RETURN(MaxBuyTimes > CurBuyTimes, ?ERROR_CLIENT_OPERATOR),

	TimesConf = tb_arena_time_buy:get(CurBuyTimes + 1),
	?JUDGE_RETURN(TimesConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	ConfList = maps:get(cost, TimesConf, []),
	ItemList = lib_item_api:conf_item_list_to_item_obj_list(ConfList),
	Ret = lib_player_pack:auto_remove(ItemList, ?REMOVE_SERIAL(?USE_ARENA_BUY_TIMES, CurBuyTimes + 1)),
	?JUDGE_RETURN(Ret, Ret),

	add_buy_times(1),

	lib_send:respond_to_client(#'Proto50137003'{buy_times = buy_times()})
.

request_refresh() ->
	RefreshTick = get_refresh_tick(),
	CurTick = lib_timer:unixtime(),
	set_refresh_tick(CurTick),

	?JUDGE_RETURN(RefreshTick =/= CurTick, ?ERROR_OPERATE_TOO_FAST),

	async_request(fun lib_arena_request:request_refresh/1, [])
.

request_history() ->
	async_request(fun lib_arena_request:request_history/1, [])
.

request_rank_list(Msg) ->
	Page = Msg#'Proto10137006'.page,
	async_request(fun lib_arena_request:request_rank_list/2, [Page])
.

request_times_info() ->
	Respond = #'Proto50137007'{
		buy_times = buy_times(),
		used_times = challenge_times()
	},
	lib_send:respond_to_client(Respond)
.