%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%	爵位系统
%%% @end
%%% Created : 11. Jan 2021 9:12 PM
%%%-------------------------------------------------------------------

-ifndef('nobility_HRL').
-define('nobility_HRL', true).

-define(CONG_SHI,		101).	%% 从士
-define(QI_SHI,			102).	%% 骑士
-define(HUI_QI_SHI,		103).	%% 辉骑士
-define(YAO_QI_SHI,		104).	%% 耀骑士
-define(SHENG_QI_SHI,	105).	%% 圣骑士
-define(XUN_JUE,		106).	%% 勋爵
-define(NAN_JUE,		107).	%% 男爵
-define(ZI_JUE,			108).	%% 子爵
-define(BO_JUE,			109).	%% 伯爵
-define(HOU_JUE,		110).	%% 侯爵
-define(GONG_JUE,		111).	%% 公爵
-define(WANG_JUE,		112).	%% 王爵

-define(PRIVILEGE,				1).		%% 累计特权
-define(HERO_COLOR,				2).		%% 英雄品质
-define(FEAT_NUM,				3).		%% 累计功勋
-define(SOLDIER,				4).		%% 累计训练士兵
-define(GOVERNMENT_AFFAIRS,		5).		%% 累计完成政务
-define(INNER_CITY_LEVEL,		6).		%% 内城等级
-define(HERO_SKILL,				7).		%% 英雄技能
-define(DISSOLVE_HERO_FRAGMENT,	8).		%% 累计分解英雄碎片
-define(CITY_BUILDING_COUNT,	9).		%% 累计城池建设点数
-define(VISIT_LETTER,			10).	%% 累计使用拜帖拜访次数
-define(EQUIP_MAKE,				11).	%% 累计制作装备数
-define(ACCOUNT_BOOK_TAXATION,	12).	%% 累计账本税收次数
-define(DA_GOVERNMENT_AFFAIRS,	13).	%% 开启爵位完成政务
-define(DA_BATTLE_COUNT,		14).	%% 开启爵位战功点数×

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%						获取特权加成，返回0代表未开启或无加成，1或其他列表表示开启或加成数量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(INNER_CITY_BUILDING_TIME,		1).		%% 内城所有建筑≤30分钟可免费立刻完成，返回1800秒*
-define(FORMATION_INCREASE,				2).		%% 可编队数量增加*
-define(NO_JOIN_COUNTRY_WAR_WITHDRAW,	3).		%% 国战中未出战的部队可撤军*
-define(MULTIPLY_BATTLE_COUNT,			4).		%% 国战中兵卒伤亡，给予额外战功补偿倍数，返回倍数*
-define(PUB_RECRUIT_ONE_INCREASE,		5).		%% 酒馆小酌，[赠送英雄碎片数量, 额外赠送王者或圣女碎片]*
-define(APPOINT_CITY_MASTER,			6).		%% 可以被任命为城主*
-define(HERO_COLOR_LIMIT,				7).		%% 英雄可突破至指定颜色*
-define(INNER_CITY_BUILDING_QUEUE,		8).		%% 内城建筑队列数量增加*
-define(INNER_CITY_INDUSTRY_INCREASE,	9).		%% 内城产量增加,[农场和伐木场产量加成百分比, 铸币工坊和矿场产量加成百分比]*
-define(LOGISTICS_EVERYDAY_FREE_TIME,	10).	%% 后勤中心每日免费购买次数增加*
-define(OCCUPY_INDUSTRY_INCREASE,		11).	%% 可占领产业数量增加*
-define(GOVERNMENT_AFFAIRS_FEAT,		12).	%% 政务的功勋奖励百分比*
-define(GOVERNMENT_AFFAIRS_TIME,		13).	%% 每日政务次数数量增加*
-define(SHOP_LOCATION_INCREASE,			14).	%% 商店位置，[名士拜访位置+1必出高级商品, 书商来访位置+1必出高级物品]
-define(COUNTRY_WAR_QUEUE_UP_CHARGE,	15).	%% 国战中排队的队伍可直接突进至下一个城池*
-define(AUTO_TRAIN_SOLDIER,				16).	%% 开启自动练兵
-define(CROSS_CITY_HERO_COMBAT,			17).	%% 跨城进行英雄切磋*
-define(TRAIN_SOLDIER_RESOURCE,			18).	%% 部队训练资源消耗减少百分比*
-define(CROSS_CITY_OCCUPY_INDUSTRY,		19).	%% 跨城进行产业占领*
-define(VISIT_GET_HERO_FRAGMENT,		20).	%% 拜访获得的英雄碎片数量增加*
-define(OCCUPY_INDUSTRY_EARNINGS,		21).	%% 已占领的产业收益百分比*
-define(CROSS_CITY_ATTACK_THIEF,		22).	%% 可以跨城进行政务攻打山贼*
-define(SCIENCE_DEVELOPMENT_RATE,		23).	%% 科技研发速度百分比
-define(VISIT_RATE,						24).	%% 拜访速度百分比*
-define(HUNT_UNITS_RATE,				25).	%% 围猎速度百分比
-define(COUNTRY_WAR_DEFEAT_SOLDIER,		26).	%% 国战中击败士兵战功百分比*
-define(LOGISTICS_BUY,					27).	%% 辎重站购买资源量百分比*
-define(OPEN_29_CHAPTER,				28).	%% 开启沙盘演义29章
-define(PRIVILEGE_FLOAT_LIST,		%% 百分比需做处理/100
	[?MULTIPLY_BATTLE_COUNT, ?INNER_CITY_INDUSTRY_INCREASE, ?TRAIN_SOLDIER_RESOURCE,
		?OCCUPY_INDUSTRY_EARNINGS, ?SCIENCE_DEVELOPMENT_RATE, ?VISIT_RATE, ?HUNT_UNITS_RATE,
		?COUNTRY_WAR_DEFEAT_SOLDIER, ?LOGISTICS_BUY]).

-record(player_nobility, {
	id = 0,					%% 玩家id
	nobility = 100,			%% 当前爵位
	privilege = sets:new(),	%% 激活的特权idSets
	prop					%% 加成
}).


-endif.
