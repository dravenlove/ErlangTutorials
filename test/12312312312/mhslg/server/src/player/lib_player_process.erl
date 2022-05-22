%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十一月 2020 11:58
%%%-------------------------------------------------------------------
-module(lib_player_process).
-author("13661").
-include("common.hrl").
-include("inner_city.hrl").
-include("science.hrl").
-include("country_task.hrl").
-include("player.hrl").
%% API
-export([
	sign_in/0,					%%登陆
	sign_out/0,					%%登出
	client_load_complete/0,		%%客户端加载完成
	process_reset_everyday/0,	%%每日重置
	process_system_refresh/0,	%%系统通用刷新时间重置
	process_recharge_money/3,	%%充值金钱
	process_recharge_gold/3,	%%充值元宝
	process_recharge_all/3,		%%任意充值
	process_function_open/1,	%%功能开启
	process_function_close/1,	%%功能关闭
	process_player_rename/1,	%%玩家重命名
	process_player_upgrade/1,	%%玩家升级
	process_player_nobility/1,	%% 玩家爵位更新
	process_player_force_upgrade/1,	%%玩家战力更新
	process_player_show_update/0,	%%玩家player_show更新
	process_hero_active/1,		%%英雄激活
	process_hero_awaken/1,		%% 英雄觉醒
	reset_season/0,
	all_process_building_upgrade/2,	%% 建筑升级处理
	all_building_open/1,  %% 建筑开启处理
	process_privilege_update/1,		%% 爵位特权更新
	process_science_upgrade/2,		 %%心树科技升级
	process_science_effect_update/1, %%心树科技效果值改变
	process_hero_equip_change/1,		%% 英雄装备改变
	process_industry_work/1,		%% 产业作业
	process_city_visiting/1,		%% 城池拜访
	process_country_task_update/1,	%% 国家任务更新
	process_use_money/2,			%% 使用金钱
	process_insert_equip/0,			%% 插入装备
	process_pass_stage/4,			%% 处理通关沙盘演绎关卡
	process_annual_reset/0,		%% 年度函数调用
	process_season_reset/0,		%% 季度函数调用

	process_hero_army_upgrade/0,		%% 升级英雄兵种军阶
	process_skill_active/1,				%% 技能激活
	process_hero_star_update/2,			%% 英雄星级提升
	process_skill_upgrade/1,			%% 技能升级
	process_industry_occupy/1,			%% 产业占领
	process_bounty_mission/1,			%% 赏金任务更新
	process_kill_monster_items/1,		%% 击杀怪物获得道具
	process_logistics_center_buy/0,		%% 后勤中心购买次数
	process_troops_create/0,			%% 创建部队
	process_pub_recruit/1,				%% 酒馆招募
	process_puppet_times/1,				%% 混沌傀儡挑战次数
	process_chapter_script_times/1, 	%% 信仰战争挑战次数
	process_dissolve_hero_fragment/1,	%% 分解碎片
	process_barrack_train/2,			%% 训练士兵
	process_dragon_rob/0,				%% 龙殿奇遇掠夺
	process_government_task_submit/1,	%% 政务任务提交
	process_arena_times/1,				%% 竞技场挑战次数
	process_city_building/3,			%% 城池建筑建设，增加建设值
	process_dungeoned_challenge/0,		%% 魔塔挑战
	process_shop_buy/2,					%% 商城购买
	process_divination/1,				%% 占星
	process_update_item/2,				%% 道具更新
	process_update_money/2,				%% 货币道具更新
	process_honour_top_apply/0,				%% 报名比武大会

	process_player_use_head/1,			%% 头像改变
	process_city_occupy/1,				%% 城池占领
	process_city_be_occupy/1,			%% 城池被占领
	process_country_kill/1,				%% 国战杀敌
	process_country_time/1,				%% 参与国战
	process_alien_invasion_kill/1,		%% 异族入侵杀敌

	save_player_fight/3					%% 测试保存玩家战斗
	]).


