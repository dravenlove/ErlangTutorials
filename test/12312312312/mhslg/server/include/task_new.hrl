%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. 4月 2021 11:42
%%%-------------------------------------------------------------------

-ifndef('task_new_HRL').
-define('task_new_HRL', true).

-define(TASK_TYPE_CHAPTER_TASK,		1001).	%% 章节任务
-define(TASK_TYPE_DAILY_TASK,		1002).	%% 日常任务
-define(TASK_TYPE_ACHIEVEMENT_TASK,	1003).	%% 成就任务
-define(TASK_TYPE_GOVERNMENT_TASK,	1004).	%% 政务任务

-define(TASK_STATUS_INIT,			0).		%% 任务可接受
-define(TASK_STATUS_UNDONE,    		1).  	%% 任务进行中,未完成
-define(TASK_STATUS_FINISH,    		2).  	%% 任务已完成
-define(TASK_STATUS_DRAW,	   		3).  	%% 任务奖励已领取

-define(TASK_ADD,					1).		%% 增加任务
-define(TASK_DELETE,				2).		%% 删除任务
-define(TASK_UPDATE,				3).		%% 更新任务

%%-define(TASK_SERIAL_ACCEPT,         1).		%% 接受任务
%%-define(TASK_SERIAL_SUBMIT,         2).		%% 提交任务
%%-define(TASK_SERIAL_ABANDON,        3).		%% 放弃任务
%%-define(TASK_SERIAL_UPDATE,			4).		%% 更新任务

-define(TASK_GRADE_D,				1).		%% 任务评级D
-define(TASK_GRADE_C,				2).		%% 任务评级C
-define(TASK_GRADE_B,				3).		%% 任务评级B
-define(TASK_GRADE_A,				4).		%% 任务评级A
-define(TASK_GRADE_S,				5).		%% 任务评级S

-define(TASK_REWARD_MAIL_ID_DAILY,	1016).	%%日常任务奖励邮件id

-define(COND_HERO_AMOUNT,			1).		%% 获得N个英雄
-define(COND_TOTAL_HERO_LEVEL,		2).		%% 任意N个英雄达到M级
-define(COND_TROOPS_AMOUNT,			3).		%% 创建N个部队
-define(COND_CITY_BOUNTY,			4).		%% 完成城池的所有赏金任务
-define(COND_BUILDING_LEVEL,		5).		%% 升级领地建筑M到N级
-define(COND_TRAIN_SOLDIER,			6).		%% 训练N个M类兵
-define(COND_DRAW_CARD,				7).		%% 完成N次类型为M的抽卡
-define(COND_PUPPET_CHALLENGE,		8).		%% 挑战N次混沌傀儡
-define(COND_ARENA_CHALLENGE,		9).		%% 挑战N次竞技场
-define(COND_SHOP_BUY,				10).	%% 在商店M中购买N次物品
-define(COND_AFFAIR,				11).	%% 完成N次政务
-define(COND_BUILDING_TYPE_LEVEL,	12).	%% 升级一类领地建筑中M的一个到N级
-define(COND_TOTAL_TRAIN_SOLDIER,	13).	%% 累计练兵N个
-define(COND_ALIEN_CHALLENGE,		14).	%% 参与N次异族征讨
-define(COND_DUNGEONED_CHALLENGE,	15).	%% 进行N次魔塔挑战
-define(COND_NOBILITY_PRIVILEGE,	16).	%% 激活N个爵位特权
-define(COND_CHUAN_SHI,				17).	%% 进行N次传识
-define(COND_BELIEF_CHALLENGE,		18).	%% 进行N次信仰战争
-define(COND_BUILDING_CITY,			19).	%% 建设世界中任意城池N次
-define(COND_OCCUPY_INDUSTRY,		20).	%% 占领N个二级及以上的产业M
-define(COND_INDUSTRY_TIMES,		21).	%% 进行N次产业作业M
-define(COND_CITY_VISITING,			22).	%% 进行N次城池拜访
-define(COND_GENESIS_CHURCH,		23).	%% 成功防守N次启世教派的进攻 	(暂未处理)
-define(COND_COUNTRY_CHALLENGE,		24).	%% 参与N次国战
-define(COND_NOBILITY_LEVEL,		25).	%% 提升爵位到N
-define(COND_BUILD_VAL,				26).	%% 累计建设值达到N
-define(COND_BELIEF_THREE_STAR,		27).	%% 三星通关信仰战争N	使用类型28,与28合并
-define(COND_BELIEF_PASS,			28).	%% 通关信仰战争N
-define(COND_TOTAL_HERO_LEARN_SKILL,29).	%% 任意N个英雄学习M个技能
-define(COND_EQUIP_AMOUNT,			30).	%% 拥有N个装备
%%31 未使用,有新的条件就占用了
-define(COND_HERO_COLOR,			32).	%% 拥有N个M色品质的英雄
-define(COND_HERO_ARMY_STAGE,		33).	%% 任意N名英雄的前后军军阶均达到M阶
-define(COND_INDUSTRY_AMOUNT,		34).	%% 同时拥有N个产业
-define(COND_COUNTRY_KILLS,			35).	%% 国战中累计歼敌N个
-define(COND_ARENA_RANK,			36).	%% 竞技场排名达到前N名
-define(COND_BUILD_CITY_HIDDEN_PATH,37).	%% 建设N次M城池的密道建筑
-define(COND_TOTAL_APPLY_BI_WU,		38).	%% 累计报名N次比武大会
-define(COND_HERO_SEX_SSR,			39).	%% 拥有N个性别为M的SSR英雄
-define(COND_EQUIP_COLOR,			40).	%% 拥有N件阶色为M的装备
-define(COND_ASTROLOGY_TIMES,		41).	%% 进行N次占星
-define(COND_DRAGON_ROB,			42).	%% 消耗N次龙殿奇遇抢夺次数
-define(COND_EQUIP_PART_AMOUNT,		43).	%% 拥有N件部位为M的装备
-define(COND_HERO_SR_SSR,			44).	%% 拥有N个SR和SSR英雄
-define(COND_ANY_HERO_SKILL_LEVEL,	45).	%% 任意N个英雄学习M级技能
-define(COND_BUY_RESOURCE,			46).	%% 后勤中心购买N次资源
-define(COND_USE_ITEMS,				47).	%% 消耗道具或者金钱
-define(COND_DONATE_ITEMS,			48).	%% 累计捐赠N个资源M
-define(COND_KILL_MONSTER_ITEMS,	49).	%% 击杀怪物获得N个道具M

