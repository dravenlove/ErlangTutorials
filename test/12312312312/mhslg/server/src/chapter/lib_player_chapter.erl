%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十一月 2020 16:07
%%%-------------------------------------------------------------------
-module(lib_player_chapter).
-author("13661").

-include("common.hrl").
-include("chapter.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10113.hrl").
-include("ProtoClient_10102.hrl").
-include("science.hrl").

%% API
-export([
	ets_init/0,
	build_index/0,
	put_player_chapter/2,
	get_player_chapter/0,
	player_chapter_handler/0
]).
-export([
	is_full_star_pass_chapter/1,
	stage_info/1
]).
-export([
	sign_in/0,
	reset_everyday/0,

	request_top_info/0,
	request_chapter_info/1,
	request_challenge/1,
	request_buy_times/0,
	request_receive_star_reward/1,
	request_sweep/1,
	request_all_info/0,
	request_hero_info/1
]).

-define(REWARD_STATE_NOT, 0).
-define(REWARD_STATE_CAN_RECEIVE, 1).
-define(REWARD_STATE_RECEIVED, 2).

-define(STAGE_ID(ChapterId, Index), ChapterId * 1000 + Index).
-define(STAR_REWARD_ID(ChapterId, Index), ChapterId * 100 + Index).

put_player_chapter(PlayerChapter) when is_record(PlayerChapter, player_chapter) ->
	put_player_chapter(PlayerChapter, false)
.
put_player_chapter(PlayerChapter, IsSaveDb) when is_record(PlayerChapter, player_chapter) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_CHAPTER),
	erlang:put(?ETS_PLAYER_CHAPTER, PlayerChapter).

get_player_chapter() ->
	erlang:get(?ETS_PLAYER_CHAPTER).

