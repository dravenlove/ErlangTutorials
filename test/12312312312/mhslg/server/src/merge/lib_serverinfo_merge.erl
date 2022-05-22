%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_serverinfo_merge
%%% Created on : 2020/10/21 14:51
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_serverinfo_merge).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

-define(SERVER_FLAG_FIELD, <<"server_flag">>).

%% API
-export([
	merge/0,
	merge_server_info/1
]).

merge() ->
	lib_merge_mongo:sync_status(fun lib_serverinfo_merge:merge_server_info/1, []),
	ok.

merge_server_info(State) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		slave = SlaveList
	} = State,
	lists:foreach(
		fun({SlaveMMO, _SlaveBack}) ->
			merge_slave_server_info(maps:get(conn, MasterMMO), maps:get(conn, SlaveMMO))
		end, SlaveList),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
merge_slave_server_info(MasterMMOConn, SlaveMMOConn) ->
	?INFO("combine server_info: ~p", [SlaveMMOConn]),
	lists:foreach(
		fun(Bson) ->
			NewBson = maps:remove(<<"_id">>, Bson),
			ServerFlag = ?BSON_STRING(Bson, ?SERVER_FLAG_FIELD),
			lib_merge_mongo:update(MasterMMOConn, ?DBSERVER_INFO,
				#{?BSONSET_STRING(?SERVER_FLAG_FIELD, ServerFlag)},
				#{<<"$set">> => NewBson}, true, false)
		end, lib_merge_mongo:find(SlaveMMOConn, ?DBSERVER_INFO, #{}, 0, 0)).
