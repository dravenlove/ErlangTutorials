%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_winter_activity
%%% Created on : 6/16/2021 3:29 PM
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%		冬日问答数据mod_season_activity单独管理
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_winter).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").


%% API
-export([
	update_winter/1,
	question_to_proto/2,
	make_question/0,
	get_question/1,
	solve/4,
	get_winter/1,
	update_rank_list/0,
	get_rank_list/0,
	get_my_rank/1,
	rank_to_proto/1,
	get_question_tick/0,
	final_rank_to_proto/1,
	award_of_winter_rank/0,
	start/0,	%% 冬日问答活动开始
	open/1,		%% 开启答题界面
	close/1,		%% 关闭答题界面
	realtime_rank/0,
	extr_time/0,
	next_question/0,
	get_answering_list/0,
	get_question_number/0,
	get_remain_time/1,
	get_answered_list/0,
	update_answered_list/1,
	question_over/0,
	get_answered/1
]).
start() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{is_open = true,question_tick = lib_timer:unixtime(),question_number = 1}),
	erlang:send_after(?TB_S_A_CONST(int,question_time)*1000,self(),realtime_rank)
.
test_start() ->
	Tick = get_question_tick(),
	case Tick =/= 0 of %% 测试初始化用
		true ->skip;
		false -> lib_winter:start()
	end
.
realtime_rank() ->
	[lib_season_activity:notify_winter_info(lib_winter:get_question_number(),?QUESTION_STATUS_QUESTION_ANSWER,PlayerId) || PlayerId <- get_answering_list()]
.
extr_time() ->
	AnsweringList = get_answering_list(),
	AnsweredList = lib_winter:get_answered_list(),
	lists:foreach(fun(PlayerId) ->
		case lists:member(PlayerId,AnsweredList) of
			true -> skip;
			false ->
				Winter = lib_winter:get_winter(PlayerId),
				#rank{time = MapTime,wrong = Wrong} = Winter,
				lib_winter:update_winter(Winter#rank{wrong = Wrong + 1,time = MapTime + ?TB_S_A_CONST(int,question_time)})
		end,
		update_rank_list(),
		lib_season_activity:notify_winter_info(lib_winter:get_question_number(),?QUESTION_STATUS_REALTIME_RANK,PlayerId)
				  end,AnsweringList),
	update_answered_list([])
.
next_question() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{question_tick = lib_timer:unixtime(),question_number = get_question_number()+1}),
	[lib_season_activity:notify_winter_info(lib_winter:get_question_number(),?QUESTION_STATUS_ANSWERING,PlayerId) || PlayerId <- get_answering_list()]
.
question_over() ->
	[lib_season_activity:notify_winter_info(lib_winter:get_question_number(),?QUESTION_STATUS_OVER,PlayerId) || PlayerId <- get_answering_list()]
.
get_answering_list() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{winter_answering_list = PlayerIdList} = SeasonActivity,
	PlayerIdList
.
close(PlayerId) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{winter_answering_list = lists:delete(PlayerId,get_answering_list())})
.
open(ProtoShowRole) ->
	test_start() ,
	#'ProtoShowRole'{id = PlayerId} = ProtoShowRole,
	QuestionNumber = lib_winter:get_question_number(),
	QuestionLimitTime = ?TB_S_A_CONST(int,question_time),
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{winter_answering_list = WinterAnsweringList,player_answer = PlayerAnswerMap,winter_answered_list = WinterAnsweredList} = SeasonActivity,
	case lists:member(PlayerId,WinterAnsweredList) of
		true ->	lib_season_activity:notify_winter_info(QuestionNumber,?QUESTION_STATUS_QUESTION_ANSWER,PlayerId);
		false ->
			NewPlayerAnswerMap =
				case maps:is_key(PlayerId,PlayerAnswerMap) of
					true ->
						PlayerAnswer = maps:get(PlayerId,PlayerAnswerMap),
						#rank{right = Right,time = Time,wrong = Wrong} =PlayerAnswer,
						RightTime = Time - Wrong * QuestionLimitTime,
						maps:put(PlayerId,PlayerAnswer#rank{time = RightTime + (QuestionNumber - 1 - Right) * QuestionLimitTime},PlayerAnswerMap);
					false -> maps:put(PlayerId,#rank{proto_show_role = ProtoShowRole,time = (QuestionNumber-1) * QuestionLimitTime},PlayerAnswerMap)
				end,
			mod_season_activity:put_season_activity(SeasonActivity#season_activity{winter_answering_list = [PlayerId|WinterAnsweringList],player_answer = NewPlayerAnswerMap}),
			update_rank_list(),
			lib_season_activity:notify_winter_info(QuestionNumber,?QUESTION_STATUS_ANSWERING,PlayerId)
	end
.
award_of_winter_rank() ->
	RankList = get_rank_list(),
	lists:foreach(fun(Rank) ->
		#rank{no = No,proto_show_role = ProtoShowRole} = Rank,
		#'ProtoShowRole'{id = ProtoShowRoleId} = ProtoShowRole,
		AwardList = maps:get(award_list, tb_season_activity_winter_award:get(No)),
		lib_season_activity_api:send_s_a_award_mail(AwardList,?WINTER_MAIL_ID,[No],ProtoShowRoleId)
				  end,RankList)
.
update_winter(Winter) ->
	#rank{proto_show_role = ProtoShowRole} =Winter,
	#'ProtoShowRole'{id = PlayerId} =ProtoShowRole,
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_answer = WinterMap} = SeasonActivity,
	NewWinterMap = maps:put(PlayerId,Winter,WinterMap),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{player_answer = NewWinterMap})
.
get_answered(PlayerId) ->
	Winter = lib_winter:get_winter(PlayerId),
	#rank{answered = Answered} = Winter,
	Answered
.
get_winter(PlayerId) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_answer = WinterMap} = SeasonActivity,
	maps:get(PlayerId,WinterMap)
