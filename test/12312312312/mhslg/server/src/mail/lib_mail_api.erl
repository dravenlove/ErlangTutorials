%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_mail_api.erl
%% Created on : 2019-05-31 11:18:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-31 11:18:00
%% Description: 发送系统邮件的接口
%% 示例：
%% MailInfo = lib_mail_api:create_sys_mail(流水类型),
%% MailInfo1 = lib_mail_api:set_title_content(MailInfo, 邮件配置id, [邮件内容参数列表]),
%% MailInfo2 = lib_mail_api:add_item(MailInfo1, 道具id, 数量),
%% lib_mail_api:send(MailInfo2, 接收者角色id).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_mail_api).
-include("log.hrl").
-include("ets.hrl").
-include("mail.hrl").
-include("player.hrl").
-include("pack.hrl").

-export([
	create_sys_mail/1,
	create_sys_mail/2,
	set_font_id/2,
	set_title_content/3,
	set_title_content/4,
%%	set_title/2,
%%	set_content/3,
%%	set_sender/3,
	send/2,
	send_in_cluster/4,
	add_item/3,
	add_item_list/2,
%%	add_item_by_reward/2,
	fast_send_mail/5,
	fast_send_mail/6,
	test_mail/2,
	format_chinese/2,

	push_mail_args/2,
	push_mail_arg/2,
	push_mail_arg/3,

	push_title_args/2,
	push_title_arg/2,

	to_format_chinese_arg/1
]).

create_sys_mail(SerialType) ->
	#{strvalue:=SenderName} = tb_const:get(system_sender),
	#{value:=Overtime} = tb_const:get(mail_default_overtime),
	#mail_info{
		serial_type = SerialType,
		mail_type = ?MAIL_TYPE_SYSTEM,
		sender_name = binary_to_list(SenderName),
		overtime_tick = lib_timer:unixtime() + Overtime
	}.
create_sys_mail(FontId, SerialType) ->
	MailOffline = create_sys_mail(SerialType),
	MailOffline#mail_info{mail_font = FontId}
.
set_font_id(MailOffline, FontId) ->
	MailOffline#mail_info{mail_font = FontId}
.

set_title_content(MailOffline, FontId, Args) ->
	set_title_content(MailOffline, FontId, Args, []).
set_title_content(MailOffline, FontId, Args, TitleArgs) ->
%%	MailConf = tb_mail:get(FontId),
%%	Title = language:auto(maps:get(title, MailConf, <<""/utf8>>)),
%%	Content = language:auto(maps:get(content, MailConf, <<""/utf8>>)),
%%	Content2 = format_chinese(Content, Args),
%%	#{value:=DefOvertime} = tb_const:get(mail_default_overtime),
%%	Overtime = maps:get(overtime, MailConf, DefOvertime),
%%	RelOvertime = case Overtime =< 0 of true -> DefOvertime; _ -> Overtime end,
%%	SenderName = maps:get(sender_name, MailConf, <<""/utf8>>),
%%	Type = maps:get(type, MailConf, ?MAIL_TYPE_SYSTEM),
%%	NMailOffline = push_mail_args(MailOffline, Args),
%%	NMailOffline#mail_info{sender_name = SenderName, mail_type = Type, mail_font = FontId, mail_title = Title,
%%		mail_content = Content2, overtime_tick = lib_timer:unixtime() + RelOvertime}.
	MailConf = tb_mail:get(FontId),
	#{value:=DefOvertime} = tb_const:get(mail_default_overtime),
	Overtime = maps:get(overtime, MailConf, DefOvertime),
	RelOvertime = case Overtime =< 0 of true -> DefOvertime; _ -> Overtime end,
	NMailOffline = push_mail_args(MailOffline, Args),
	NMailOffline1 = push_title_args(NMailOffline, TitleArgs),
	NMailOffline1#mail_info{mail_font = FontId, overtime_tick = lib_timer:unixtime() + RelOvertime}.

format_chinese(Content, Args) ->
	format_chinese(Content, Args, []).
format_chinese(Content, [], NewArgs) ->
	lib_common:format_chinese(Content, NewArgs);
format_chinese(Content, [Arg | Args], NewArgs) ->
	NewArg = to_format_chinese_arg(Arg),
	format_chinese(Content, Args, NewArgs ++ [NewArg]).