sign_in() ->

	RunList = [
		fun lib_player:sign_in/0,
		fun lib_player_nobility:sign_in/0,
		fun lib_player_league:sign_in/0,
		fun lib_player_copy:sign_in/0,
		fun lib_player_friend:sign_in/0,
		fun lib_player_backactivity:sign_in/0,
		fun lib_player_rank:sign_in/0,
		fun lib_server_info:save_server_info/0,
		fun lib_player_chapter:sign_in/0,
		fun lib_hero:sign_in/0,
		fun lib_function_open:sign_in/0,
		fun lib_player:http_role_info/0,
		fun lib_player_country:sign_in/0,
		fun lib_player_chat_limit:sign_in/0,
		fun lib_player_chat_block:sign_in/0,
		fun lib_player_science:sign_in/0,
		fun lib_player_shop:sign_in/0,
		fun lib_player_alien:sign_in/0,
		fun lib_meritorious_award:sign_in/0,
		fun lib_player_challenge:sign_in/0,
		fun lib_player_puppet:sign_in/0,
		fun lib_hero_crops_study:sign_in/0,
		fun lib_player_arena:sign_in/0,
		fun lib_player_task_new:sign_in/0,
		fun lib_player_activity_handle:sign_in/0,
		fun lib_country_warehouse:sign_in/0,
		fun lib_player_city_industry:sign_in/0,
		fun lib_troops:sign_in/0,
		fun lib_player_alien_invasion:sign_in/0,
		fun lib_player_map_clearing:sign_in/0,
		fun lib_player_recharge:sign_in/0,
		fun lib_mutual_api:sign_in/0,
		fun lib_player_block:sign_in/0,
		fun lib_spring:sign_in/0,
		fun lib_player_open_server_rank:sign_in/0
	],
	lib_common:try_run(RunList),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_player_login/2, [lib_player_chat:to_chat_player()])

.

sign_out() ->
	PlayerId = lib_player:player_id(),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_player_logout/2, [PlayerId]),

	RunList = [
		fun lib_player_league:sign_out/0,
		fun lib_player_copy:sign_out/0,
		fun lib_player_friend:sign_out/0,
		fun lib_player_backactivity:sign_out/0,
		fun lib_player_rank:sign_out/0,
		fun lib_hero:sign_out/0,
		fun online_gift:sign_out/0,
		fun lib_player:http_role_info/0,
		fun lib_player_country:sign_out/0,
		fun lib_player_alien:sign_out/0,
		fun lib_player_challenge:sign_out/0,
		fun lib_player_honour_top:sign_out/0,
		fun lib_player_activity_handle:sign_out/0,
		fun lib_troops:sign_out/0,
		fun lib_player_block:sign_out/0,
		fun lib_spring:sign_out/0,
		fun welfare_exchange:sign_out/0
	],
	lib_common:try_run(RunList)
.

client_load_complete() ->
	RunList = [
		fun lib_function_open:notify_open_function_list/0,
		fun lib_player_country:client_load_complete/0,
		fun lib_player_nobility:notice_privilege_activation/0,
		fun lib_player_dungeoned:sign_in/0,
		fun lib_barrack_train:sign_in/0,
		fun lib_inner_city:resource_building_output_update/0,
		fun online_gift:sign_in/0,
		fun welfare_exchange:sign_in/0
	],
	lib_common:try_run(RunList)
.

process_reset_everyday() ->
	RunList = [
		fun lib_function_open:check_function_open_or_close/0,
		fun lib_player_country:reset_everyday/0,
		fun lib_player_dungeoned:reset_every_day/0,
		fun lib_player_arena:reset_everyday/0,
		fun lib_player_puppet:reset_everyday/0,
		fun lib_player_task_new:reset_everyday/0,
		fun lib_player_chapter:reset_everyday/0,
		fun lib_player_activity_handle:reset_everyday/0,
		fun lib_star_stop:reset_everyday/0,
		fun lib_pub_recruit:reset_everyday/0
	],
	lib_common:try_run(RunList)
