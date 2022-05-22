%%--- coding:utf-8 ---
-ifndef('ERRCODE_HRL').
-define('ERRCODE_HRL', true).

%% 后台活动
-define(ERROR_BACK_ACT_NO_ONGOING           	,-9002).		%% 活动未在进行中
-define(ERROR_BACK_ACT_NO_EXIST             	,-9001).		%% 活动不存在

%% 英雄
-define(ERROR_HERO_NOT_EXISTENT             	,-8001).		%% 英雄不存在

%% 运营活动
-define(ERROR_BACKACT_DRAWED                	,-7004).		%% 奖励已领取
-define(ERROR_BACKACT_NO_REWARD             	,-7003).		%% 没有奖励可领取
-define(ERROR_BACKACT_NO_START              	,-7002).		%% 运营活动未开始
-define(ERROR_NO_BACKACT                    	,-7001).		%% 运营活动不存在

%% 好友
-define(ERROR_NO_PLAYER_NAME                	,-6004).		%% 该名字的玩家不存在
-define(ERROR_IN_TARGET_BLACK_FRIEND        	,-6003).		%% 您在对方的黑名单中
-define(ERROR_IS_IN_BLACK_FRIEND            	,-6002).		%% 对方在您的黑名单中
-define(ERROR_IS_IN_FRIEND                  	,-6001).		%% 对方已是您的好友

%% 联盟
-define(ERROR_LEAGUE_LEAVE_WAIT_TICK        	,-5017).		%% 此联盟离开后的等待时间未到
-define(ERROR_LEAGUE_QUIT_WAIT_TICK         	,-5016).		%% 主动退出联盟后的等待时间未到
-define(ERROR_LEAGUE_JOIN_TIMES             	,-5015).		%% 每日可加入联盟次数限制
-define(ERROR_LEAGUE_POSITION_TIMES         	,-5014).		%% 该成员每天可修改职位次数已达上限
-define(ERROR_MAX_LEAGUE_ASSISTANT          	,-5013).		%% 副会长人数已达上限
-define(ERROR_LEAGUE_NOTICE_LEN             	,-5012).		%% 联盟公告长度限制
-define(ERROR_NO_LEAGUE_MEMBER              	,-5011).		%% 成员不在联盟中
-define(ERROR_LEADER_QUIT                   	,-5010).		%% 会长不能退出联盟
-define(ERROR_LEAGUE_APPLY_NULL             	,-5009).		%% 联盟的申请列表为空
-define(ERROR_LEAGUE_POSITION_RIGHT         	,-5008).		%% 所在联盟的职位权限不足
-define(ERROR_LEAUGE_WAIT_APPLY             	,-5007).		%% 您有联盟申请未处理完
-define(ERROR_LEAGUE_FULL                   	,-5006).		%% 联盟人数已满
-define(ERROR_LEAGUE_HAS_APPLY              	,-5005).		%% 您已申请过此联盟
-define(ERROR_LEAGUE_NO_EXISTS              	,-5004).		%% 联盟不存在
-define(ERROR_LEAGUE_NAME_EXISTS            	,-5003).		%% 联盟名字重复
-define(ERROR_HAVE_LEAGUE                   	,-5002).		%% 您已在联盟中
-define(ERROR_LEAGUE_NAME_LEN               	,-5001).		%% 联盟名字过长

%% 邮件
-define(ERROR_MAIL_NO_READ                  	,-4003).		%% 有未读邮件
-define(ERROR_PICKED_MAIL                   	,-4002).		%% 邮件附件已提取
-define(ERROR_NO_MAIL                       	,-4001).		%% 邮件不存在

%% 礼包码
-define(ERROR_GIFT_CODE_USED                	,-3104).		%% 激活码已被使用
-define(ERROR_GIFT_CODE_ALREADY_USED        	,-3103).		%% 已使用过同类型的礼包码
-define(ERROR_GIFT_CODE_INVALID             	,-3102).		%% 无效的礼包码
-define(ERROR_GIFT_CODE_SUCCESS             	,-3101).		%% 兑换成功，请前往邮件领取

