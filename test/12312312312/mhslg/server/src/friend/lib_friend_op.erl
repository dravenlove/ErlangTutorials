%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_friend_op
%%% Created on : 2020/8/21 0021 17:09
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		好友基本操作接口，其他功能定义新的模块处理
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_friend_op).
-author("glendy").
-include("common.hrl").
-include("friend.hrl").
-include("ProtoClient_10107.hrl").

%% API
-export([
	async_fetch_friend_list/2,
	async_friend_apply/2,
	async_friend_apply_reply/3,
	async_friend_remove/2,
	async_friend_black_insert/2,
	async_friend_black_remove/2,
	async_friend_search/2,
	sync_friend_chat/1
]).

get_info_set_by_type(?FRI_APPLY_LIST_TYPE, PlayerFriend) ->
	PlayerFriend#player_friend.apply_list;
get_info_set_by_type(?FRI_FRIEND_LIST_TYPE, PlayerFriend) ->
	PlayerFriend#player_friend.friend_map;
get_info_set_by_type(?FRI_BLACK_LIST_TYPE, PlayerFriend) ->
	PlayerFriend#player_friend.black_map;
get_info_set_by_type(?FRI_REMOVE_LIST_TYPE, PlayerFriend) ->
	PlayerFriend#player_friend.remove_friend_map;
get_info_set_by_type(_Type, _PlayerFriend) ->
	#{}.

serialize_proto_friend_list(?FRI_APPLY_LIST_TYPE, List) ->
	lists:foldl(
		fun(Id, AccProtoFriendList0) ->
			case lib_friend_base:get_friend(Id) of
				undefined -> AccProtoFriendList0;
				Friend ->
					[lib_friend_base:serialize_proto_friend(Friend) | AccProtoFriendList0]
			end
		end, [], List);
serialize_proto_friend_list(_Type, Map) ->
	maps:fold(
		fun(Id, _FriendOther, AccProtoFriendList0) ->
			case lib_friend_base:get_friend(Id) of
				undefined -> AccProtoFriendList0;
				Friend ->
					ProtoFriend = lib_friend_base:serialize_proto_friend(Friend),
					[ProtoFriend | AccProtoFriendList0]
			end
		end, [], Map).

%% 请求好友列表
async_fetch_friend_list(PlayerId, Type) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		ProtoFriendList = serialize_proto_friend_list(Type, get_info_set_by_type(Type, PlayerFriend)),
		Respond = #'Proto50107001'{
			type = Type,
			friend_list = ProtoFriendList
		},
		?DEBUG("friend list: ~p ~p ~w", [PlayerId, Type, Respond]),
	    lib_send:respond_to_client_by_pid(PlayerPid, Respond)
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_LIST, ErrCode)
	end.

%% 好友申请
async_friend_apply(PlayerId, FriendId) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		#player_friend{
			friend_map = FriendMap,
			black_map = BlackMap
		} = PlayerFriend,
		?JUDGE_RETURN(maps:is_key(FriendId, FriendMap) =:= false, ?ERROR_IS_IN_FRIEND),
		?JUDGE_RETURN(maps:is_key(FriendId, BlackMap) =:= false, ?ERROR_IS_IN_BLACK_FRIEND),
		Friend = lib_friend_base:get_friend(FriendId),
		?JUDGE_RETURN(Friend =/= undefined, ?ERROR_ROLE_NOT_EXISTS),
		?JUDGE_RETURN(maps:is_key(PlayerId, Friend#player_friend.black_map) =:= false, ?ERROR_IN_TARGET_BLACK_FRIEND),
		NewFriend = Friend#player_friend{
			apply_list = lists:usort([PlayerId | Friend#player_friend.apply_list])
		},
		lib_friend_base:put_friend(NewFriend, true),
		case lib_player:is_player_process_alive(FriendId) of
			true ->
				ActRespond = #'Proto80107008'{
					player_id = PlayerId
				},
				FriendPid = lib_player:get_pid(FriendId),
				lib_send:respond_to_client_by_pid(FriendPid, ActRespond);
			_ -> skip
		end,
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_APPLY)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_APPLY, ErrCode)
	end.

