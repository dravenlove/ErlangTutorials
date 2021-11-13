%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_chat_history
%%% Created on : 2020/8/10 0010 21:36
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_chat_history).
-author("glendy").
-include("common.hrl").
-include("chat.hrl").
-include("ProtoClient_10105.hrl").

%% API
-export([
	push_private_history_record/4,
	remove_private_history_expire/1,
	notify_private_history_when_login/2
]).

%%chatstate => #chat_state , chatmsg => #Proto80105002 ,ProtoShowid,PrivatePlayerId私聊id
push_private_history_record(ChatState, ChatMsg, ReqPlayerId, PrivatePlayerId) ->
	try
		#{value := HisFlag} = tb_const:get(private_chat_his),
		?JUDGE_RETURN(HisFlag > 0, -1),
		Bin = lib_msg:pack_to_bin(ChatMsg),
			?DEBUG("bin is ~p",[Bin]),
		#chat_state{
			private_history_map = PrivateHisMap
		} = ChatState,
		NewPrivateHisMap0 = put_private_history_record(ReqPlayerId, ChatMsg#'Proto80105002'.send_tick, Bin, PrivateHisMap),
		NewPrivateHisMap = put_private_history_record(PrivatePlayerId, ChatMsg#'Proto80105002'.send_tick, Bin, NewPrivateHisMap0),
		ChatState#chat_state{
			private_history_map = NewPrivateHisMap
		}
	catch
		throw:{error, _} -> ChatState
	end.

put_private_history_record(PlayerId, SendTick, Bin, PrivateHisMap) ->
	{OldestTick, BinList} = maps:get(PlayerId, PrivateHisMap, {SendTick, []}),
	maps:put(PlayerId, {OldestTick, [	#chat_record{
		send_tick = SendTick,
		msg_binary = Bin
	} | BinList]}, PrivateHisMap).

%% 删除超时的私聊内容
remove_private_history_expire(State) ->
	#chat_state{
		private_history_map = PrivateHisMap
	} = State,
	NewPrivateHisMap = remove_expired_private_history_map(PrivateHisMap),
	State#chat_state{private_history_map = NewPrivateHisMap}.

remove_expired_private_history_map(PrivateHisMap) ->
	try
		#{value:=PrivteHisSec} = tb_const:get(private_chat_his),
		?JUDGE_RETURN(PrivteHisSec > 0, -1),
		NowTick = lib_timer:unixtime(),
		maps:fold(
			fun(PlayerId, {OldestTick, HistoryList}, AccPrivateHisMap0) ->
				case (OldestTick + PrivteHisSec) =< NowTick andalso length(HistoryList) > 0 of
					true ->
						{NewOldestTick, NewHistoryList} = remove_history_record_list(PrivteHisSec, NowTick, lists:reverse(HistoryList)),
						if
							NewOldestTick =< 0 -> maps:remove(PlayerId, AccPrivateHisMap0);
							true -> maps:put(PlayerId, {NewOldestTick, NewHistoryList}, AccPrivateHisMap0)
						end;
					_ -> AccPrivateHisMap0
				end
			end, PrivateHisMap, PrivateHisMap)
	catch
		throw:{error, _} -> PrivateHisMap
	end.

remove_history_record_list(_HisSec, _NowTick, []) ->
	{0, []};
remove_history_record_list(HisTimeoutSec, NowTick, [Record | T] = OrgList) ->
	#chat_record{
		send_tick = SendTick
	} = Record,
	if
		(SendTick + HisTimeoutSec) > NowTick ->
			{SendTick, lists:reverse(OrgList)};
		true ->
			remove_history_record_list(HisTimeoutSec, NowTick, T)
	end.

notify_private_history_when_login(ChatPlayer, PrivateHisMap) ->
	try
		lib_timer:sleep(1000),
		#{value := PrivteHisSec} = tb_const:get(private_chat_his),
		?JUDGE_RETURN(PrivteHisSec > 0, -1),
		PlayerId = ChatPlayer#chat_player.id,
		Sid = ChatPlayer#chat_player.sid,
		{_, RecordList} = maps:get(PlayerId, PrivateHisMap, {0, []}),
		NowTick = lib_timer:unixtime(),
		BinList = record_list_to_bin_list(NowTick, PrivteHisSec, RecordList),
		notify_private_history(Sid, BinList),
		ok
	catch
	    throw:{error, _} -> ok
	end.

record_list_to_bin_list(NowTick, PrivteHisSec, RecordList) ->
	record_list_to_bin_list([], NowTick, PrivteHisSec, RecordList).
record_list_to_bin_list(BinList, _NowTick, _PrivteHisSec, []) ->
	BinList;
record_list_to_bin_list(BinList, NowTick, PrivteHisSec, [Record | T]) ->
	#chat_record{
		send_tick = SendTick,
		msg_binary = Bin
	} = Record,
	if
		SendTick + PrivteHisSec =< NowTick -> BinList;
		true ->
			record_list_to_bin_list([Bin | BinList], NowTick, PrivteHisSec, T)
	end.

notify_private_history(_Sid, []) ->
	ok;
notify_private_history(Sid, [Bin | T]) ->
	lib_send:channel_send_by_sid(Sid, Bin),
	notify_private_history(Sid, T).

