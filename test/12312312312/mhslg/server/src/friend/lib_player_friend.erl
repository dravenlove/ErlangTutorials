%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_friend
%%% Created on : 2020/8/21 0021 11:33
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_friend).
-author("glendy").
-include("common.hrl").
-include("friend.hrl").
-include("player_copy.hrl").
-include("ProtoClient_10107.hrl").

%% API
-export([
	sign_in/0,
	sign_out/0,
	async_friend_info/0,
	request_friend_list/1,
	request_friend_apply/1,
	request_friend_apply_reply/1,
	request_friend_remove/1,
	request_friend_black_add/1,
	request_friend_black_del/1,
	request_friend_search/1
]).

-export([
	test_friend_command/4
]).

make_up_friend() ->
	PlayerCopy = lib_player_copy:get_player_copy(),
	#player_friend{
		id = PlayerCopy#player_copy.id,
		player_show = PlayerCopy#player_copy.player_show,
		online = 1,
		offline_tick = 0
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sign_in() ->
	Friend = make_up_friend(),
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_base:async_friend_info/2, [Friend, ?FRIEND_SYNC_LOGIN]),
	ok.

sign_out() ->
	Friend = make_up_friend(),
	NewFriend = Friend#player_friend{
		online = 0,
		offline_tick = lib_timer:unixtime()
	},
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_base:async_friend_info/2, [NewFriend, ?FRIEND_SYNC_LOGOUT]),
	ok.

async_friend_info() ->
	Friend = make_up_friend(),
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_base:async_friend_info/2, [Friend, ?FRIEND_SYNC_NORMAL]),
	ok.

%% 请求好友列表
request_friend_list(Msg) ->
	#'Proto10107001'{type = Type} = Msg,
	?JUDGE_RETURN(?FRI_FRIEND_LIST_TYPE =< Type andalso Type =< ?FRI_REMOVE_LIST_TYPE, ?ERROR_INVALID_PARAM),
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_fetch_friend_list/2, [lib_player:player_id(), Type]).

%% 好友申请
request_friend_apply(Msg) ->
	#'Proto10107002'{friend_id = FriendId} = Msg,
	PlayerId = lib_player:player_id(),
	?JUDGE_RETURN(FriendId > 0 andalso FriendId =/= PlayerId, ?ERROR_INVALID_PARAM),
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_apply/2, [PlayerId, FriendId]).

%% 审批好友申请
request_friend_apply_reply(Msg) ->
	#'Proto10107003'{type = Type, apply_list = ClientApplyList} = Msg,
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_apply_reply/3, [lib_player:player_id(), Type, ClientApplyList]).

%% 删除好友
request_friend_remove(Msg) ->
	#'Proto10107004'{id_list = IdList} = Msg,
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_remove/2, [lib_player:player_id(), IdList]).

%% 加入黑名单
request_friend_black_add(Msg) ->
	#'Proto10107005'{id_list = IdList} = Msg,
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_black_insert/2, [lib_player:player_id(), IdList]).

%% 删除黑名单
request_friend_black_del(Msg) ->
	#'Proto10107006'{id_list = IdList} = Msg,
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_black_remove/2, [lib_player:player_id(), IdList]).

%% 查找好友
request_friend_search(Msg) ->
	#'Proto10107007'{name = SearchName} = Msg,
	FriendId = db_player_base:get_player_id_by_name(SearchName),
	?DEBUG("search: ~p ~ts", [FriendId, SearchName]),
	?JUDGE_RETURN(FriendId > 0, ?ERROR_NO_PLAYER_NAME),
	mod_server:async_apply(mod_friend:get_pid(), fun lib_friend_op:async_friend_search/2, [lib_player:player_id(), FriendId]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
test_friend_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 1 ->
			request_friend_list(#'Proto10107001'{type = Par2});
		Par1 =:= 2 ->
			request_friend_apply(#'Proto10107002'{friend_id = Par2});
		Par1 =:= 3 ->
			request_friend_apply_reply(#'Proto10107003'{type = Par2, apply_list = [Par3]});
		Par1 =:= 4 ->
			request_friend_remove(#'Proto10107004'{id_list = [Par2]});
		Par1 =:= 5 ->
			request_friend_black_add(#'Proto10107005'{id_list = [Par2]});
		Par1 =:= 6 ->
			request_friend_black_del(#'Proto10107006'{id_list = [Par2]});
		Par1 =:= 7 ->
			request_friend_search(#'Proto10107007'{name = "占冷亦"});
		Par1 =:= 8 ->
			PlayerFriend = mod_server:sync_apply(mod_friend:get_pid(), fun lib_friend_base:get_friend/1, [Par2]),
			?DEBUG("friend info: ~p ~w", [Par2, PlayerFriend]);
		true ->
			?WARNING("test friend: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end.
