%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 5月 2021 14:34
%%%-------------------------------------------------------------------
-module(lib_player_honour_top).
-author("df").
-include("common.hrl").
-include("ProtoClient_10149.hrl").
-include("season_and_day.hrl").
-include("honour_top.hrl").
-include("hero.hrl").
%% API
-export([
	get_honour_top_info/1,				%% 荣耀之巅界面
	get_honour_top_apply_info/0,		%% 荣耀之巅报名界面
	honour_top_apply/1,					%% 报名/更改阵容
	honour_top_worship/0,				%% 膜拜
	honour_top_get_item/1,				%% 增加道具
	get_honour_top_report/1,			%% 获取战报
	get_honour_top_final/0,				%% 八强赛界面
	get_honour_top_bet_info/0,			%% 押注信息
	honour_top_bet_on/1,				%% 押注
	get_apply_hero/0,
	use_honour_top/1,
	refresh_every_day/0,
	sign_out/0,
	sign_out/1
]).

get_honour_top_info(Msg) ->
	#'Proto10149001'{stage = Stage,group = Group,type = Type} = Msg,
	?DEBUG("Msg ~p",[Msg]),
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_159), ?INFO("功能未开启")),

	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_info/5,[Stage,Group,Type])
.
get_honour_top_apply_info() ->
	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_apply_info/2)
.

honour_top_apply(Msg) ->
	#'Proto10149003'{hero_list = Hero_id_list,is_apply = Type} = Msg,
	?DEBUG("Msg ~p",[Msg]),
	HeroList = get_hero_info(Hero_id_list),
	?JUDGE_RETURN(lists:any(fun(Hero_id)-> lib_hero_assist:hero_is_assist(Hero_id) end,Hero_id_list) =/= true,?ERROR_CLIENT_OPERATOR),
	Force = lib_honour_top_api:count_force(HeroList),
	case Type =:= 1 of
		true ->
			Rank = mod_server:sync_apply(mod_arena:get_pid(),fun lib_arena_api:player_rank/1, [lib_player:player_id()]),
			?JUDGE_RETURN((Rank =< ?APPLY_MAX) andalso (Rank =/= 0), ?ERROR_RANK_NOT_ENOUGH),
			lib_player_process:process_honour_top_apply();
		false-> skip
	end,
	lib_honour_top:async_apply(fun lib_honour_top:honour_top_apply/5,[HeroList,Type,Force])

.
honour_top_worship() ->
	lib_honour_top:async_apply(fun lib_honour_top:honour_top_worship/2)
.
honour_top_get_item(Item) ->
	Item_list = lib_item_api:conf_item_to_pack_item(Item),
	lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_HONOUR_TOP, 1),true, 1)
.
get_honour_top_report(Msg) ->
	#'Proto10149005'{stage = Stage,group = Group} = Msg,
	?DEBUG("Msg ~p",[Msg]),
	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_report/4,[Stage,Group])
.
get_honour_top_final() ->
	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_final/2)
.
get_honour_top_bet_info() ->
	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_bet_info/2)
.
honour_top_bet_on(Msg) ->
	#'Proto10149008'{rank = Rank,money = Money} = Msg,
	?INFO("honour_top_bet_on Msg ~p",[Msg]),
	{Min,Max} = lib_honour_top_api:bet_money(),
	Tick = lib_timer:unixtime(),
	Time = Tick - lib_timer:current_zero_unixtime(Tick),
	case ((Time >= ?BET_START) andalso (Time < ?BET_OVER)) andalso ((Money >= Min) andalso (Money =< Max)) of
		true  -> 	Need_item = [?MONEY,Money],
			Item = lib_item_api:conf_item_to_pack_item(Need_item),
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_CHALLENGE_BUY, Money)),
			lib_honour_top:async_apply(fun lib_honour_top:honour_top_bet_on/4,[Rank,Money]),
			lib_send:respond_to_client(#'Proto50149008'{is_success = 1});
		false -> ?INFO("投注时间错误或数量不在区间内"),lib_send:respond_to_client(#'Proto50149008'{is_success = 0})
	end
.

get_apply_hero() ->
	lib_honour_top:async_apply(fun lib_honour_top:get_apply_hero/2)
.

use_honour_top(Msg) ->
	#'Proto10149010'{type = Type} = Msg,
	?DEBUG("Msg  ~p ",[Msg]),
	lib_honour_top:async_apply(fun lib_honour_top:use_honour_top/3,[Type])
.

get_hero_info(Hero_id_list) ->
	lists:foldr(fun(HeroId,List)->
		[lib_hero_api:hero_base_info(HeroId)|List]
	end,[],Hero_id_list)
.

sign_out() ->
	lib_honour_top:async_apply(fun lib_honour_top:sign_out/2),
	lib_honour_top:async_apply(fun lib_honour_top:use_honour_top/3,[2])
.
sign_out(Player) ->
	Hero_id_list = lists:foldr(fun(HeroBase,L)->
		[HeroBase#hero_base.id|L]
	end,[],Player#player_honour_top.hero_info),
	HeroList = get_hero_info(Hero_id_list),
	Force = lib_honour_top_api:count_force(HeroList),
	lib_honour_top:async_apply(fun lib_honour_top:honour_top_apply/5,[HeroList,2,Force])
.
refresh_every_day() ->
	lib_honour_top:async_apply(fun lib_honour_top:refresh_every_day/2)
.