.

process_system_refresh() ->
	RunList = [
		fun lib_logistics_center:reset_in_system_reset_time/0,
		fun lib_player_science:process_system_refresh/0,
		fun lib_season_and_days:request_season_and_day_info/0,
		fun online_gift:process_reset_every_day/0,
		fun lib_player_shop:process_system_refresh/0,
		fun lib_player_city_visiting:clear/0,
		fun lib_player_hero_busy:clear/0,
		fun lib_player_honour_top:refresh_every_day/0,
		fun lib_player_fight:delete_test_fight_record/0,
		fun lib_player_activity_handle:system_refresh/0
	],
	lib_common:try_run(RunList)
.

process_recharge_money(ConfId, Money, Gold) ->
	RunList = [
		{fun lib_player_activity_handle:process_recharge_money/3, [ConfId, Money, Gold]}
	],
	lib_common:try_run(RunList)
.

process_recharge_gold(_ConfId, Money, Gold) ->
	RunList = [
		{fun lib_player_activity_handle:process_recharge_gold/2, [Money, Gold]}
	],
	lib_common:try_run(RunList)
.

process_recharge_all(ConfId, Money, Gold) ->
	RunList = [
		fun lib_player_vip:check_vip_level/0,
		{fun lib_player_ba_cumulate_recharge:check_recharge_money/1, [Money]},
%%		{fun lib_player_cluster_rank:refresh_rank_cluster_recharge/2, [Money, Gold]},
		{fun lib_player_country:process_recharge_money/1, [Money]},
		{fun lib_player_activity_handle:process_recharge_all/3, [ConfId, Money, Gold]}
	],
	lib_common:try_run(RunList)
.


process_function_open(?CONDITION_ID_139) ->
	RunList = [
		fun lib_player_government_task:refresh_all_government_task_begin/0
	],
	lib_common:try_run(RunList)
;
process_function_open(?CONDITION_ID_140) ->
	RunList = [
		fun lib_player_daily_task:check_accept_daily_task/0
	],
	lib_common:try_run(RunList)
;
process_function_open(_FunctionId) ->
	skip
.

process_function_close(_FunctionId) ->
	skip
.

process_player_rename(PlayerBase) ->
	RunList = [
		{fun lib_player_map:change_player_base/1, [PlayerBase]}
	],
	lib_common:try_run(RunList)
.

process_player_upgrade(Level) ->
	RunList = [
		fun lib_player:http_role_info/0,
		fun lib_player:check_player_force/0,
		fun lib_function_open:check_function_open_or_close/0,
		fun lib_hero_level:process_player_level_upgrade/0,
		fun lib_player_rank:update_player_level/0,
		fun lib_player_activity_handle:level_upgrade/0,
		{fun lib_player_open_server_rank:update_player_grade/2, [?OPEN_SERVER_TASK_TYPE_1,Level]}
	],
	lib_common:try_run(RunList),

	process_player_show_update()
.

process_player_nobility(Nobility) ->
	RunList = [
		fun lib_function_open:check_function_open_or_close/0,
		{fun lib_player_task_new:refresh_task_status/1, [?COND_NOBILITY_LEVEL]},
		{fun lib_player:change_player_nobility/1, [Nobility]}
	],
	case Nobility =:= ?HOU_JUE orelse Nobility =:= ?GONG_JUE of
		true -> lib_meritorious_award_rank:sync_apply(fun lib_meritorious_award_rank:clean_nobility_meritorious/1);
		false -> skip
	end,
	case Nobility =:= ?BO_JUE orelse Nobility =:= ?HOU_JUE orelse Nobility =:= ?GONG_JUE of
		true -> lib_player_government_task:clean_nobility_time();
		false -> skip
	end,
	lib_common:try_run(RunList),
	process_player_show_update()
.

process_player_force_upgrade(_Force) ->
	RunList = [
		fun lib_player_rank:update_player_force/0
	],
	lib_common:try_run(RunList),

	process_player_show_update()
