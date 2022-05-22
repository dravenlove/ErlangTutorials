%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_mail
%%% Created on : 2020/8/14 0014 11:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_mail).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("ProtoClient_10104.hrl").

%% API
-export([
	put_player_mail/2,
	get_player_mail/0,
	ets_init/0,
	build_index/0,
	player_mail_handler/0,
	check_receive_mail/0,
	check_remove_expire_mail/0,
	request_mail_list/0,
	request_single_mail/1,
	request_pick_mail/1,
	request_del_mail/1
]).

-export([
	test_mail_command/4
]).

put_player_mail(PlayerMail, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_MAIL),
	erlang:put(?ETS_PLAYER_MAIL, PlayerMail).

get_player_mail() ->
	erlang:get(?ETS_PLAYER_MAIL).

ets_init() ->
	ets:new(?ETS_PLAYER_MAIL, [?ETS_KEY_POS(#player_mail.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_MAIL, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_MAIL, {?TUPLE_INT(<<"overtime_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBMAILOFFLINE, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBMAILOFFLINE, {?TUPLE_INT(<<"receiver_id">>, 1), ?TUPLE_INT(<<"send_tick">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_MAIL, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_MAIL, {?TUPLE_INT(<<"read">>, 1)}, false),
	ok.

player_mail_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_MAIL,
		table_name = ?DBPLAYER_MAIL,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_mail:ets_init/0,
		mongo_index_func = fun lib_player_mail:build_index/0,
		load_func = fun db_player_mail:load_player_mail/1,
		save_func = fun db_player_mail:save_player_mail/1,
		get_func = fun lib_player_mail:get_player_mail/0,
		put_func = fun lib_player_mail:put_player_mail/2
	}.

%% 定时检查收取邮件
check_receive_mail() ->
	PlayerId = lib_player:player_id(),
	SendTick = lib_timer:unixtime(),
	MailList = db_player_mail:load_mail_offline(PlayerId, SendTick),
	#player_mail{
		mail_map = MailMap
	} = PlayerMail = get_player_mail(),
	PlayerBase = lib_player:get_player_base(),
	{NewMailMap, NewMailIdList} = receive_mail_list(MailMap, [], PlayerBase, MailList),
	case length(NewMailIdList) > 0 of
		true ->
			put_player_mail(PlayerMail#player_mail{
				mail_map = NewMailMap
			}, true),
			Respond = #'Proto80104001'{
				mail_id_list = NewMailIdList
			},
			lib_send:respond_to_client(Respond);
		_ -> skip
	end,
	ok.

%% 删除失效的邮件
check_remove_expire_mail() ->
	#player_mail{
		mail_map = MailMap
	} = PlayerMail = get_player_mail(),
	PlayerBase = lib_player:get_player_base(),
	NowTick = lib_timer:unixtime(),
	NewMailMap = maps:fold(
		fun(MailId, MailInfo, AccMailMap0) ->
			if
				MailInfo#mail_info.overtime_tick =< NowTick ->
					lib_serial_api:serial_mail(PlayerBase, ?SERIAL_MAIL_SYS_TIME_DELETE, MailInfo),
					maps:remove(MailId, AccMailMap0);
				true -> AccMailMap0
			end
		end, MailMap, MailMap),
	case maps:size(MailMap) =/= maps:size(NewMailMap) of
		true ->
			put_player_mail(PlayerMail#player_mail{
				mail_map = NewMailMap
			}, true);
		_ -> skip
	end,
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端请求接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 邮件列表
request_mail_list() ->
	#player_mail{
		id = PlayerId,
		mail_map = MailMap
	} = get_player_mail(),
	ProtoMailList = serialize_mail_list(MailMap),
	Respond = #'Proto50104002'{
		mail_list = ProtoMailList
	},
	?DEBUG("mail list: ~p ~w", [PlayerId, Respond]),
	lib_send:respond_to_client(Respond).