.
solve(PlayerId,IsRight,AnswerTime,Answered) ->
	AnsweredList = lib_winter:get_answered_list(),
	case lists:member(PlayerId,AnsweredList) of
		true -> skip;
		false ->
			Winter = lib_winter:get_winter(PlayerId),
			#rank{right = Right,time = MapTime,wrong = Wrong} = Winter,
			case IsRight of
				true ->
					lib_winter:update_winter(Winter#rank{right = Right + 1 ,time = MapTime + AnswerTime,answered = Answered});
				false ->
					lib_winter:update_winter(Winter#rank{wrong = Wrong + 1,time = MapTime + ?TB_S_A_CONST(int,question_time),answered = Answered})
			end,
			update_rank_list(),
			lib_season_activity:notify_winter_info(get_question_number(),?QUESTION_STATUS_QUESTION_ANSWER,PlayerId),
			update_answered_list([PlayerId|AnsweredList])
	end
.
get_remain_time(Status) ->
	case Status of
		?QUESTION_STATUS_BEFORE -> 0;
		?QUESTION_STATUS_ANSWERING -> ?TB_S_A_CONST(int,question_time)-(lib_timer:unixtime()-lib_winter:get_question_tick());
		?QUESTION_STATUS_REALTIME_RANK -> ?TB_S_A_CONST(int,next_question_extr_time);
		?QUESTION_STATUS_FINAL_RANK -> 0;
		?QUESTION_STATUS_QUESTION_ANSWER -> ?TB_S_A_CONST(int,next_question_rank_time);
		?QUESTION_STATUS_OVER -> 0
	end
.
rank_to_proto(Rank) ->
	#'ProtoWinterRank'{
		no = Rank#rank.no,
		right = Rank#rank.right,
		time = Rank#rank.time
	}
.
final_rank_to_proto(RankList) ->
	lists:foldr(fun(Rank,List) ->
		[#'ProtoWinterFinalRank'{
			proto_show_role = Rank#rank.proto_show_role,
			proto_winter_rank = rank_to_proto(Rank)
		}|List]
				end,[],RankList)
.
update_rank_list() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{player_answer = WinterMap} = SeasonActivity,
	WinterList = maps:values(WinterMap),
	RankList = lists:sort(fun(A,B) -> {A#rank.right,B#rank.time} > {B#rank.right,A#rank.time} end,WinterList),
	{ReverseList,_No} = lists:foldl(fun(Rank,{List,No}) -> {[Rank#rank{no = No}|List],No+1} end,{[],1},RankList),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{rank_list = lists:reverse(ReverseList)})
.
get_question(QuestionId) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{question = QuestionMap} = SeasonActivity,
	case maps:size(QuestionMap) =:= 0 of  %% 测试用（不用等活动开始:初始化）
		true ->
			mod_season_activity:put_season_activity(SeasonActivity#season_activity{is_open = true,question_tick = lib_timer:unixtime(),question_number = 1}),
			make_question(),
			get_question(QuestionId);
		false -> maps:get(QuestionId,QuestionMap)
	end
.
get_question_number() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{question_number = QuestionNumber} = SeasonActivity,
	QuestionNumber
.
get_question_tick() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{question_tick = QuestionTick} = SeasonActivity,
	QuestionTick
.
get_rank_list() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{rank_list = RankList} = SeasonActivity,
	RankList
.
get_my_rank(PlayerId) ->
	RankList = get_rank_list(),
	[MyRank] = lists:filter(fun(Rank) ->#rank{proto_show_role = ProtoShowRole} = Rank,#'ProtoShowRole'{id = Id} = ProtoShowRole,PlayerId =:= Id end,RankList),
	MyRank
.
get_answered_list() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{winter_answered_list = WinterAnsweredList} = SeasonActivity,
	WinterAnsweredList
.
update_answered_list(WinterAnsweredList) ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{winter_answered_list = WinterAnsweredList})
.
make_question() ->
	SeasonActivity = mod_season_activity:get_season_activity(),
	#season_activity{question = QuestionMap} = SeasonActivity,
	QUESTION_NUMBER = ?TB_S_A_CONST(int,question_number),
	AllQuestionList = tb_season_activity_winter_question:get_list(),
	QuestionKeyList = lib_random:rand_more(QUESTION_NUMBER,AllQuestionList),
	{NewQuestionMap,_Id} = lists:foldl(fun(QuestionKey,{Question,Acc}) -> NewQuestion = maps:put(Acc,load_question(QuestionKey,Acc),Question),{NewQuestion,Acc+1} end,{QuestionMap,1},QuestionKeyList),
	mod_season_activity:put_season_activity(SeasonActivity#season_activity{question = NewQuestionMap})
.
load_question(QuestionKey,Acc) ->
	#question{
		id = Acc,
		question = QuestionKey,
		answer_list = lib_random:rand_more(4,[1,2,3,4])
	}
.
question_to_proto(Question,PlayerId) ->
	#'ProtoTopic'{
		id = Question#question.id,							%题号
		topic_main = Question#question.question,				%说明：题干
		answer_list = Question#question.answer_list,		%说明：正确答案
		answered = get_answered(PlayerId)		%说明：错误答案
	}
.