ets_init() ->
	ets:new(?ETS_PLAYER_CHAPTER, [?ETS_KEY_POS(#player_chapter.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_CHAPTER, {?TUPLE_INT(<<"id">>, 1)}, true).

player_chapter_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_CHAPTER,
		table_name = ?DBPLAYER_CHAPTER,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_chapter:ets_init/0,
		mongo_index_func = fun lib_player_chapter:build_index/0,
		load_func = fun db_player_chapter:load_player_chapter/1,
		save_func = fun db_player_chapter:save_player_chapter/1,
		get_func = fun lib_player_chapter:get_player_chapter/0,
		put_func = fun lib_player_chapter:put_player_chapter/2
	}.


chapter_info(ChapterId) ->
	PlayerChapter = get_player_chapter(),
	?DICT_FETCH(ChapterId, PlayerChapter#player_chapter.chapters, #chapter{chapter_id = ChapterId})
.

update_chapter(Chapter) when is_record(Chapter, chapter) ->
	PlayerChapter = get_player_chapter(),
	NewChapters = dict:store(Chapter#chapter.chapter_id, Chapter, PlayerChapter#player_chapter.chapters),
	put_player_chapter(PlayerChapter#player_chapter{chapters = NewChapters})
.

stage_info(StageId) ->
	ChapterId = StageId div 1000,
	Chapter = chapter_info(ChapterId),
	?DICT_FETCH(StageId, Chapter#chapter.stages, #stage{stage_id = StageId})
.

update_stage(Stage) when is_record(Stage, stage) ->
	StageId = Stage#stage.stage_id,
	ChapterId = StageId div 1000,
	Chapter = chapter_info(ChapterId),
	NewStages = dict:store(StageId, Stage, Chapter#chapter.stages),
	update_chapter(Chapter#chapter{stages = NewStages})
.

get_challenge_times() ->
	PlayerChapter = get_player_chapter(),
	PlayerChapter#player_chapter.challenge_times
.

add_challenge_times(Times) ->
	PlayerChapter = get_player_chapter(),
	OldTimes = PlayerChapter#player_chapter.challenge_times,
	put_player_chapter(PlayerChapter#player_chapter{challenge_times = OldTimes + Times}),
	lib_player_process:process_chapter_script_times(Times)
.

get_buy_times() ->
	PlayerChapter = get_player_chapter(),
	PlayerChapter#player_chapter.buy_times
.

add_buy_times(Times) ->
	PlayerChapter = get_player_chapter(),
	OldTimes = PlayerChapter#player_chapter.buy_times,
	put_player_chapter(PlayerChapter#player_chapter{buy_times = OldTimes + Times})
.

day_free_times() ->
	lib_const_api:get_const_int(chapter_free_times)
.

left_challenge_times() ->
	TimesNumber = lib_const_api:get_const_int(chapter_times_number),
	day_free_times() + get_buy_times() * TimesNumber - get_challenge_times()
.

get_star_reward_state(ChapterId, Index) ->
	RewardId = ?STAR_REWARD_ID(ChapterId, Index),
	Chapter = chapter_info(ChapterId),
	?DICT_FETCH(RewardId, Chapter#chapter.star_rewards, ?REWARD_STATE_NOT)
.

set_star_reward_state(ChapterId, Index, State) ->
	RewardId = ?STAR_REWARD_ID(ChapterId, Index),
	Chapter = chapter_info(ChapterId),
	NewRewards = dict:store(RewardId, State, Chapter#chapter.star_rewards),
	update_chapter(Chapter#chapter{star_rewards = NewRewards})
.


refresh_chapter_total_star() ->
	ChapterIdList = tb_chapter:get_list(),
	lib_common:list_map(fun(ChapterId) ->
		refresh_chapter_total_star(ChapterId)
	end, ChapterIdList)
.
refresh_chapter_total_star(ChapterId) ->
	ChapterConf = tb_chapter:get(ChapterId),
	StageNumber = maps:get(stage_number, ChapterConf, 0),

	TotalStar =
	lib_common:fold(fun(Index, Total) ->
		StageId = ?STAGE_ID(ChapterId, Index),
		StageConf = tb_stage:get(StageId),

		case StageConf =/= false andalso maps:get(is_boss, StageConf, 0) =:= 1 of
			false -> Total;
			true ->
				Stage = stage_info(StageId),
				Total + Stage#stage.pass_star
		end
	end, 0, 1, StageNumber),

	Chapter = chapter_info(ChapterId),
	update_chapter(Chapter#chapter{total_star = TotalStar})
.

refresh_chapter_star_reward() ->
	ChapterIdList = tb_chapter:get_list(),
	lib_common:list_map(fun(ChapterId) ->
		refresh_chapter_star_reward(ChapterId)
	end, ChapterIdList)
.
refresh_chapter_star_reward(ChapterId) ->
	Chapter = chapter_info(ChapterId),
	#chapter{
		total_star = TotalStar,
		star_rewards = StarRewards
	} = Chapter,

	Conf = tb_chapter:get(ChapterId),
	StarRewardNumber = maps:get(star_number, Conf, 0),

	NewRewards =
	lib_common:fold(fun(Index, Rewards) ->
		RewardId = ?STAR_REWARD_ID(ChapterId, Index),
		State = ?DICT_FETCH(RewardId, Rewards, ?REWARD_STATE_NOT),
		case State =:= ?REWARD_STATE_NOT of
			false -> Rewards;
			true ->
				RewardConf = tb_chapter_reward:get(RewardId),
				case RewardConf =/= false andalso TotalStar >= maps:get(star, RewardConf) of
					false -> Rewards;
					true -> dict:store(RewardId, ?REWARD_STATE_CAN_RECEIVE, Rewards)
				end
		end
	end, StarRewards, 1, StarRewardNumber),

	update_chapter(Chapter#chapter{star_rewards = NewRewards})
.

refresh_chapter_top_stage() ->
	ChapterIdList = tb_chapter:get_list(),
	lib_common:list_map(fun(ChapterId) ->
		refresh_chapter_top_stage(ChapterId)
	end, ChapterIdList)
.
refresh_chapter_top_stage(ChapterId) ->
	Chapter = chapter_info(ChapterId),
	ChapterConf = tb_chapter:get(ChapterId),
	StageNumber = maps:get(stage_number, ChapterConf, 0),

	TopStageId =
	lib_common:fold(fun(Index, Top) ->
		StageId = ?STAGE_ID(ChapterId, Index),
		Stage = stage_info(StageId),
		?JUDGE_BREAK(Stage#stage.is_pass, Top),
		StageId
	end, 0, 1, StageNumber),

	update_chapter(Chapter#chapter{
		top_stage_id = TopStageId
	})
.

check_star_reward_event() ->
	ChapterIdList = tb_chapter:get_list(),
	lib_common:list_map(fun(ChapterId) ->
		Flag = check_star_reward_event(ChapterId),
		?JUDGE_BREAK(not Flag)
	end, ChapterIdList)
.
check_star_reward_event(ChapterId) ->
	Chapter = chapter_info(ChapterId),
	Conf = tb_chapter:get(ChapterId),
	StarRewardNumber = maps:get(star_number, Conf, 0),

	EventFlag =
	try
		lib_common:for(fun(Index) ->
			RewardId = ?STAR_REWARD_ID(ChapterId, Index),
			State = ?DICT_FETCH(RewardId, Chapter#chapter.star_rewards, ?REWARD_STATE_NOT),
			?JUDGE_RETURN(State =/= ?REWARD_STATE_CAN_RECEIVE, true)
		end, 1, StarRewardNumber),
		false
	catch
		throw: {error, Flag} -> Flag
	end,

	%%todo notify
	EventFlag
.

check_times_event() ->
	_EventFlag = left_challenge_times() > 0
	%%todo notify
.

is_full_star_pass_chapter(ChapterId) ->
	try
		Conf = tb_chapter:get(ChapterId),
		?JUDGE_RETURN(Conf =/= false, false),

		StarRewardNumber = maps:get(star_number, Conf),
		RewardConf = tb_chapter_reward:get(?STAR_REWARD_ID(ChapterId, StarRewardNumber)),
		?JUDGE_RETURN(RewardConf =/= false, false),

		NeedStar = maps:get(star, RewardConf),
		Chapter = chapter_info(ChapterId),
		Chapter#chapter.total_star >= NeedStar
	catch
	    throw: {error, Flag} -> Flag
	end
.

sign_in() ->
	refresh_chapter_total_star(),
	refresh_chapter_star_reward(),
	refresh_chapter_top_stage(),
	check_star_reward_event(),
	check_times_event()
.

reset_everyday() ->
	PlayerChapter = get_player_chapter(),
	put_player_chapter(PlayerChapter#player_chapter{
		buy_times = 0,
		challenge_times = 0
	})
.

stage_to_proto(Stage) when is_record(Stage, stage) ->
	#'ProtoStage'{
		stage_id = Stage#stage.stage_id,
		is_pass = Stage#stage.is_pass,
		pass_star = Stage#stage.pass_star,
		pass_target_list = Stage#stage.pass_targets
	}
.

chapter_to_proto(Chapter) when is_record(Chapter, chapter) ->
	ProtoStageList =
	dict:fold(fun(_StageId, Stage, List) ->
		[stage_to_proto(Stage) | List]
  	end, [], Chapter#chapter.stages),

	ProtoStarRewardList =
	dict:fold(fun(RewardId, State, List) ->
		[#'ProtoPairLong'{key = RewardId, value = State} | List]
  	end, [], Chapter#chapter.star_rewards),

	#'ProtoChapter'{
		chapter_id = Chapter#chapter.chapter_id,
		total_star = Chapter#chapter.total_star,
		star_rewards = ProtoStarRewardList,
		stage_list = ProtoStageList
	}
.

request_top_info() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_002), ?INFO("功能未开启")),
	PlayerChapter = get_player_chapter(),

	ProtoChapterList =
	dict:fold(fun(ChapterId, Chapter, List) ->
		[#'ProtoPairLong'{key = ChapterId, value = Chapter#chapter.top_stage_id} | List]
  	end, [], PlayerChapter#player_chapter.chapters),

	Respond = #'Proto50113001'{
		chapter_list = ProtoChapterList
	},
	lib_send:respond_to_client(Respond)
.

request_chapter_info(Msg) ->
	ChapterId = Msg#'Proto10113002'.chapter_id,
	Conf = tb_chapter:get(ChapterId),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	Chapter = chapter_info(ChapterId),
	Respond = #'Proto50113002'{
		chapter = chapter_to_proto(Chapter),
		used_times = get_challenge_times(),
		buy_times = get_buy_times()
	},

	lib_send:respond_to_client(Respond)
.

process_fight_result(Result) ->
	Data = Result#combat_callback.callback_data,
	IsWin = Data#callback_data0.win_type =:= ?FIGHTER_TYPE_L,
	{ChapterId, StageId} = Result#combat_callback.params,

	FightResultList = Data#callback_data0.fight_result,

	{TroopsFlag, DieNumber} =
	lib_common:list_foldl(fun(FightResult, {Flag, Number}) ->
		Wastage = FightResult#fight_result.l_wastage,
		?JUDGE_CONTINUE(Wastage =/= false, {Flag, Number + 1}),
		Total = Wastage#fight_wastage.start_front + Wastage#fight_wastage.start_back,
		Left = Wastage#fight_wastage.over_front + Wastage#fight_wastage.over_back,
		?INFO("chapter challenge result ~p ~p ~p ~p ~p", [Flag, Left, Total, Wastage#fight_wastage.is_win, Number]),
		{Flag andalso ((Left / Total * 100) >= 30), ?IIF(Wastage#fight_wastage.is_win, Number, Number + 1)}
	end, {true, 0}, FightResultList),

	Target1 = IsWin,
	Target2 = DieNumber =< 1,
	Target3 = IsWin andalso TroopsFlag andalso DieNumber =:= 0,

	Star = lib_types:to_integer(Target1) + lib_types:to_integer(Target2) + lib_types:to_integer(Target3),

	% Star =
	% if
	% 	IsWin andalso TroopsFlag andalso DieNumber =:= 0 -> 3;
	% 	IsWin andalso DieNumber =< 1 -> 2;
	% 	IsWin -> 1;
	% 	true -> 0
	% end,

	StageConf = tb_stage:get(StageId),
	IsBoss = maps:get(is_boss, StageConf, 0),

	Stage = stage_info(StageId),
	#stage{
		is_pass = IsPass,
		pass_star = OldStar,
		pass_times = PassTimes,
		pass_targets = PassTargets
	} = Stage,

	ResultMsg =
	case IsWin of
		false -> Data#callback_data0.result_msg;
		true ->
			NewPassTargets =
			case Star >= OldStar of
				false ->
					PassTargets;
				true ->
					[Target1, Target2, Target3]
			end,

			update_stage(Stage#stage{
				is_pass = true,
				pass_times = PassTimes + 1,
				pass_star = max(Star, OldStar),
				pass_targets = NewPassTargets
			}),

			StageReward = maps:get(pass_reward, StageConf, []),
			Add = lib_player_science_api:get_effect_value(?EFFECT_CHAPTER_REWARD_ADD),
			PassReward =
			lists:foldl(fun([ItemId,Num],L) ->
					case maps:get(main_type, tb_item:get(ItemId)) == 102 andalso maps:get(sub_type, tb_item:get(ItemId)) == 19 of
						true ->
							[[ItemId,trunc(Num * (1 + Add))]|L];
						false ->
							[[ItemId,Num]|L]
					end
			end,[],StageReward),

			FirstReward =
			case IsPass of
				false -> maps:get(first_reward, StageConf, []);
				true -> []
			end,

			ItemList = lib_item_api:conf_item_list_to_pack_item_list(FirstReward ++ PassReward),
			lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_CHAPTER_CHALLENGE, StageId), true, ?PACK_TIPS0),
			lib_combat_queue_api:result_msg_add_reward(Data#callback_data0.result_msg#'Proto80102007'{
				param1 = Star
			}, FirstReward ++ PassReward)
	end,

	case IsWin of
		false -> 
			lib_send:respond_to_client(Data#callback_data0.msg),
			lib_send:respond_to_client(ResultMsg);
		true ->
			Chapter = chapter_info(ChapterId),
			#chapter{
				total_star = TotalStar,
				top_stage_id = TopStageId
			} = Chapter,

			NewTotalStar =
			case IsBoss =:= 1 andalso Star > OldStar of
				true -> TotalStar + (Star - OldStar);
				false -> TotalStar
			end,

			update_chapter(Chapter#chapter{
				total_star = NewTotalStar,
				top_stage_id = max(TopStageId, StageId)
			}),

			case Star > OldStar of
				false -> skip;
				true ->
					refresh_chapter_star_reward(ChapterId),
					check_star_reward_event(ChapterId)
			end,
			lib_send:respond_to_client(Data#callback_data0.msg),
			lib_send:respond_to_client(ResultMsg),
			lib_player_process:process_pass_stage(1, ChapterId, StageId, Star)
	end
.

request_challenge(Msg) ->
	#'Proto10113003'{
		chapter_id = ChapterId,
		index = Index,
		stage_id = StageId,
		hero_list = HeroList
	} = Msg,
	?JUDGE_RETURN(?STAGE_ID(ChapterId, Index) =:= StageId, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(lists:any(fun(Hero_id)-> lib_hero_assist:hero_is_assist(Hero_id) end,HeroList) =/= true,?ERROR_CLIENT_OPERATOR),
	ChapterConf = tb_chapter:get(ChapterId),
	?JUDGE_RETURN(ChapterConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	OpenLevel = maps:get(open_level, ChapterConf),
	?JUDGE_RETURN(lib_player:player_level() >= OpenLevel, ?ERROR_CLIENT_OPERATOR),

	StageConf = tb_stage:get(StageId),
	?JUDGE_RETURN(StageConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	PrevStageId = maps:get(prev_stage_id, StageConf, 0),
	case PrevStageId =/= 0 of
		false -> skip;
		true ->
			PrevStage = stage_info(PrevStageId),
			?JUDGE_RETURN(PrevStage#stage.is_pass, ?ERROR_CLIENT_OPERATOR)
	end,

	IsBoss = maps:get(is_boss, StageConf, 0),
	Stage = stage_info(StageId),
	?JUDGE_RETURN(not Stage#stage.is_pass orelse IsBoss =:= 1, ?ERROR_CLIENT_OPERATOR),

	HeroNumber = length(HeroList),
	MaxHeroNumber = maps:get(max_hero, StageConf, 0),
	?JUDGE_RETURN(0 < HeroNumber andalso HeroNumber =< MaxHeroNumber, ?ERROR_HERO_NOT_EXISTENT),
	lists:foldl(fun(HeroId, Sets) ->
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
		?JUDGE_RETURN(not sets:is_element(HeroId, Sets), ?ERROR_CLIENT_OPERATOR),
		sets:add_element(HeroId, Sets)
	end, sets:new(), HeroList),

	case Stage#stage.is_pass of
		false -> skip;
		true ->
			?JUDGE_RETURN(left_challenge_times() > 0, ?ERROR_CLIENT_OPERATOR),
			add_challenge_times(1)
	end,

	Respond = #'Proto50113003'{
		chapter_id = ChapterId,
		index = Index,
		stage_id = StageId,
		hero_list = HeroList,
		challenge_times = get_challenge_times()
	},
	lib_send:respond_to_client(Respond),

	RobotId = maps:get(robot_id, StageConf, 0),
	Result = lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_CHAPTER,
		l_fighters = lib_combat_queue_api:hero_id_list_to_fighters(HeroList),
		r_fighters = lib_combat_queue_api:robot_id_to_fighters(RobotId),
		fight_type = ?FIGHT_TYPE2,
		params = {ChapterId, StageId}
	}),

	process_fight_result(Result),

	check_times_event()
.

request_buy_times() ->
	BuyTimes = get_buy_times(),
	MaxBuyTimes = length(tb_chapter_times:get_list()),
	?JUDGE_RETURN(MaxBuyTimes > BuyTimes, ?ERROR_CLIENT_OPERATOR),

	Conf = tb_chapter_times:get(BuyTimes + 1),
	ConfList = maps:get(cost, Conf , []),
	ItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfList),
	Ret = lib_player_pack:validate_remove(ItemList),
	?PACK_IS_SUCCESS(Ret),

	lib_player_pack:auto_remove(ItemList, ?REMOVE_SERIAL(?USE_CHAPTER_BUY, BuyTimes + 1)),
	add_buy_times(1),

	Respond = #'Proto50113004'{
		buy_times = get_buy_times()
	},
	lib_send:respond_to_client(Respond),

	check_times_event()
.

request_receive_star_reward(Msg) ->
	#'Proto10113005'{
		chapter_id = ChapterId,
		index = Index
	} = Msg,
	RewardId = ?STAR_REWARD_ID(ChapterId, Index),

	ChapterConf = tb_chapter:get(ChapterId),
	?JUDGE_RETURN(ChapterConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	RewardNumber = maps:get(star_number, ChapterConf, 0),
	?JUDGE_RETURN(RewardNumber >= Index, ?ERROR_CLIENT_OPERATOR),

	RewardConf = tb_chapter_reward:get(RewardId),
	?JUDGE_RETURN(RewardConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	State = get_star_reward_state(ChapterId, Index),
	?JUDGE_RETURN(State =:= ?REWARD_STATE_CAN_RECEIVE, ?ERROR_CLIENT_OPERATOR),

	set_star_reward_state(ChapterId, Index, ?REWARD_STATE_RECEIVED),

	ConfList = maps:get(rewards, RewardConf, []),
	ItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfList),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_CHAPTER_STAR_REWARD, RewardId)),

	Respond = #'Proto50113005'{
		chapter_id = ChapterId,
		index = Index
	},
	lib_send:respond_to_client(Respond),

	check_star_reward_event(ChapterId)
.

request_sweep(Msg) ->
	#'Proto10113006'{
		chapter_id = ChapterId,
		index = Index,
		stage_id = StageId
	} = Msg,
	?JUDGE_RETURN(?STAGE_ID(ChapterId, Index) =:= StageId, ?ERROR_CLIENT_OPERATOR),

	ChapterConf = tb_chapter:get(ChapterId),
	?JUDGE_RETURN(ChapterConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	StageConf = tb_stage:get(StageId),
	?JUDGE_RETURN(StageConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	IsBoss = maps:get(is_boss, StageConf, 0),
	?JUDGE_RETURN(IsBoss =:= 1, ?ERROR_CLIENT_OPERATOR),

	Stage = stage_info(StageId),
	?JUDGE_RETURN(Stage#stage.is_pass, ?ERROR_CLIENT_OPERATOR),

	?JUDGE_RETURN(left_challenge_times() > 0, ?ERROR_CLIENT_OPERATOR),

	add_challenge_times(1),

	StageReward = maps:get(pass_reward, StageConf, []),
	Add = lib_player_science_api:get_effect_value(?EFFECT_CHAPTER_REWARD_ADD),
	ConfList =
		lists:foldl(fun([ItemId,Num],L) ->
			case maps:get(main_type, tb_item:get(ItemId)) == 102 andalso maps:get(sub_type, tb_item:get(ItemId)) == 19 of
				true ->
					[[ItemId,trunc(Num * (1 + Add))]|L];
				false ->
					[[ItemId,Num]|L]
			end
		end,[],StageReward),
	ItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfList),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_CHAPTER_SWEEP, StageId)),

	Respond = #'Proto50113006'{
		chapter_id = ChapterId,
		index = Index,
		stage_id = StageId,
		challenge_times = get_challenge_times()
	},
	lib_send:respond_to_client(Respond),

	check_times_event(),
	lib_player_process:process_pass_stage(2, ChapterId, StageId, 0)
.

request_all_info() ->
	ChapterIdList = tb_chapter:get_list(),
	ProtoChapterList = [chapter_to_proto(chapter_info(ChapterId)) || ChapterId <- ChapterIdList],

	Respond = #'Proto50113007'{
		chapter_list = ProtoChapterList
	},

	lib_send:respond_to_client(Respond)
.

request_hero_info(Msg) ->
	#'Proto10113008'{
		id = StageId
	} = Msg,
	StageConf = tb_stage:get(StageId),
	?JUDGE_RETURN(StageConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	RobotId = maps:get(robot_id,StageConf),
	HeroList = lib_robot_api:robot_monster_list(RobotId),
	Respond = #'Proto50113008'{
		hero_list = [lib_hero_api:hero_base_to_proto(Hero) || Hero <- HeroList]
	},
	lib_send:respond_to_client(Respond)
.