%% 单个邮件的详细信息
request_single_mail(Msg) ->
	#'Proto10104003'{mail_id = MailId} = Msg,
	MailInfo = find_mail(MailId),
	?JUDGE_RETURN(MailInfo =/= undefined, ?ERROR_NO_MAIL),
	NewMailInfo = MailInfo#mail_info{has_read = 1},
	if
		MailInfo#mail_info.has_read =:= 0 ->
			update_mail(NewMailInfo#mail_info{read_tick = lib_timer:unixtime()}),
			lib_serial_api:serial_mail(lib_player:get_player_base(), ?SERIAL_MAIL_READ, NewMailInfo);
		true -> skip
	end,
	Respond = #'Proto50104003'{
		mail_info = serialize_proto_mail(NewMailInfo)
	},
	?DEBUG("single mail info: ~w", [Respond]),
	lib_send:respond_to_client(Respond).

%% 提取附件
request_pick_mail(Msg) ->
	#'Proto10104004'{mail_id = MailId} = Msg,
	if
		MailId > 0 ->
			pick_single_mail(MailId);
		true ->
			#player_mail{
				mail_map = MailMap
			} = get_player_mail(),
			pick_all_mail(maps:to_list(MailMap))
	end,
	lib_send:respond_to_client(?MSG_RETURN_PICK_MAIL).

%% 删除邮件
request_del_mail(Msg) ->
	#'Proto10104005'{mail_id_list = MailIdList} = Msg,
	?INFO("~p~n", [MailIdList]),
	#player_mail{
		mail_map = MailMap
	} = PlayerMail = get_player_mail(),
	{NewMailMap, DelIdList} = delete_mail(MailMap, [], MailIdList),
	put_player_mail(PlayerMail#player_mail{
		mail_map = NewMailMap
	}, true),
	Respond = #'Proto50104005'{
		mail_id_list = DelIdList
	},
	?INFO("~p~n", [DelIdList]),
	lib_send:respond_to_client(Respond).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
receive_mail_list(MailMap, MailIdList, _PlayerBase, []) ->
	{MailMap, MailIdList};
