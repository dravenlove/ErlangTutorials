%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_backmail_base
%%% Created on : 2020/9/14 0014 17:30
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_backmail_base).
-author("glendy").
-include("common.hrl").

%% API
-export([
	check_back_mail/0
]).

check_back_mail() ->
	MailBsonList = lib_special_mongodb:find(?BACK_POOL, ?MODULE, ?DBBACK_MAIL, #{?BSONSET_INT(<<"read">>, 0)}),
	check_back_mail(MailBsonList).

check_back_mail([]) ->
	ok;
check_back_mail([Bson | T]) ->
	Id = ?BSON_INT(Bson, <<"id">>),
	Title = ?BSON_STRING(Bson, <<"title">>),
	Content = ?BSON_STRING(Bson, <<"content">>),
	ItemList = db_player_pack:bson_list_to_pack_item_list(?BSON_LIST(Bson, <<"item">>)),
	?INFO("back mail: ~p ~ts ~ts", [Id, Title, Content]),
	case ?BSON_LIST(Bson, <<"receiver_set">>) of
		[] ->
			send_back_mail_to_month_player(Title, Content, ItemList);
		BRList ->
			send_back_mail(Title, Content, ItemList, BRList)
	end,
	lib_special_mongodb:update(?BACK_POOL, ?MODULE, ?DBBACK_MAIL,
		#{?BSONSET_INT(<<"id">>, Id)},
		#{<<"$set">> => #{?BSONSET_INT(<<"read">>, 1)}}, false, false),
	check_back_mail(T).

send_back_mail(_Title, _Content, _ItemList, []) ->
	ok;
send_back_mail(Title, Content, ItemList, [PlayerId | T]) ->
	send_back_mail_to_player(Title, Content, ItemList, PlayerId),
	send_back_mail(Title, Content, ItemList, T).

send_back_mail_to_player(Title, Content, ItemList, PlayerId) ->
	MailInfo0 = lib_mail_api:create_sys_mail(?ADD_BACK_MAIL),
	MailInfo1 = lib_mail_api:set_title_content(MailInfo0, ?BACK_MAIL_FONT, [Content], [Title]),
	MailInfo2 = lib_mail_api:add_item_list(MailInfo1, ItemList),
	MailId = lib_counter:get_mail_id(),
	NowTick = lib_timer:unixtime(),
	NewMailInfo = MailInfo2#mail_info{id = MailId, receiver_id = PlayerId, send_tick = NowTick},
	Bson = db_player_mail:mail_info_to_bson(NewMailInfo),
	lib_special_mongodb:update(?MMO_POOL, ?MODULE, ?DBMAILOFFLINE, #{?BSONSET_INT(<<"id">>, MailId)}, #{<<"$set">> => Bson}).

send_back_mail_to_month_player(Title, Content, ItemList) ->
	PrevMonthTick = lib_timer:unixtime() - lib_timer:day_second() * 31,
	BsonList = lib_special_mongodb:find(?MMO_POOL, ?MODULE, ?DBROLE, #{<<"logout_tick">> => #{<<"$gt">> => PrevMonthTick}}),
	lists:foreach(
		fun(Bson) ->
			PlayerId = ?BSON_INT(Bson, <<"id">>),
			send_back_mail_to_player(Title, Content, ItemList, PlayerId)
		end, BsonList).
