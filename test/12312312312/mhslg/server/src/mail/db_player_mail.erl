%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_mail
%%% Created on : 2020/8/14 0014 11:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_mail).
-author("glendy").
-include("common.hrl").

%% API
-export([
	save_mail_offline/1,
	load_mail_offline/2,
	load_player_mail/1,
	save_player_mail/1,
	delete_overtime_offline_mail/0,
	mail_info_to_bson/1
]).

save_mail_offline(MailOffline) ->
	MailId = MailOffline#mail_info.id,
	Bson = mail_info_to_bson(MailOffline),
	mongo_poolboy:async_update(?MMO_POOL, ?DBMAILOFFLINE, #{?BSONSET_INT(<<"id">>, MailId)}, #{<<"$set">> => Bson}),
	ok.

load_mail_offline(PlayerId, SendTick) ->
	QueryBson = #{?BSONSET_INT(<<"receiver_id">>, PlayerId), ?BSONSET_BSON(<<"send_tick">>, #{<<"$lt">> => SendTick})},
	BsonList = mongo_poolboy:find(?MMO_POOL, ?DBMAILOFFLINE, QueryBson),
	mongo_poolboy:delete(?MMO_POOL, ?DBMAILOFFLINE, QueryBson),
	lists:foldl(
		fun(Bson, AccMailList0) ->
			MailInfo = bson_to_mail_info(Bson),
			[MailInfo | AccMailList0]
		end, [], BsonList).

load_player_mail(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_MAIL, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_mail(Bson);
		_ -> #player_mail{id = PlayerId}
	end.

save_player_mail(PlayerMail) ->
	PlayerId = PlayerMail#player_mail.id,
	Bson = player_mail_to_bson(PlayerMail),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_MAIL,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

%% 服务器启动时删除超过一个月未收取的邮件
delete_overtime_offline_mail() ->
	PrevMonthTick = lib_timer:unixtime() - lib_timer:day_second() * 30,
	mongo_poolboy:async_delete(?MMO_POOL, ?DBMAILOFFLINE, #{?BSONSET_BSON(<<"overtime_tick">>, #{<<"$lte">> => PrevMonthTick})}),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mail_info_to_bson(MailOffline) ->
	#{
		?BSONSET_INT(<<"id">>, MailOffline#mail_info.id),
		?BSONSET_INT(<<"serial_type">>, MailOffline#mail_info.serial_type),
		?BSONSET_INT(<<"mail_type">>, MailOffline#mail_info.mail_type),
		?BSONSET_INT(<<"mail_font">>, MailOffline#mail_info.mail_font),
		?BSONSET_STRING(<<"mail_title">>, MailOffline#mail_info.mail_title),
		?BSONSET_STRING(<<"mail_content">>, MailOffline#mail_info.mail_content),
		?BSONSET_INT(<<"send_tick">>, MailOffline#mail_info.send_tick),
		?BSONSET_INT(<<"sender_id">>, MailOffline#mail_info.sender_id),
		?BSONSET_STRING(<<"sender_name">>, MailOffline#mail_info.sender_name),
		?BSONSET_INT(<<"receive_tick">>, MailOffline#mail_info.receive_tick),
		?BSONSET_INT(<<"receiver_id">>, MailOffline#mail_info.receiver_id),
		?BSONSET_STRING(<<"receiver_name">>, MailOffline#mail_info.receiver_name),
		?BSONSET_INT(<<"has_read">>, MailOffline#mail_info.has_read),
		?BSONSET_INT(<<"read_tick">>, MailOffline#mail_info.read_tick),
		?BSONSET_INT(<<"has_attach_draw">>, MailOffline#mail_info.has_attach_draw),
		?BSONSET_INT(<<"draw_tick">>, MailOffline#mail_info.draw_tick),
		?BSONSET_LIST(<<"item_list">>, db_player_pack:pack_item_list_to_bson_list(MailOffline#mail_info.item_list)),
		?BSONSET_LIST(<<"args">>, args_to_bson_list(MailOffline#mail_info.args)),
		?BSONSET_LIST(<<"title_args">>, args_to_bson_list(MailOffline#mail_info.title_args)),
		?BSONSET_INT(<<"overtime_tick">>, MailOffline#mail_info.overtime_tick)
	}.

args_to_bson_list(Args) ->
	lists:foldl(fun(Arg, Acc) ->
		[arg_to_bson(Arg) | Acc]
	end, [], Args).
arg_to_bson(Arg) when is_record(Arg, mail_arg) ->
	#{
		?BSONSET_INT(type, Arg#mail_arg.type),
		?BSONSET_INT(int_val, Arg#mail_arg.int_val),
		?BSONSET_INT(double_val, Arg#mail_arg.double_val),
		?BSONSET_STRING(string_val, Arg#mail_arg.string_val),
		?BSONSET_BSON(player_show, lib_common:player_show_to_bson(Arg#mail_arg.player_show)),
		?BSONSET_BSON(item_obj, lib_item_api:item_obj_to_bson(Arg#mail_arg.item_obj))
	}
.
% arg_to_bson(#mail_arg{type = ?MAIL_ARG_TYPE_INT_NUMBER} = Arg) ->
% 	#{
% 		?BSONSET_INT(<<"type">>, Arg#mail_arg.type),
% 		?BSONSET_INT(<<"data">>, Arg#mail_arg.data)
% 	};
% arg_to_bson(#mail_arg{type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER} = Arg) ->
% 	#{
% 		?BSONSET_INT(<<"type">>, Arg#mail_arg.type),
% 		?BSONSET_FLOAT(<<"data">>, Arg#mail_arg.data)
% 	};
% arg_to_bson(#mail_arg{type = ?MAIL_ARG_TYPE_STRING} = Arg) ->
% 	#{
% 		?BSONSET_INT(<<"type">>, Arg#mail_arg.type),
% 		?BSONSET_STRING(<<"data">>, Arg#mail_arg.data)
% 	};
% arg_to_bson(#mail_arg{type = ?MAIL_ARG_TYPE_ROLE_BASE} = Arg) ->
% 	#{
% 		?BSONSET_INT(<<"type">>, Arg#mail_arg.type),
% 		?BSONSET_BSON(<<"data">>, lib_common:player_show_to_bson(Arg#mail_arg.data))
% 	};
% arg_to_bson(#mail_arg{type = ?MAIL_ARG_TYPE_ITEM_OBJ} = Arg) ->
% 	#{
% 		?BSONSET_INT(<<"type">>, Arg#mail_arg.type),
% 		?BSONSET_BSON(<<"data">>, lib_item_api:item_obj_to_bson(Arg#mail_arg.data))
% 	}.

bson_to_mail_info(Bson) ->
	#mail_info{
		id = ?BSON_INT(Bson, <<"id">>),
		serial_type = ?BSON_INT(Bson, <<"serial_type">>),
		mail_type = ?BSON_INT(Bson, <<"mail_type">>),
		mail_font = ?BSON_INT(Bson, <<"mail_font">>),
		mail_title = ?BSON_STRING(Bson, <<"mail_title">>),
		mail_content = ?BSON_STRING(Bson, <<"mail_content">>),
		send_tick = ?BSON_INT(Bson, <<"send_tick">>),
		sender_id = ?BSON_INT(Bson, <<"sender_id">>),
		sender_name = ?BSON_STRING(Bson, <<"sender_name">>),
		receive_tick = ?BSON_INT(Bson, <<"receive_tick">>),
		receiver_id = ?BSON_INT(Bson, <<"receiver_id">>),
		receiver_name = ?BSON_STRING(Bson, <<"receiver_name">>),
		has_read = ?BSON_INT(Bson, <<"has_read">>),
		read_tick = ?BSON_INT(Bson, <<"read_tick">>),
		has_attach_draw = ?BSON_INT(Bson, <<"has_attach_draw">>),
		draw_tick = ?BSON_INT(Bson, <<"draw_tick">>),
		item_list = db_player_pack:bson_list_to_pack_item_list(?BSON_LIST(Bson, <<"item_list">>)),
		args = bson_list_to_args(?BSON_LIST(Bson, <<"args">>)),
		title_args = bson_list_to_args(?BSON_LIST(Bson, <<"title_args">>)),
		overtime_tick = ?BSON_INT(Bson, <<"overtime_tick">>)
	}.

bson_list_to_args(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		[bson_to_arg(Bson) | Acc]
	end, [], BsonList).
bson_to_arg(Bson) ->
	#mail_arg{
		type = ?BSON_INT(Bson, type),
		int_val = ?BSON_INT(Bson, int_val),
		double_val = ?BSON_INT(Bson, double_val),
		string_val = ?BSON_STRING(Bson, string_val),
		player_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, player_show)),
		item_obj = lib_item_api:bson_to_item_obj(?BSON_BSON(Bson, item_obj))
	}.

	% Type = ?BSON_INT(Bson, <<"type">>),
	% bson_to_arg(Type, Bson).
% bson_to_arg(?MAIL_ARG_TYPE_INT_NUMBER, Bson) ->
% 	#mail_arg{
% 		type = ?MAIL_ARG_TYPE_INT_NUMBER,
% 		data = ?BSON_INT(Bson, <<"data">>)
% 	};
% bson_to_arg(?MAIL_ARG_TYPE_DOUBLE_NUMBER, Bson) ->
% 	#mail_arg{
% 		type = ?MAIL_ARG_TYPE_DOUBLE_NUMBER,
% 		data = ?BSON_FLOAT(Bson, <<"data">>)
% 	};
% bson_to_arg(?MAIL_ARG_TYPE_STRING, Bson) ->
% 	#mail_arg{
% 		type = ?MAIL_ARG_TYPE_STRING,
% 		data = ?BSON_STRING(Bson, <<"data">>)
% 	};
% bson_to_arg(?MAIL_ARG_TYPE_ROLE_BASE, Bson) ->
% 	#mail_arg{
% 		type = ?MAIL_ARG_TYPE_ROLE_BASE,
% 		data = lib_common:bson_to_player_show(?BSON_BSON(Bson, <<"data">>))
% 	};
% bson_to_arg(?MAIL_ARG_TYPE_ITEM_OBJ, Bson) ->
% 	#mail_arg{
% 		type = ?MAIL_ARG_TYPE_ITEM_OBJ,
% 		data = lib_item_api:bson_to_item_obj(?BSON_BSON(Bson, <<"data">>))
% 	}.

bson_to_player_mail(Bson) ->
	#player_mail{
		id = ?BSON_INT(Bson, <<"id">>),
		mail_map = bson_list_to_mail_map(?BSON_LIST(Bson, <<"mail">>))
	}.
bson_list_to_mail_map(BsonList) ->
	bson_list_to_mail_map(#{}, BsonList).
bson_list_to_mail_map(MailMap, []) ->
	MailMap;
bson_list_to_mail_map(MailMap, [Bson | T]) ->
	MailInfo = bson_to_mail_info(Bson),
	bson_list_to_mail_map(maps:put(MailInfo#mail_info.id, MailInfo, MailMap), T).

player_mail_to_bson(PlayerMail) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerMail#player_mail.id),
		?BSONSET_LIST(<<"mail">>, mail_map_to_bson_list(PlayerMail#player_mail.mail_map))
	}.

mail_map_to_bson_list(MailMap) ->
	maps:fold(
		fun(_, MailInfo, AccBsonList0) ->
			Bson = mail_info_to_bson(MailInfo),
			[Bson | AccBsonList0]
		end, [], MailMap).