.

process_player_show_update() ->
	Show = lib_player:player_show(),
	RunList = [
		{fun lib_player_country:process_player_show_update/1, [Show]},
		{fun lib_player_rank:process_player_show_update/1, [Show]}
	],
	lib_common:try_run(RunList)
.

process_hero_active(HeroId) ->
	RunList = [
		{fun lib_head_icon:process_hero_active/1, [HeroId]},
		fun lib_player:check_player_force/0,
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_AMOUNT]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_COLOR]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_SEX_SSR]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_SR_SSR]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_ANY_HERO_SKILL_LEVEL]},
		fun lib_troops:hero_active/0
	],
	lib_common:try_run(RunList)
.

process_hero_awaken(HeroId) ->
	RunList = [
		{fun lib_hero_genius:update_hero_genius_prop/1, [HeroId]},
		{fun lib_hero_assist:update_assist/1, [HeroId]}
	],
	lib_common:try_run(RunList)
.

%% 季节改变接口
reset_season() ->
	RunList = [
		fun lib_function_open:check_function_open_or_close/0
	],
	lib_common:try_run(RunList)
.



%% 建筑升级通知
all_process_building_upgrade(Building_id, BuildingLevel) ->
	BuildingType = Building_id div 10000,
	RunList = [
		fun lib_player_country:process_fief_reward_update/0,
		{fun lib_player_task_new:refresh_task_status/2, [?COND_BUILDING_LEVEL, Building_id]},
		{fun lib_player_task_new:refresh_task_status/2, [?COND_BUILDING_TYPE_LEVEL, BuildingType]}
	],
	lib_common:try_run(RunList),
	process_building_upgrade(Building_id, BuildingLevel)
.
%% 领主府
process_building_upgrade(?BUILDING_LORD_MANSION, BuildingLevel) ->
	RunList = [
		{fun lib_player:check_player_upgrade/2, [?BUILDING_LORD_MANSION, BuildingLevel]}
	],
	lib_common:try_run(RunList)
;
%% 步兵营
process_building_upgrade(?BUILDING_INFANTRY_BATTALION, BuildingLevel) ->
	RunList = [
		{fun lib_barrack_train_api:soldier_level_change_inform/2, [?BUILDING_INFANTRY_BATTALION, BuildingLevel]}
	],
	lib_common:try_run(RunList)
;
%% 骑兵营
process_building_upgrade(?BUILDING_CAVALRY_CAMP, BuildingLevel) ->
	RunList = [
		{fun lib_barrack_train_api:soldier_level_change_inform/2, [?BUILDING_CAVALRY_CAMP, BuildingLevel]}
	],
	lib_common:try_run(RunList)
;
%% 弓兵营
process_building_upgrade(?BUILDING_BOW_BARRACKS, BuildingLevel) ->
	RunList = [
		{fun lib_barrack_train_api:soldier_level_change_inform/2, [?BUILDING_BOW_BARRACKS, BuildingLevel]}
	],
	lib_common:try_run(RunList)
;
%% 方士营
process_building_upgrade(?BUILDING_FANG_SHIYING, BuildingLevel) ->
	RunList = [
		{fun lib_barrack_train_api:soldier_level_change_inform/2, [?BUILDING_FANG_SHIYING, BuildingLevel]}
	],
	lib_common:try_run(RunList)
;
%% 心树科技
process_building_upgrade(?BUILDING_SCIENCE, _BuildingLevel) ->
	RunList = [

	],
	lib_common:try_run(RunList)
;
%% 需要使用添加
process_building_upgrade(_BuildingId, _BuildingLevel) ->
	skip
.


%% 建筑开启
all_building_open(Building_id) ->
	BuildingType = Building_id div 10000,
	RunList = [
		{fun lib_player_task_new:refresh_task_status/2, [?COND_BUILDING_LEVEL, Building_id]},
		{fun lib_player_task_new:refresh_task_status/2, [?COND_BUILDING_TYPE_LEVEL, BuildingType]}
	],
	lib_common:try_run(RunList),
	building_open(Building_id)