to_format_chinese_arg(#mail_arg{type = ?MAIL_ARG_TYPE_ROLE_BASE} = Arg) ->
	RoleShow = Arg#mail_arg.data,
	RoleShow#player_show.name;
to_format_chinese_arg(#mail_arg{type = ?MAIL_ARG_TYPE_ITEM_OBJ} = Arg) ->
	ItemObj = Arg#mail_arg.data,
	?INFO("~p", [ItemObj]),
	lib_item_api:item_name(ItemObj#item_obj.item_id) ++ "*" ++ lib_types:to_list(ItemObj#item_obj.amount);
to_format_chinese_arg(Arg) when is_record(Arg, mail_arg) ->
	Arg#mail_arg.data;
to_format_chinese_arg(Data) ->
	Data.

%%set_title(MailOffline, Title) ->
%%	MailOffline#mail_info{mail_title = Title}.
%%
%%set_content(MailOffline, Content, Args) ->
%%	Content2 = format_chinese(Content, Args),
%%	MailOffline#mail_info{mail_content = Content2}.
%%
%%set_sender(MailOffline, SenderId, SenderName) ->
%%	MailOffline#mail_info{sender_id = SenderId, sender_name = SenderName}.

send(MailOffline, ReceiverId) ->
	MailId = lib_counter:get_mail_id(),
	NowTick = lib_timer:unixtime(),
	ReceiverName =
		case lib_game_cache:get_player_cache(?ETS_PLAYER_BASE, ReceiverId) of
			#player_base{name = Name} -> Name;
			_ -> ""
		end,
	NewMailOffline = MailOffline#mail_info{id = MailId, receiver_id = ReceiverId, receiver_name = ReceiverName, send_tick = NowTick},
	db_player_mail:save_mail_offline(NewMailOffline),
	NewMailOffline.

%% 在跨服进程中调用的发邮件的接口
%% ServerFlag: 玩家所在的服务器标识
%% ClusterType: 哪个玩法类型发的邮件
send_in_cluster(MailOffline, ReceiverId, ServerFlag, ClusterType) ->
	lib_cluster_send:async_apply_single(ClusterType, ServerFlag, mod_chat, fun lib_mail_api:send/2, [MailOffline, ReceiverId]).

add_item(MailOffline, ItemId, Amount) ->
	ItemList = MailOffline#mail_info.item_list,
	PackItem = #item{item_id = ItemId, amount = Amount},
	MailOffline#mail_info{has_attach_draw = 1, item_list = [PackItem | ItemList]}.

add_item_list(MailOffline, AddItemList) ->
	if
		AddItemList =/= [] ->
			ItemList = MailOffline#mail_info.item_list,
			NewItemList = lists:foldl(
				fun(PackItem, AccItemList0) ->
					[PackItem | AccItemList0]
				end, ItemList, AddItemList),
			MailOffline#mail_info{has_attach_draw = 1, item_list = NewItemList};
		true ->
			MailOffline#mail_info{has_attach_draw = 0, item_list = []}
	end.

%%%% 根据reward id设置邮件的道具附件
%%add_item_by_reward(MailOffline, Reward) ->
%%	case is_list(Reward) of
%%		true -> List = lists:foldl(fun(GroupId, Acc0) ->
%%			List = lib_reward_api:get_good_by_reward(GroupId),
%%			lists:merge(List, Acc0)
%%								   end, [], Reward),
%%			ItemList = lib_player_package_api:merge_same_item(List)
%%		;
%%		false -> ItemList = lib_reward_api:get_good_by_reward(Reward)
%%	end,
%%	add_item_list(MailOffline, ItemList).

%% 快速构建发送邮件
fast_send_mail(ReceiverId, FontId, Args, ItemList, SerialType) ->
	MailOffline = create_sys_mail(SerialType),
	MailOffline1 = set_title_content(MailOffline, FontId, Args),
	MailOffline2 = add_item_list(MailOffline1, ItemList),
	send(MailOffline2, ReceiverId).

%% 快速构建发送邮件
fast_send_mail(ReceiverId, FontId, Args, TitleArgs, ItemList, SerialType) ->
	MailOffline = create_sys_mail(SerialType),
	MailOffline1 = set_title_content(MailOffline, FontId, Args, TitleArgs),
	MailOffline2 = add_item_list(MailOffline1, ItemList),
	send(MailOffline2, ReceiverId).

%% 测试邮件接口
test_mail(Id, MailId) ->
	MailOffline = create_sys_mail(10001),	%% ?ADD_TEST = 10001
	MailOffline1 = set_title_content(MailOffline, MailId, []),
	MailOffline2 = add_item(MailOffline1, 208015101, 1),
	send(MailOffline2, Id).

push_mail_args(MailOffline, []) ->
	MailOffline;
push_mail_args(MailOffline, [Arg | Args]) ->
	NewMailOffline = push_mail_arg(MailOffline, Arg),
	push_mail_args(NewMailOffline, Args).

push_mail_arg(MailOffline, Data) when is_integer(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_INT_NUMBER,
		int_val = Data
	},
	MailOffline#mail_info{
		args = [Arg] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, Data) when is_float(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER,
		double_val = Data
	},
	MailOffline#mail_info{
		args = [Arg] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, Data) when is_list(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_STRING,
		string_val = Data
	},
	MailOffline#mail_info{
		args = [Arg] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_INT_NUMBER, data = Data} = Arg) when is_integer(Data) ->
	Arg1 = Arg#mail_arg{int_val = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER, data = Data} = Arg) when is_float(Data) ->
	Arg1 = Arg#mail_arg{double_val = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_STRING, data = Data} = Arg) when is_list(Data) ->
	Arg1 = Arg#mail_arg{string_val = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_ROLE_BASE, data = Data} = Arg) when is_record(Data, player_show) ->
	Arg1 = Arg#mail_arg{player_show = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_ROLE_BASE, data = Data} = Arg) when is_record(Data, player_base) ->
	Data0 = lib_player:player_show(Data),
	Arg0 = Arg#mail_arg{data = Data0, player_show = Data0},
	MailOffline#mail_info{
		args = [Arg0] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_ITEM_OBJ, data = Data} = Arg) when is_record(Data, item_obj) ->
	Arg1 = Arg#mail_arg{item_obj = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_ITEM_OBJ, data = Data} = Arg) when is_record(Data, item) ->
	Data0 = lib_item_api:pack_item_to_item_obj(Data),
	Arg0 = Arg#mail_arg{data = Data0, item_obj = Data0},
	MailOffline#mail_info{
		args = [Arg0] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_HERO_SKILL_NAME, data = Data} = Arg) when is_integer(Data) ->
	Arg1 = Arg#mail_arg{int_val = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_HERO_NAME, data = Data} = Arg) when is_integer(Data) ->
	Arg1 = Arg#mail_arg{int_val = Data},
	MailOffline#mail_info{
		args = [Arg1] ++ MailOffline#mail_info.args
	};
