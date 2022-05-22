%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 8月 2021 10:52
%%%-------------------------------------------------------------------
-module(lib_player_open_server_rank).
-author("df").
-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").
-include("ProtoClient_10156.hrl").
-include("ProtoPublic.hrl").
-include("hero.hrl").
-include("hero_skill.hrl").


%% API
-export([
	pid/1,
	async/2,
	async/3,

	request_interface_info/1,
	request_rank_info/1,
	request_task_info/1,
	get_task_award/1,
	get_open_server_box/1,

	refresh_day_award/1,
	update_player_grade/2,
	tips/2,
	sign_in/0
]).

pid(UID)->
	lib_activity_api:get_pid(UID)
.

async(UID,Fun) ->
	mod_server:async_apply(pid(UID), Fun, [lib_player:player_show()])
.

async(UID,Fun,Args) ->
	mod_server:async_apply(pid(UID), Fun, lists:append([lib_player:player_show()],Args))
.

get_day_award(UID) ->
	Data = lib_player_activity:get_activity_data(UID),
	Data#player_open_server.day_award
.
update_day_award(UID, Day_award) ->
	Data = lib_player_activity:get_activity_data(UID),
	lib_player_activity:update_activity_data(UID, Data#player_open_server{day_award = Day_award})
.

refresh_day_award(Activity) ->
	?INFO("refresh_day_award "),
	Uid = lib_activity_api:uid(Activity),
	update_day_award(Uid, ?BOX_RECEIVED)
.

request_interface_info(Msg) ->
	Uid = lib_activity_api:uid(Msg#'Proto10156006'.uid),
	Have_box = get_day_award(Uid),
	async(Uid,fun interface_info/2,[Have_box])
.
request_rank_info(Msg) ->
	#'Proto10156001'{type = Type} = Msg,
	Uid = lib_activity_api:uid(Msg#'Proto10156001'.uid),
	async(Uid,fun rank_info/2, [Type])
.
request_task_info(Msg) ->
	#'Proto10156002'{type = Type} = Msg,
	Uid = lib_activity_api:uid(Msg#'Proto10156002'.uid),
	async(Uid,fun task_info/2, [Type])
.
get_task_award(Msg) ->
	#'Proto10156003'{type = Type,id = TaskId} = Msg,
	Uid = lib_activity_api:uid(Msg#'Proto10156003'.uid),
	async(Uid,fun get_task_award/4, [Msg#'Proto10156003'.uid,Type,TaskId])
.
get_open_server_box(Msg) ->
	Uid = lib_activity_api:uid(Msg#'Proto10156004'.uid),
	Day_award = get_day_award(Uid),
	?JUDGE_RETURN(Day_award =:= ?BOX_RECEIVED,?INFO("宝箱已被玩家领取")),
	update_day_award(Uid, ?BOX_NO_RECEIVED),
	async(Uid,fun open_server_box/2, [Msg#'Proto10156004'.uid])
.

interface_info(PlayerShow,Have_box) ->
	Activity = mod_activity:get_activity(),
	PlayerId = PlayerShow#player_show.id,
	OpenSecond = lib_open_server_rank:activity_open_second(),
	List =
	maps:fold(fun(Type,Value,L) ->
		case OpenSecond >= maps:get(time,Value) of
			true -> Rank = lib_open_server_rank:get_player_info(PlayerId,Type),
					[rank_to_proto(Rank)|L];
			false-> L
		end
	end,[], tb_open_server_rank_open:get(lib_open_server_rank:index())),
	Respond = #'Proto50156006'{
		info_list = lists:reverse(List),
		acc = lib_activity_api:activity_to_proto_no_tip(Activity),
		have_award_list = get_have_award_list(PlayerId),
		have_box = Have_box
	},
	Pid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(Pid,Respond),
	?INFO("Respond ~p",[Respond])
.

tips(Uid,PlayerId) ->
	Have_box = get_day_award(Uid),
	Award_num = mod_server:sync_apply(pid(Uid), fun get_all_have_award/1 , [PlayerId]),
	case Have_box of
		0 -> Award_num;
		1 -> Award_num + 1
	end
.

get_have_award_list(PlayerId) ->
	TypeList = maps:keys(tb_open_server_rank_open:get(lib_open_server_rank:index())),
	lists:foldl(fun(Type,List)->
		PlayerMap = lib_open_server_rank:get_map(Type),
		case maps:is_key(PlayerId,PlayerMap#open_server.map) of
			true -> PlayerInfo = maps:get(PlayerId,PlayerMap#open_server.map),
					Have_award =
					try
						maps:fold(fun(_Key,Value,Acc)->
							case Value#open_server_task.state =:= ?TASK_STATUS_FINISH of
								true -> throw({ok,true});
								false-> Acc
							end
								  end,false,PlayerInfo#open_server_rank.task_map)
					catch
						throw:({ok,true})  -> true
					end,
				case Have_award of true -> [Type|List];false -> List end;
			false -> List
		end
	end,[],TypeList)
.

get_all_have_award(PlayerId) ->
	TypeList = maps:keys(tb_open_server_rank_open:get(lib_open_server_rank:index())),
	lists:foldl(fun(Type,Sum)->
		PlayerMap = lib_open_server_rank:get_map(Type),
		case maps:is_key(PlayerId,PlayerMap#open_server.map) of
			true -> PlayerInfo = maps:get(PlayerId,PlayerMap#open_server.map),
					 maps:fold(fun(_Key,Value,Sum1)->
							case Value#open_server_task.state =:= ?TASK_STATUS_FINISH of
								true -> Sum1 + 1;
								false-> Sum1
							end
						end,0,PlayerInfo#open_server_rank.task_map) + Sum;
			false -> Sum
		end
	end,0,TypeList)
.

rank_info(PlayerShow,Type) ->
	PlayerId = PlayerShow#player_show.id,
	RankMap = lib_open_server_rank:get_map(Type),
	List =
		lists:reverse(lists:keysort(2,
			maps:fold(fun(_Key,Value,List) ->
				[{Value#open_server_rank.player_id,Value#open_server_rank.rank}|List]
			end,[],RankMap#open_server.map))),
	PlayerInfo = rank_to_proto(lib_open_server_rank:get_player_info(PlayerShow#player_show.id,Type)),
	ProtoList =
		lists:foldl(fun({Id,_},L)->
			Rank = lib_open_server_rank:get_player_info(Id,Type),
			case Rank#open_server_rank.rank =/= -1 andalso Rank#open_server_rank.rank =/= 0 of
				true -> [rank_to_proto(Rank)|L];
				false-> L
			end
		end,[],List),
	Respond = #'Proto50156001'{
		info = ProtoList,
		player_info = PlayerInfo,
		type = Type
	},
	lib_send:respond_to_client_by_pid(lib_player:get_pid(PlayerId),Respond),
	?INFO("Respond ~p",[Respond])
.
task_info(PlayerShow,Type) ->
	PlayerId = PlayerShow#player_show.id,
	PlayerInfo = lib_open_server_rank:get_player_info(PlayerId,Type),
	ProtoList =
		maps:fold(fun(_Task_id,Task,L)->
			[task_to_proto(Task) |L]
		end,[],PlayerInfo#open_server_rank.task_map),
	Respond = #'Proto50156002'{
		info = lists:reverse(ProtoList),
		type = Type
	},
	lib_send:respond_to_client_by_pid(lib_player:get_pid(PlayerId),Respond),
	?INFO("Respond ~p",[Respond])
.
get_task_award(PlayerShow,ProtoUid,Type,TaskId) ->
	PlayerId = PlayerShow#player_show.id,
	TaskInfo = lib_open_server_rank:get_task_info(PlayerId,Type,TaskId),
	?JUDGE_RETURN(TaskInfo#open_server_task.state =:= ?TASK_STATUS_FINISH,?ERROR_CLIENT_OPERATOR),
	Map1 = tb_open_server_task:get(lib_open_server_rank:index()),
	Map2 = maps:get(Type,Map1),
	TaskConf = maps:get(TaskId,Map2),
	?JUDGE_RETURN(lib_open_server_rank:activity_open_second() >= maps:get(need_times,TaskConf),?ERROR_CLIENT_OPERATOR),
	Item_List = maps:get(rewards,TaskConf),
	Pid = lib_player:get_pid(PlayerId),
	mod_server:async_apply(Pid,fun get_player_item/1, [Item_List]),
	lib_open_server_rank:put_task_info(PlayerId,Type,TaskId,TaskInfo#open_server_task{state = ?TASK_STATUS_DRAW}),
	Respond = #'Proto50156003'{
		uid = ProtoUid,
		type = Type,
		id = TaskId
	},
	lib_send:respond_to_client_by_pid(lib_player:get_pid(PlayerId),Respond),
	?INFO("Respond ~p",[Respond])
.

open_server_box(PlayerShow,ProtoUid) ->
	PlayerId = PlayerShow#player_show.id,
	Pid = lib_player:get_pid(PlayerId),
	OpenDay = (lib_open_server_rank:activity_open_second() div lib_timer:day_second()) + 1,
	Key = 1 * 100000 + lib_open_server_rank:index() * 100 + OpenDay,
	Item_List = maps:get(rewards, tb_open_server_small_box:get(Key)),
	mod_server:async_apply(Pid,fun get_player_item/1, [Item_List]),
	Respond = #'Proto50156004'{
		uid = ProtoUid
	},
	lib_send:respond_to_client_by_pid(lib_player:get_pid(PlayerId),Respond),
	?INFO("Respond ~p",[Respond])
.

get_player_item(Item_list) ->
	Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_OPEN_SERVER_RANK_BOX, 1))
.

rank_to_proto(Rank) ->
	Show = Rank#open_server_rank.show,
	#'ProtoOpenServerRank'{
		rank = Rank#open_server_rank.rank,
		tick = Rank#open_server_rank.tick,
		player_info = #'ProtoShowRole'{id = Show#player_show.id,sex = Show#player_show.sex,name = Show#player_show.name,
			country = Show#player_show.country,head_icon = Show#player_show.head_icon},
		grade = Rank#open_server_rank.rank_grade
	}
.
task_to_proto(Task) ->
	#'ProtoOpenServerTask'{
		task_id = Task#open_server_task.task_id,
		grade = Task#open_server_task.task_grade,
		state = Task#open_server_task.state
	}
.


update_player_grade(?OPEN_SERVER_TASK_TYPE_1,Lvl) ->
	lib_open_server_rank:mod_add_grade(lib_player:player_id(),?OPEN_SERVER_TASK_TYPE_1,Lvl,lib_timer:unixtime())
;
update_player_grade(?OPEN_SERVER_TASK_TYPE_2,_Info) ->
	SkillInfo =
	lists:foldl(fun(Hero,L) ->
		SkillLvList =
			maps:fold(fun(_SkillId,Skill,L1) ->
				case Skill#skill.is_active of
					true -> [Skill#skill.level|L1];
					false-> L1
				end
			end,[],Hero#hero.skill_learning_map),
		[{Hero#hero.id,SkillLvList}|L]
	end,[],lib_hero_api:hero_list()),
	lib_open_server_rank:mod_add_grade(lib_player:player_id(),?OPEN_SERVER_TASK_TYPE_2,SkillInfo,lib_timer:unixtime())
;
update_player_grade(?OPEN_SERVER_TASK_TYPE_3,_Info) ->
	StageInfo = [{Hero#hero.id, [Hero#hero.front_stage,Hero#hero.back_stage]}|| Hero <- lib_hero_api:hero_list()],
	lib_open_server_rank:mod_add_grade(lib_player:player_id(),?OPEN_SERVER_TASK_TYPE_3,StageInfo,lib_timer:unixtime())
;
update_player_grade(?OPEN_SERVER_TASK_TYPE_6,List) ->
	Num = lists:foldl(fun(Item_obj,Sum) ->
			case Item_obj#item_obj.item_id =:= ?MONEY_ID of
				true -> Sum + Item_obj#item_obj.amount;
				false-> Sum
			end
		end,0,List),
	lib_open_server_rank:mod_add_grade(lib_player:player_id(),?OPEN_SERVER_TASK_TYPE_6,Num,lib_timer:unixtime())
.

sign_in() ->
	UidList = mod_activity_monitor:find_activity_uid_list(?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK),
	lists:foreach(fun(Uid) -> async(Uid,fun sign_in/1) end,UidList),
	update_player_grade(?OPEN_SERVER_TASK_TYPE_1,lib_player:player_level()),
	update_player_grade(?OPEN_SERVER_TASK_TYPE_2,0),
	update_player_grade(?OPEN_SERVER_TASK_TYPE_3,0),
	Rank = mod_server:sync_apply(mod_arena:get_pid(),fun lib_arena_api:player_rank/1, [lib_player:player_id()]),
	lib_open_server_rank:mod_add_grade(lib_player:player_id(),?OPEN_SERVER_TASK_TYPE_4,Rank,lib_timer:unixtime())
.
sign_in(PlayerShow) ->
	Map = tb_open_server_rank_open:get(lib_open_server_rank:index()),
	Player_id = PlayerShow#player_show.id,
	lists:foreach(fun(Type) ->
		Player_info = lib_open_server_rank:get_player_info(Player_id,Type),
		lib_open_server_rank:put_player_info(Player_id,Type,Player_info#open_server_rank{show = PlayerShow})
	end, maps:keys(Map))
.