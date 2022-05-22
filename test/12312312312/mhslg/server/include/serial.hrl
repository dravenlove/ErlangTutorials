%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: serial
%%% Created on : 2020/8/11 0011 18:03
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('serial_HRL').
-define('serial_HRL', true).

-record(serial_obj, {
	insert_serial_type = 0,		%% 增加的流水类型,调用auto_insert_item时使用
	insert_sub_type = 0,		%% 增加的流水子类型
	remove_serial_type = 0,		%% 消耗的流水类型,调用auto_remove_item时使用
	remove_sub_type = 0,		%% 消耗的流水子类型
	use_money_id = 0,	%% 获得该道具需要花费的金钱id
	use_money_amount = 0,	%% 获得该道具需要花费的金钱数量
	buy_item_id = 0,	%% 消耗的金钱用于购买的道具id
	buy_item_amount = 0,	%% 消耗的金钱用于购买的道具数量
	currency_type = 0, %% 充值的币种类型
	currency = 0 %% 充值的金额
}).

-define(SERIALDB_POOL, serialdb_pool).
-define(INSERT_SERIAL(TYPE, SUB_TYPE), #serial_obj{insert_serial_type = TYPE, insert_sub_type = SUB_TYPE}).
-define(REMOVE_SERIAL(TYPE, SUB_TYPE), #serial_obj{remove_serial_type = TYPE, remove_sub_type = SUB_TYPE}).

%% 金钱道具增加流水 - 10000
-define(ADD_FROM_BEGIN, 10000).
-define(ADD_TEST, 10001).	%% 测试插入
-define(ADD_MAIL_PICK, 10003).	%% 邮件获得
-define(ADD_RECHARGE, 10004).	%% 后台充值
-define(ADD_BA_CUMULATE_RECHARGE, 10005).	%% 累积充值活动奖励
-define(ADD_BACK_MAIL, 10006).	%% 后台邮件
-define(ADD_CHAPTER_CHALLENGE, 10007). %%沙盘演绎挑战奖励
-define(ADD_CHAPTER_STAR_REWARD, 10008). %%沙盘演绎星级奖励
-define(ADD_CHAPTER_SWEEP, 10009). %%沙盘演绎扫荡奖励
-define(ADD_RESET_HERO_LEVEL, 10010). %%重置英雄等级
-define(ADD_RESET_HERO_STAR, 10011). %%重置英雄星级
-define(ADD_ITEM_OVERDUE_REWARD, 10012). %%过期道具删除奖励
-define(ADD_OPTION_GIFT, 10013).	%% 自选礼包获得
-define(ADD_FIXED_GIFT, 10014).	%% 固定礼包获得
-define(ADD_ONLINE_GIFT, 10015).	%% 在线奖励礼包获得
-define(ADD_WEAK_COUNTRY, 10016).	%% 创角弱势国
-define(ADD_RESET_CORPS_STAGE, 10017). %%重置兵种等阶
-define(ADD_BUILDING_RESOURCE, 10018). %% 内城资源建筑领取道具
-define(ADD_SKILL_LEARNING_RESET, 10019). %%英雄技能学习重置技能
-define(ADD_PUB_RECRUIT, 10020). %% 酒馆招募获得
-define(ADD_COUNTRY_DIVIDENDS, 10021). %% 活动国家分红红包
-define(ADD_COUNTRY_YEAR_AWARD, 10022). %% 国家年度奖励
-define(ADD_COUNTRY_OPEN_ORDER, 10023). %%开启军令
-define(ADD_BUY_RESOURCE, 10024). %% 资源中心购买资源
-define(ADD_COUNTRY_OPEN_MASTER_ORDER, 10025). %%开启城主令
-define(ADD_KING_RECHARGE_REBATE, 10026). %%国王充值返利
-define(ADD_MASTER_TAX_REVENUE, 10027). %%城主税收
-define(ADD_COUNTRY_POS_SALARY, 10028). %%国家官员俸禄
-define(ADD_DISSOLVE_HERO_FRAGMENT,10029).%%分解英雄碎片获得奖励
-define(ADD_EQUIP_BREAK_BACK_PROP, 10030).	%%装备突破失败返还道具
-define(ADD_NOBILITY_ACTIVATION, 10031). %% 爵位提升奖励
-define(ADD_BOUNTY_MISSION, 10032). %% 赏金任务获取奖励
-define(ADD_DUNGEONED_RANK_REWARD, 10033). %%魔塔排行榜奖励
-define(ADD_DUNGEONED_REWARD, 10034). %%魔塔奖励
-define(ADD_SCIENCE_REWARD, 10035). %%心树科技
-define(ADD_CITY_BUILDING, 10036).	%% 城池建设获得奖励
-define(ADD_ARENA_CHALLENGE, 10037). %% 巅峰竞技挑战奖励
-define(ADD_ARENA_FIRST_REWARD, 10038). %% 巅峰竞技首次达到排名
-define(ADD_ARENA_RANK_REWARD, 10039). %% 巅峰竞技排名奖励
-define(ADD_CITY_INDUSTRY, 10040).	%% 城池产业获得奖励
-define(ADD_HERO_BUSY_ONE_KEY, 10041). %% 英雄一键收获奖励
-define(ADD_DRAGON_PALACE_ADVENTURE, 10042). %% 龙殿奇遇探险奖励
-define(ADD_DRAGON_PALACE_ROB, 10043). %% 龙殿奇遇掠夺奖励
-define(ADD_MERITORIOUS_AWARD, 10044). %% 战功奖励
-define(ADD_MERITORIOUS_RANK, 10045). %% 战功排行榜奖励
-define(ADD_ALIEN_REWARD, 10046).	%% 异族征伐宝箱奖励
-define(ADD_CITY_VISITING, 10047).	%% 城池拜访奖励
-define(ADD_HERO_INCIDENT, 10048).	%% 事件奖励
-define(ADD_SHOP_BUY, 10049). %% 商店购买
-define(ADD_EQUIP_MAKE, 10050). %% 装备制作获得
-define(ADD_COUNTRY_TASK, 10051). %% 国家任务获得
-define(ADD_CHALLENGE, 10052). %% 王座之争(擂台赛)获得
-define(ADD_PUPPET_CHALLENGE, 10053). %% 混沌傀儡挑战获得
-define(ADD_TASK_REWARD,10054). %% 完成任务获得
-define(ADD_TASK_MONSTER,10055). %%击杀任务怪物获得
-define(ADD_HONOUR_TOP_RANK,10056). %%荣耀之巅排名奖励
-define(ADD_HONOUR_TOP_BET,10057). %%荣耀之巅押注奖励
-define(ADD_HONOUR_TOP,10058). %%荣耀之巅膜拜奖励
-define(ADD_ACC_RECHARGE, 10059). %%累计充值奖励
-define(ADD_STAR_STOP_ASTROLOGY, 10060). %%星座系统占星获得
-define(ADD_STAR_STOP_RESOLVE, 10061). 	 %%星座系统碎星获得
-define(ADD_HERO_RESET, 10062). %%英雄重置奖励
-define(ADD_HERO_FORMATION_RESET,		10063).	%% 英雄阵法重置
-define(ADD_EQUIP_CORE_LEVEL,			10064).	%% 核心装备失败返还
-define(ADD_EQUIP_RESOLVE,				10065).	%% 装备分解获得
-define(ADD_OPEN_SERVER_RANK_BOX,		10066).	%% 开服冲榜获取
-define(ADD_SEASON_ACTIVITY_AWARD,		10067).	%% 季节活跃活动奖励
-define(ADD_OPEN_SERVER_RANK,			10068).	%% 开服冲榜排行奖励
-define(ADD_WELFARE_EXCHANGE,			10069).	%% 福利兑换奖励
%% 金钱道具减少流水 - 20000
-define(USE_FROM_BEGIN, 20000).
-define(USE_TEST, 20001).	%% 测试删除
-define(USE_LEAGUE_CREATE, 20002).	%% 联盟创建消耗
-define(USE_CHAPTER_BUY, 20003). %%沙盘演绎购买次数
-define(USE_ACTIVE_HERO, 20004). %%激活英雄
-define(USE_HERO_LEVEL_UPGRADE, 20005). %%英雄升级
-define(USE_HERO_STAR_UPGRADE, 20006). %%英雄升星
-define(USE_RESET_HERO_LEVEL, 20007). %%重置英雄等级
-define(USE_RESET_HERO_STAR, 20008). %%重置英雄星级
-define(USE_ITEM_OVERDUE, 20009). %%过期道具删除
-define(USE_ITEM_PLAYER_USE, 20010). %%玩家使用道具消耗
-define(USE_ITEM_RENAME, 20011). %%玩家改名
-define(USE_ITEM_CORPS_STAGE_UPGRADE, 20012). %%英雄兵种升阶
-define(USE_ITEM_CORPS_STAGE_RESET, 20013).	%%重置英雄等阶
-define(USE_BUILDING_UPGRADE, 20014). %%建筑升级消耗道具
-define(USE_BUILDING_ACCELERATE, 20015). %%建筑升级/工作加速消耗道具
-define(USE_PUB_RECRUIT, 20016). %%酒馆招募消耗道具
-define(USE_SKILL_LEARNING_ACTIVE, 20017). 	%%技能学习激活技能
-define(USE_SKILL_LEARNING_UPGRADE, 20018). %%技能学习升级技能
-define(USE_SKILL_LEARNING_RESET,	20019). %%技能学习重置技能
-define(USE_BARRACK_TRAIN, 20020). %%兵营训练消耗
-define(USE_BARRACK_TRAIN_ACCELERATE, 20021). %%兵营训练加速消耗道具
-define(USE_EQUIP_UP_PROP, 20022).	%%装备强化消耗道具
-define(USE_EQUIP_BREAK_PROP, 20023).	%%装备突破消耗道具
-define(USE_EQUIP_WASH_PROP, 20024).	%%装备洗练消耗道具
-define(USE_IMPEACH_KING, 20025). %%弹劾国王
-define(USE_COUNTRY_OPEN_ORDER, 20026). %%开启军令
-define(USE_LOGISTICS_CENTER, 20027). %%资源中心消耗元宝
-define(USE_COUNTRY_OPEN_MASTER, 20028). %%开启城主令
-define(USE_TROOPS_REPAIR, 20029). %%部队元宝补兵
-define(USE__DISSOLVE_HERO_FRAGMENT,20030).%%分解英雄碎片消耗银元
-define(USE_PRIVILEGE_ACTIVATION, 20031). %%爵位激活特权消耗
-define(USE_OPEN_PLACE,20032).				%% 开启圣灵大厅位置消耗
-define(USE_UPGRADE_HOLY_SPIRIT_HALL,20033).%% 升级圣灵大厅消耗
-define(USE_BOUNTY_MISSION, 20034). %% 赏金任务资源消耗
-define(USE_DUNGEONED_BUY_TIMES, 20035). %%魔塔购买次数
-define(USE_SCIENCE_UPGRADE, 20036). %%心树科技学习
-define(USE_SCIENCE_ACCELERATE, 20037). %%心树科技加速
-define(USE_CITY_BUILDING, 20038).	%% 城池建设消耗
-define(USE_ARENA_BUY_TIMES, 20039). %% 巅峰竞技购买挑战次数
-define(USE_CITY_INDUSTRY, 20040).	%% 城池产业消耗
-define(USE_HERO_BUSY_QUICKEN, 20041). %% 英雄忙碌加速
-define(USE_DRAGON_PALACE_ROB, 20042). %% 龙殿奇遇刷新掠夺对象消耗
-define(USE_DRAGON_PALACE_ASTROLOGY, 20043). %% 龙殿奇遇占星消耗
-define(USE_CITY_VISITING, 20044). %% 城池拜访消耗
-define(USE_SHOP_BUY, 20045). %% 商店购买
-define(USE_SHOP_REFRESH, 20046). %% 商店刷新
-define(USE_EQUIP_MAKE, 20047). %% 装备制作消耗
-define(USE_AWAKEN_HERO, 20048). %% 觉醒英雄消耗
-define(USE_TROOPS_MARCH, 20048). %% 行军消耗
-define(USE_CHALLENGE_BUY, 20049). %% 王座之争购买
-define(USE_PUPPET_REFRESH, 20050). %% 混沌傀儡刷新消耗
-define(USE_PUPPET_LOCK, 20051).	%% 混沌傀儡锁定消耗
-define(USE_PUPPET_BUY_TIMES,20052). %% 混沌傀儡购买次数
-define(USE_HERO_CROPS_STUDY,20053). %% 英雄兵种研究/突破消耗
-define(USE_HERO_CROPS_STUDY_REMEDY,20054). %% 英雄兵种研究/突破补救消耗
-define(USE_TASK_DONATE, 20055).		%% 任务捐赠消耗
-define(USE_TASK_BUY_TIMES, 20056).		%% 任务购买次数消耗
-define(USE_TASK_REFRESH, 20057).		%% 任务刷新消耗
-define(USE_TASK_GRADE, 20058).			%% 任务提升评级消耗
-define(USE_TASK_SUBMIT, 20059).		%% 任务提交消耗
-define(USE_STAR_STOP_ASTROLOGY, 20060). %% 星座系统占星消耗
-define(USE_STAR_STOP_RESOLVE, 20061).	 %% 星座系统碎星消耗
-define(USE_STAR_ITEM_UPGRADE, 20062).	 %% 星座系统宝物升级消耗
-define(USE_HERO_RESET, 20063).			%% 英雄重置
-define(USE_HERO_FORMATION_LEVEL,		20064).	%% 英雄阵法升级
-define(USE_HERO_FORMATION_STAGE,		20065).	%% 英雄阵法升阶
-define(USE_HERO_FORMATION_RESET,		20066).	%% 英雄阵法重置
-define(USE_EQUIP_CORE_LEVEL,			20067).	%% 核心装备升级
-define(USE_EQUIP_RESOLVE,				20068).	%% 装备分解
-define(USE_SEASON_ACTIVITY,		20069).	%% 季节活跃活动消耗
-define(USE_WELFARE_EXCHANGE,		20070).	%% 福利兑换钻石消耗
%% 经验流水 - 30000


%% 邮件流水 - 40000
-define(SERIAL_MAIL_RECEIVE, 40000).				%% 未读邮件
-define(SERIAL_MAIL_PLAYER_DELETE, 40001).			%% 玩家手动删除邮件
-define(SERIAL_MAIL_SYS_LIMIT_DELETE, 40002).		%% 达到邮件上限系统自动删除
-define(SERIAL_MAIL_SYS_TIME_DELETE, 40003).		%% 达到过期时间系统自动删除
-define(SERIAL_MAIL_READ, 40004).					%% 读取邮件
-define(SERIAL_MAIL_PICKUP, 40005).					%% 提取附件

%% 联盟流水 - 50000
-define(SERIAL_LEAGUE_BEGIN, 50000).		%% 联盟流水
-define(SERIAL_LEAGUE_CREATE, 50001).		%% 创建
-define(SERIAL_LEAGUE_APPLY, 50002).		%% 申请加入
-define(SERIAL_LEAGUE_JOIN, 50003).			%% 审核加入, value1: 加入的玩家id
-define(SERIAL_LEAGUE_REJECT_JOIN, 50004).	%% 审核拒绝, value1: 拒绝的玩家id, 0 表示拒绝所有
-define(SERIAL_LEAGUE_QUIT, 50005).			%% 主动退出联盟
-define(SERIAL_LEAGUE_KICK, 50006).			%% 被逐出联盟, value1: 被逐出的玩家id
-define(SERIAL_LEAGUE_DISMISS, 50007).		%% 解散
-define(SERIAL_LEAGUE_POSITION, 50008).		%% 职位变化, value1:职位变化的玩家id, value2:新的职位, value3: 旧的职位
-define(SERIAL_LEAGUE_LEADER, 50009).		%% 转让会长, value1:新会长id
-define(SERIAL_LEAGUE_NOTICE, 50010).		%% 修改公告

%% 任务流水 - 60000
-define(SERIAL_TASK_ACCEPT,		60001).		%% 接受任务
-define(SERIAL_TASK_SUBMIT,     60002).		%% 提交任务
-define(SERIAL_TASK_ABANDON,	60003).		%% 放弃任务

-define(SERIAL_ACCEPT_TASK, 50000).		%% 接受任务
-define(SERIAL_SUBMIT_TASK, 50001).		%% 提交任务
-define(ADD_ITEM_TASK, 50002).	%% 任务获得
-define(SERIAL_DAILY_TASK_REWARD,50003). %%每日任务获得

%% 玩法操作流水记录 - 600000000 + 玩法类型 * 10000 + 玩法操作类型
-define(SERIAL_OP_BEGIN, 600000000).
-define(SERIAL_OP_LEAGUE_CREATE, 600010001).		%% 联盟创建, value1: 联盟id
-define(SERIAL_OP_LEAGUE_APPLY, 600010002).			%% 联盟申请, value1: 联盟id, value2: 当时的盟主id, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_JOIN, 600010003).			%% 联盟加入, value1: 联盟id, value2: 加入的成员id, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_REJECT_JOIN, 600010004).	%% 联盟拒绝加入, value1: 联盟id, value2: 拒绝的成员id, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_QUIT, 600010005).			%% 主动退出联盟, value1: 联盟id, value2: 0, value3: 职位, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_KICK, 600010006).			%% 逐出联盟, value1: 联盟id,  value2: 逐出的成员id, value3: 职位, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_DISMISS, 600010007).		%% 解散联盟, value1: 联盟id, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_POSITION, 600010008).		%% 职位变化, value1: 联盟id, value2: 变化的玩家id, value3: 新职位, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_LEADER, 600010009).		%% 转让会长, value1: 联盟id, value2: 新盟主id, value4: 等级, value5: 人数
-define(SERIAL_OP_LEAGUE_NOTICE, 600010010).		%% 修改公告, value1: 联盟id, value4: 等级, value5: 人数

-endif.