%% 背包
-define(ERROR_ITEM_CONF_PACK_TYPE           	,-3019).		%% 道具没有配置背包类型
-define(ERROR_ITEM_NO_EXIST                 	,-3018).		%% 物品不存在
-define(ERROR_OVERLAP_LIMIT                 	,-3017).		%% 物品超出可叠加数量
-define(ERROR_ITEM_CONFIG_NO_EXIST          	,-3016).		%% 道具配置不存在
-define(ERROR_VIP_LVL_LIMIT                 	,-3015).		%% VIP等级不足
-define(ERROR_TODAY_TIME_LIMIT              	,-3014).		%% 本日次数已满
-define(ERR_NO_REWARD_CONF                  	,-3013).		%% 奖励配置不存在
-define(ERR_MONEY_AMOUNT                    	,-3012).		%% 货币数量不足
-define(ERR_AMOUNT_NEGATIVE                 	,-3011).		%% 数量负数
-define(ERR_PACK_AMOUNT                     	,-3010).		%% 道具数量不足
-define(ERR_ITEM_OVERAMOUNT                 	,-3009).		%% 道具的叠加数量未初始化
-define(ERR_ITEM_PACK_CAPACITY              	,-3008).		%% 道具背包容量不足
-define(ERR_PACK_TYPE                       	,-3007).		%% 背包类型错误
-define(ERROR_ITEM_AMOUNT                   	,-3006).		%% 道具数量不足
-define(ERROR_PACK_LEFT_SPACE               	,-3005).		%% 背包空间不足
-define(ERROR_COPPER_AMOUNT                 	,-3004).		%% 铜钱数量不足
-define(ERROR_GOLD_AMOUNT                   	,-3003).		%% 元宝数量不足
-define(ERROR_RES_AMOUNT                    	,-3002).		%% 资源数量不足
-define(ERROR_NO_PACK_TYPE                  	,-3001).		%% 背包类型不存在

%% 星座系统
-define(ERROR_HERO_STAR_BUSY                	,-2901).		%% 英雄忙碌中，无法更换星座道具

%% 活动
-define(ERROR_ACTIVITY_NO_ONGOING           	,-2802).		%% 活动未进行中
-define(ERROR_ACTIVITY_NO_EXIST             	,-2801).		%% 活动不存在

%% 荣耀之巅
-define(ERROR_RANK_NOT_ENOUGH               	,-2701).		%% 巅峰竞技排名不在1024名内，不能报名

%% 混沌傀儡
-define(ERROR_NO_FREE_REFRESH_TIMES         	,-2604).		%% 免费刷新次数不足
-define(ERROR_TODAY_MAX_BUY_TIMES           	,-2603).		%% 今日购买次数已达到上限
-define(ERROR_PUPPET_NO_CHALLENGE           	,-2602).		%% 挑战次数不足
-define(ERROR_PUPPET_NO_FIND                	,-2601).		%% 混沌傀儡不存在,已重新刷新

%% 兵营训练
-define(ERROR_BARRACK_FILL                  	,-2501).		%% 兵营已满,无法训练！

%% 城池拜访
-define(ERROR_CITY_VISITING_ID              	,-2403).		%% 错误的城池拜访
-define(ERROR_HERO_VISITING_SAME            	,-2402).		%% 英雄与拜访英雄一致，不能拜访
-define(ERROR_CITY_VISITING_IN              	,-2401).		%% 该城池英雄拜访中