%% 开服冲榜任务
-define(OPEN_SERVER_TASK_TYPE_1, 101).	%% 领主府等级
-define(OPEN_SERVER_TASK_TYPE_2, 102).	%% 英雄技能等级
-define(OPEN_SERVER_TASK_TYPE_3, 103).	%% 英雄兵阶等级
-define(OPEN_SERVER_TASK_TYPE_4, 104).	%% 巅峰竞技排名
-define(OPEN_SERVER_TASK_TYPE_5, 105).	%% 战功排名
-define(OPEN_SERVER_TASK_TYPE_6, 106).	%% 研究心树消耗银两排名



-record(task_info,{
	id = 0,				%% 任务Id
	type = 0,			%% 任务类型
	sub_type = 0,		%% 任务子类型
	status = 0,			%% 任务状态
	cond_type = 0,      %% 条件类型
	cond_id = 0,		%% 具体到某一件事件,如指定某个建筑id升级
	cur_value = 0,		%% 当前进度
	final_value = 0,	%% 最终进度
	reward_id = 0,		%% 奖励id
	grade = 0,			%% 评分
	city_id = 0			%% 城池id
}).

-record(player_task_info,{
	id = 0,							%% 玩家Id
	task_dict = dict:new(),			%% 所有任务,key:任务Id,value:#task_info{}
	listen_task_dict = dict:new(),	%% 监听任务,key:条件类型,value->dict key1:任务Id,value1:#task_info{}
	task_type_detail = dict:new()		%% 各类型任务数据,key:任务大类型,value:对应类型任务的相关数据
									%% 1001 => #chapter_detail{}
									%% 1003 => #achievement_detail{}
									%% 1004 => #government_detail{}
}).

-record(chapter_detail,{
	chapter_id = 0,					%% 章节Id
	draw = 0						%% 奖励状态(0未领取,1已领取)
}).

-record(achievement_detail,{
	is_init = 0
}).

-record(government_detail,{
	next_refresh_tick = 0,
	use_times = 0,
	buy_times = 0,
	free_refresh_times = 0,
	buy_refresh_times = 0,
	is_notify = false,
	delete_status = ?TASK_STATUS_INIT,
	total_time = 0,					%% 完成政务总次数
	nobility_time = 0				%% 爵位保存
}).

-endif.