receive_mail_list(MailMap, MailIdList, PlayerBase, [MailInfo | T]) ->
	case maps:is_key(MailInfo#mail_info.id, MailMap) of
		false ->
			MailMap1 = check_mail_map_size(MailMap),
			NewMailMap = maps:put(MailInfo#mail_info.id, MailInfo#mail_info{receiver_name = PlayerBase#player_base.name}, MailMap1),
			NewMailIdList = [MailInfo#mail_info.id | MailIdList],
			?INFO("receive mail: ~p ~ts ~p ~ts", [PlayerBase#player_base.id, PlayerBase#player_base.name, MailInfo#mail_info.id, MailInfo#mail_info.mail_title]),
			lib_serial_api:serial_mail(PlayerBase, ?SERIAL_MAIL_RECEIVE, MailInfo),
			receive_mail_list(NewMailMap, NewMailIdList, PlayerBase, T);
		_ ->
			receive_mail_list(MailMap, MailIdList, PlayerBase, T)
	end.

check_mail_map_size(MailMap) ->
	#{value := MaxSize} = tb_const:get(mail_max_size),
	case maps:size(MailMap) < MaxSize - 1 of
		true ->
			MailMap;
		_ ->
			[{MailId, _MailInfo} | _] = lists:sort(fun mail_sort/2, maps:to_list(MailMap)),
			{NewMailMap, _} = delete_mail(MailMap, [], [MailId]),
			NewMailMap
	end.

mail_sort(L, R) ->
	{_LMailId, LMailInfo} = L,
	{_RMailId, RMailInfo} = R,
	try
		case LMailInfo#mail_info.has_attach_draw =:= RMailInfo#mail_info.has_attach_draw of
			true ->
				case LMailInfo#mail_info.has_read =:= RMailInfo#mail_info.has_read of
					true ->
						case LMailInfo#mail_info.item_list =:= [] orelse RMailInfo#mail_info.item_list =:= [] of
							true ->
								LMailInfo#mail_info.item_list =:= [];
							_ ->
								LMailInfo#mail_info.receive_tick < RMailInfo#mail_info.receive_tick
						end;
					_ ->
						LMailInfo#mail_info.has_read > RMailInfo#mail_info.has_read
				end;
			_ ->
				LMailInfo#mail_info.has_attach_draw < RMailInfo#mail_info.has_attach_draw
		end
	catch
		throw:{error, Flag} -> Flag
	end.

serialize_mail_list(MailMap) ->
	maps:fold(
		fun(_, MailInfo, AccProtoMailList) ->
			Proto = serialize_proto_mail(MailInfo),
			[Proto | AccProtoMailList]
		end, [], MailMap).

serialize_proto_mail(MailInfo) ->
	#'ProtoMail'{
		mail_id = MailInfo#mail_info.id,
		mail_font = MailInfo#mail_info.mail_font,
		mail_type = MailInfo#mail_info.mail_type,
		title = MailInfo#mail_info.mail_title,
		content = MailInfo#mail_info.mail_content,
		send_tick = MailInfo#mail_info.send_tick,
		sender_id = MailInfo#mail_info.sender_id,
		sender_name = MailInfo#mail_info.sender_name,
		overtime_tick = MailInfo#mail_info.overtime_tick,
		has_read = MailInfo#mail_info.has_read,
		has_attach = MailInfo#mail_info.has_attach_draw,
		item_list = [lib_item_api:serialize_proto_item(Item) || Item <- MailInfo#mail_info.item_list],
		args = serialize_proto_mail_args(MailInfo#mail_info.args),
		title_args = serialize_proto_mail_args(MailInfo#mail_info.title_args)
	}.

serialize_proto_mail_args(Args) ->
	lists:foldr(fun(Arg, Acc) ->
		[serialize_proto_mail_arg(Arg) | Acc]
	end, [], Args).
serialize_proto_mail_arg(Arg) when is_record(Arg, mail_arg) ->
	#'ProtoMailArg'{
		type = Arg#mail_arg.type,
		int_number = Arg#mail_arg.int_val,
		double_number = Arg#mail_arg.double_val,
		str = Arg#mail_arg.string_val,
		role = lib_common:player_show_to_proto(Arg#mail_arg.player_show),
		item = lib_item_api:item_obj_to_proto_obj(Arg#mail_arg.item_obj)
	}
.
% serialize_proto_mail_arg(#mail_arg{type = ?MAIL_ARG_TYPE_INT_NUMBER} = Arg) ->
% 	#'ProtoMailArg'{
% 		type = Arg#mail_arg.type,
% 		int_number = Arg#mail_arg.data
% 	};
% serialize_proto_mail_arg(#mail_arg{type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER} = Arg) ->
% 	#'ProtoMailArg'{
% 		type = Arg#mail_arg.type,
% 		double_number = Arg#mail_arg.data
% 	};
% serialize_proto_mail_arg(#mail_arg{type = ?MAIL_ARG_TYPE_STRING} = Arg) ->
% 	#'ProtoMailArg'{
% 		type = Arg#mail_arg.type,
% 		str = Arg#mail_arg.data
% 	};
% serialize_proto_mail_arg(#mail_arg{type = ?MAIL_ARG_TYPE_ROLE_BASE} = Arg) ->
% 	#'ProtoMailArg'{
% 		type = Arg#mail_arg.type,
% 		role = lib_common:player_show_to_proto(Arg#mail_arg.data)
% 	};
% serialize_proto_mail_arg(#mail_arg{type = ?MAIL_ARG_TYPE_ITEM_OBJ} = Arg) ->
% 	#'ProtoMailArg'{
% 		type = Arg#mail_arg.type,
% 		item = lib_item_api:item_obj_to_proto_obj(Arg#mail_arg.data)
% 	}.


find_mail(MailId) ->
	#player_mail{
		mail_map = MailMap
	} = get_player_mail(),
	maps:get(MailId, MailMap, undefined).

update_mail(MailInfo) ->
	MailId = MailInfo#mail_info.id,
	#player_mail{
		mail_map = MailMap
	} = PlayerMail = get_player_mail(),
	put_player_mail(PlayerMail#player_mail{
		mail_map = maps:put(MailId, MailInfo, MailMap)
	}, true).

pick_single_mail(MailId) ->
	MailInfo = find_mail(MailId),
	pick_single_mail(MailId, MailInfo).
pick_single_mail(_MailId, MailInfo) ->
	?JUDGE_RETURN(MailInfo =/= undefined, ?ERROR_NO_MAIL),
	?JUDGE_RETURN(MailInfo#mail_info.has_attach_draw =:= 1, ?ERROR_PICKED_MAIL),
	NowTick = lib_timer:unixtime(),
	?JUDGE_RETURN(MailInfo#mail_info.overtime_tick >= NowTick, ?ERROR_NO_MAIL),
	SerialType =
		if
			MailInfo#mail_info.serial_type > 0 -> MailInfo#mail_info.serial_type;
			true -> ?ADD_MAIL_PICK
		end,
	Ret = lib_player_pack:validate_insert(MailInfo#mail_info.item_list),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_insert(MailInfo#mail_info.item_list, #serial_obj{insert_serial_type = SerialType}, true, ?PACK_TIPS1),
	NewMailInfo = MailInfo#mail_info{has_read = 1, has_attach_draw = 0, draw_tick = NowTick},
	update_mail(NewMailInfo),
	lib_serial_api:serial_mail(lib_player:get_player_base(), ?SERIAL_MAIL_PICKUP, NewMailInfo).

pick_all_mail([]) ->
	ok;
pick_all_mail([{_MailId, MailInfo} | T]) ->
	case MailInfo#mail_info.has_attach_draw =:= 1 andalso length(MailInfo#mail_info.item_list) > 0
		andalso MailInfo#mail_info.overtime_tick > lib_timer:unixtime() of
		true ->
			try
				pick_single_mail(MailInfo#mail_info.id, MailInfo)
			catch
			    throw:{error, _ErrCode} -> skip
			end;
		_ -> skip
	end,
	pick_all_mail(T).

delete_mail(MailMap, DelIdList, []) ->
	{MailMap, DelIdList};
delete_mail(MailMap, DelIdList, [MailId | T]) ->
	MailInfo = maps:get(MailId, MailMap, undefined),
	NowTick = lib_timer:unixtime(),
	{NewMailMap, NewDelIdList} =
		if
			MailInfo =:= undefined ->
				{MailMap, DelIdList};
			MailInfo#mail_info.overtime_tick < NowTick orelse MailInfo#mail_info.has_read =:= 1 ->
				lib_serial_api:serial_mail(lib_player:get_player_base(), ?SERIAL_MAIL_PLAYER_DELETE, MailInfo),
				{maps:remove(MailId, MailMap), [MailId | DelIdList]};
			true -> {MailMap, DelIdList}
		end,
	delete_mail(NewMailMap, NewDelIdList, T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
test_mail_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 0 ->
			lib_mail_api:fast_send_mail(lib_player:player_id(), ?ITEM_OVERDUE_MAIL_ID, [1, lib_item_api:item_name(?ITEM_ID_GOLD)],
				[#item{item_id = 105001004, amount = 10, overdue = 10, remove_tick = 15}], ?ADD_ITEM_OVERDUE_REWARD);
		Par1 =:= 1 ->
			request_mail_list();
		Par1 =:= 2 ->
			request_single_mail(#'Proto10104003'{mail_id = Par2});
		Par1 =:= 3 ->
			request_pick_mail(#'Proto10104004'{mail_id = Par2});
		Par1 =:= 4 ->
			request_del_mail(#'Proto10104005'{mail_id_list = [Par2, Par3, Par4]});
		true ->
			?WARNING("test mail: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end,
	ok.