%% 审核好友申请
async_friend_apply_reply(PlayerId, Type, ClientApplyList) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		NewPlayerFriend =
			if
				Type =:= 1 ->
					do_agree_friend_apply(PlayerFriend, ClientApplyList);
				true ->
					do_disagree_friend_apply(PlayerFriend, ClientApplyList)
			end,
		lib_friend_base:put_friend(NewPlayerFriend, true),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_APPLY_REPLY)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_APPLY_REPLY, ErrCode)
	end.

%% 删除好友列表
async_friend_remove(PlayerId, IdList) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		NewPlayerFriend = remove_friend_list(PlayerFriend, IdList),
		lib_friend_base:put_friend(NewPlayerFriend, true),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_REMOVE)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_REMOVE, ErrCode)
	end.

%% 加入黑名单
async_friend_black_insert(PlayerId, IdList) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		NewPlayerFriend = insert_black_friend_list(PlayerFriend, IdList),
		lib_friend_base:put_friend(NewPlayerFriend, true),
		sync_friend_chat(NewPlayerFriend),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_BLACK_ADD)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_BLACK_ADD, ErrCode)
	end.

%% 删除黑名单
async_friend_black_remove(PlayerId, IdList) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		PlayerFriend = lib_friend_base:get_friend(PlayerId),
		?JUDGE_RETURN(PlayerFriend =/= undefined, ?ERROR_SERVER_DATA),
		NewPlayerFriend = remove_black_friend_list(PlayerFriend, IdList),
		lib_friend_base:put_friend(NewPlayerFriend, true),
		sync_friend_chat(NewPlayerFriend),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_BLACK_DEL)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_BLACK_DEL, ErrCode)
	end.

%% 查找玩家
async_friend_search(PlayerId, FriendId) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		Friend = lib_friend_base:get_friend(FriendId),
		?JUDGE_RETURN(Friend =/= undefined, ?ERROR_SERVER_DATA),
		Respond = #'Proto50107007'{
			friend = lib_friend_base:serialize_proto_friend(Friend)
		},
		?DEBUG("friend search: ~p ~p ~w", [PlayerId, FriendId, Respond]),
		lib_send:respond_to_client_by_pid(PlayerPid, Respond)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_FRIEND_SEARCH, ErrCode)
	end.

%% 把信息同步到聊天进程
sync_friend_chat(PlayerFriend) ->
	BlackList = maps:fold(
		fun(Id, _, AccBlackList0) ->
			[Id | AccBlackList0]
		end, [], PlayerFriend#player_friend.black_map),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat_friend:async_black_friend_list/3, [PlayerFriend#player_friend.id, BlackList]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_agree_friend_apply(PlayerFriend, []) ->
	PlayerFriend;
do_agree_friend_apply(PlayerFriend, [Id | T]) ->
	#player_friend{
		apply_list = ApplyList
	} = PlayerFriend,
	case lib_common:lists_find(Id, ApplyList) > 0 of
		true ->
			case lib_friend_base:get_friend(Id) of
				undefined ->
					do_agree_friend_apply(PlayerFriend, T);
				Friend ->
					NewPlayerFriend = do_insert_friend(PlayerFriend, Id),
					NewFriend = do_insert_friend(Friend, PlayerFriend#player_friend.id),
					lib_friend_base:put_friend(NewFriend, true),
					do_agree_friend_apply(NewPlayerFriend, T)
			end;
		_ ->
			do_agree_friend_apply(PlayerFriend, T)
	end.

do_disagree_friend_apply(PlayerFriend, []) ->
	PlayerFriend;
do_disagree_friend_apply(PlayerFriend, [Id | T]) ->
	NewApplyList = lists:delete(Id, PlayerFriend#player_friend.apply_list),
	NewPlayerFriend = PlayerFriend#player_friend{
		apply_list = NewApplyList
	},
	do_disagree_friend_apply(NewPlayerFriend, T).

%% 把玩家加入好友列表
do_insert_friend(PlayerFriend, Id) ->
	#player_friend{
		friend_map = FriendMap,
		black_map = BlackMap,
		remove_friend_map = RemoveMap,
		apply_list = ApplyList
	} = PlayerFriend,
	FriendFlag = maps:is_key(Id, FriendMap),
	RemoveFlag = maps:is_key(Id, RemoveMap),
	BlackFlag = maps:is_key(Id, BlackMap),
	FriendOther =
		if
			FriendFlag =:= true -> maps:get(Id, FriendMap);
			RemoveFlag =:= true -> maps:get(Id, RemoveMap);
			BlackFlag =:= true -> maps:get(Id, BlackMap);
			true ->
				#friend_other{
					id = Id
				}
		end,
	PlayerFriend#player_friend{
		friend_map = maps:put(Id, FriendOther, FriendMap),
		black_map = maps:remove(Id, BlackMap),
		remove_friend_map = maps:remove(Id, RemoveMap),
		apply_list = lists:delete(Id, ApplyList)
	}.

