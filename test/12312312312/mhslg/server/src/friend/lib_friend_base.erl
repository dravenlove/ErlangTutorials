%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_friend_base
%%% Created on : 2020/8/21 0021 11:33
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		好友服务进程里调用的接口，用于缓存好友的相关信息，减少数据库和跨进程间取数据的复杂度
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_friend_base).
-author("glendy").
-include("common.hrl").
-include("friend.hrl").
-include("player_copy.hrl").
-include("ProtoClient_10107.hrl").

-define(FRIEND_PLAYER_INFO(Id), {friend_player_info, Id}).
-define(FRIEND_PLAYER_CACHE_TICK, friend_player_cache_tick).
-define(FRIEND_PLAYER_SAVE, friend_player_save).
-define(FRIEND_CACHE_TIMEOUT_SEC, 1800).

%% API
-export([
	ets_init/0,
	build_index/0,
	get_friend_cache_map/0,
	set_friend_cache/2,
	remove_friend_cache_tick/1,
	get_friend_player_save_map/0,
	put_friend_player_save_map/1,
	put_friend/2,
	get_friend/1,
	remove_friend/1,
	serialize_proto_friend/1
]).

-export([
	async_friend_info/2
]).

ets_init() ->
	ets:new(?ETS_PLAYER_FRIEND, [?ETS_KEY_POS(#player_friend.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_FRIEND, {?TUPLE_INT(<<"id">>, 1)}, true),
	ok.

%% 玩家数据在好友进程字典里缓存的清除时间
get_friend_cache_map() ->
	case erlang:get(?FRIEND_PLAYER_CACHE_TICK) of
		undefined -> #{};
		Val -> Val
	end.
set_friend_cache(Id, Tick) ->
	Map = get_friend_cache_map(),
	erlang:put(?FRIEND_PLAYER_CACHE_TICK, maps:put(Id, Tick, Map)).
remove_friend_cache_tick(Id) ->
	Map = get_friend_cache_map(),
	case maps:is_key(Id, Map) of
		true -> erlang:put(?FRIEND_PLAYER_CACHE_TICK, maps:remove(Id, Map));
		_ -> skip
	end.

%% 哪些玩家数据需要保存数据库的标识集合
get_friend_player_save_map() ->
	case erlang:get(?FRIEND_PLAYER_SAVE) of
		undefined -> #{};
		Val -> Val
	end.
put_friend_player_save_map(Map) ->
	erlang:put(?FRIEND_PLAYER_SAVE, Map).
set_friend_player_save(Id) ->
	Map = get_friend_player_save_map(),
	put_friend_player_save_map(maps:put(Id, 1, Map)).

put_friend(Friend, IsSaveDb) ->
	Id = Friend#player_friend.id,
	if
		IsSaveDb =:= true ->
			set_friend_player_save(Id);
		true -> skip
	end,
	if
		Friend#player_friend.online =:= 0 ->
			set_friend_cache(Id, lib_timer:unixtime() + ?FRIEND_CACHE_TIMEOUT_SEC);
		true -> skip
	end,
	erlang:put(?FRIEND_PLAYER_INFO(Id), Friend).

get_friend(Id) ->
	case erlang:get(?FRIEND_PLAYER_INFO(Id)) of
		undefined ->
			case lib_game_cache:get_player_cache(?ETS_PLAYER_FRIEND, Id) of
				undefined ->
					case lib_game_cache:get_player_cache(?ETS_PLAYER_COPY, Id) of
						undefined -> undefined;
						PlayerCopy ->
							#player_copy{
								player_show = Show,
								offline_tick = OfflineTick
							} = PlayerCopy,
							Friend = #player_friend{
								id = Id,
								player_show = Show,
								online = 0,
								offline_tick = OfflineTick
							},
							put_friend(Friend, true),
							Friend
					end;
				PlayerFriend ->
					put_friend(PlayerFriend, false),
					PlayerFriend
			end;
		Val -> Val
	end.

remove_friend(Id) ->
	erlang:erase(?FRIEND_PLAYER_INFO(Id)).

serialize_proto_friend(Friend) ->
	#'ProtoFriend'{
		show = Friend#player_friend.player_show,
		online = Friend#player_friend.online,
		offline_tick = Friend#player_friend.offline_tick
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

async_friend_info(SyncFriend, SyncType) ->
	PlayerId = SyncFriend#player_friend.id,
	NewPlayerFriend =
		case get_friend(PlayerId) of
			undefined -> put_friend(SyncFriend, true), SyncFriend;
			PlayerFriend ->
				NewPlayerFriend0 = PlayerFriend#player_friend{
					player_show = SyncFriend#player_friend.player_show,
					online = SyncFriend#player_friend.online,
					offline_tick = SyncFriend#player_friend.offline_tick
				},
				put_friend(NewPlayerFriend0, true),
				NewPlayerFriend0
		end,
	if
		SyncType =:= ?FRIEND_SYNC_LOGIN ->
			remove_friend_cache_tick(PlayerId),
			lib_friend_op:sync_friend_chat(NewPlayerFriend);
		true -> skip
	end.


