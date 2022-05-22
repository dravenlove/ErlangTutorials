%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_combat_queue.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_combat_queue).
-include("common.hrl").
-include("player.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10102.hrl").

-export([
	get_combat_queue/0,
	put_combat_queue/1,
	del_combat_detail/1,

	handle/0,
	fight_result/2,

	call_fight/2,
	new_combat_queue/3,
	init_combat_queue/3,
	join_combat_queue/4,
	join_combat_queue/2,
	quit_combat_queue/5,
	quit_combat_queue/3,
	quic_combat_queue/3,
	quic_combat_queue/1,
	restart_combat_queue/1,
	join_watching/2,
	quit_watching/2,
	request_rank/2,
	insert_combat_buff/3,
	remove_combat_buff/3
]).

get_combat_queue() ->
	erlang:get(?MODULE).
put_combat_queue(CombatQueue) ->
	erlang:put(?MODULE, CombatQueue).
get_combat_detail(CombatQueueId) ->
	CombatQueue = get_combat_queue(),
	dict:fetch(CombatQueueId, CombatQueue#combat_queue.queue_dict).
put_combat_detail(CombatQueueId, CombatDetail) ->
	CombatQueue = get_combat_queue(),
	CombatQueueDict = CombatQueue#combat_queue.queue_dict,
	put_combat_queue(CombatQueue#combat_queue{queue_dict = dict:store(CombatQueueId, CombatDetail, CombatQueueDict)}).
del_combat_detail(CombatQueueId) ->
	CombatQueue = get_combat_queue(),
	CombatQueueDict = CombatQueue#combat_queue.queue_dict,
	put_combat_queue(CombatQueue#combat_queue{queue_dict = dict:erase(CombatQueueId, CombatQueueDict)}).
get_node(CombatQueueId) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	CombatDetail#combat_queue_detail.node.
combat_queue_callback(CombatQueueId, CallbackData) ->
	mod_server:cast(get_node(CombatQueueId), {combat_queue_callback, CallbackData}).
add_combat_times(CombatQueueId) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	put_combat_detail(CombatQueueId,CombatDetail#combat_queue_detail{
		combat_times = CombatDetail#combat_queue_detail.combat_times + 1
	}).



handle() ->
	CombatQueue = get_combat_queue(),
	NowTick = lib_timer:unixtime(),
	dict:map(fun(CombatQueueId, CombatDetail) ->
		try
			?JUDGE_RETURN(not CombatDetail#combat_queue_detail.is_stop, 0),
			?JUDGE_RETURN(CombatDetail#combat_queue_detail.interval_type =/= ?INTERVAL_TYPE0, 0),
			?JUDGE_RETURN(CombatDetail#combat_queue_detail.combat_state =/= ?COMBAT_STATE1, 0),
			?JUDGE_RETURN(CombatDetail#combat_queue_detail.handle_tick =< NowTick, 0),
			LFighters = CombatDetail#combat_queue_detail.l_fighters,
			RFighters = CombatDetail#combat_queue_detail.r_fighters,
			case erlang:length(LFighters) =< 0 orelse erlang:length(RFighters) =< 0 of
				true ->
					queue_finish(CombatQueueId),throw(queue_finish);
				_ -> skip
			end,
			?INFO("mod_fight_manager:fight"),
			add_combat_times(CombatQueueId),
			mod_fight_manager:fight(get_combat_detail(CombatQueueId)),
			put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
				handle_tick = NowTick,
				combat_state = ?COMBAT_STATE1
			})
		catch
		    _:_  -> ok
		end
	end, CombatQueue#combat_queue.queue_dict).

fight_result(FightResult, ProtoDetail) ->
	try
		CombatQueueId = FightResult#fight_result.combat_id,
		drop_reward(CombatQueueId, FightResult),
		CombatDetail = get_combat_detail(CombatQueueId),
		FType = CombatDetail#combat_queue_detail.fight_type,
		{LHighest, LPlayerDict, LFighters, LLast} = lib_combat_queue_extra:handle_wastage(CombatDetail#combat_queue_detail.l_fighters,
			FightResult#fight_result.l_wastage, CombatDetail#combat_queue_detail.l_highest, CombatDetail#combat_queue_detail.l_player_dict, FType),
		{RHighest, RPlayerDict, RFighters, RLast} = lib_combat_queue_extra:handle_wastage(CombatDetail#combat_queue_detail.r_fighters,
			FightResult#fight_result.r_wastage, CombatDetail#combat_queue_detail.r_highest, CombatDetail#combat_queue_detail.r_player_dict, FType),

		Msg = parsing_proto_msg(CombatQueueId),
		Recogn = lib_msg:recogn_by_proto_msg(Msg#'Proto80102002'{fight_process = [ProtoDetail#'ProtoFightDetail'{start_tick = CombatDetail#combat_queue_detail.handle_tick}]}),
		Bin = lib_msg:pack_to_bin(Recogn, 0, Msg#'Proto80102002'{fight_process = [ProtoDetail#'ProtoFightDetail'{drop_id = CombatDetail#combat_queue_detail.drop_id}]}),
		put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
			handle_tick = lib_combat_queue_extra:fetch_handle_tick(CombatDetail, FightResult),
			combat_state = ?COMBAT_STATE2,
			l_last_role = LLast,
			l_highest = LHighest,
			l_player_dict = LPlayerDict,
			l_fighters = LFighters,
			r_last_role = RLast,
			r_fighters = RFighters,
			r_highest = RHighest,
			r_player_dict = RPlayerDict,
			drums = max(0, CombatDetail#combat_queue_detail.drums - 1),
			msg_bin = Bin
		}),
		update_win_times(CombatQueueId, FightResult),
		NewCombatDetail = get_combat_detail(CombatQueueId),
		combat_queue_callback(CombatQueueId, #combat_callback{
			combat_id = CombatQueueId,
			params = CombatDetail#combat_queue_detail.params,
			callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE2,
			callback_data = #callback_data2{
				drop_id = CombatDetail#combat_queue_detail.drop_id,
				fight_result = FightResult
			}
		}),
		notify_player(CombatQueueId),
		if
			NewCombatDetail#combat_queue_detail.drums > 0 ->
				mod_fight_manager:fight(NewCombatDetail),
				put_combat_detail(CombatQueueId, NewCombatDetail#combat_queue_detail{
					handle_tick = lib_timer:unixtime(),
					combat_state = ?COMBAT_STATE1
				});
			true -> ok
		end
	catch
	    _:Reason  -> ?DEBUG("~p ~p ~n", [Reason, erlang:get_stacktrace()])
	end.

new_combat_queue(CombatQueueId, ReqCombatQueue, CallBackModule) ->
	try
		CombatQueue = get_combat_queue(),
		CombatQueueDict = CombatQueue#combat_queue.queue_dict,
		?JUDGE_RETURN(dict:is_key(CombatQueueId, CombatQueueDict) == false, already_have_combat_queue),
		put_combat_queue(CombatQueue#combat_queue{queue_dict =
			dict:store(CombatQueueId, init_combat_queue(CombatQueueId, ReqCombatQueue, CallBackModule), CombatQueueDict)
		}),
		if
			ReqCombatQueue#req_combat_queue.interval_type =:= ?INTERVAL_TYPE0 ->
				CombatDetail = get_combat_detail(CombatQueueId),
				Data =
					try
						call_fight(CombatDetail)
					catch
					    _:Reason0  -> ?INFO("sync fight error ~p~n", [Reason0]), error
					end,
				combat_queue_callback(CombatQueueId, Data),
				?INFO("async call_fight finish"),
				del_combat_detail(CombatDetail#combat_queue_detail.combat_id);
			true ->
				combat_queue_callback(CombatQueueId, #combat_callback{
					combat_id = CombatQueueId,
					params = ReqCombatQueue#req_combat_queue.params,
					callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE1,
					callback_data = #callback_data1{
						count_down = ReqCombatQueue#req_combat_queue.count_down
					}
				})
		end
	catch
	    _:Reason  -> ?ERROR("start combat queue error Reason:~p CallBackModule:~p~n", [Reason, CallBackModule])
	end.
init_combat_queue(CombatQueueId, ReqCombatQueue, CallBackModule) ->
	{LHighest, LPlayerDict, LFighters, LLast} = lib_combat_queue_extra:parsing_fighters(ReqCombatQueue#req_combat_queue.l_fighters),
	{RHighest, RPlayerDict, RFighters, RLast} = lib_combat_queue_extra:parsing_fighters(ReqCombatQueue#req_combat_queue.r_fighters),
	#combat_queue_detail{
		combat_id = CombatQueueId,
		type = ReqCombatQueue#req_combat_queue.type,
		interval_type = ReqCombatQueue#req_combat_queue.interval_type,
		fight_type = ReqCombatQueue#req_combat_queue.fight_type,
		handle_tick = ReqCombatQueue#req_combat_queue.count_down + lib_timer:unixtime(),
		interval = ReqCombatQueue#req_combat_queue.interval,
		node = CallBackModule,
		l_country = ReqCombatQueue#req_combat_queue.l_country,
		l_buff_list = ReqCombatQueue#req_combat_queue.l_buff_list,
		l_last_role = LLast,
		l_highest = LHighest,
		l_player_dict = LPlayerDict,
		l_fighters = LFighters,
		r_country = ReqCombatQueue#req_combat_queue.r_country,
		r_buff_list = ReqCombatQueue#req_combat_queue.r_buff_list,
		r_last_role = RLast,
		r_fighters = RFighters,
		r_highest = RHighest,
		r_player_dict = RPlayerDict,
		params = ReqCombatQueue#req_combat_queue.params,
		drums_limit = ReqCombatQueue#req_combat_queue.drums_limit,
		save_record = ReqCombatQueue#req_combat_queue.save_record,
		have_drop = ReqCombatQueue#req_combat_queue.have_drop
	}.

join_combat_queue(CombatQueueId, Fighters, CallBackModule, Params) ->
	try
		lists:foreach(fun(Fighter) ->
			join_combat_queue(CombatQueueId, Fighter)
		end, lists:reverse(Fighters)),
		mod_server:cast(CallBackModule, {join_combat_queue_callback, [true | Params]})
	catch
		_:Reason -> ?ERROR("join combat queue error Reason:~p CallBackModule:~p~n", [Reason, CallBackModule]),
			mod_server:cast(CallBackModule, {join_combat_queue_callback, [false | Params]})
	end.
join_combat_queue(CombatQueueId, Fighter) ->
	CombatQueue = get_combat_queue(),
	CombatQueueDict = CombatQueue#combat_queue.queue_dict,
	?JUDGE_RETURN(dict:is_key(CombatQueueId, CombatQueueDict), no_found_combat_queue),
	%%?JUDGE_RETURN(PlayerShow#player_show.id =:= Fighter#combat_hero.id, no_found_combat_queue),
	CombatDetail = dict:fetch(CombatQueueId, CombatQueue#combat_queue.queue_dict),
	put_combat_queue(CombatQueue#combat_queue{
		queue_dict = dict:store(CombatQueueId, lib_combat_queue_extra:fighter_join(Fighter, CombatDetail), CombatQueueDict)
	}),
	HandleType = if Fighter#combat_hero.country =:= CombatDetail#combat_queue_detail.country ->
	?HANDLE_TYPE2; true -> ?HANDLE_TYPE1 end,
	combat_queue_callback(CombatQueueId, #combat_callback{
		combat_id = CombatQueueId,
		params = CombatDetail#combat_queue_detail.params,
		callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE4,
		callback_data = #callback_data4{
			handle_type = HandleType,
			hero = Fighter
		}
	}).

restart_combat_queue(CombatQueueId) ->
	Detail = get_combat_detail(CombatQueueId),
	put_combat_detail(CombatQueueId, Detail#combat_queue_detail{is_stop = false}).

quit_combat_queue(CombatQueueId, PlayerShow, HeroId, CallBackModule, Params) ->
	try
		quit_combat_queue(CombatQueueId, PlayerShow, HeroId),
		mod_server:cast(CallBackModule, {quit_combat_queue_callback, [true | Params]})
	catch
		_:Reason -> ?ERROR("quit combat queue error Reason:~p CallBackModule:~p~n", [Reason, CallBackModule]),
			mod_server:cast(CallBackModule, {quit_combat_queue_callback, [false | Params]})
	end.
quit_combat_queue(CombatQueueId, PlayerShow, HeroId) ->
	CombatQueue = get_combat_queue(),
	CombatQueueDict = CombatQueue#combat_queue.queue_dict,
	?JUDGE_RETURN(dict:is_key(CombatQueueId, CombatQueueDict), no_found_combat_queue),
	CombatDetail = dict:fetch(CombatQueueId, CombatQueue#combat_queue.queue_dict),
	put_combat_queue(CombatQueue#combat_queue{queue_dict = dict:store(CombatQueueId,
		lib_combat_queue_extra:fighter_quit(PlayerShow, HeroId, CombatDetail), CombatQueueDict)}),
	HandleType = if PlayerShow#player_show.country =:= CombatDetail#combat_queue_detail.country ->
	?HANDLE_TYPE2; true -> ?HANDLE_TYPE1 end,
	combat_queue_callback(CombatQueueId, #combat_callback{
		combat_id = CombatQueueId,
		params = CombatDetail#combat_queue_detail.params,
		callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE5,
		callback_data = #callback_data5{
			handle_type = HandleType,
			player_id = PlayerShow#player_show.id,
			hero_id = HeroId
		}
	}).

quic_combat_queue(CombatQueueId, CallBackModule, Params) ->
	try
		quic_combat_queue(CombatQueueId),
		mod_server:cast(CallBackModule, {quic_combat_queue_callback, [true | Params]})
	catch
		_:Reason -> ?ERROR("quic combat queue error Reason:~p CallBackModule:~p~n", [Reason, CallBackModule]),
			mod_server:cast(CallBackModule, {quic_combat_queue_callback, [false | Params]})
	end.
quic_combat_queue(CombatQueueId) ->
	CombatQueue = get_combat_queue(),
	CombatQueueDict = CombatQueue#combat_queue.queue_dict,
	?JUDGE_RETURN(dict:is_key(CombatQueueId, CombatQueueDict), no_found_combat_queue),
	CombatDetail = dict:fetch(CombatQueueId, CombatQueue#combat_queue.queue_dict),
	?JUDGE_RETURN(CombatDetail#combat_queue_detail.drums =:= 0, 0),
	?JUDGE_RETURN(erlang:length(CombatDetail#combat_queue_detail.r_fighters) >= CombatDetail#combat_queue_detail.drums_limit, 0),
	?JUDGE_RETURN(erlang:length(CombatDetail#combat_queue_detail.l_fighters) >= CombatDetail#combat_queue_detail.drums_limit, 0),
	put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
		drums = ?DRUMS_LIMIT_SIZE
	}).

insert_combat_buff(CombatQueueId, InsertType, BuffList) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	NewCombatDetail =
	case InsertType of
		?FIGHTER_TYPE_L ->
			CombatDetail#combat_queue_detail{
				l_buff_list = CombatDetail#combat_queue_detail.l_buff_list ++ BuffList
			};
		?FIGHTER_TYPE_R ->
			CombatDetail#combat_queue_detail{
				r_buff_list = CombatDetail#combat_queue_detail.r_buff_list ++ BuffList
			};
		_ ->
			CombatDetail
	end,
	put_combat_detail(CombatQueueId, NewCombatDetail).

remove_combat_buff(CombatQueueId, RemoveType, BuffList) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	NewCombatDetail =
		case RemoveType of
			?FIGHTER_TYPE_L ->
				List0 =
				lists:foldl(fun(RID0, Acc0) ->
					lists:delete(RID0, Acc0)
					end, CombatDetail#combat_queue_detail.l_buff_list, BuffList),
				CombatDetail#combat_queue_detail{
					l_buff_list = List0
				};
			?FIGHTER_TYPE_R ->
				List1 =
					lists:foldl(fun(RID1, Acc1) ->
						lists:delete(RID1, Acc1)
								end, CombatDetail#combat_queue_detail.r_buff_list, BuffList),
				CombatDetail#combat_queue_detail{
					l_buff_list = List1
				};
			_ ->
				CombatDetail
		end,
	put_combat_detail(CombatQueueId, NewCombatDetail).


join_watching(CombatQueueId, PlayerData) ->
	try
		CombatDetail = get_combat_detail(CombatQueueId),
		Flag = lists:keymember(PlayerData#watching_player.id, #watching_player.id, CombatDetail#combat_queue_detail.watching_players),
		if
			Flag =:= true -> skip;
			true -> put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
				watching_players = [PlayerData | CombatDetail#combat_queue_detail.watching_players]
			}),
			case CombatDetail#combat_queue_detail.msg_bin of
				undefined ->
					Msg = parsing_count_down_proto_msg(CombatQueueId),
					CountDown = max(1, CombatDetail#combat_queue_detail.handle_tick - lib_timer:unixtime()),
					lib_send:respond_to_player(PlayerData#watching_player.id, Msg#'Proto80102002'{count_down = CountDown});
				_ ->
					lib_send:send_by_sid(lib_player:get_pid(PlayerData#watching_player.id), CombatDetail#combat_queue_detail.msg_bin)
			end,
			lib_send:respond_to_player(PlayerData#watching_player.id, lib_combat_queue_extra:serialize_highest_msg(CombatDetail))
		end
	catch
	    _:_  -> ?INFO("~p~n", [erlang:get_stacktrace()]),ok
	end.

quit_watching(CombatQueueId, PlayerId) ->
	try
		CombatDetail = get_combat_detail(CombatQueueId),
		put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
			watching_players = lists:keydelete(PlayerId, #watching_player.id, CombatDetail#combat_queue_detail.watching_players)
		})
	catch
		_:_  -> ok
	end.

notify_player(CombatQueueId) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	PlayerList = CombatDetail#combat_queue_detail.watching_players,
	NewPlayerList =
	lists:foldl(fun(Player, Acc) ->
		PlayerPid = lib_player:get_pid(Player#watching_player.id),
		case erlang:is_pid(PlayerPid) andalso erlang:is_process_alive(PlayerPid) of
			true ->
				lib_send:send_by_sid(Player#watching_player.sid, CombatDetail#combat_queue_detail.msg_bin),
				lib_send:respond_to_player(Player#watching_player.id, lib_combat_queue_extra:serialize_highest_msg(CombatDetail)),
				[Player | Acc];
			_ ->
				Acc
		end
	end, [], PlayerList),
	put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{watching_players = NewPlayerList}).

notify_finish(CombatDetail) ->
	PlayerList = CombatDetail#combat_queue_detail.watching_players,
	LFighters = CombatDetail#combat_queue_detail.l_fighters,
	WinType = case erlang:length(LFighters) =< 0 of true -> ?FIGHTER_TYPE_L; _ -> ?FIGHTER_TYPE_R end,
	ResultMsg = #'Proto80102007'{win_type = WinType, type = CombatDetail#combat_queue_detail.type},
	lists:foreach(fun(Player) ->
		lib_send:respond_to_player(Player#watching_player.id, ResultMsg)
	end, PlayerList).

queue_finish(CombatQueueId) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	?INFO("combat queue finish"),
	notify_finish(CombatDetail),
	LFighters = CombatDetail#combat_queue_detail.l_fighters,
	WinType = case erlang:length(LFighters) > 0 of true -> ?FIGHTER_TYPE_L; _ -> ?FIGHTER_TYPE_R end,
	combat_queue_callback(CombatQueueId, #combat_callback{
		combat_id = CombatQueueId,
		params = CombatDetail#combat_queue_detail.params,
		callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE3,
		callback_data = #callback_data3{
			win_type = WinType,
			drop_map = CombatDetail#combat_queue_detail.drop_map
		}
	}),
	del_combat_detail(CombatDetail#combat_queue_detail.combat_id).

parsing_proto_msg(CombatQueueId) when is_integer(CombatQueueId)->
	CombatDetail = get_combat_detail(CombatQueueId),
	parsing_proto_msg(CombatDetail);
parsing_proto_msg(CombatDetail) ->
	#'Proto80102002'{
		combat_id = CombatDetail#combat_queue_detail.combat_id,
		type = CombatDetail#combat_queue_detail.type,
		country = CombatDetail#combat_queue_detail.country,
		l_country = CombatDetail#combat_queue_detail.l_country,
		r_country = CombatDetail#combat_queue_detail.r_country,
		fight_process = [],
		drop_map = lib_combat_queue_extra:drop_map_to_proto(CombatDetail#combat_queue_detail.drop_map)
	}.
parsing_count_down_proto_msg(CombatQueueId) when is_integer(CombatQueueId)->
	CombatDetail = get_combat_detail(CombatQueueId),
	parsing_count_down_proto_msg(CombatDetail);
parsing_count_down_proto_msg(CombatDetail) ->
	ProcessProto = #'ProtoFightDetail'{
		combat_times = 0,
		l_size = erlang:length(CombatDetail#combat_queue_detail.l_fighters),
		r_size = erlang:length(CombatDetail#combat_queue_detail.r_fighters),
		l_fighters = lib_fight_parsing:fighters_to_proto(CombatDetail#combat_queue_detail.l_fighters),
		r_fighters = lib_fight_parsing:fighters_to_proto(CombatDetail#combat_queue_detail.r_fighters),
		fight = [],
		start_tick = CombatDetail#combat_queue_detail.handle_tick
	},
	#'Proto80102002'{
		combat_id = CombatDetail#combat_queue_detail.combat_id,
		type = CombatDetail#combat_queue_detail.type,
		country = CombatDetail#combat_queue_detail.country,
		l_country = CombatDetail#combat_queue_detail.l_country,
		r_country = CombatDetail#combat_queue_detail.r_country,
		fight_process = [ProcessProto],
		drop_map = lib_combat_queue_extra:drop_map_to_proto(CombatDetail#combat_queue_detail.drop_map)
	}.

update_win_times(CombatQueueId, Result) ->
	CombatDetail = get_combat_detail(CombatQueueId),
	{LWin, RWin} =
		case Result#fight_result.win_type of
			?FIGHTER_TYPE_L ->
				{CombatDetail#combat_queue_detail.l_win_times + 1, CombatDetail#combat_queue_detail.r_win_times};
			?FIGHTER_TYPE_R ->
				{CombatDetail#combat_queue_detail.l_win_times, CombatDetail#combat_queue_detail.r_win_times + 1};
			_ ->
				{CombatDetail#combat_queue_detail.l_win_times, CombatDetail#combat_queue_detail.r_win_times}
		end,
	put_combat_detail(CombatQueueId, CombatDetail#combat_queue_detail{
		l_win_times = LWin,
		r_win_times = RWin
	}).



call_fight(ReqCombatQueue, CallBackModule) ->
	CombatDetail = init_combat_queue(0, ReqCombatQueue, CallBackModule),
	call_fight(CombatDetail).
call_fight(CombatDetail) ->
	Msg = parsing_proto_msg(CombatDetail),
	start_call_fight(CombatDetail, Msg, []).

start_call_fight(CombatDetail0, Msg, ResultList) ->
	CombatDetail = CombatDetail0#combat_queue_detail{combat_times = CombatDetail0#combat_queue_detail.combat_times + 1},
	LSize = erlang:length(CombatDetail#combat_queue_detail.l_fighters),
	RSize = erlang:length(CombatDetail#combat_queue_detail.r_fighters),
	case LSize > 0 andalso RSize > 0 of
		true ->
			{Result, Proto} = mod_fight_manager:fight(CombatDetail, sync),
			NewCombatDetail = handle_call_result(drop_reward(CombatDetail, Result), Result),
			NewMsg = Msg#'Proto80102002'{fight_process = lists:append(Msg#'Proto80102002'.fight_process,
				[Proto#'ProtoFightDetail'{drop_id = NewCombatDetail#combat_queue_detail.drop_id,start_tick = CombatDetail#combat_queue_detail.handle_tick}])},
			start_call_fight(NewCombatDetail, NewMsg, [Result | ResultList]);
		_ ->
			{CombatDetail1, ResultList1, WinType} =
			if
				LSize > 0 ->
					List =
					case CombatDetail#combat_queue_detail.fight_type of
						?FIGHT_TYPE1 ->
							[];
						?FIGHT_TYPE2 ->
							CombatDetail#combat_queue_detail.l_fighters
					end,
					List1 =
					lists:foldl(fun(F, Acc) ->
						LFormer = F#combat_hero.former,
						LLatter = F#combat_hero.latter,
						lists:append(Acc, [#fight_result{
							win_type = ?FIGHTER_TYPE_L,
							r_wastage = false,
							l_wastage = #fight_wastage{
								fighter = F,
								is_win = true,
								start_front = LFormer#combat_army.cur_troops,
								start_back = LLatter#combat_army.cur_troops,
								over_back = LLatter#combat_army.cur_troops,
								over_front = LFormer#combat_army.cur_troops}
						}])
					end, ResultList, List),
					LWinTimes = CombatDetail#combat_queue_detail.l_win_times + LSize,
					RWinTimes = CombatDetail#combat_queue_detail.r_win_times,
					{List2, Type} =
					case CombatDetail#combat_queue_detail.fight_type of
						?FIGHT_TYPE1 ->
							{ResultList, ?FIGHTER_TYPE_L};
						?FIGHT_TYPE2 ->
							{List1, get_win_type(CombatDetail#combat_queue_detail.fight_type, LWinTimes, RWinTimes, ?FIGHTER_TYPE_L)}
							%%{List1, case LWinTimes >= RWinTimes of true -> ?FIGHTER_TYPE_L; _ -> ?FIGHTER_TYPE_R end}
					end,
					{CombatDetail#combat_queue_detail{l_win_times = LWinTimes}, List2, Type};
				RSize > 0 ->
					List =
					case CombatDetail#combat_queue_detail.fight_type of
						?FIGHT_TYPE1 ->
							[];
						?FIGHT_TYPE2 ->
							CombatDetail#combat_queue_detail.r_fighters
					end,
					List1 =
					lists:foldl(fun(F, Acc) ->
						LFormer = F#combat_hero.former,
						LLatter = F#combat_hero.latter,
						lists:append(Acc, [#fight_result{
							win_type = ?FIGHTER_TYPE_R,
							l_wastage = false,
							r_wastage = #fight_wastage{
								fighter = F,
								is_win = true,
								start_front = LFormer#combat_army.cur_troops,
								start_back = LLatter#combat_army.cur_troops,
								over_back = LLatter#combat_army.cur_troops,
								over_front = LFormer#combat_army.cur_troops}
						}])
					end, ResultList, List),
					LWinTimes = CombatDetail#combat_queue_detail.l_win_times,
					RWinTimes = CombatDetail#combat_queue_detail.r_win_times + RSize,
					{List2, Type} =
					case CombatDetail#combat_queue_detail.fight_type of
						?FIGHT_TYPE1 ->
							{ResultList, ?FIGHTER_TYPE_R};
						?FIGHT_TYPE2 ->
							{List1, get_win_type(CombatDetail#combat_queue_detail.fight_type, LWinTimes, RWinTimes, ?FIGHTER_TYPE_R)}
							%%{List1, case LWinTimes >= RWinTimes of true -> ?FIGHTER_TYPE_L; _ -> ?FIGHTER_TYPE_R end}
					end,
					{CombatDetail#combat_queue_detail{r_win_times = RWinTimes}, List2, Type};
				true ->
					LWinTimes = CombatDetail#combat_queue_detail.l_win_times,
					RWinTimes = CombatDetail#combat_queue_detail.r_win_times,
					{CombatDetail,ResultList,get_win_type(LWinTimes, RWinTimes)}
			end,
			ResultProto = lib_combat_queue_extra:fight_result_list_to_proto(ResultList1),
			ResultMsg = #'Proto80102007'{result = ResultProto, type = CombatDetail#combat_queue_detail.type},
			Data = #callback_data0{
				win_type = WinType,
				msg = Msg,
				result_msg = ResultMsg#'Proto80102007'{win_type = WinType},
				l_win_times = CombatDetail1#combat_queue_detail.l_win_times,
				r_win_times = CombatDetail1#combat_queue_detail.r_win_times,
				fight_result = lists:reverse(ResultList1),
				drop_map = CombatDetail1#combat_queue_detail.drop_map
			},
			%%todo
			[L|_] = dict:fetch_keys(CombatDetail#combat_queue_detail.l_player_dict),
			[R|_] = dict:fetch_keys(CombatDetail#combat_queue_detail.r_player_dict),
			RecordId = save_record(L,R,CombatDetail1#combat_queue_detail.save_record, CombatDetail1#combat_queue_detail.type, Data),
%%			?INFO("~p~n", [RecordId]),
			#combat_callback{
				combat_id = CombatDetail#combat_queue_detail.combat_id,
				params = CombatDetail#combat_queue_detail.params,
				callback_type = ?COMBAT_QUEUE_CALLBACK_TYPE0,
				callback_data = Data#callback_data0{record_id = RecordId}
			}
	end.

handle_call_result(CombatDetail, Result) ->
	[LFighter | LFighters0] = CombatDetail#combat_queue_detail.l_fighters,
	LFighters = case is_list(LFighters0) of true -> LFighters0; _ -> [] end,
	LWastage = Result#fight_result.l_wastage,
	LF = LFighter#combat_hero.former,
	LB = LFighter#combat_hero.latter,
	LFighter1 = LFighter#combat_hero{
		former = LF#combat_army{cur_troops = min(LF#combat_army.troops, LWastage#fight_wastage.over_front)},
		latter = LB#combat_army{cur_troops = min(LB#combat_army.troops, LWastage#fight_wastage.over_back)}
	},
	NewLFighters =
	case lib_combat_queue_extra:is_die(LFighter1) of
		true ->
			LFighters;
		_ ->
			case CombatDetail#combat_queue_detail.fight_type of
				?FIGHT_TYPE1 -> lists:append(LFighters, [LFighter1]);
				?FIGHT_TYPE2 -> LFighters
			end
	end,

	[RFighter | RFighters0] = CombatDetail#combat_queue_detail.r_fighters,
	RFighters = case is_list(RFighters0) of true -> RFighters0; _ -> [] end,
	RWastage = Result#fight_result.r_wastage,
	RF = RFighter#combat_hero.former,
	RB = RFighter#combat_hero.latter,
	RFighter1 = RFighter#combat_hero{
		former = RF#combat_army{cur_troops = min(RF#combat_army.troops, RWastage#fight_wastage.over_front)},
		latter = RB#combat_army{cur_troops = min(RB#combat_army.troops, RWastage#fight_wastage.over_back)}
	},
	NewRFighters =
	case lib_combat_queue_extra:is_die(RFighter1) of
		true ->
			RFighters;
		_ ->
			case CombatDetail#combat_queue_detail.fight_type of
				?FIGHT_TYPE1 -> lists:append(RFighters, [RFighter1]);
				?FIGHT_TYPE2 -> RFighters
			end
	end,

	{LWin, RWin} =
	case Result#fight_result.win_type of
		?FIGHTER_TYPE_L ->
			{CombatDetail#combat_queue_detail.l_win_times + 1, CombatDetail#combat_queue_detail.r_win_times};
		?FIGHTER_TYPE_R ->
			{CombatDetail#combat_queue_detail.l_win_times, CombatDetail#combat_queue_detail.r_win_times + 1};
		_ ->
			{CombatDetail#combat_queue_detail.l_win_times, CombatDetail#combat_queue_detail.r_win_times}
	end,

	CombatDetail#combat_queue_detail{
		l_fighters = NewLFighters,
		r_fighters = NewRFighters,
		l_win_times = LWin,
		r_win_times = RWin
	}.

get_win_type(FightType, LTimes, RTimes, Type) ->
	case FightType of
		?FIGHT_TYPE1 -> Type;
		?FIGHT_TYPE2 -> get_win_type(LTimes, RTimes)
	end.
get_win_type(LTimes, RTimes) ->
	if
		LTimes =:= RTimes -> ?FIGHTER_TYPE_C;
		LTimes > RTimes -> ?FIGHTER_TYPE_L;
		true -> ?FIGHTER_TYPE_R
	end.

save_record(L,_R,Flag, Type, Data) ->
 case Flag orelse config:server_type() =:= ?SERVER_TYPE_TEST orelse config:server_flag() =:= "slg001" of
	 true ->
		 Id = db_fight:save_fight_record(Data, Type),
		 case config:server_type() =:= ?SERVER_TYPE_TEST of
			 true ->
				 try
					 lib_test_command:debug_string(io_lib:format("record id : ~p~n", [Id]))
				 catch
					 _:_  -> ok
				 end;
			 _ ->
				 skip
		 end,
		 case (config:server_flag() =:= "slg001" andalso not Flag) orelse config:server_type() =:= ?SERVER_TYPE_TEST of
			 true -> ?INFO("save_fight_record "),lib_player_process:save_player_fight(L,Id,Type);
			 false-> skip
		 end,
		 Id;
	 _ ->
		 0
 end.
%% todo
%%save_record(Flag, Type, Data) ->
%%	case Flag orelse config:server_type() =:= ?SERVER_TYPE_TEST of
%%		true ->
%%			Id = db_fight:save_fight_record(Data, Type),
%%			case config:server_type() =:= ?SERVER_TYPE_TEST of
%%				true ->
%%					try
%%						lib_test_command:debug_string(io_lib:format("record id : ~p~n", [Id]))
%%					catch
%%						_:_  -> ok
%%					end;
%%				_ ->
%%					skip
%%			end,
%%			Id;
%%		_ ->
%%			0
%%	end.

request_rank(CombatQueueId, PlayerId) ->
	try
		CombatDetail = get_combat_detail(CombatQueueId),
		ProtoList = combat_rank_to_proto(CombatDetail#combat_queue_detail.combat_rank),
		lib_send:respond_to_player(PlayerId, #'Proto50102006'{rank_list = ProtoList})
	catch
		_:_  -> ok
	end.

combat_rank_to_proto(CombatRank) ->
	lists:foldl(fun(Ranker, Acc) ->
		[#'ProtoFightRank'{
			id = Ranker#rank_detail.id,
			country = Ranker#rank_detail.country,
			name = Ranker#rank_detail.name,
			kills = Ranker#rank_detail.kills
		} | Acc]
	end, [], CombatRank).

drop_reward(CombatDetail, FightResult) when is_record(CombatDetail, combat_queue_detail)->
	try
		?JUDGE_RETURN(CombatDetail#combat_queue_detail.have_drop, 0),
		drop_reward(CombatDetail#combat_queue_detail.type, CombatDetail, FightResult)
	catch
		_:_  -> CombatDetail#combat_queue_detail{drop_id = 0}
	end;
drop_reward(CombatQueueId, FightResult) ->
	try
		CombatDetail = get_combat_detail(CombatQueueId),
		?JUDGE_RETURN(CombatDetail#combat_queue_detail.have_drop, 0),
		put_combat_detail(CombatQueueId, drop_reward(CombatDetail#combat_queue_detail.type, CombatDetail, FightResult))
	catch
	    _:_  ->
			CombatDetail0 = get_combat_detail(CombatQueueId),
			put_combat_detail(CombatQueueId, CombatDetail0#combat_queue_detail{drop_id = 0})
	end.

drop_reward(?CALL_FIGHT_TYPE_DUNGEONED, CombatDetail, FightResult) ->
	NewCombatDetail = lib_dungeoned:assist_drop_map(CombatDetail),
	PlayerId = FightResult#fight_result.l_wastage#fight_wastage.fighter#combat_hero.id,
	DropId = lib_dungeoned:get_drop_id(PlayerId, NewCombatDetail),
	?INFO("DropId ~p",[DropId]),
	lib_combat_queue_extra:add_drop_id(PlayerId, DropId, NewCombatDetail);
drop_reward(_, CombatDetail, _) ->
	CombatDetail.