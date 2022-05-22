%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_mailoffline_merge
%%% Created on : 2020/10/21 14:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_mailoffline_merge).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

-define(MAIL_SEND_TICK_FIELD, <<"send_tick">>).

%% API
-export([
	merge/0,
	merge_mailoffline/1
]).

merge() ->
	lib_merge_mongo:sync_status(fun lib_mailoffline_merge:merge_mailoffline/1, []),
	ok.

merge_mailoffline(State) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		slave = SlaveList
	} = State,
	lists:foreach(
		fun({SlaveMMO, _SlaveBack}) ->
			merge_slave_mailoffline(maps:get(conn, MasterMMO), maps:get(conn, SlaveMMO))
		end, SlaveList),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%
merge_slave_mailoffline(MasterMMOConn, SlaveMMOConn) ->
	NowTick = lib_timer:unixtime(),
	PrevMonthTick = NowTick - lib_timer:day_second() * 30,
	?INFO("combine mailoffline: ~p ~p", [PrevMonthTick, SlaveMMOConn]),
	lists:foreach(
		fun(Bson) ->
			NewBson = maps:remove(<<"_id">>, Bson),
			lib_merge_mongo:insert(MasterMMOConn, ?DBMAILOFFLINE, NewBson)
		end, lib_merge_mongo:find(SlaveMMOConn, ?DBMAILOFFLINE, #{?MAIL_SEND_TICK_FIELD => #{<<"$gt">> => PrevMonthTick}}, 0, 0)).