%% 删除好友列表
remove_friend_list(PlayerFriend, []) ->
	PlayerFriend;
remove_friend_list(PlayerFriend, [Id | T]) ->
	NewPlayerFriend = remove_friend(PlayerFriend, Id),
	remove_friend_list(NewPlayerFriend, T).

remove_friend(PlayerFriend, Id) ->
	#player_friend{
		friend_map = FriendMap,
		remove_friend_map = RemoveMap,
		apply_list = ApplyList
	} = PlayerFriend,
	case maps:is_key(Id, FriendMap) of
		true ->
			FriendOther = maps:get(Id, FriendMap),
			NewFriendMap = maps:remove(Id, FriendMap),
			NewRemovemap = maps:put(Id, FriendOther, RemoveMap),
			PlayerFriend#player_friend{
				friend_map = NewFriendMap,
				remove_friend_map = NewRemovemap,
				apply_list = lists:usort(lists:delete(Id, ApplyList))
			};
		_ ->
			PlayerFriend
	end.

%% 插入黑名单
insert_black_friend_list(PlayerFriend, []) ->
	PlayerFriend;
insert_black_friend_list(PlayerFriend, [Id | T]) when PlayerFriend#player_friend.id =:= Id ->
	insert_black_friend_list(PlayerFriend, T);
insert_black_friend_list(PlayerFriend, [Id | T]) ->
	case lib_friend_base:get_friend(Id) of
		undefined ->
			insert_black_friend_list(PlayerFriend, T);
		OtherPlayerFriend ->
			NewPlayerFriend = insert_black_friend(PlayerFriend, Id),
			lib_friend_base:put_friend(NewPlayerFriend, true),
			NewOtherPlayerFriend = remove_friend(OtherPlayerFriend, PlayerFriend#player_friend.id),
			lib_friend_base:put_friend(NewOtherPlayerFriend, true),
			insert_black_friend_list(NewPlayerFriend, T)
	end.

insert_black_friend(PlayerFriend, Id) ->
	#player_friend{
		friend_map = FriendMap,
		remove_friend_map = RemoveMap,
		black_map = BlackMap,
		apply_list = ApplyList
	} = PlayerFriend,
	IsFriend = maps:is_key(Id, FriendMap),
	IsRemove = maps:is_key(Id, RemoveMap),
	FriendOther =
		if
			IsFriend =:= true -> maps:get(Id, FriendMap);
			IsRemove =:= true -> maps:get(Id, RemoveMap);
			true ->
				#friend_other{
					id = Id
				}
		end,
	PlayerFriend#player_friend{
		friend_map = maps:remove(Id, FriendMap),
		remove_friend_map = maps:remove(Id, RemoveMap),
		black_map = maps:put(Id, FriendOther, BlackMap),
		apply_list = lists:usort(lists:delete(Id, ApplyList))
	}.

remove_black_friend_list(PlayerFriend, []) ->
	PlayerFriend;
remove_black_friend_list(PlayerFriend, [Id | T]) ->
	NewPlayerFriend = remove_black_friend(PlayerFriend, Id),
	remove_black_friend_list(NewPlayerFriend, T).

remove_black_friend(PlayerFriend, Id) ->
	#player_friend{
		black_map = BlackMap
	} = PlayerFriend,
	PlayerFriend#player_friend{
		black_map = maps:remove(Id, BlackMap)
	}.

