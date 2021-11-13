%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: ets
%%% Created on : 2020/7/30 0030 19:50
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('ets_HRL').
-define('ets_HRL', true).

%% ETS OPTION
-define(ETS_OPTIONS,[named_table,public,set,{read_concurrency,true}]).
-define(ETS_OPTIONS_KEYPOS1, [{keypos,1},named_table,public,set,{read_concurrency,true}]).
-define(ETS_KEY_POS(Name), {keypos, Name}).

-define(ETS_GLOBAL_CACHE, ets_global_cache).
-define(ETS_COUNTER, ets_counter).
-define(ETS_LEAGUE, ets_league).
-define(ETS_LEAGUE_MEMBER, ets_league_member).
-define(ETS_GAME_NODE, ets_game_node).	%% 游戏服的node信息
-define(ETS_SERVER_NODE, ets_server_node).
-define(ETS_CLUSTER_GROUP, ets_cluster_group).
-define(ETS_CLUSTER_SERVER_GROUP, ets_cluster_server_group).
-define(ETS_SEASON, ets_season).
-define(ETS_MAP, ets_map).	%%地图系统
-define(ETS_TROOPS, ets_troops).
-define(ETS_HERO_SKILL_LIKE, ets_hero_skill_like).	%% 英雄技能点赞

-define(ETS_PLAYER_BASE, ets_player_base).
-define(ETS_PLAYER_BASE_OTHER, ets_player_base_other).
-define(ETS_PLAYER_PACK, ets_player_pack).
-define(ETS_PLAYER_MONEY, ets_player_money).
-define(ETS_PLAYER_MAIL, ets_player_mail).
-define(ETS_PLAYER_COPY, ets_player_copy).
-define(ETS_PLAYER_LEAGUE, ets_player_league).
-define(ETS_PLAYER_FRIEND, ets_player_friend).	%% 好友跟其他玩家数据处理流程不同,不能参考
-define(ETS_PLAYER_BACKACTIVITY, ets_player_backactivity).
-define(ETS_PLAYER_RANK, ets_player_rank).
-define(ETS_PLAYER_VIP, ets_player_vip).
-define(ETS_PLAYER_BAN, ets_player_ban).
-define(ETS_PLAYER_CHAPTER, ets_player_chapter).
-define(ETS_PLAYER_HERO, ets_player_hero).
-define(ETS_PLAYER_ACTIVITY, ets_player_activity).
-define(ETS_PLAYER_BACKSTAGE_ACTIVITY, ets_player_backstage_activity).
-define(ETS_PLAYER_TASK, ets_player_task).    %% yc---------玩家任务
-define(ETS_ONLINE_GIFT, ets_online_gift). %%在线奖励
-define(ETS_PLAYER_FUNCTION_OPEN, ets_player_function_open).
-define(ETS_PLAYER_HEAD_ICON, ets_player_head_icon).
-define(ETS_PLAYER_TROOPS, ets_player_troops).	%%部队系统
-define(ETS_PLAYER_INNER_CITY, ets_player_inner_city). %% 内城系统
-define(ETS_PLAYER_PUB_RECRUIT, ets_player_pub_recruit). %% 酒馆招募
-define(ETS_PLAYER_BARRACK_TRAIN, ets_player_barrack_train). %% 兵营和训练
-define(ETS_PLAYER_EQUIP, ets_player_equip). %%玩家装备
-define(ETS_PLAYER_COUNTRY,	ets_player_country). %%玩家国家信息
-define(ETS_PLAYER_LOGISTICS_CENTER,	ets_player_logistics_center). %%玩家后勤中心
-define(ETS_PLAYER_DISSOVLE_HERO_FUAGMENT,	ets_player_dissolve). %%玩家英雄碎片
-define(ETS_PLAYER_NOBILITY, ets_player_nobility).	%% 玩家爵位记录
-define(ETS_PLAYER_HOLY_SPIRIT_HALL,	ets_player_holy_spirit_hall). %%玩家圣灵大厅
-define(ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD,	ets_player_backstage_chat_setting_record). %%玩家圣灵大厅
-define(ETS_PLAYER_BOUNTY_MISSION, ets_player_bounty_mission). %% 玩家赏金任务
-define(ETS_PLAYER_MAP_CLEARING, ets_player_map_clearing). %% 玩家地图空地
-define(ETS_PLAYER_DUNGEONED, ets_player_dungeoned). %% 玩家魔塔
-define(ETS_PLAYER_CITY_BUILDING, ets_player_city_building). %% 玩家城池建设
-define(ETS_PLAYER_SCIENCE, ets_player_science). %%心树科技
-define(ETS_PLAYER_TASK_SYSTEM, ets_player_task_system). %%玩家任务系统
-define(ETS_PLAYER_CITY_INDUSTRY, ets_player_city_industry). %% 玩家城池产业
-define(ETS_PLAYER_ARENA, ets_player_arena). %% 玩家巅峰竞技
-define(ETS_PLAYER_HERO_BUSY, ets_player_hero_busy). %% 玩家英雄忙碌
-define(ETS_PLAYER_CITY_VISITING, ets_player_city_visiting). %% 玩家城池拜访
-define(ETS_PLAYER_SHOP, ets_player_shop). %%玩家商店
-define(ETS_PLAYER_PUPPET,ets_player_puppet). %%混沌傀儡
-define(ETS_PLAYER_COUNTRY_TASK, ets_player_country_task). %% 玩家国家任务
-define(ETS_HERO_CROPS_STUDY, ets_hero_crops_study).%% 英雄兵种研究
-define(ETS_PLAYER_TASK_INFO,ets_player_task_info). %% 玩家任务
-define(ETS_PLAYER_ALIEN_INVASION, ets_player_alien_invasion). %% 玩家异族入侵
-define(ETS_PLAYER_SEASON_ACTIVITY,ets_player_season_activity). %% 季节活跃活动
-define(ETS_ACTIVITY_TABLE, ets_activity_table). %%活动系统
-define(ETS_WELFARE_EXCHANGE,ets_welfare_exchange). %%福利兑换
-define(ETS_PLAYER_ARCHIVES,ets_player_archives).   %%档案馆

-define(ETS_STAR, ets_star). %%星座系统




-endif.
