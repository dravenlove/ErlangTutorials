%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_other
%%% Created on : 2020/8/24 0024 17:51
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		查看其他玩家信息的接口模块
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_other).
-author("glendy").
-include("common.hrl").
-include("ProtoClient_10111.hrl").

%% API
-export([
	request_player_other/1,
	async_send_player_other/1,
	request_player_hero_base/1
]).

%% 获取其他玩家信息
request_player_other(Msg) ->
	#'Proto10111002'{player_id = OtherId} = Msg,
	PlayerId = lib_player:player_id(),
	if
		PlayerId =:= OtherId ->
			async_send_player_other(PlayerId);
		true ->
			case lib_player:is_player_process_alive(OtherId) of
				true ->
					OtherPid = lib_player:get_pid(OtherId),
					mod_server:async_apply(OtherPid, fun lib_player_other:async_send_player_other/1, [PlayerId]);
				false ->
					send_player_other_by_cache(OtherId)
			end
	end.

%% 从其他玩家的进程组包回发给请求的玩家
async_send_player_other(PlayerId) ->
	Show = lib_player:serialize_show_role_detail(),
	Respond = #'Proto50111002'{
		show = Show
	},
	?DEBUG("~p~n", [Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

send_player_other_by_cache(OtherId) ->
	Show = lib_player:serialize_other_player_show_role_detail(OtherId),
	Respond = #'Proto50111002'{
		show = Show
	},
	?DEBUG("~p~n", [Respond]),
	lib_send:respond_to_client(Respond).

%% 从其他玩家的进程组包回发给请求的玩家
async_send_player_hero_base(PlayerId, HeroId) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	case lib_hero_api:is_have_hero(HeroId) of
		true ->
			HeroBase = lib_hero_api:hero_base_info(HeroId),
			Res = #'Proto50111004'{
				hero_base = lib_hero_api:hero_base_to_proto(HeroBase)
			},
			lib_send:respond_to_client_by_pid(PlayerPid, Res);
		false ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_PLAYER_HERO_BASE, ?ERROR_HERO_NOT_EXISTENT)
	end
.

async_send_player_hero_base_by_db(PlayerId, HeroId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_HEROS, #{?BSONSET_INT(<<"id">>, PlayerId), ?BSONSET_INT(<<"hero_id">>, HeroId)}) of
		Bson = #{} ->
			Hero = db_player_hero:bson_to_hero(Bson),
			HeroBase = lib_hero_api:hero_to_hero_base(Hero),
			Respond = #'Proto50111004'{
				hero_base = lib_hero_api:hero_base_to_proto(HeroBase)
			},
			lib_send:respond_to_client(Respond);
		_ -> lib_send:respond_to_client(?MSG_RETURN_PLAYER_HERO_BASE, ?ERROR_HERO_NOT_EXISTENT)
	end
.

%% 获取玩家英雄信息
request_player_hero_base(Msg) ->
	PlayerId = Msg#'Proto10111004'.player_id,
	HeroId = Msg#'Proto10111004'.hero_id,
	case lib_player:player_id() of
		PlayerId -> async_send_player_hero_base(PlayerId, HeroId);
		SelfPlayerId ->
			case lib_player:is_player_process_alive(PlayerId) of
				true ->
					Pid = lib_player:get_pid(PlayerId),
					mod_server:async_apply(Pid, fun async_send_player_hero_base/2, [SelfPlayerId, HeroId]);
				false ->
					async_send_player_hero_base_by_db(PlayerId, HeroId)
			end
	end
.