.
%% 领主府
building_open(?BUILDING_LORD_MANSION) ->
	RunList = [
		fun lib_player_country:process_fief_reward_update/0
	],
	lib_common:try_run(RunList)
;
building_open(_Building_id) ->
	skip
.

process_privilege_update(Type) ->
	RunList = case Type of
		?FORMATION_INCREASE ->
			[
				fun lib_troops:player_troops/0
			];
		?MULTIPLY_BATTLE_COUNT ->
			[
				fun lib_meritorious_award:update_damage/0
			];
		?COUNTRY_WAR_DEFEAT_SOLDIER ->
			[
				fun lib_meritorious_award:update_kill/0
			];
		?OCCUPY_INDUSTRY_EARNINGS ->
			[
				fun lib_player_city_industry:update_finish/0
			];
		?APPOINT_CITY_MASTER ->
			[
				fun lib_player_country:process_nobility_active/0
			];
		?OCCUPY_INDUSTRY_INCREASE ->
			[
				fun lib_player_city_industry:process_nobility_active/0
			];
		?GOVERNMENT_AFFAIRS_TIME ->
			[
				fun lib_player_task_new:request_player_task_info/0
			];
		?SHOP_LOCATION_INCREASE ->
			[
				fun lib_player_shop:check_open_grid/0
			];
		_ -> []
	end,
	lib_common:try_run(RunList),
	lib_nobility_api:calc_privilege_prop(),
	lib_player_task_new:process_update_task(?COND_NOBILITY_PRIVILEGE)
.

process_science_upgrade(_ScienceId, _Level) ->
	RunList = [
		fun lib_hero_skill_learning:refresh_skill_number/1, [true]
	],
	lib_common:try_run(RunList)
.

process_science_effect_update(?EFFECT_SCIENCE_UPGRADE_TIME_REDUCE) ->
	RunList = [
		fun lib_player_science:check_science_timeout/0
	],
	lib_common:try_run(RunList)
;
process_science_effect_update(?EFFECT_TYPE_HERO_PROP) ->
	RunList = [
		fun lib_player_science:process_prop_effect_update/0
	],
	lib_common:try_run(RunList)
;
process_science_effect_update(?EFFECT_ARMS_HERO_PROP) ->
	RunList = [
		fun lib_player_science:process_prop_effect_update/0
	],
	lib_common:try_run(RunList)
;
process_science_effect_update(?EFFECT_COLOR_HERO_PROP) ->
	RunList = [
		fun lib_player_science:process_prop_effect_update/0
	],
	lib_common:try_run(RunList)
;
process_science_effect_update(?EFFECT_QUALITY_HERO_PROP) ->
	RunList = [
		fun lib_player_science:process_prop_effect_update/0
	],
	lib_common:try_run(RunList)
;
process_science_effect_update(_EffectType) ->
	skip
.

process_hero_equip_change(HeroId) ->
	RunList = [
		{fun lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update/1, [HeroId]},
		{fun lib_equip_api:update_equip_prop/1, [HeroId]},
		{fun lib_hero_assist:update_assist/1, [HeroId]}
	],
	lib_common:try_run(RunList)
.

process_industry_work(IndustryId) ->
	RunList = [
		{fun lib_country_task_api:add/2, [?ADD_INDUSTRY_WORK, IndustryId]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_INDUSTRY_TIMES, IndustryId div 100, 1]}
	],
	lib_common:try_run(RunList)
.

process_city_visiting(_CityId) ->
	RunList = [
		{fun lib_country_task_api:add/2, [?ADD_VISITING, 1]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_CITY_VISITING, 0, 1]}
	],
	lib_common:try_run(RunList)
.

process_country_task_update(_TaskId) ->
	RunList = [
	],
	lib_common:try_run(RunList)
.

