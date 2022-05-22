%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 15:12
%%%-------------------------------------------------------------------
-author("13661").

-define(CONDITION_ID_002,		  2).	%% 沙盘演绎
-define(CONDITION_ID_101,		101).	%% 英雄列表界面
-define(CONDITION_ID_102,		102).	%% 英雄升级界面
-define(CONDITION_ID_103,		103).	%% 英雄前军兵种升级
-define(CONDITION_ID_104,		104).	%% 英雄后军兵种升级
-define(CONDITION_ID_105,		105).	%% 英雄升星
-define(CONDITION_ID_106,		106).	%% 英雄技能
-define(CONDITION_ID_107,		107).	%% 英雄分解
-define(CONDITION_ID_108,		108).	%% 爵位
-define(CONDITION_ID_109,		109).	%% 城池建设
-define(CONDITION_ID_110,		110).	%% 心树系统
-define(CONDITION_ID_111,		111).	%% 自动训练
-define(CONDITION_ID_112,		112).	%% 酒馆招募
-define(CONDITION_ID_113,		113).	%% 后勤中心
-define(CONDITION_ID_114,		114).	%% 城池产业
-define(CONDITION_ID_115,		115).	%% 世界频道发言
-define(CONDITION_ID_116,		116).	%% 势力频道发言
-define(CONDITION_ID_117,		117).	%% 栋梁频道发言
-define(CONDITION_ID_118,		118).	%% 跨服聊天开启
-define(CONDITION_ID_119,		119).	%% 全服排行
-define(CONDITION_ID_120,		120).	%% 势力排行
-define(CONDITION_ID_121,		121).	%% 异族征讨
-define(CONDITION_ID_122,		122).	%% 国家仓库
-define(CONDITION_ID_123,		123).	%% 国家官职
-define(CONDITION_ID_124,		124).	%% 国家任务
-define(CONDITION_ID_125,		125).	%% 赏金任务
-define(CONDITION_ID_126,		126).	%% 英雄忙碌管理
-define(CONDITION_ID_127,		127).	%% 城池拜访
-define(CONDITION_ID_128,		128).	%% 装备突破
-define(CONDITION_ID_129,		129).	%% 装备洗练
-define(CONDITION_ID_130,		130).	%% 装备强化
-define(CONDITION_ID_131,		131).	%% 英雄助战
-define(CONDITION_ID_132,		132).	%% 势力互助
-define(CONDITION_ID_133,		133).	%% 英雄属性
-define(CONDITION_ID_134,		134).	%% 英雄命运
-define(CONDITION_ID_135,		135).	%% 英雄宝物
-define(CONDITION_ID_136,		136).	%% 星辰系统

-define(CONDITION_ID_139,		139).	%% 政务任务
-define(CONDITION_ID_140,		140).	%% 日常任务

-define(CONDITION_ID_155,		155).	%% 春色远游
-define(CONDITION_ID_156,		156).	%% 夏日篝火
-define(CONDITION_ID_157,		157).	%% 秋收驱盗
-define(CONDITION_ID_158,		158).	%% 冬季问答


-define(CONDITION_ID_159,		159).	%% 比武大会

-define(CONDITION_ID_160,		160).	%% 福利兑换

-define(CONDITION_ID_161,		161). %% 档案馆


-define(CONDITION_TYPE_ORELSE,	1). %%满足一个条件开启
-define(CONDITION_TYPE_ANDALSO,	2).	%%满足所有条件开启
-define(CONDITION_TYPE_OPEN,	3).	%%无条件开启
-define(CONDITION_TYPE_CLOSE,	4).	%%无条件关闭

-record(function,{
	function_id = 0,
	 function_is_open = false
}).

-record(player_function_open,{
	id = 0,
	function_dict = dict:new()
}).