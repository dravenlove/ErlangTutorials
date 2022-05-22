%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_copy
%%% Created on : 2020/8/15 0015 10:56
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_copy).
-author("glendy").
-include("common.hrl").
-include("player_copy.hrl").

%% API
-export([
	load_player_copy/1,
	save_player_copy/1
]).

load_player_copy(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_COPY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_copy(Bson);
		_ -> #player_copy{id = PlayerId}
	end.

save_player_copy(PlayerCopy) ->
	PlayerId = PlayerCopy#player_copy.id,
	Bson = player_copy_to_bson(PlayerCopy),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_COPY,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_player_copy(Bson) ->
	#player_copy{
		id = ?BSON_INT(Bson, <<"id">>),
		player_show = lib_player:bson_to_show_role(?BSON_BSON(Bson, <<"player_show">>)),
		online = ?BSON_INT(Bson, <<"online">>),
		offline_tick = ?BSON_INT(Bson, <<"offline_tick">>),
		fight_props = lib_fight_prop:bson_to_fight_prop(?BSON_BSON(Bson, <<"fight_props">>)),
		active_skill_map = lib_fight_skill:bson_list_to_skill_map(?BSON_BSON(Bson, <<"active_skill_map">>)),
		passive_skill_map = lib_fight_skill:bson_list_to_skill_map(?BSON_BSON(Bson, <<"passive_skill_map">>))
	}.

player_copy_to_bson(PlayerCopy) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerCopy#player_copy.id),
		?BSONSET_BSON(<<"player_show">>, lib_player:show_role_to_bson(PlayerCopy#player_copy.player_show)),
		?BSONSET_INT(<<"online">>, PlayerCopy#player_copy.online),
		?BSONSET_INT(<<"offline_tick">>, PlayerCopy#player_copy.offline_tick),
		?BSONSET_BSON(<<"fight_props">>, lib_fight_prop:fight_prop_to_bson(PlayerCopy#player_copy.fight_props)),
		?BSONSET_BSON(<<"active_skill_map">>, lib_fight_skill:skill_map_to_bson_list(PlayerCopy#player_copy.active_skill_map)),
		?BSONSET_BSON(<<"passive_skill_map">>, lib_fight_skill:skill_map_to_bson_list(PlayerCopy#player_copy.passive_skill_map))
	}.
