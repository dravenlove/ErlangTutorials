%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2021 7:47 PM
%%%-------------------------------------------------------------------
-module(lib_player_block).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("troop.hrl").
-include("ProtoClient_10154.hrl").

%% API
-export([
	sign_in/0,
	sign_out/0,
	request_block_view/1,
	notice_troop_info/1,
	notice_troop_vanish/1

]).

-define(BLOCK_VIEW,	block_view).

sign_in() ->
	put(?BLOCK_VIEW, [])
.
sign_out() ->
	DelBlockList = get(?BLOCK_VIEW),
	SelfPid = self(),
	[
		begin
			Pid = lib_block:pid(Block),
			mod_server:cast(Pid, {?PLAYER_DEL_VIEW, SelfPid})
		end || Block <- DelBlockList]
.
request_block_view(Msg) ->
	BlockList = Msg#'Proto10154001'.block_list,
	NewBlockList = lib_api:list_del_excess(BlockList),
	OldBlockList = get(?BLOCK_VIEW),
	AddBlockList = NewBlockList -- OldBlockList,
	DelBlockList = OldBlockList -- NewBlockList,
	SelfPid = self(),
	[
		begin
			Pid = lib_block:pid(Block),
			mod_server:cast(Pid, {?PLAYER_ADD_VIEW, SelfPid})
		end || Block <- AddBlockList],
	[
		begin
			Pid = lib_block:pid(Block),
			mod_server:cast(Pid, {?PLAYER_DEL_VIEW, SelfPid})
		end || Block <- DelBlockList],
	lib_send:respond_to_client(?MSG_RETURN_BLOCK_VIEW)
.

notice_troop_info(Troop) when is_record(Troop, troop) ->
	ProtoTroopList = [lib_player_troop:to_proto(Troop)],
	send_notice(ProtoTroopList)
;
notice_troop_info(TroopInfo) ->
	TroopList = maps:values(TroopInfo),
	ProtoTroopList = [lib_player_troop:to_proto(Troop) || Troop <- TroopList],
	send_notice(ProtoTroopList)
.
send_notice(ProtoTroopList) ->
	Respond = #'Proto80154002'{
		troop_list = ProtoTroopList
	},
%%	?DEBUG("info ~p", [Respond]),
	lib_send:respond_to_client(Respond)
.

notice_troop_vanish(TroopId) ->
	Respond = #'Proto80154003'{
		player_id = ?PLAYER_ID(TroopId),
		hero_id = ?HERO_ID(TroopId)
	},
%%	?DEBUG("vanish ~p", [Respond]),
	lib_send:respond_to_client(Respond)
.