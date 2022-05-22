%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. 11月 2020 15:00
%%%-------------------------------------------------------------------

-ifndef('map_HRL').
-define('map_HRL', true).

-define(WORLD_CITY,			1). %% 世界城池
-define(INNER_CITY,			2).	%% 主城城池
-define(AFFILIATE_OBJECT,	3).	%% 附属对象，产业
-define(SIMPLE_OBJECT,		4).	%% 简单对象，如鹤

-define(CITY_FORTRESS,	1).		%%要塞
-define(CITY_XIAN_CITY,	2).		%%县城
-define(CITY_GUAN_CITY,	3).		%%关城
-define(CITY_JUN_CITY,	4).		%%郡城
-define(CITY_DU_CITY,	5).		%%都城
-define(CITY_CAPITAL,	6).		%%首都
-define(CITY_CENTRE,	7).		%% 中心城

-define(COUNTRY_CAPITAL(C), ?CITY_CAPITAL * 1000000 + C * 1000 + 1).

-define(FIGHTING_NO, 0).		%%无战斗

-define(ANTIWAR_NO, 0).			%%可进攻
-define(ANTIWAR_YES, 1).		%%免战

-define(GUARD_GENERAL,	1).		%% 普通
-define(GUARD_ELITE, 	2).		%% 精英
-define(GUARD_SENIOR,	3).		%% 大将
-define(GUARD_INIT,	#{
	?GUARD_GENERAL => 0,
	?GUARD_ELITE => 0,
	?GUARD_SENIOR => 0
}).			%% 初始化
-define(GUARD_NUM(M),	lists:sum(maps:values(M))).	%% 总数量

-define(COUNTRY_EFFECT_LIST, []).

-define(CITY_EFFECT_1,		'1').	%% 1-增加城防军上限数量*
-define(CITY_EFFECT_2,		'2').	%% 2-增加每小时税银产量*
-define(CITY_EFFECT_3,		'3').	%% 3-增加每小时税粮产量*
-define(CITY_EFFECT_4,		'4').	%% 4-增加本城到邻城移动速度百分比*
-define(CITY_EFFECT_5,		'5').	%% 5-增加每小时税金产量*
-define(CITY_EFFECT_6,		'6').	%% 6-增加全国所有城池税粮产量*
-define(CITY_EFFECT_7,		'7').	%% 7-减少全国城池移动时间*
-define(CITY_EFFECT_8,		'8').	%% 8-增加本国指定城池城防军大将晋升百分比*
-define(CITY_EFFECT_9,		'9').	%% 9-增加建设时建设度百分比*
-define(CITY_EFFECT_10,		'10').	%% 10-增加城防军精英晋升百分比*
-define(CITY_EFFECT_11,		'11').	%% 11-减少到邻城的粮食消耗百分比*
-define(CITY_EFFECT_12,		'12').	%% 12-增加每小时恢复城防军数量*
-define(CITY_EFFECT_13,		'13').	%% 13-增加攻击敌方高傲气部队，击败敌方当前兵力百分比
-define(CITY_EFFECT_14,		'14').	%% 14-增加每小时额外税银产量百分比*
-define(CITY_EFFECT_15,		'15').	%% 15-增加每小时额外税粮产量百分比*
-define(CITY_EFFECT_16,		'16').	%% 16-每20小战攻击一次，砸歼敌方当前兵力百分比
-define(CITY_EFFECT_17,		'17').	%% 17-本部队在本城战斗，提升伤害和免伤百分比
-define(CITY_EFFECT_18,		'18').	%% 18-密道等级

-record(master_order, { 	%% 城主令
	uuid = 0,				%% UUID
	is_in_open = false,		%% 是否开启中
	start_tick = 0			%% 开始时间
}).

-record(city, {		%%城池信息
	id = 0,				%%id
	country = 0,		%%所属国家
	fighting = 0,		%%战斗状态
	antiwar = 0,		%%免战状态
	master_id = 0,		%%城主id
	master_name = "",	%%城主昵称
	master_icon = 0,	%% 城主头像
	master_order = #master_order{}, %% 城主令
	tax_revenue_map = maps:new(), %% 税收 key:id val:数量
	send_tax_revenue_map = maps:new(), %% 发送的税收 key:id val:数量
	tax_revenue_reset_tick = 0,		%% 最后一次重置那天的0点
	tax_revenue_produce_tick = 0,	%% 最后一次产出那小时的0点
	tax_revenue_send_tick = 0,		%% 最后一次发送的那天0点

	deduct_protect_tick = 0,		%% 未到保护时间，建筑度不扣除
	building_map = maps:new(),		%% buildingId => 建设度
	building_prop = maps:new(),		%% 建筑加成

	guard_num = maps:new(),			%% 城防军map
	defend_troops = [],				%% 防守方玩家部队id列表
	attack_country = 0,				%% 进攻方势力
	attack_troops = [],				%% 进攻方玩家部队id列表

	occupy_tick = 0					%% 被占领的时间戳

}).

-define(PLAYER_DEL_VIEW,	player_del_view).
-define(PLAYER_ADD_VIEW,	player_add_view).

-define(COMBAT_AREA,	5).
-define(TROOP_ID(PlayerId, HeroId),	PlayerId * 1000 + HeroId).
-define(PLAYER_ID(TroopId),			TroopId div 1000).
-define(HERO_ID(TroopId),			TroopId rem 1000).

-define(SPACE,		$ ).	%% 空
-define(CANT_GO,	$0).	%% 不可行走
-define(CAN_GO,		$1).	%% 可行走
-define(CANT_FIGHT,	$2).	%% 可行走，不可战斗


-define(BLOCK_ID(X, Y),	tb_block_id:get({trunc(X) div 75 + 1, trunc(abs(Y)) div 75 + 1})).

-record(block, {
	id,
	x,			%% 左上角x坐标
	y,			%% 左上角y坐标
	speed = 0,	%% 速度加成
	pos_tuple,
	pid_view_set = sets:new(),
	move_troop = [],
	troop_map = maps:new()

}).

-endif.
