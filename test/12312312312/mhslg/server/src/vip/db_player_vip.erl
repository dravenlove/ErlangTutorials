%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_vip
%%% Created on : 2020/8/28 0028 17:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_vip).
-author("glendy").
-include("common.hrl").
-include("vip.hrl").

%% API
-export([
	load_player_vip/1,
	save_player_vip/1
]).

load_player_vip(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_VIP, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_vip(Bson);
		_ ->
			#player_vip{id = PlayerId}
	end.

save_player_vip(PlayerVip) ->
	PlayerId = PlayerVip#player_vip.id,
	Bson = player_vip_to_bson(PlayerVip),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_VIP,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_player_vip(Bson) ->
	#player_vip{
		id = ?BSON_INT(Bson, <<"id">>),
		vip_level = ?BSON_INT(Bson, <<"vip_level">>)
	}.

player_vip_to_bson(PlayerVip) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerVip#player_vip.id),
		?BSONSET_INT(<<"vip_level">>, PlayerVip#player_vip.vip_level)
	}.

