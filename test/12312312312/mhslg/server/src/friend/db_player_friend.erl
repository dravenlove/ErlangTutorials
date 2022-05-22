%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_friend
%%% Created on : 2020/8/21 0021 12:01
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_friend).
-author("glendy").
-include("common.hrl").
-include("friend.hrl").

%% API
-export([
	load_player_friend/1,
	save_player_friend/1
]).

load_player_friend(PlayerId) ->
	?DEBUG("load player friend: ~p", [PlayerId]),
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_FRIEND, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_friend(Bson);
		_ ->
			undefined
	end.

save_player_friend(PlayerFriend) ->
	PlayerId = PlayerFriend#player_friend.id,
	Bson = player_friend_to_bson(PlayerFriend),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_FRIEND,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_player_friend(Bson) ->
	#player_friend{
		id = ?BSON_INT(Bson, <<"id">>),
		player_show = lib_player:bson_to_show_role(?BSON_BSON(Bson, <<"player_show">>)),
		online = ?BSON_INT(Bson, <<"online">>),
		offline_tick = ?BSON_INT(Bson, <<"offline_tick">>),
		friend_map = bson_list_to_friend_other_map(?BSON_LIST(Bson, <<"friend">>)),
		black_map = bson_list_to_friend_other_map(?BSON_LIST(Bson, <<"black">>)),
		apply_list = ?BSON_LIST(Bson, <<"apply_list">>),
		remove_friend_map = bson_list_to_friend_other_map(?BSON_LIST(Bson, <<"remove">>))
	}.

bson_list_to_friend_other_map(BsonList) ->
	bson_list_to_friend_other_map(#{}, BsonList).
bson_list_to_friend_other_map(Map, []) ->
	 Map;
bson_list_to_friend_other_map(Map, [Bson | T]) ->
	FriendOther = bson_to_friend_other(Bson),
	bson_list_to_friend_other_map(maps:put(FriendOther#friend_other.id, FriendOther, Map), T).

bson_to_friend_other(Bson) ->
	#friend_other{
		id = ?BSON_INT(Bson, <<"id">>)
	}.

player_friend_to_bson(PlayerFriend) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerFriend#player_friend.id),
		?BSONSET_BSON(<<"player_show">>, lib_player:show_role_to_bson(PlayerFriend#player_friend.player_show)),
		?BSONSET_INT(<<"online">>, PlayerFriend#player_friend.online),
		?BSONSET_INT(<<"offline_tick">>, PlayerFriend#player_friend.offline_tick),
		?BSONSET_LIST(<<"friend">>, friend_other_map_to_bson_list(PlayerFriend#player_friend.friend_map)),
		?BSONSET_LIST(<<"black">>, friend_other_map_to_bson_list(PlayerFriend#player_friend.black_map)),
		?BSONSET_LIST(<<"apply_list">>, PlayerFriend#player_friend.apply_list),
		?BSONSET_LIST(<<"remove">>, friend_other_map_to_bson_list(PlayerFriend#player_friend.remove_friend_map))
	}.

friend_other_map_to_bson_list(FriendOtherMap) ->
	maps:fold(
		fun(_Id, FriendOther, AccBsonList0) ->
			Bson = friend_other_to_bson(FriendOther),
			[Bson | AccBsonList0]
		end, [], FriendOtherMap).

friend_other_to_bson(FriendOther) ->
	#{
		?BSONSET_INT(<<"id">>, FriendOther#friend_other.id)
	}.
