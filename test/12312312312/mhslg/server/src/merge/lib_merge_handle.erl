%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_merge_handle
%%% Created on : 2020/10/16 17:15
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_merge_handle).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

%% API
-export([
	is_clear_master/0,
	is_remove_slave/0,
	is_merge/0,
	is_copy_person/0,
	batchsize/0,
	run/0,
	clear_master_db/1
]).

is_clear_master() ->
	config:is_clear_master().

is_remove_slave() ->
	config:is_remove_slave().

is_merge() ->
	config:is_merge().

is_copy_person() ->
	config:is_copy_person().

batchsize() ->
	config:merge_batchsize().

run() ->
	ets:new(?ETS_PLAYER_RENAME, [?ETS_KEY_POS(#player_rename.id) | ?ETS_OPTIONS]),
	ets:new(?ETS_PLAYER_NAME_COUNT, ?ETS_OPTIONS_KEYPOS1),
	ets:new(?ETS_LEAGUE_RENAME, [?ETS_KEY_POS(#league_rename.id) | ?ETS_OPTIONS]),
	ets:new(?ETS_LEAGUE_NAME_COUNT, ?ETS_OPTIONS_KEYPOS1),
	mod_merge_mongodb:start(),
	?INFO("is clear master: ~p", [is_clear_master()]),
	case is_clear_master() of
		true -> clear_master_db();
		_ -> skip
	end,
	lib_mongodb:build_index(),
	case is_merge() of
		true -> merge();
		_ -> skip
	end,
	case is_copy_person() of
		true -> copy_players();
		_ -> skip
	end,
	?INFO("finish all merge"),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 清除主库
clear_master_db() ->
	lib_merge_mongo:sync_status(fun lib_merge_handle:clear_master_db/1, []),
	ok.
clear_master_db(State) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		master_backstage = MasterBack
	} = State,
	lib_merge_mongo:dropDatabase(maps:get(conn, MasterMMO)),
	lib_merge_mongo:dropDatabase(maps:get(conn, MasterBack)).

%% 复制玩家操作
copy_players() ->
	lists:foreach(
		fun(PlayerIdStr) ->
			PlayerId = lib_types:to_integer(PlayerIdStr),
			lib_merge_mongo:sync_status(fun lib_player_merge:copy_players/2, [PlayerId])
		end, config:copy_players()),
	ok.

%% 合服操作
merge() ->
	lib_player_merge:merge(),
	lib_league_merge:merge(),
	lib_serverinfo_merge:merge(),
	lib_backactivity_merge:merge(),
	lib_mailoffline_merge:merge(),
	ok.
