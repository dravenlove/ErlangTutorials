%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_backactivity_merge
%%% Created on : 2020/10/21 14:45
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_backactivity_merge).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

-define(BACKACT_ACT_INDEX_FIELD, <<"act_index">>).

%% API
-export([
	merge/0,
	merge_backactivity_active/1
]).

merge() ->
	lib_merge_mongo:sync_status(fun lib_backactivity_merge:merge_backactivity_active/1, []),
	ok.

merge_backactivity_active(State) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		slave = SlaveList
	} = State,
	lists:foreach(
		fun({SlaveMMO, _SlaveBack}) ->
			merge_slave_backactivity_active(maps:get(conn, MasterMMO), maps:get(conn, SlaveMMO))
		end, SlaveList),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
merge_slave_backactivity_active(MasterMMOConn, SlaveMMOConn) ->
	?INFO("combine backactivity_active: ~p", [SlaveMMOConn]),
	lists:foreach(
		fun(Bson) ->
			NewBson = maps:remove(<<"_id">>, Bson),
			ActIndex = ?BSON_INT(Bson, ?BACKACT_ACT_INDEX_FIELD),
			lib_merge_mongo:update(MasterMMOConn, ?DBBACKACTIVITY_ACTIVE,
				#{?BSONSET_INT(?BACKACT_ACT_INDEX_FIELD, ActIndex)},
				#{<<"$set">> => NewBson}, true, false)
		end, lib_merge_mongo:find(SlaveMMOConn, ?DBBACKACTIVITY_ACTIVE, #{}, 0, 0)).
