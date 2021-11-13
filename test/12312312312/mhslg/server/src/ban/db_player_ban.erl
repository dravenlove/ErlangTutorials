%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_ban
%%% Created on : 2020/9/14 0014 11:49
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_ban).
-author("glendy").
-include("common.hrl").
-include("ban.hrl").

%% API
-export([
	load_player_ban/1,
	save_player_ban/1,
	load_back_ban_list/0,
	update_ban_rec_flag/1,
	unban_account/1,
	unban_ip/1,
	ban_account/1,
	ban_ip/1,
	is_ban_login/2
]).

load_player_ban(PlayerId) ->
	Account = db_player_base:get_account_by_id(PlayerId),
	load_player_ban_by_account(Account, PlayerId).

load_player_ban_by_account(Account, PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_BAN, #{?BSONSET_STRING(<<"account">>, Account)}) of
		Bson = #{} ->
			bson_to_player_ban(Bson, PlayerId);
		_ ->
			#player_ban{id = PlayerId, account = Account}
	end.

save_player_ban(PlayerBan) ->
	Account = PlayerBan#player_ban.account,
	Bson = player_ban_to_bson(PlayerBan),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BAN,
		#{?BSONSET_STRING(<<"account">>, Account)},
		#{<<"$set">> => Bson}).

load_back_ban_list() ->
	case mongo_poolboy:find(?BACK_POOL, ?DBBACK_BAN, #{?BSONSET_INT(<<"flag">>, 0)}) of
		BsonList = [_ | _] ->
			bson_list_to_ban_list(BsonList);
		_ ->
			[]
	end.

update_ban_rec_flag(Id) ->
	mongo_poolboy:async_update(?BACK_POOL, ?DBBACK_BAN,
		#{?BSONSET_INT(<<"id">>, Id)},
		#{<<"$set">> => #{?BSONSET_INT(<<"flag">>, 1)}}).

unban_account(Account) ->
	BSON = #{
		?BSONSET_INT(<<"account_ban">>, 0),
		?BSONSET_INT(<<"ip_ban">>, 0)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BAN,
		#{?BSONSET_STRING(<<"account">>, Account)},
		#{<<"$set">> => BSON}, false, true).

unban_ip(ClientIp) ->
	mongo_poolboy:async_delete(?MMO_POOL, ?DBBAN_IP, #{?BSONSET_STRING(<<"ip">>, ClientIp)}),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BAN,
		#{?BSONSET_STRING(<<"ip">>, ClientIp)},
		#{<<"$set">> => #{?BSONSET_INT(<<"ip_ban">>, 0)}}, false, true).

ban_account(Account) ->
	BSON = #{
		?BSONSET_STRING(<<"account">>, Account),
		?BSONSET_INT(<<"account_ban">>, 1)
	},
	mongo_poolboy:update(?MMO_POOL, ?DBPLAYER_BAN,
		#{?BSONSET_STRING(<<"account">>, Account)},
		#{<<"$set">> => BSON}).

ban_ip(ClientIp) ->
	mongo_poolboy:async_update(?MMO_POOL, ?DBBAN_IP,
		#{?BSONSET_STRING(<<"ip">>, ClientIp)},
		#{<<"$set">> => #{?BSONSET_STRING(<<"ip">>, ClientIp)}}),
	AccountList = db_player_base:get_account_by_ip(ClientIp),
	lists:foreach(
		fun(Account) ->
			BSON = #{
				?BSONSET_STRING(<<"account">>, Account),
				?BSONSET_INT(<<"ip_ban">>, 1),
				?BSONSET_STRING(<<"ip">>, ClientIp)
			},
			mongo_poolboy:update(?MMO_POOL, ?DBPLAYER_BAN,
				#{?BSONSET_STRING(<<"account">>, Account)},
				#{<<"$set">> => BSON})
		end, AccountList).

is_ban_login(Account, ClientIp) ->
	#player_ban{
		account_ban = AccountBan,
		ip_ban = IpBan
	} = load_player_ban_by_account(Account, 0),
	if
		IpBan =:= 1 orelse AccountBan =:= 1 -> true;
		true ->
			%% 对于新号, 要检查一下是否有IP封禁
			AccountCount = mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"account">>, Account)}),
			BanIpCount = mongo_poolboy:count(?MMO_POOL, ?DBBAN_IP, #{?BSONSET_STRING(<<"ip">>, ClientIp)}),
			if
				AccountCount =< 0 andalso BanIpCount > 0 -> true;
				true -> false
			end
	end.

%%%%%%%%%%%%%%%
bson_to_player_ban(Bson, PlayerId) ->
	#player_ban{
		id = PlayerId,
		account = ?BSON_STRING(Bson, <<"account">>),
		account_ban = ?BSON_INT(Bson, <<"account_ban">>),
		ip_ban = ?BSON_INT(Bson, <<"ip_ban">>),
		ip = ?BSON_STRING(Bson, <<"ip">>),
		chat_ban = ?BSON_INT(Bson, <<"chat_ban">>)
	}.

player_ban_to_bson(PlayerBan) ->
	#{
		?BSONSET_STRING(<<"account">>, PlayerBan#player_ban.account),
		?BSONSET_INT(<<"account_ban">>, PlayerBan#player_ban.account_ban),
		?BSONSET_INT(<<"ip_ban">>, PlayerBan#player_ban.ip_ban),
		?BSONSET_STRING(<<"ip">>, PlayerBan#player_ban.ip),
		?BSONSET_INT(<<"chat_ban">>, PlayerBan#player_ban.chat_ban)
	}.

bson_list_to_ban_list(BsonList) ->
	bson_list_to_ban_list([], BsonList).
bson_list_to_ban_list(BackBanList, []) ->
	BackBanList;
bson_list_to_ban_list(BackBanList, [Bson | T]) ->
	BackBan = bson_to_ban_rec(Bson),
	bson_list_to_ban_list([BackBan | BackBanList], T).

bson_to_ban_rec(Bson) ->
	#ban_rec{
		id = ?BSON_INT(Bson, <<"id">>),
		role_id = ?BSON_INT(Bson, <<"role_id">>),
		role_name = ?BSON_STRING(Bson, <<"role_name">>),
		account = ?BSON_STRING(Bson, <<"account">>),
		ip = ?BSON_STRING(Bson, <<"ip">>),
		opt_type = ?BSON_INT(Bson, <<"opt_type">>),
		action = ?BSON_INT(Bson, <<"action">>),
		tick = ?BSON_INT(Bson, <<"tick">>),
		flag = ?BSON_INT(Bson, <<"flag">>)
	}.
