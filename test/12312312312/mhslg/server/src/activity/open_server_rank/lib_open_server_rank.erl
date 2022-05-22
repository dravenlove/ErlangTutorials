%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 8月 2021 10:50
%%%-------------------------------------------------------------------
-module(lib_open_server_rank).
-author("df").
-include("activity.hrl").
-include("task_new.hrl").
-include("common.hrl").
-define(MAIL_ID, 1025).
%% API
%% 活动进程
-export([
	index/0,

	get_map/1,
	get_player_info/2,
	get_task_info/3,

	put_map/2,
	put_player_info/3,
	put_task_info/4,

	activity_open_second/0,
	update_player_grade/4,

	timer_refresh_rank/0,
	rank_award/1,
	rank_award_mail/1,
	init_activity/1
]).
%% 功能进程调用
-export([
	mod_add_grade/4
]).

index() ->
	Activity = mod_activity:get_activity(),
	Activity#activity.conf_index
.

get_all_map() ->
	Activity = mod_activity:get_activity(),
	Activity#activity.data
.
get_map(Type) ->
	Map = get_all_map(),
	maps:get(Type,Map#activity_open_server.map,#open_server{type = Type})
.
get_player_info(Player_id,Type) ->
	Map = get_map(Type),
	maps:get(Player_id,Map#open_server.map,#open_server_rank{player_id = Player_id,task_map = get_init_task(Type)})
.
get_task_info(Player_id,Type,Task_id) ->
	Map = get_player_info(Player_id,Type),
	maps:get(Task_id,Map#open_server_rank.task_map,#open_server_task{task_id = Task_id})
.

put_all_map(Map) ->
	Activity = mod_activity:get_activity(),
	mod_activity:update_activity(Activity#activity{data = Map}, true)
.
put_map(Type,Info) when is_record(Info, open_server)->
	Map = get_all_map(),
	NewMap = maps:put(Type,Info,Map#activity_open_server.map),
	put_all_map(Map#activity_open_server{map = NewMap})
.
put_player_info(Player_id,Type,Info) when is_record(Info,open_server_rank)->
	Map = get_map(Type),
	NewMap = maps:put(Player_id,Info,Map#open_server.map),
	put_map(Type,Map#open_server{map = NewMap})
.
put_task_info(Player_id,Type,Task_id,Info) when is_record(Info,open_server_task) ->
	Map = get_player_info(Player_id,Type),
	NewMap = maps:put(Task_id,Info,Map#open_server_rank.task_map),
	put_player_info(Player_id,Type,Map#open_server_rank{task_map = NewMap})
.

get_init_task(Type) ->
	IndexMap = tb_open_server_task:get(index()),
	TaskMap = maps:get(Type,IndexMap),
	lists:foldl(fun(Key,Map) ->
		maps:put(Key,#open_server_task{task_id = Key,state = ?TASK_STATUS_UNDONE},Map)
	end,maps:new(),maps:keys(TaskMap))
.
activity_open_second() ->
	activity_open_second(lib_timer:unixtime())
.
activity_open_second(Tick) ->
	Activity = mod_activity:get_activity(),
	Tick - Activity#activity.start_tick
.

update_player_grade(PlayerShow,Type,Grade,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	case maps:is_key(Type,Map) of
		true -> update_grade(PlayerShow,Type,Grade,Tick);
		false-> skip
	end
.

sum_list(List,Value) ->
	lists:foldl(fun({_,Value1},Sum) ->
		Value1 + Sum
				end,0,lists:sublist(List,Value))
.

sum_list1(List,Value) ->
	lists:foldl(fun({_,Value1},Sum) ->
		case Value1 >= Value of
			true -> Sum + 1;
			false-> Sum
		end
	end,0,lists:sublist(List,Value))
.

update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_1,Lvl,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(?OPEN_SERVER_TASK_TYPE_1,Map),
	case Lvl >= maps:get(final_value,Conf) of
		true -> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_1,Lvl,Lvl,Tick,true);
		false-> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_1,Lvl,Lvl,Tick,false)
	end
;
update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_2,InfoList,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(?OPEN_SERVER_TASK_TYPE_2,Map),
	List = lists:ukeysort(2,[{HeroId,lists:sum(SkillLvList)}|| {HeroId,SkillLvList} <- InfoList]),
	Grade1 = sum_list(List,maps:get(assist_value,Conf)),
	case (Grade1 >= maps:get(final_value,Conf)) of
		true -> Grade2 = sum_list(List,maps:get(rank_count,Conf)),
				update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_2,Grade2,List,Tick,true);
		false-> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_2,0,List,Tick,false)

	end
;
update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_3,InfoList,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(?OPEN_SERVER_TASK_TYPE_3,Map),
	List = lists:ukeysort(2,[{HeroId,lists:sum(StageList)}|| {HeroId,StageList} <- InfoList]),
	Grade1 = sum_list(List,maps:get(assist_value,Conf)),
	case Grade1 >= maps:get(final_value,Conf)of
		true -> Grade2 = sum_list(List,maps:get(rank_count,Conf)),
				update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_3,Grade2,List,Tick,true);
		false-> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_3,0,List,Tick,false)

	end
;
update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_4,Rank,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(?OPEN_SERVER_TASK_TYPE_4,Map),
	case Rank =< maps:get(final_value,Conf) of
		true -> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_4,Rank,Rank,Tick,true);
		false-> update_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_4,Rank,Rank,Tick,false)
	end
;
update_grade(PlayerId,Type,Grade,Tick) ->
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(Type,Map),
	PlayerInfo = get_player_info(PlayerId,Type),
	NewRankGrade = PlayerInfo#open_server_rank.rank_grade + Grade,
	case NewRankGrade >= maps:get(final_value,Conf) of
		true -> update_grade(PlayerId,Type,NewRankGrade,Grade,Tick,true);
		false-> update_grade(PlayerId,Type,NewRankGrade,Grade,Tick,false)
	end
.

update_grade(PlayerId,Type,NewRankGrade,Info,Tick,Is_rank) ->
	?INFO("~p ~p ~p ~p ~p ~p ",[PlayerId,Type,NewRankGrade,Info,Tick,Is_rank]),
	update_task_grade(PlayerId,Type,Info),
	Map = tb_open_server_rank_open:get(index()),
	Conf = maps:get(Type,Map),
	Second = activity_open_second(),
	case Second >= maps:get(time,Conf) andalso Second < maps:get(award_day,Conf) of
		true -> update_rank_grade(PlayerId,Type,NewRankGrade,Tick,Is_rank);
		false-> ?INFO("不在排行累计时间内")
	end
.

update_rank_grade(PlayerId,Type,NewGrade,Tick,Is_rank) ->
	PlayerInfo = get_player_info(PlayerId,Type),
	case NewGrade =:= PlayerInfo#open_server_rank.rank_grade of
		true -> skip;
		false-> case Is_rank of
				   true -> Rank = case PlayerInfo#open_server_rank.rank =:= -1 of
									  true -> 0;
									  false-> PlayerInfo#open_server_rank.rank
								  end,
					   		put_player_info(PlayerId,Type,PlayerInfo#open_server_rank{rank_grade = NewGrade,tick = Tick,rank = Rank});
				   false-> put_player_info(PlayerId,Type,PlayerInfo#open_server_rank{rank_grade = NewGrade,tick = Tick,rank = -1})
				end
	end
.

update_task_grade(PlayerId,Type,Info) ->
	IndexMap = tb_open_server_task:get(index()),
	TaskMap = maps:get(Type,IndexMap),
	Task_id_list = maps:keys(TaskMap),
	%% 更新任务信息
	lists:foreach(fun(Task_id) ->
		TaskInfo = get_task_info(PlayerId,Type,Task_id),
		case TaskInfo#open_server_task.state =/= ?TASK_STATUS_UNDONE of
			true -> skip;
			false->
				TaskConf = maps:get(Task_id,TaskMap),
				Final_value = maps:get(final_value,TaskConf),
				Assist_value = maps:get(assist_value,TaskConf,0),
				{Task_grade,Stage} =
					if
						Type =:= ?OPEN_SERVER_TASK_TYPE_1  ->
							case Info >= Final_value of
								true -> {Final_value,?TASK_STATUS_FINISH};
								false -> {Info,?TASK_STATUS_UNDONE}
							end;
						Type =:= ?OPEN_SERVER_TASK_TYPE_2  ->
							Grade1 = sum_list1(Info,Final_value),
							case Grade1 >= Assist_value of
								true -> {Assist_value,?TASK_STATUS_FINISH};
								false -> {Grade1,?TASK_STATUS_UNDONE}
							end;
						Type =:= ?OPEN_SERVER_TASK_TYPE_3  ->
							Grade1 = sum_list1(Info,Final_value),
							case Grade1 >= Assist_value of
								true -> {Assist_value,?TASK_STATUS_FINISH};
								false -> {Grade1,?TASK_STATUS_UNDONE}
							end;
						Type =:= ?OPEN_SERVER_TASK_TYPE_4  ->
							case Info =< Final_value of
								true -> {Final_value,?TASK_STATUS_FINISH};
								false -> {Info,?TASK_STATUS_UNDONE}
							end;
						Type =:= ?OPEN_SERVER_TASK_TYPE_5 orelse Type =:= ?OPEN_SERVER_TASK_TYPE_6 ->
							Value = TaskInfo#open_server_task.task_grade + Info,
							case Value >= Final_value of
								true -> {Final_value,?TASK_STATUS_FINISH};
								false -> {Value,?TASK_STATUS_UNDONE}
							end
					end,
				put_task_info(PlayerId,Type,Task_id,TaskInfo#open_server_task{task_grade = Task_grade,state = Stage})
		end
	end,Task_id_list)
.

timer_refresh_rank() ->
	Map = tb_open_server_rank_open:get(index()),
	Second = activity_open_second(),
	lists:foreach(fun(Type) ->
		Conf = maps:get(Type,Map),
		case Second >= maps:get(rank_cunt_lift_time,Conf) andalso Second < maps:get(rank_cunt_right_time,Conf) of
			true -> ?INFO("refresh_rank  ~p",[Type]),refresh_rank(Type);
			false-> skip
		end
	end, maps:keys(Map))
.


refresh_rank(Type) ->
	TypeMap = get_map(Type),
	RankList0 = lists:filter(fun(Ranker) -> filter(Type, Ranker) end, maps:values(TypeMap#open_server.map)),
	RankerList1 = lists:sort(fun(L, R) -> compare(Type, L, R) end, RankList0),
	{_, RankerList2} =
	lists:foldl(fun(Ranker, {Rank, List}) ->
		{Rank + 1, [Ranker#open_server_rank{rank = Rank} | List]}
	end, {1, []}, RankerList1),
	RankerList3 = lists:reverse(RankerList2),
	NewRankerMap =
	lists:foldl(fun(Ranker, Map) ->
		maps:put(Ranker#open_server_rank.player_id, Ranker, Map)
	end, maps:new(), RankerList3),
	put_map(Type,TypeMap#open_server{map = NewRankerMap})
.

filter(_Type, Ranker) ->
	Ranker#open_server_rank.rank =/= -1 andalso Ranker#open_server_rank.rank_grade =/= 0
.

compare(?OPEN_SERVER_TASK_TYPE_4, L, R) ->
	try
		?JUDGE_RETURN(L#open_server_rank.rank_grade =:= R#open_server_rank.rank_grade, L#open_server_rank.rank_grade < R#open_server_rank.rank_grade),
		L#open_server_rank.tick < R#open_server_rank.tick
	catch
		throw: {error, Flag} -> Flag
	end;

compare(_, L, R) ->
	try
		?JUDGE_RETURN(L#open_server_rank.rank_grade =:= R#open_server_rank.rank_grade, L#open_server_rank.rank_grade > R#open_server_rank.rank_grade),
		L#open_server_rank.tick < R#open_server_rank.tick
	catch
		throw: {error, Flag} -> Flag
	end.

mod_add_grade(PlayerId,Type,Num,Tick) ->
	UidList = mod_activity_monitor:find_activity_uid_list(?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK),
	lists:foreach(fun(Uid) -> mod_server:async_apply(lib_player_open_server_rank:pid(Uid),fun update_player_grade/4 ,[PlayerId,Type,Num,Tick]) end,UidList)
.
rank_award(Tick) ->
	Conf = tb_open_server_rank_open:get(index()),
	Second = activity_open_second(Tick),
	lists:foreach(fun(Type) ->
			Award_day = maps:get(award_day,maps:get(Type,Conf)),
			Time = Award_day - Second,
		 	case Time < 0 of
				true -> skip;
				false->  erlang:send_after(Time * 1000, self(), {open_server_timer,Type})
			end
		end,maps:keys(Conf))
.

rank_award_mail(Type) ->
	RanKMap = get_map(Type),
	Conf = tb_open_server_rank_reward:get(index()),
	AwardConf = maps:get(Type,Conf),
	lists:foreach(fun(RankInfo) ->
		#open_server_rank{player_id = PlayerId,rank = Rank} = RankInfo,
		case Rank =:= 0 orelse Rank =:= -1 of
			true -> skip;
			false-> AwardInfo =
						try
							lists:foldl(fun(Info,Award)->
								case maps:get(rank_left,Info) =< Rank andalso maps:get(rank_right,Info) >= Rank of
									true -> throw({ok, maps:get(item_list,Info)});
									false-> Award
								end
							end,[],maps:values(AwardConf))
						catch
						    _:{ok,Award1}  -> Award1
						end ,
					case AwardInfo =:= [] of
						true -> skip;
						false-> lib_mail_api:fast_send_mail(PlayerId, ?MAIL_ID, [Rank],
							lib_item_api:conf_item_list_to_pack_item_list(AwardInfo), ?ADD_OPEN_SERVER_RANK)
					end
		end
	end,maps:values(RanKMap#open_server.map))
.

init_activity(Activity) ->
	Map = tb_open_server_rank_open:get(index()),
	Map1 =
	lists:foldl(fun(Type,MAP) ->
		maps:put(Type,#open_server{type = Type},MAP)
	end, maps:new(),maps:keys(Map)),
	NewData = #activity_open_server{map = Map1},
	mod_activity:update_activity(Activity#activity{data = NewData}, true)
.