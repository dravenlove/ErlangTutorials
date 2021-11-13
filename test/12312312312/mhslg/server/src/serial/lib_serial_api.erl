%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_serial_api
%%% Created on : 2020/8/13 0013 20:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_serial_api).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("chat.hrl").
-include("mail.hrl").
-include("league.hrl").
-include("ProtoPublic.hrl").

%% API
-export([
	serial_login/2,
	serial_logout/4,
	serial_online/5,
	serial_chat/4,
	serial_money/6,
	serial_item/3,
	serial_level/1,
	serial_exp/4,
	serial_mail/3,
	serial_league/4,
	serial_league/5,
	serial_league/6,
	serial_league/7,
	serial_league/8,
	serial_operate/4,
	serial_operate/5,
	serial_operate/6,
	serial_operate/7,
	serial_operate/8,
	serial_operate/9,
	serial_task/3
]).

%% 登录时写入流水
serial_login(PlayerBase, PlayerBaseOther) ->
	#player_base{
		id = PlayerId,
		account = Account,
		name = Name,
		level = Level,
		login_tick = LoginTick,
		agent_code = AgentCode,
		market = Market,
		server_flag = ServerFlag
	} = PlayerBase,
	#player_base_other{
		ip = ClientIp,
		sys_model = SYS_MODEL,
		sys_version = SYS_VERSION,
		mac = SYS_MAC
	} = PlayerBaseOther,
	Sql = "INSERT INTO `loginout_serial`(`role_id`, `account`, `role_name`, `login_level`, `login_time`, `agent`, `market`, `client_ip`, `sys_model`, `sys_version`, `mac`, `time`, `server_flag`) VALUE (~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, Account, Name, Level, LoginTick, AgentCode, Market, ClientIp, SYS_MODEL, SYS_VERSION, SYS_MAC, lib_timer:unixtime(), ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 登出时更新流水
serial_logout(PlayerId, LoginTick, LogoutTick, Level) ->
	Sql = "UPDATE `loginout_serial` SET `logout_time` = ~ts, `logout_level` = ~ts, `online_time` = ~ts WHERE `role_id` = ~ts AND `login_time` = ~ts",
	OnlineSec = if
					LoginTick > 0 andalso LogoutTick > 0 andalso LogoutTick >= LoginTick ->
						LogoutTick - LoginTick;
					true ->
						0
				end,
	Args = [LogoutTick, Level, OnlineSec, PlayerId, LoginTick],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 在线流水
serial_online(Agent, Market, Users, TotalUsers, Tick) ->
	Sql = "INSERT INTO `online_serial`(`server_flag`, `agent`, `market`, `users`, `total_users`, `time`) VALUE (~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	ServerFlag = config:server_flag(),
	Args = [ServerFlag, Agent, Market, Users, TotalUsers, Tick],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 聊天流水
serial_chat(ChatPlayer, Wcontent, SerialType, SerialSubType) ->
	#chat_player{
		id = PlayerId,
		ip = Ip,
		account = Account,
		show = PlayerShow,
		agent_code = Agent,
		server_flag = ServerFlag,
		market = Market
	} = ChatPlayer,
	#'ProtoShowRole'{
		name = Name,
		level = Level
	} = PlayerShow,
	Sql = "INSERT INTO `chat_serial`(`role_id`, `role_name`,`level`,`account`,`ip`,`serial_type`,`sub_type`,`time`,`content`,`market`,`agent`,`server_flag`)
	VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, Name, Level, Account, Ip, SerialType, SerialSubType, lib_timer:unixtime(), Wcontent, Market, Agent, ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 金钱流水
%% Amount 变化值，没变化填０
%% LeftAmount 变化后剩余值
serial_money(PlayerBase, PlayerBaseOther, SerialObj, MoneyType, Amount, LeftAmount) ->
	%% 支持21位数字，超过bigint的范围，因此使用varchar
	AmountStr = erlang:integer_to_list(Amount),
	LeftAmountStr = erlang:integer_to_list(LeftAmount),
	#player_base{
		id = PlayerId,
		agent_code = AgentCode,
		market = Market,
		server_flag = ServerFlag,
		account = Account,
		name = Name,
		level = Level
	} = PlayerBase,
	#player_base_other{
		ip = Ip,
		device = Device
	} = PlayerBaseOther,
	#serial_obj{
		insert_serial_type = InsertSerialType,
		insert_sub_type = InsertSubSerialType,
		remove_serial_type = RemoveSerialType,
		remove_sub_type = RemoveSubSerialType,
		buy_item_id = BuyItemId,
		buy_item_amount = BuyItemAmount,
		currency_type = CurrencyType,
		currency = Currency
	} = SerialObj,
	{SerialType, SubSerialType} =
		if
			InsertSerialType > 0 -> {InsertSerialType, InsertSubSerialType};
			true -> {RemoveSerialType, RemoveSubSerialType}
		end,
	Sql = "INSERT INTO `money_serial`(`role_id`, `serial_type`, `sub_type`, `agent`, `market`, `money_type`, `money`, `remain_money`, `time`, `buy_item_id`, `buy_item_amount`, `currency_type`, `currency`, `server_flag`, `ip`, `account`, `role_name`, `device`, `role_level`) VALUE (~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, SerialType, SubSerialType, AgentCode, Market,
		MoneyType, AmountStr, LeftAmountStr, lib_timer:unixtime(),
		BuyItemId, BuyItemAmount, CurrencyType, Currency, ServerFlag, Ip, Account, Name, Device, Level],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 道具流水
