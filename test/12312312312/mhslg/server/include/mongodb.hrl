%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mongodb
%%% Created on : 2020/7/29 0029 20:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('mongodb_HRL').
-define('mongodb_HRL', true).

-define(MMO_POOL, mmo_pool).
-define(BACK_POOL, backstage_pool).
-define(DEFAULT_MONGO_TIMEOUT, 180 * 1000).

-record(mongo_state, {
	conn = undefined,
	is_close = true,
	mongoargs = []
}).

-define(BSON_INT_DEFAULT(BSON, Name, Default), lib_types:to_integer(maps:get(lib_types:to_binary(Name), BSON, Default))).
-define(BSON_FLOAT_DEFAULT(BSON, Name, Default), lib_types:to_float(maps:get(lib_types:to_binary(Name), BSON, Default))).
-define(BSON_STRING_DEFAULT(BSON, Name, Default), lib_types:to_list(maps:get(lib_types:to_binary(Name), BSON, Default))).
-define(BSON_LIST_DEFAULT(BSON, Name, Default), lib_types:to_list(maps:get(lib_types:to_binary(Name), BSON, Default))).
-define(BSON_BSON_DEFAULT(BSON, Name, Default), maps:get(lib_types:to_binary(Name), BSON, Default)).
-define(BSON_BIN_DEFAULT(BSON, Name, Default), maps:get(lib_types:to_binary(Name), BSON, Default)).
-define(BSON_BOOL_DEFAULT(BSON, Name, Default), maps:get(lib_types:to_binary(Name), BSON, Default)).

