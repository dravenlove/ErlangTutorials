%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05 . 11月 2020 16:21
%%%-------------------------------------------------------------------
-author("df").

-define(ONLINE_GIFT_STAGE_ONE, 		1).
-define(ONLINE_GIFT_STAGE_TWO, 		2).
-define(ONLINE_GIFT_STAGE_THREE, 	3).

-define(ONLINE_TIME_STAGE_ONE, 		1800).
-define(ONLINE_TIME_STAGE_TWO, 		3600).
-define(ONLINE_TIME_STAGE_THREE, 	7200).

-define(ONLINE_GIFT_MAIL_ID,		1002).		%% 邮件



%%-record(gift_state, {
%%	gift_id = 0,
%%	start = 0
%%}).

-record(player_online_gift, {
	id = 0,
	today_accumulative_time = 0,	%% 今天累计在线时间
	recharge_state = 0,				%% 充值状态
	online_gift_state = 0,			%% 礼物领取状态 (最近领取的礼包id,全部未领取为0)
	is_receive_all = 0,				%% 是否领取所有
	icon_state = 2					%% 显示图标的状态 1 或 2

}).
