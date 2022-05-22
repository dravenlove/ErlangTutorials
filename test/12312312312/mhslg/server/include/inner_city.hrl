%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Dec 2020 3:46 PM
%%%-------------------------------------------------------------------
-author("zxl").
-include("chat.hrl").

-define(BUILDING_LORD_MANSION, 1010101).	%% 领主府
-define(BUILDING_PUB, 1020101).	%% 酒馆
-define(BUILDING_SKY_MELTING_POT, 1030101).	%% 天空熔炉
-define(BUILDING_SCIENCE, 1040101).	%% 心树
-define(BUILDING_FAIR, 1050101).	%% 市集
-define(BUILDING_ARENA, 1070101).	%% 竞技场
-define(BUILDING_DUEL_HALL, 1070201).	%% 决斗大厅
-define(BUILDING_EXPEDITIONARY_FORCE_DEPARTMENT, 1080101).	%% 远征军部
-define(BUILDING_WAR_COUNCIL, 1080201).	%% 战争议会
-define(BUILDING_LOGISTICS_CENTER, 1090101).	%% 后勤中心
-define(BUILDING_ASTROLOGY_SCHOOL, 1110101).	%% 占星院
-define(BUILDING_GENERAL_STATION, 1110201).	%% 传识台
-define(BUILDING_DRAGON_HOME, 1130101).	%% 龙栖之地
-define(BUILDING_THE_VALHALLA, 1140101).	%% 英灵殿
-define(BUILDING_RAINBOW_BRIDGE, 1150101).	%% 彩虹桥
-define(BUILDING_INFANTRY_BATTALION, 1060101). %% 步兵营
-define(BUILDING_CAVALRY_CAMP, 1060201). %% 骑兵营
-define(BUILDING_BOW_BARRACKS, 1060301). %% 弓兵营
-define(BUILDING_FANG_SHIYING, 1060401). %% 方士营
-define(BUILDING_TRADE_SHIP,1100101). %% 贸易货船

-define(BUILDING_COINS_WORKSHOP_ONE, 	1120101). %% 铸币工坊1
-define(BUILDING_COINS_WORKSHOP_TWO, 	1120102). %% 铸币工坊2
-define(BUILDING_COINS_WORKSHOP_THREE, 	1120103). %% 铸币工坊3
-define(BUILDING_MINE_ONE, 				1120201). %% 矿场1
-define(BUILDING_MINE_TWO, 				1120202). %% 矿场2
-define(BUILDING_MINE_THREE,			1120203). %% 矿场3
-define(BUILDING_FARM_ONE, 				1120301). %% 农场1
-define(BUILDING_FARM_TWO, 				1120302). %% 农场2
-define(BUILDING_FARM_THREE,			1120303). %% 农场3
-define(BUILDING_LUMBER_MILL_ONE,  		1120401). %% 伐木场1
-define(BUILDING_LUMBER_MILL_TWO,  		1120402). %% 伐木场2
-define(BUILDING_LUMBER_MILL_THREE, 	1120403). %% 伐木场3

%% 建筑状态  往后加
-define(BUILDING_LEISURE,				0).						%% 建筑空闲
-define(BUILDING_UPGRADE,				1).						%% 建筑升级
-define(BUILDING_TRAINING,				2).						%% 建筑训练
-define(BUILDING_EQUIPPED_BREAKTHROUGH,	3).						%% 装备突破
-define(BUILDING_GET_ITEM,				4).						%% 建筑有可领取道具


%% 建筑加速方式
-define(BUILDING_COMPLETE,	0).		%% 直接完成
-define(BUILDING_USE_GOLD,	1).		%% 建筑使用黄金
-define(BUILDING_USE_ITEM,	2).		%% 建筑使用道具


-record(building,{
	building_id = 0,			%% 建筑id
	building_lv = 0,			%% 建筑等级
	class_id_big = 0,			%% 大类id(建筑组id)
	class_id = 0,				%% 小类id
	building_state = 0,			%% 建筑状态 0 无  1 升级  2 训练
	upgrade_tick = 0,     		%% 开始时间戳 升级 or 工作
	remaining_time = 0,			%% 需要时间(加速时修改)
	upgrade_total_time = 0,		%% 升级总时间
	is_open = -1,				%% 是否开启 -1 未解锁 0 未开启  1 已开启
	is_resource_building = 0,	%% 是否是资源建筑
	resource_tick = 0,			%% 上次收集资源的时间戳(资源建筑使用)
	is_mutual = false           %% 是否申请势力互助

}).

-record(inner_city,{
	id = 0,							%% 玩家id
	use_construction_workers = 0,	%% 使用中的建筑工数量
	buildings_dict = dict:new(),	%% 建筑列表
	working_list = []				%% 建筑工作列表
}).

%% 势力互助配置
-define(MUTUAL_ACCELERATE_TIME , maps:get(value, tb_building_upgrade_mutual:get(accelerate_time))).
-define(MUTUAL_TOTAL_TIMES , maps:get(value, tb_building_upgrade_mutual:get(number))).
-define(MUTUAL_AUTO_TIME , maps:get(value, tb_building_upgrade_mutual:get(auto_time))).
-define(MUTUAL_ASYNC_APPLY,fun(Func,Args) -> mod_server:async_apply(mod_mutual:get_pid(), Func, Args) end).
-define(BROAD_ID_MUTUAL, 1024).		%% 势力互助

-record(mutual,{				%% 势力互助
	proto_show_role = 0,		%% 玩家信息 => #ProtoShowRole
	building_id = 0,			%% 建筑id
	building_lv = 0,			%% 建筑等级
	mutual_times = 0,           %% 势力互助完成次数
	mutual_total_times = 0,     %% 势力互助总次数
	mutual_player_list = [],    %% 助力过的玩家id列表
	is_mutual = false,			%% 是否助力过：获取时标记用
	update_tick = 0,			%% 更新的时间戳
	country_id = 0					%% 势力
}).

-record(mutual_status,{
	mutual = [] %% 势力互助 => #mutual
}).
