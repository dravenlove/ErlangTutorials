%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_function_open).
-author("13661").

-include("common.hrl").
-include("ProtoClient_10119.hrl").

%% API
-export([
	get_player_function_open/0,
	put_player_function_open/2,
	ets_init/0,
	build_index/0,
	player_function_open_handler/0
]).
-export([
	function_is_open/1, 	%% 功能是否开启
	open_function_list/0,	%% 已开启功能列表


	sign_in/0,
	check_function_open_or_close/0,
	notify_open_function_list/0
]).
-export([
	request_open_function_list/0
]).

get_player_function_open() ->
	erlang:get(?ETS_PLAYER_FUNCTION_OPEN)
.

put_player_function_open(PlayerFunctionOpen) when is_record(PlayerFunctionOpen, player_function_open) ->
	put_player_function_open(PlayerFunctionOpen, true)
.
put_player_function_open(PlayerFunctionOpen, IsSaveDb) when is_record(PlayerFunctionOpen, player_function_open) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_FUNCTION_OPEN),
	erlang:put(?ETS_PLAYER_FUNCTION_OPEN, PlayerFunctionOpen)
.

ets_init() ->
	ets:new(?ETS_PLAYER_FUNCTION_OPEN, [?ETS_KEY_POS(#player_function_open.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_FUNCTION_OPEN, {?TUPLE_INT(id, 1)}, true)
.

player_function_open_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_FUNCTION_OPEN,
		table_name = ?DBPLAYER_FUNCTION_OPEN,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_function_open:load_player_function_open/1,
		save_func = fun db_player_function_open:save_player_function_open/1,
		get_func = fun get_player_function_open/0,
		put_func = fun put_player_function_open/2
	}.

open_function_list()->
	Info = get_player_function_open(),
	dict:fold(fun(FunctionId, Function, List) ->
		case Function#function.function_is_open of
			false -> List;
			true -> [FunctionId | List]
		end
  	end, [], Info#player_function_open.function_dict)
.

function_info(FunctionId) ->
	Info = get_player_function_open(),
	?DICT_FETCH(FunctionId, Info#player_function_open.function_dict, #function{function_id = FunctionId})
.

update_function(Function) when is_record(Function, function) ->
	Info = get_player_function_open(),
	NewDict = dict:store(Function#function.function_id, Function, Info#player_function_open.function_dict),
	put_player_function_open(Info#player_function_open{function_dict = NewDict})
.

function_is_open(FunctionId) ->
	Info = get_player_function_open(),
	case dict:is_key(FunctionId,Info#player_function_open.function_dict) of
		true ->	Function = function_info(FunctionId),
			Function#function.function_is_open;
		false-> true
	end
.

sign_in() ->
	check_function_open_or_close(),
	notify_open_function_list()
.

check_function_open_or_close() ->
	FunctionIdList = tb_function_open:get_list(),
	Info = get_player_function_open(),
	lists:foreach(fun(FunctionId) ->
		case tb_function_open:get(FunctionId) of
			false ->
				FunctionInfo = get_player_function_open(),
				NewDict = dict:erase(FunctionId,FunctionInfo#player_function_open.function_dict),
				put_player_function_open(FunctionInfo#player_function_open{function_dict = NewDict});
			_ -> skip
		end
	end,dict:fetch_keys(Info#player_function_open.function_dict)),
	{NewOpenList, NewCloseList} =
	lists:foldl(fun(FunctionId, {OpenList, CloseList}) ->
		{IsUpdate, IsOpen} = check_function_open_or_close(FunctionId),
		case IsUpdate of
			false -> {OpenList, CloseList};
			true ->
				case IsOpen of
					false -> {OpenList, [FunctionId | CloseList]};
					true -> {[FunctionId | OpenList], CloseList}
				end
		end
	end, {[],[]}, FunctionIdList),
	notify_function_open(NewOpenList),
	notify_function_close(NewCloseList),

	lists:map(fun(FunctionId) -> process_function_open(FunctionId) end, NewOpenList),
	lists:map(fun(FunctionId) -> process_function_close(FunctionId) end, NewCloseList)
.
check_function_open_or_close(FunctionId) ->
	try
		Config = tb_function_open:get(FunctionId),
		?JUDGE_RETURN(Config =/= false, -1),

		CondType = maps:get(condition_type, Config, 0),
		?JUDGE_RETURN(CondType =/= 0, -1),

		IsOpen = check_function_is_open(CondType, FunctionId, Config),
		Function = function_info(FunctionId),
		OldIsOpen = Function#function.function_is_open,

		?JUDGE_RETURN(OldIsOpen =/= IsOpen, -1),
		update_function(Function#function{function_is_open = IsOpen}),
		case IsOpen of
			true -> lib_player_process:process_function_open(FunctionId);
			false -> lib_player_process:process_function_close(FunctionId)
		end,

		{true, IsOpen}
	catch
	    throw: {error, _} -> {false, false}
	end
.

check_function_is_open(?CONDITION_TYPE_ORELSE, _FunctionId, Config) ->
	try
		case maps:find(player_level, Config) of
			error -> skip;
			{ok, PlayerLevel} -> ?JUDGE_RETURN(lib_player:player_level() < PlayerLevel, true)
		end,
		case maps:find(season, Config) of
			error -> skip;
			{ok, Season} ->
				{CurSeason, _} = lib_season_api:season_info(),
				?JUDGE_RETURN(CurSeason =/= Season, true)
		end,
		case maps:find(knighthood, Config) of
			error -> skip;
			{ok, Knighthood} -> ?JUDGE_RETURN(lib_nobility_api:get_nobility() < Knighthood, true)
		end,
		case maps:find(privilege, Config) of
			error -> skip;
			{ok, Privilege} -> ?JUDGE_RETURN(not lib_nobility_api:is_open(Privilege), true)
		end,
		case maps:find(open_day, Config) of
			error -> skip;
			{ok, OpenDay} -> ?JUDGE_RETURN(config:get_open_days() < OpenDay, true)
		end,
		case maps:find(combine_day, Config) of
			error -> skip;
			{ok, CombineList} ->
				?JUDGE_RETURN(CombineList =/= [], true),
				CombineTimes = config:combine_time(),
				CombineDay = config:get_open_days(),
				case is_integer(hd(CombineList)) of
					true ->
						[T, D] = CombineList,
						?JUDGE_RETURN(CombineTimes < T orelse CombineDay < D, true);
					false ->
						List = lists:reverse(CombineList),
						?JUDGE_RETURN(CombineTimes =< hd(hd(List)), true),
						lists:foreach(
							fun([T, D]) ->
								?JUDGE_RETURN(CombineTimes =/= T orelse CombineDay < D, true)
							end, List)
				end
		end,
		false
	catch
	    throw: {error, IsOpen} -> IsOpen
	end
;
check_function_is_open(?CONDITION_TYPE_ANDALSO, _FunctionId, Config) ->
	try
		case maps:find(player_level, Config) of
			error -> skip;
			{ok, PlayerLevel} -> ?JUDGE_RETURN(lib_player:player_level() >= PlayerLevel, false)
		end,
		case maps:find(season, Config) of
			error -> skip;
			{ok, Season} ->
				{CurSeason, _} = lib_season_api:season_info(),
				?JUDGE_RETURN(CurSeason =:= Season, false)
		end,
		case maps:find(knighthood, Config) of
			error -> skip;
			{ok, Knighthood} -> ?JUDGE_RETURN(lib_nobility_api:get_nobility() >= Knighthood, false)
		end,
		case maps:find(privilege, Config) of
			error -> skip;
			{ok, Privilege} -> ?JUDGE_RETURN(lib_nobility_api:is_open(Privilege), false)
		end,
		case maps:find(open_day, Config) of
			error -> skip;
			{ok, OpenDay} -> ?JUDGE_RETURN(config:get_open_days() >= OpenDay, false)
		end,
		case maps:find(combine_day, Config) of
			error -> skip;
			{ok, CombineList} ->
				CombineTimes = config:combine_time(),
				CombineDay = config:get_open_days(),
				case CombineList of
					[] -> skip;
					_ ->
						case is_integer(hd(CombineList)) of
							true ->
								[T, D] = CombineList,
								?JUDGE_RETURN(CombineTimes >= T orelse CombineDay >= D, false);
							false ->
								List = lists:reverse(CombineList),
								case CombineTimes > hd(hd(List)) of
									true -> skip;
									false ->
										?JUDGE_RETURN(lists:any(
											fun([T, D]) ->
												CombineTimes =:= T andalso CombineDay >= D
											end, List), false)
								end
						end
				end
		end,
		true
	catch
	    throw: {error, IsOpen} -> IsOpen
	end
;
check_function_is_open(?CONDITION_TYPE_OPEN, _FunctionId, _Config) ->
	true
;
check_function_is_open(?CONDITION_TYPE_CLOSE, _FunctionId, _Config) ->
	false
.

process_function_open(FunctionId) ->
	lib_player_process:process_function_open(FunctionId)
.

process_function_close(FunctionId) ->
	lib_player_process:process_function_close(FunctionId)
.

notify_open_function_list() ->
	Notify = #'Proto80119001'{
		function_list = open_function_list()
	},
	lib_send:respond_to_client(Notify)
.

notify_function_open([]) ->
	skip
;
notify_function_open(FunctionIdList) ->
	Notify = #'Proto80119003'{
		function_list = FunctionIdList
	},
	lib_send:respond_to_client(Notify)
.

notify_function_close([]) ->
	skip
;
notify_function_close(FunctionIdList) ->
	Notify = #'Proto80119002'{
		function_list = FunctionIdList
	},
	lib_send:respond_to_client(Notify)
.

request_open_function_list() ->
	Respond = #'Proto50119001'{
		function_list = open_function_list()
	},
	lib_send:respond_to_client(Respond)
.