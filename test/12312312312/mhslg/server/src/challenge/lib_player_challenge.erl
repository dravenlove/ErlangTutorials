%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 3月 2021 17:54
%%%-------------------------------------------------------------------
-module(lib_player_challenge).
-author("df").
-include("ProtoClient_10145.hrl").
-include("common.hrl").
-include("hero.hrl").
-include("challenge.hrl").

%% API
-export([
	challenge_info/0,				%% 请求王座信息
	challenge_guess/1,				%% 黑马擂台竞猜
	challenge_attack/1,				%% 请求攻擂
	challenge_report/1,				%% 查看战报
	buy_time/1,						%% 购买攻擂次数
	player_use/1,					%% 玩家使用界面
	sign_in/0,
	sign_out/0
]).

challenge_info()->
	lib_challenge:async_apply(fun lib_challenge:challenge_info/2)
.

challenge_guess(Msg)->
	#'Proto10145002'{type = Type} = Msg,
	lib_challenge:async_apply(fun lib_challenge:challenge_guess/3,[Type])
.


challenge_attack(Msg)->
	#'Proto10145004'{type = Type , hero_list = Hero_id_list} = Msg,
	HeroList = get_hero_info(Hero_id_list),
	lib_challenge:async_apply(fun lib_challenge:challenge_attack/4,[Type,HeroList])
.
challenge_report(Msg)->
	#'Proto10145005'{challenge_type = Challenge_type,report_type = ReportType} = Msg,
	lib_challenge:async_apply(fun lib_challenge:challenge_report/4,[Challenge_type,ReportType])
.

buy_time(Msg)->
	#'Proto10145007'{buy_time = Buy_time} = Msg,
	?DEBUG("购买次数 ~p",[Buy_time]),
	Need_item = lib_challenge_api:buy_time_need(Buy_time + 1),
	Item = lib_item_api:conf_item_to_pack_item(Need_item),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_CHALLENGE_BUY, Buy_time)),
	lib_challenge:async_apply(fun lib_challenge:buy_time/2)
.

%% challenge_function: 1 -> 进入界面  2 -> 进入战报界面
%% type: 0->进入 1->退出
player_use(Msg) ->
	?DEBUG("Msg ~p",[Msg]),
	#'Proto10145009'{type = Type,challenge_function = Function} = Msg,
	lib_challenge:async_apply(fun lib_challenge:player_use/4 ,[Type,Function])
.


sign_in() ->
	lib_challenge:async_apply(fun lib_challenge:sign_in/2)
.

sign_out() ->
	lib_challenge:async_apply(fun lib_challenge:player_use/4 ,[?CHALLENGE_LEAVEN, 1]),
	lib_challenge:async_apply(fun lib_challenge:player_use/4 ,[?CHALLENGE_LEAVEN, 2])
.


get_hero_info(Hero_id_list) ->
	lists:foldr(fun(Id,L) ->
		SkillList = lib_holy_spirit_hall_api:hero_have_skill_list(Id),
		Hero = lib_hero_api:hero_base_info(Id),
		[wipe_off_skill(Hero,SkillList)|L]
				end,[],Hero_id_list)
.
wipe_off_skill(Hero,SkillList) ->
	List = Hero#hero_base.skill_list,
	%% 去除圣灵大厅加成
	List1 =
		lists:foldr(fun(K,L)->
			lists:delete(K,L)
		end,List,SkillList),
	%% 增加减免效果技能
	AddSkill = maps:get(value,tb_challenge_const:get(add_skill)),
	NewList = lists:append([AddSkill],List1),
	Hero#hero_base{skill_list = NewList}
.