%% 城池产业
-define(ERROR_CROSS_CITY_INDUSTRY           	,-2308).		%% 需激活跨城占领
-define(ERROR_CITY_INDUSTRY_ASTRICT         	,-2307).		%% 产业已达作业上限
-define(ERROR_HERO_INDUSTRY_ASTRICT         	,-2306).		%% 英雄已达作业上限
-define(ERROR_CITY_INDUSTRY_WORK            	,-2305).		%% 该产业作业中
-define(ERROR_CITY_INDUSTRY_HOLD            	,-2304).		%% 产业已占领
-define(ERROR_CITY_INDUSTRY_WAIVE           	,-2303).		%% 占领产业后，60分钟内不可放弃！
-define(ERROR_CITY_INDUSTRY_NULL            	,-2302).		%% 暂无可领取收益
-define(ERROR_CITY_INDUSTRY_ID              	,-2301).		%% 错误的城池产业

%% 巅峰竞技
-define(ERROR_ARENA_RANK_CHANGE             	,-2201).		%% 排行已刷新

%% 城池建设
-define(ERROR_CITY_BUILDING_IN              	,-2106).		%% 该建筑建设中
-define(ERROR_CITY_BUILDING_HERO            	,-2105).		%% 该英雄忙碌中
-define(ERROR_CITY_BUILDING_TYPE            	,-2104).		%% 错误的建设类型
-define(ERROR_CITY_BUILDING_ID              	,-2103).		%% 错误的建设
-define(ERROR_CITY_BUILDING_UNLOCK          	,-2102).		%% 该城池建设尚未解锁
-define(ERROR_CITY_ID                       	,-2101).		%% 该城池不能建设

%% 聊天
-define(ERROR_AUTHORITY_LIMIT               	,-2008).		%% 权限不足无法发言
-define(ERROR_REMOVE_BOLCK                  	,-2007).		%% 解除屏蔽成功
-define(ERROR_REOMVE_BAN                    	,-2006).		%% 解除禁言成功
-define(ERROR_BLOCK_TRUE                    	,-2005).		%% 屏蔽成功
-define(ERROR_BAN_TRUE                      	,-2004).		%% 禁言成功
-define(ERROR_TARGET_NO_LOGIN_CHAT          	,-2003).		%% 对方聊天未登录
-define(ERROR_NO_CHAT_VOICE                 	,-2002).		%% 语音信息已过期
-define(ERROR_NO_LOGIN_CHAT                 	,-2001).		%% 聊天未登录

%% 爵位系统
-define(ERROR_NOBILITY_FAIL                 	,-1904).		%% 提升爵位失败
-define(ERROR_PRIVILEGE_FAIL                	,-1903).		%% 特权激活失败
-define(ERROR_PRIVILEGE_ID                  	,-1902).		%% 错误的特权请求
-define(ERROR_NOBILITY_ID                   	,-1901).		%% 错误的爵位请求

%% 部队系统
-define(ERROR_TROOPS_BUILDING_LEVEL         	,-1809).		%% 军营等级不足
-define(ERROR_TROOPS_DISSOLVE_ROAD          	,-1808).		%% 无回首都通路
-define(ERROR_TROOPS_CITYOUT                	,-1807).		%% 已经过城池，无法撤回
-define(ERROR_TROOPS_TIMEOUT                	,-1806).		%% 撤回时间已过
-define(ERROR_TROOPS_ERROR                  	,-1805).		%% 部队操作有误
-define(ERROR_NO_TROOPS                     	,-1804).		%% 部队不存在
-define(ERROR_TROOPS_NULL                   	,-1803).		%% 当前城池没有部队
-define(ERROR_BARRACK_DEFICIENCY            	,-1802).		%% 库存不足
-define(ERROR_TROOPS_FULL                   	,-1801).		%% 部队满员