serial_item(PlayerBase, SerialObj, PackItem) ->
	#player_base{
		id = PlayerId,
		agent_code = AgentCode,
		market = Market,
		server_flag = ServerFlag
	} = PlayerBase,
	#serial_obj{
		insert_serial_type = InsertSerialType,
		insert_sub_type = InsertSubSerialType,
		remove_serial_type = RemoveSerialType,
		remove_sub_type = RemoveSubSerialType,
		use_money_id = UseMoneyId,
		use_money_amount = UseMoneyAmount
	} = SerialObj,
	{SerialType, SubSerialType} =
		if
			InsertSerialType > 0 -> {InsertSerialType, InsertSubSerialType};
			true -> {RemoveSerialType, RemoveSubSerialType}
		end,
	#item{item_id = ItemId, amount = Amount, unique_id = Unique_id} = PackItem,
	Sql = "INSERT INTO `item_serial`(`role_id`, `serial_type`, `sub_type`, `agent`, `market`, `item_id`, `amount`, `unique_id`, `time`, `use_money_id`, `use_money_amount`, `server_flag`) VALUE (~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, SerialType, SubSerialType, AgentCode, Market,
		ItemId, Amount, Unique_id, lib_timer:unixtime(),
		UseMoneyId, UseMoneyAmount, ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 等级流水
serial_level(PlayerBase) ->
	#player_base{
		id = PlayerId,
		agent_code = AgentCode,
		market = Market,
		server_flag = ServerFlag,
		level = Level
	} = PlayerBase,
	Sql = "INSERT INTO `level_serial`(`role_id`, `agent`, `market`, `time`, `level`, `server_flag`) VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, AgentCode, Market, lib_timer:unixtime(), Level, ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 经验流水
serial_exp(PlayerBase, SerialObj, Exp, TotalExp) ->
	#player_base{
		id = PlayerId,
		agent_code = AgentCode,
		market = Market,
		server_flag = ServerFlag,
		level = Level
	} = PlayerBase,
	#serial_obj{insert_serial_type = SerialType, insert_sub_type = SubSerialType} = SerialObj,
	Sql = "INSERT INTO `exp_serial`(`role_id`, `agent`, `market`, `serial_type`, `sub_serial_type`, `time`, `exp`,`total_exp`, `level`, `server_flag`) VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, AgentCode, Market, SerialType, SubSerialType, lib_timer:unixtime(), Exp, TotalExp, Level, ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%% 邮件流水
serial_mail(PlayerBase, SerialType, MailInfo) ->
	#player_base{
		id = PlayerId,
		agent_code = Agent,
		server_flag = ServerFlag,
		market = Market
	} = PlayerBase,
	#mail_info{
		id = UId, mail_type = MailType, mail_font = MailFont, title_args = TitleArgs, args = ContentArgs,
		send_tick = SendTick, sender_id = SenderId, sender_name = SenderName, receive_tick = ReceiveTick,
		receiver_id = ReceiveId, receiver_name = ReceiveName, has_read = HasRead, read_tick = ReadTick,
		has_attach_draw = HasDraw, draw_tick = DrawTick, item_list = ItemList, overtime_tick = Overtime
	} = MailInfo,
	ItemListString = pack_item_list_to_serial_string(ItemList),
	ArgsString = mail_args_to_serial_string(ContentArgs),
	TitleArgsString = mail_args_to_serial_string(TitleArgs),
	Sql = "INSERT INTO `mail_serial`(`role_id`, `serial_type`, `id`, `mail_type`, `mail_font`, `mail_title`, `mail_content`,
	`send_tick`, `sender_id`, `sender_name`, `receive_tick`, `receiver_id`, `receiver_name`,
	`has_read`, `read_tick`, `has_attach_draw`, `draw_tick`, `item_list`, `overtime`,
	`server_flag`, `market`, `agent`, `time`)
	VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, SerialType, UId, MailType, MailFont, TitleArgsString, ArgsString,
		SendTick, SenderId, SenderName, ReceiveTick, ReceiveId, ReceiveName,
		HasRead, ReadTick, HasDraw, DrawTick, ItemListString, Overtime,
		ServerFlag, Market, Agent, lib_timer:unixtime()],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