push_mail_arg(MailOffline, _) ->
	?ERROR("undefined mail arg type"),
	MailOffline.
push_mail_arg(MailOffline, Type, Data) when is_integer(Type) ->
	push_mail_arg(MailOffline, #mail_arg{type = Type, data = Data})
.

push_title_args(MailOffline, []) ->
	MailOffline;
push_title_args(MailOffline, [Arg | Args]) ->
	NewMailOffline = push_title_arg(MailOffline, Arg),
	push_title_args(NewMailOffline, Args).

push_title_arg(MailOffline, Data) when is_integer(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_INT_NUMBER,
		data = Data
	},
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	};
push_title_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_INT_NUMBER, data = Data} = Arg) when is_integer(Data) ->
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	};
push_title_arg(MailOffline, Data) when is_float(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER,
		data = Data
	},
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	};
push_title_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER, data = Data} = Arg) when is_float(Data) ->
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	};
push_title_arg(MailOffline, Data) when is_list(Data) ->
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_STRING,
		data = Data
	},
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	};
push_title_arg(MailOffline, #mail_arg{type = ?MAIL_ARG_TYPE_STRING, data = Data} = Arg) when is_list(Data) ->
	MailOffline#mail_info{
		title_args = [Arg] ++ MailOffline#mail_info.title_args
	}.