process_use_money(PackItem, _SerialObj) ->
	ItemId = PackItem#item.item_id,
	Amount = PackItem#item.amount,
	RunList =
		[
			{fun lib_player_task_new:refresh_task_status/3, [?COND_USE_ITEMS, ItemId, Amount]}
		],
	lib_common:try_run(RunList)
.

process_insert_equip() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_AMOUNT]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_COLOR]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_PART_AMOUNT]}
	],
	lib_common:try_run(RunList)
.

%% Type : 1为挑战 2为扫荡
%% Star : Type为1时有效
process_pass_stage(_Type, _ChapterId, StageId, _Star) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/2, [?COND_BELIEF_PASS, StageId]}
	],
	lib_common:try_run(RunList)
.

process_annual_reset() ->
	lib_player_rank:update_rank0_build_val(0),
	ok
.

process_season_reset() ->
	ok
.

process_hero_army_upgrade() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_ARMY_STAGE]},
		{fun lib_player_open_server_rank:update_player_grade/2, [?OPEN_SERVER_TASK_TYPE_3,0]}
	],
	lib_common:try_run(RunList)
.

process_skill_active(HeroId) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_TOTAL_HERO_LEARN_SKILL]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_ANY_HERO_SKILL_LEVEL]},
		{fun lib_hero_assist:update_assist/1, [HeroId]},
		{fun lib_player_open_server_rank:update_player_grade/2, [?OPEN_SERVER_TASK_TYPE_2,HeroId]}
	],
	lib_common:try_run(RunList)
.

process_hero_star_update(HeroId, _NewStar) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_HERO_COLOR]},
		{fun lib_hero_assist:update_assist/1, [HeroId]}
	],
	lib_common:try_run(RunList)
.

process_skill_upgrade(HeroId) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_ANY_HERO_SKILL_LEVEL]},
		{fun lib_hero_assist:update_assist/1, [HeroId]},
		{fun lib_player_open_server_rank:update_player_grade/2, [?OPEN_SERVER_TASK_TYPE_2,HeroId]}
	],
	lib_common:try_run(RunList)
.

process_industry_occupy(IndustryId) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_INDUSTRY_AMOUNT]},
		{fun lib_player_task_new:refresh_task_status/2, [?COND_INDUSTRY_AMOUNT, IndustryId div 100]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_OCCUPY_INDUSTRY, IndustryId div 100, IndustryId rem 100]}
	],
	lib_common:try_run(RunList)
.

process_bounty_mission(CityId) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/2, [?COND_CITY_BOUNTY, CityId]}
	],
	lib_common:try_run(RunList)
.

process_kill_monster_items(ItemId) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/2, [?COND_KILL_MONSTER_ITEMS, ItemId]}
	],
	lib_common:try_run(RunList)
.

process_logistics_center_buy() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BUY_RESOURCE, 0, 1]}
	],
	lib_common:try_run(RunList)
.

process_troops_create() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_TROOPS_AMOUNT, 0 , 1]}
	],
	lib_common:try_run(RunList)
.

process_pub_recruit(Type) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_DRAW_CARD, Type, 1]}
	],
	lib_common:try_run(RunList)
.

process_puppet_times(Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_PUPPET_CHALLENGE, 0, Times]}
	],
	lib_common:try_run(RunList)
.

process_chapter_script_times(Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BELIEF_CHALLENGE, 0 ,Times]}
	],
	lib_common:try_run(RunList)
.

process_dissolve_hero_fragment(Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_CHUAN_SHI, 0, Times]}
	],
	lib_common:try_run(RunList)
.

process_barrack_train(Type, TrainNum) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_TRAIN_SOLDIER, Type, TrainNum]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_TOTAL_TRAIN_SOLDIER, 0, TrainNum]}
	],
	lib_common:try_run(RunList)
.

process_dragon_rob() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_DRAGON_ROB, 0 , 1]}
	],
	lib_common:try_run(RunList)
.