serial_league(OpPlayerId, League, LeaderName, SerialObj) ->
	serial_league(OpPlayerId, League, LeaderName, SerialObj, 0).
serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1) ->
	serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, 0).
serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, Value2) ->
	serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, Value2, 0).
serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, Value2, Value3) ->
	serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, Value2, Value3, 0).
serial_league(OpPlayerId, League, LeaderName, SerialObj, Value1, Value2, Value3, Value4) ->
	#league{
		id = LeagueId,
		name = LeagueName,
		leader_id = LeaderId,
		server_flag = ServerFlag,
		agent_code = Agent,
		market = Market
	} = League,
	#serial_obj{insert_serial_type = SerialType, insert_sub_type = SubSerialType} = SerialObj,
	Sql = "INSERT INTO `league_serial`(`serial_type`, `sub_serial_type`, `role_id`, `league_id`, `league_name`,`leader_id`, `leader_name`, `time`, `server_flag`, `agent`, `market`, `value1`, `value2`, `value3`, `value4`) VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [SerialType, SubSerialType, OpPlayerId, LeagueId, LeagueName, LeaderId, LeaderName, lib_timer:unixtime(), ServerFlag, Agent, Market, Value1, Value2, Value3, Value4],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

serial_operate(ProtoShowRole, SerialObj, Task, Money) ->
	serial_operate(ProtoShowRole, SerialObj, Task, Money, 0).
serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1) ->
	serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, 0).
serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2) ->
	serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, 0).
serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, Val3) ->
	serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, Val3, 0).
serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, Val3, Val4) ->
	serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, Val3, Val4, 0).
serial_operate(ProtoShowRole, SerialObj, Task, Money, Val1, Val2, Val3, Val4, Val5) ->
	#'ProtoShowRole'{
		id = PlayerId,
		level = Level,
		vip = Vip,
		market = Market,
		agent_code = AgentCode,
		server_flag = ServerFlag
	} = ProtoShowRole,
	#serial_obj{
		insert_serial_type = SerialType
	} = SerialObj,
	Sql = "INSERT INTO `op_serial`(`role_id`, `serial_type`, `level`, `task`, `vip`, `money`, `time`, `market`, `agent`, `server_flag`, `value1`, `value2`, `value3`, `value4`, `value5`) VALUE (~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, SerialType, Level, Task, Vip, Money, lib_timer:unixtime(), Market, AgentCode, ServerFlag, Val1, Val2, Val3, Val4, Val5],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

serial_task(PlayerBase, TaskInfo, SerialType) ->
	#player_base{
		id = PlayerId,
		agent_code = Agent,
		server_flag = ServerFlag,
		market = Market
	} = PlayerBase,
	#task_info{
		id = TaskId,
		type = TaskType,
		status = Status
	} = TaskInfo,
	Sql = "INSERT INTO `task_serial`(`role_id`, `market`, `agent`, `task_id`, `task_type`, `status`, `serial_type`, `time`, `server_flag`) VALUE(~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts, ~ts)",
	Args = [PlayerId, Market, Agent, TaskId, TaskType, Status, SerialType, lib_timer:unixtime(),ServerFlag],
	Sql2 = format_sql(Sql, Args),
	mod_serial:push_serial_sql(Sql2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format_sql(Sql, []) -> Sql;
format_sql(Sql, Args) when is_list(Sql) ->
	Args2 = [mysql_encode:encode(V) || V <- Args],
	lib_common:format_chinese(Sql, Args2);
format_sql(Sql, Args) when is_bitstring(Sql) ->
	format_sql(bitstring_to_list(Sql), Args).

pack_item_list_to_serial_string(PackItemList) ->
	pack_item_list_to_serial_string([], PackItemList).
pack_item_list_to_serial_string(StringList, []) ->
	string:join(StringList, ";");
pack_item_list_to_serial_string(StringList, [PackItem | T]) ->
	String = lib_types:to_list(PackItem#item.item_id) ++ "," ++ lib_types:to_list(PackItem#item.amount),
	pack_item_list_to_serial_string([String | StringList], T).


mail_args_to_serial_string(Args) ->
	mail_args_to_serial_string([], Args).
mail_args_to_serial_string(StringList, []) ->
	string:join(StringList, ";");
mail_args_to_serial_string(StringList, [Arg | T]) ->
	String = lib_types:to_list(lib_mail_api:to_format_chinese_arg(Arg)),
	mail_args_to_serial_string([String | StringList], T).
