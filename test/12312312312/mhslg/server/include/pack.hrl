%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: item.hrl
%% Created on : 2019-05-22 15:17:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-22 15:17:00
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('pack_HRL').
-define('pack_HRL', true).
-include("ProtoPublic.hrl").
-include("equip.hrl").
-include("honor_title.hrl").
-include("star.hrl").
-include("recharge.hrl").

%% 调用操作背包接口成功返回宏(其他返回皆表示操作失败，操作失败通常返回错误码)
%% 验证一类接口返回此宏表示验证通过，不通过则返回错误码
-define(PACK_SUCCESS, true).
%% 调用背包接口时：成功通过 失败抛错误码
-define(PACK_IS_SUCCESS(Ret), case Ret =:= ?PACK_SUCCESS of false -> throw({error, Ret}); _ -> skip end).


%% 客户端获得道具表现类型
-define(PACK_TIPS0, 0).		%% 不表现
-define(PACK_TIPS1, 1).		%% 普通获得表现

%%物品类型
-define(ITEM_MAIN_TYPE_MONEY,	101).          	%%货币
-define(ITEM_MAIN_TYPE_COMMON,	102).          	%%普通
-define(ITEM_MAIN_TYPE_FIXED,	103).			%%礼包--固定
-define(ITEM_MAIN_TYPE_RANDOM,	104).			%%礼包--随机
-define(ITEM_MAIN_TYPE_HYBRID,	105).			%%礼包--混合
-define(ITEM_MAIN_TYPE_OPTION,	106).			%%礼包--自选
-define(ITEM_MAIN_TYPE_TITLE, 	108).			%%称号

%% 常用货币道具id
-define(GOLD_ID,		maps:get(value, tb_const:get(gold))			).	%% 元宝
-define(MONEY_ID,		maps:get(value, tb_const:get(money))		).	%% 银两
-define(PROVISIONS_ID,	maps:get(value, tb_const:get(provisions))	).	%% 粮草
-define(WOOD_ID,		maps:get(value, tb_const:get(wood))			).	%% 木材
-define(IRON_ID,		maps:get(value, tb_const:get(iron))			).	%% 生铁
-define(FEAT_ID,		maps:get(value, tb_const:get(feat))			).	%% 功勋


-define(ITEM_TIME_LIMIT_TYPE0, 0).  %% 不是限时道具
-define(ITEM_TIME_LIMIT_TYPE1, 1).  %% 从获得道具时起计算，有效期XX分钟
-define(ITEM_TIME_LIMIT_TYPE2, 2).  %% 指定某个具体时间节点，该节点后为失效
-define(ITEM_BIND_NONE, 0).			%% 不绑定
-define(ITEM_BIND, 1).				%% 绑定
-define(ITEM_OVERLAP_DEFAULT, 100).     %% 默认叠加数量
-define(REMOVE_PRIORITY_BIND, 0).		%%优先删除绑定
-define(REMOVE_BY_BIND, 1).				%%区分绑定状态删除绑定

-define(ITEM_ID_GOLD,           101001001).		%% 充值的元宝
-define(ITEM_ID_SYSTEM_GOLD,    101001002).		%% 系统赠送的元宝

-define(ITEM_OVERDUE_MAIL_ID,           1001).		%% 邮件

%% 背包类型 [注意]新加的类型不能把已有的背包类型顺序打乱，防止新旧数据不兼容
-define(PACK_TYPE_NUMBER, 			1).	%% 身上数值类: 如货币，铜钱等
-define(PACK_TYPE_COMMON, 			2).	%% 普通道具
-define(PACK_TYPE_EQUIP,			5).	%% 装备
-define(PACK_TYPE_TITLE,			6).	%% 称号 / 其他类（星座：策划配的）

-define(ITEM_OBJ(ID, AMOUNT), #item_obj{item_id = ID, amount = AMOUNT}).
-define(ITEM_OBJ(ID, AMOUNT, EFFECT), #item_obj{item_id = ID, amount = AMOUNT, effect = EFFECT}).
-define(ITEM_OBJ(ID, AMOUNT, EFFECT, FLAG), #item_obj{item_id = ID, amount = AMOUNT, effect = EFFECT, flag = FLAG}).

-define(PROTO_ITEM_OBJ(ID, AMOUNT), #'ProtoItemObj'{item_id = ID, amount = AMOUNT}).
-define(PROTO_ITEM_OBJ(ID, AMOUNT, EFFECT), #'ProtoItemObj'{item_id = ID, amount = AMOUNT, effect = EFFECT}).
-define(PROTO_ITEM_OBJ(ID, AMOUNT, EFFECT, FLAG), #'ProtoItemObj'{item_id = ID, amount = AMOUNT, effect = EFFECT, flag = FLAG}).

-record(player_package, {
	id = 0, 		 	    %% 所属玩家ID
	dict = dict:new()		%% key: pack_type, value: #package{}
}).

-record(package, {
	package_type = 0, 		%% 背包类型
	max_size = 0,			%% 当前背包最大容量
	dict = dict:new(),		%% key: unique_id, value: #pack_item{}
	%%key_dict = dict:new(),  %% key: item_id, value: [unique_id] 包含某个道具的unique_id列表   TODO
	insert_result = [],
	remove_result = [],
	pack_unique_id = 0,
	rend
}).

-record(item, {
	unique_id = 0,	%% 唯一id
	equip_info = #equip_info{},	%%装备信息
	item_id = 0,	%% 道具id
	amount = 0,		%% 数量
	bind = 0,		%% 道具绑定状态,0 不绑定, 1绑定
	item_index = 0, %%
	opt_tick = 0,	%% 获得/操作时间
	overdue = 0,    %% 过期时间
	notify_overdue = false,    %% 过期通知
	remove_tick = 0,%% 删除时间
	honor_title = #honor_title{},
	star_info = #star_info{},		%% 星座信息
	rend
}).

-record(item_obj, {
	item_id = 0,	%% 道具id
	amount = 0,		%% 数量
	effect = 0,		%% 特效
	flag = 0		%% FLAG
}).



-record(player_money, {		%% 玩家身上资源信息
	id = 0,		%% 玩家id
	money_map = #{},		%%
	total_recharge_money = 0.0,				%% 总充值金额
	total_recharge_gold = 0,				%% 总充值元宝
	recharge_map = maps:new(),				%% 某个充值档次已充值次数
	have_first = 0,
	get_first = 0
}).

-endif.