-define(BSON_INT(BSON, Name), lib_types:to_integer(maps:get(lib_types:to_binary(Name), BSON, 0))).
-define(BSON_FLOAT(BSON, Name), lib_types:to_float(maps:get(lib_types:to_binary(Name), BSON, 0.0))).
-define(BSON_STRING(BSON, Name), lib_types:to_list(maps:get(lib_types:to_binary(Name), BSON, ""))).
-define(BSON_LIST(BSON, Name), lib_types:to_list(maps:get(lib_types:to_binary(Name), BSON, []))).
-define(BSON_LIST(BSON, Name, Default), ?BSON_LIST_DEFAULT(BSON, Name, Default)).
-define(BSON_STRING_LIST(BSON, Name), [lib_types:to_list(V) || V <- lib_types:to_list(maps:get(lib_types:to_binary(Name), BSON, []))]).
-define(BSON_BSON(BSON, Name), maps:get(lib_types:to_binary(Name), BSON, #{})).
-define(BSON_BIN(BSON, Name), maps:get(lib_types:to_binary(Name), BSON, <<>>)).
-define(BSON_BOOL(BSON, Name), maps:get(lib_types:to_binary(Name), BSON, false)).
-define(BSON_VALUE(BSON, Name), maps:get(lib_types:to_binary(Name), BSON)).

-define(BSONSET_INT(Name, Value), lib_types:to_binary(Name) => lib_types:to_integer(Value)).
-define(BSONSET_FLOAT(Name, Value), lib_types:to_binary(Name) => lib_types:to_float(Value)).
-define(BSONSET_STRING(Name, Value), lib_types:to_binary(Name) => lib_types:to_binary(Value)).
-define(BSONSET_LIST(Name, Value), lib_types:to_binary(Name) => Value).
-define(BSONSET_STRING_LIST(Name, Value), lib_types:to_binary(Name) => [lib_types:to_binary(V) || V <- Value]).
-define(BSONSET_BSON(Name, Value), lib_types:to_binary(Name) => Value).
-define(BSONSET_BIN(Name, Value), lib_types:to_binary(Name) => Value).
-define(BSONSET_BOOL(Name, Value), lib_types:to_binary(Name) => Value).
-define(BSONSET_VALUE(Name, Value), lib_types:to_binary(Name) => Value).

-define(TUPLE_INT(Name, Value), lib_types:to_binary(Name), Value).

-define(DBGLOBAL, <<"global">>).
-define(DBMAILOFFLINE, <<"mail_offline">>).
-define(DBLEAGUE, <<"league">>).
-define(DBBACKACTIVITY_ACTIVE, <<"backactivity_active">>).
-define(DBRANK, <<"rank">>).
-define(DB_RANK0, <<"rank0">>).
-define(DBSERVER_INFO, <<"server_info">>).
-define(DBCLUSTER_RANK, <<"cluster_rank">>).
-define(DBBAN_IP, <<"ban_ip">>).
-define(DB_COUNTRY,	<<"country">>).
-define(DB_COUNTRY_PLAYER, <<"country_player">>).
-define(DB_COUNTRY_RANK, <<"country_rank">>).
-define(DB_ARENA, <<"arena">>).
-define(DB_ARENA_PLAYER, <<"arena_player">>).
-define(DB_DRAGON_PALACE_ADVENTURE, <<"dragon_palace_adventure">>).
-define(DB_CHALLENGE, <<"challenge">>).
-define(DB_HONOUR_TOP, <<"honour_top">>).

-define(DBROLE, <<"role">>).
-define(DBPLAYER_PACK, <<"player_pack">>).
-define(DBPLAYER_MONEY, <<"player_money">>).
-define(DBPLAYER_MAIL, <<"player_mail">>).
-define(DBPLAYER_COPY, <<"player_copy">>).
-define(DBPLAYER_LEAGUE, <<"player_league">>).
-define(DBPLAYER_FRIEND, <<"player_friend">>).
-define(DBPLAYER_BACKACTIVITY, <<"player_backactivity">>).
-define(DBPLAYER_RANK, <<"player_rank">>).
-define(DBPLAYER_VIP, <<"player_vip">>).
-define(DBPLAYER_BAN, <<"player_ban">>).
-define(DBPLAYER_CHAPTER, <<"player_chapter">>).
-define(DBPLAYER_HEROS, <<"player_heros">>).
-define(DB_PLAYER_ACTIVITY, <<"player_activity">>).
-define(DB_PLAYER_BACKSTAGE_ACTIVITY, <<"player_backstage_activity">>).
-define(DBPLAYER_FUNCTION_OPEN, <<"player_function_open">>).
-define(DBPLAYER_HEAD_ICON, <<"player_head_icon">>).
-define(DBPLAYER_ONLINE_GIFT, <<"player_online_gift">>).
-define(DBPLAYER_INNER_CITY, <<"player_inner_city">>).
-define(DBPLAYER_PUB_RECRUIT, <<"player_pub_recruit">>).
-define(DBPLAYER_BARRACK_TRAIN, <<"player_barrack_train">>).
-define(DBPLAYER_COUNTRY, <<"player_country">>).
-define(DBPLAYER_LOGISTICS_CENTER, <<"player_logistics_center">>).
-define(DBPLAYER_DISSOLVE_HERO_FRAGMENT, <<"player_dissolve_hero_fragment">>).
-define(DBPLAYER_NOBILITY, <<"player_nobility">>).
-define(DBPLAYER_TROOPS, <<"player_troops">>).
-define(DBPLAYER_EQUIP, <<"player_equip">>).
-define(DBPLAYER_HOLY_SPIRIT_HALL, <<"player_holy_spirit_hall">>).
-define(DB_PLAYER_CHAT_LIMIT,<<"player_chat_limit">>).
-define(DBPLAYER_BOUNTY_MISSION, <<"player_bounty_mission">>).
-define(DBPLAYER_MAP_CLEARING, <<"player_map_clearing">>).
-define(DBPLAYER_DUNGEONED, <<"player_dungeoned">>).
-define(DBPLAYER_CITY_BUILDING, <<"player_city_building">>).
-define(DBPLAYER_SCIENCE, <<"player_science">>).
-define(DB_PLAYER_TASK_SYSTEM, <<"player_task_system">>).
-define(DBPLAYER_CITY_INDUSTRY, <<"player_city_industry">>).
-define(DB_PLAYER_ARENA, <<"player_arena">>).
-define(DBPLAYER_HERO_BUSY, <<"player_hero_busy">>).
-define(DBPLAYER_CITY_VISITING, <<"player_city_visiting">>).
-define(DBPLAYER_SHOP, <<"player_shop">>).
-define(DBPLAYER_PUPPET, <<"player_puppet">>).
-define(DBPLAYER_COUNTRY_TASK, <<"player_country_task">>).
-define(DBPLAYER_HERO_CROPS_STUDY, <<"player_hero_crops_study">>).
-define(DBPLAYER_PLAYER_TASK, <<"player_task">>).
-define(DBPLAYER_PLAYER_STAR, <<"player_star">>).
-define(DBPLAYER_PLAYER_ALIEN_INVASION, <<"player_alien_invasion">>).
-define(DBPLAYER_WELFARE_EXCHANGE,<<"player_welfare_exchange">>).
-define(DBPLAYER_ARCHIVES,<<"player_archives">>).

-define(DBBACK_ACTIVITY, <<"back_activity">>).
-define(DBBACKACTIVITY_CONVERT, <<"backactivity_convert">>).
-define(DBBACK_ORDER, <<"order">>).
-define(DBBACK_BAN, <<"ban">>).
-define(DBBACK_MAIL, <<"mail">>).
-define(DB_MMO_ACTIVITY, <<"activity">>).
-define(DB_BACKSTAGE_ACTIVITY, <<"backstage_activity">>).
-define(DB_MAP, <<"map">>).

-define(DB_TROOPS, <<"troops">>).
-define(DB_HERO_SKILL_LIKE, <<"hero_skill_like">>).
-define(DB_COUNTRY_WAREHOUSE,	<<"country_warehouse">>).
-define(DB_CHAT_BLOCK,	<<"chat_block">>). %%聊天屏蔽表
-define(DB_MMO_TASK_SYTEM, <<"task_system">>).
-define(DB_MERITORIOUS_RANK, <<"meritorious_rank">>).
-define(DBBACK_GAME_NODE, <<"cluster_gamenode">>).
-define(DBBACK_CLUSTER_BACKGROUP, <<"cluster_backgroup">>).
-define(DBBACK_CLUSTER_GROUP, <<"cluster_group">>).

-define(DBPLAYER_TASK, <<"player_task">>). %%玩家任务数据表

-define(DB_COMBAT_QUEUE, <<"combat_queue">>).
-define(DB_FIGHT_RECORD, <<"fight_record">>).

-define(DB_BACKSTAGE_CHAT_LIMIT,<<"chat_limit">>). %%后台聊天限制表
-define(DB_DUNGEONED, <<"dungeoned">>).
-define(DB_ALIEN, <<"alien">>).

-define(DB_SEASON, <<"season">>).
-define(DBBACK_SEASON, <<"season">>).

-define(DB_PLAYER_SEASON_ACTIVITY, <<"player_season_activity">>).
-define(DBBACK_PLAYER_SEASON_ACTIVITY, <<"player_season_activity">>).
-define(DB_SEASON_ACTIVITY, <<"season_activity">>).
-define(DBBACK_SEASON_ACTIVITY, <<"season_activity">>).

-define(DB_MUTUAL, <<"mutual">>).
-define(DBBACK_MUTUAL, <<"mutual">>).

-endif.
