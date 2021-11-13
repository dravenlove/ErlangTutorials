%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Dec 2020 4:07 PM
%%%-------------------------------------------------------------------
-author("df").
-define(COUNTRY_YEAR_AWARD_MAIL_ID,			 1003).		%% 邮件


%% 玩家国家仓库信息
-record(player_country_warehouse, {
	id = 0,							%% 玩家id
	country = 0,					%% 国家
	get_red_packet_tick = 0,		%% 上次领取红包时间
	year_annihilation = 0,			%% 年度歼敌数
	year_battle_losses = 0,			%% 年度战损数
	year_construction_value = 0		%% 年度建设值
}).

-record(warehouse_gather, {
	country_warehouse_map = maps:new(), 	%% 国家仓库MAP CountryId => #country_warehouse
	player_info = maps:new()				%% 玩家信息 id => #player_country_warehouse
}).

%% 国家仓库信息
-record(country_warehouse, {
	country_id = 0,							%% 国家
	quarter_income_map = dict:new(),		%% 季度收入
	year_income_map = dict:new(),			%% 年度收入
	recharges_dict = dict:new(),    		%% 国家分红(充值产生),
	player_treasure_box_dict = dict:new()	%% 玩家宝箱信息

}).

-record(resource,{
	id  = 0,				%% 资源id
	num = 0					%% 资源数量
}).

-record(treasure_box,{
	id = 0,			%% 玩家id
	box_level = 0	%5 宝箱等级
}).

%% 分红充值信息
-record(recharge_dividends,{
	id = 0,
	recharge_tick = 0,			%% 充值时间
	name = "",					%% 姓名
	official_position = 0,		%% 官职
	is_chatelain = 0,       	%% 是否是城主 0 否 1 是
	num = 0						%% 红包数量
}).