%% 装备系统
-define(ERROR_EQUIP_UNFIX                   	,-1711).		%% 暂时无法卸下装备
-define(ERROR_EQUIP_USE                     	,-1710).		%% 暂时无法穿戴装备
-define(ERROR_SKY_NO_LEVEL                  	,-1709).		%% 天空熔炉等级不足
-define(ERROR_EQUIP_MAKE_CONDITION          	,-1708).		%% 装备制作条件不满足
-define(ERROR_EQUIP_MAKE_FINISH             	,-1707).		%% 装备已制作完成
-define(ERROR_SKY_BUSY                      	,-1706).		%% 天空熔炉忙碌中
-define(ERROR_WASH_PROP_LACK                	,-1705).		%% 装备洗练道具不足
-define(ERROR_BREAK_FAIL                    	,-1704).		%% 装备突破失败
-define(ERROR_BREAK_PROP_LACK               	,-1703).		%% 装备突破道具不足
-define(ERROR_UP_FAIL                       	,-1702).		%% 强化失败
-define(ERROR_UP_PROP_LACK                  	,-1701).		%% 装备强化道具不足

%% 建筑升级
-define(ERROR_NO_FREE                       	,-1602).		%% 建筑不在空闲状态
-define(ERROR_UPGRADE_CONDITIONS            	,-1601).		%% 升级条件不满足

%% 任务 -- 
-define(ERROR_BAD_TASK                      	,-1502).		%% 任务不存在
-define(ERROR_TASK_CITY                     	,-1311).		%% 该城池已被其他势力占领
-define(ERROR_DRAW_CHAPTER_TASK             	,-1310).		%% 存在未完成或未领取的任务
-define(ERROR_MANSION_LEVEL                 	,-1309).		%% 官邸等级不足
-define(ERROR_COUNTRY_TASK                  	,-1308).		%% 国家任务未完成
-define(ERROR_BOUNTY_MISSION                	,-1307).		%% 赏金任务未完成
-define(ERROR_NO_TASK_REFRESH               	,-1306).		%% 任务刷新次数不足
-define(ERROR_NO_TASK_TIMES                 	,-1305).		%% 任务次数不足
-define(ERROR_GOTTEN_REWARD                 	,-1304).		%% 任务已完成
-define(ERROR_NO_STATE                      	,-1303).		%% 任务未完成
-define(ERROR_TASK_NOT_FINISH               	,-1101).		%% 任务未完成或已提交

%% 登录
-define(ERROR_CONFIG_ERROR                  	,-1019).		%% 配置错误
-define(ERROR_ALREADY_LOGIN                 	,-1018).		%% 该账号正在游戏中！
-define(ERROR_INVALID_INDEX                 	,-1017).		%% 索引非法！
-define(ERROR_CLIENT_OPERATOR               	,-1016).		%% 客户端操作有误
-define(ERROR_BAN_LOGIN                     	,-1015).		%% 您已被管理员封禁，请联系客服
-define(ERROR_PLAYER_LOGIN_ERR              	,-1014).		%% 玩家登录报错，请联系客服
-define(ERROR_SERVER_DATA                   	,-1013).		%% 没有玩家数据
-define(ERROR_CONFIG_NOT_EXISTENT           	,-1012).		%% 配置不存在
-define(ERROR_OPERATE_TIMEOUT               	,-1011).		%% 请求操作已超时
-define(ERROR_OPERATE_TOO_FAST              	,-1010).		%% 操作频率太快
-define(ERROR_ROLE_NO_LOGIN_SINGLE          	,-1009).		%% 角色没有在此服中登录
-define(ERROR_INVALID_PARAM                 	,-1008).		%% 消息参数非法
-define(ERROR_ROLE_NOT_EXISTS               	,-1007).		%% 角色不存在
-define(ERROR_ROLE_NAME_EXISTS              	,-1006).		%% 角色名字已存在
-define(ERROR_COUNTRY_LIMIT                 	,-1005).		%% 国家错误
-define(ERROR_NAME_LENGTH                   	,-1004).		%% 玩家名字长度限制
-define(ERROR_SESSION_TIMEOUT               	,-1003).		%% 会话超时
-define(ERROR_SESSION_ILLEGAL               	,-1002).		%% 会话非法
-define(ERROR_ACCOUNT_LENGTH                	,-1001).		%% 帐号长度限制

-endif.