process_government_task_submit(Grade) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_AFFAIR, 0, Grade]}
	],
	lib_common:try_run(RunList)
.

process_arena_times(Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_ARENA_CHALLENGE, 0, Times]}
	],
	lib_common:try_run(RunList)
.

process_city_building(CityId, BuildingId, AddCount) ->
	lib_city_building_api:add_build_val(AddCount),
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BUILD_CITY_HIDDEN_PATH, CityId, BuildingId]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BUILDING_CITY, 0, 1]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BUILD_VAL, CityId, AddCount]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_BUILD_VAL, 0, AddCount]},
		{fun lib_country_warehouse_api:add_year_construction_values/1, [AddCount]}
	],
	lib_common:try_run(RunList),
	lib_player_rank:add_build_val(AddCount),
	lib_player_rank:add_rank0_build_val(AddCount),
	lib_map_api:async(fun lib_map_api:add_building_count/3, [BuildingId, CityId, AddCount])
.

process_dungeoned_challenge() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_DUNGEONED_CHALLENGE, 0 , 1]}
	],
	lib_common:try_run(RunList)
.

process_shop_buy(ShopId ,Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_SHOP_BUY, ShopId ,Times]}
	],
	lib_common:try_run(RunList)
.

process_divination(Times) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_ASTROLOGY_TIMES, 0 ,Times]}
	],
	lib_common:try_run(RunList)
.

process_update_item(PackType, _PackItem) ->
	case PackType of
		?PACK_TYPE_EQUIP ->
			RunList = [
				{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_AMOUNT]},
				{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_COLOR]},
				{fun lib_player_task_new:refresh_task_status/1, [?COND_EQUIP_PART_AMOUNT]}
			],
			lib_common:try_run(RunList);
		_ ->
			skip
	end
.

process_update_money(Id, Amount) ->
	case ?FEAT_ID of
		Id ->
			RunList = [
				{fun lib_city_building_api:add_total_feat/1, [Amount]}
			],
			lib_common:try_run(RunList);
		_ ->
			skip
	end
.

process_honour_top_apply() ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/1, [?COND_TOTAL_APPLY_BI_WU, 0, 1]  }
	],
	lib_common:try_run(RunList)
.

process_player_use_head(PlayerBase) ->
	RunList = [
		{fun lib_player_map:change_player_base/1, [PlayerBase]}
	],
	lib_common:try_run(RunList)
.

process_city_occupy(CityId) ->
	RunList = [
		{fun lib_player_bounty_mission:city_occupy/1, [CityId]}
	],
	lib_common:try_run(RunList)
.

process_city_be_occupy(CityId) ->
	RunList = [
		{fun lib_player_bounty_mission:city_be_occupy/1, [CityId]},
		{fun lib_player_city_industry:city_be_occupy/1, [CityId]}
	],
	lib_common:try_run(RunList)
.

process_country_kill(Num) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_COUNTRY_KILLS, 0, Num]},
		{fun lib_player_task_new:refresh_task_status/3, [?COND_COUNTRY_KILLS, 1, Num]}
	],
	lib_common:try_run(RunList)
.

process_country_time(Num) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_COUNTRY_CHALLENGE, 0, Num]}
	],
	lib_common:try_run(RunList)
.

process_alien_invasion_kill(Num) ->
	RunList = [
		{fun lib_player_task_new:refresh_task_status/3, [?COND_COUNTRY_KILLS, 0, Num]}
	],
	lib_common:try_run(RunList)
.


save_player_fight(PlayerId,Id,Type) ->
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true ->	 mod_server:async_apply(Pid,fun save_player_fight_record/2, [Id,Type])
	end
.
save_player_fight_record(Id,Type) ->
	Player_base = lib_player:get_player_base(),
	Tick = lib_timer:unixtime(),
	NewMap = maps:put(Tick,#fight_record{tick = Tick,record_id = Id,fight_type = Type},Player_base#player_base.fight_record),
	lib_player:put_player_base(Player_base#player_base{fight_record = NewMap},true)
.