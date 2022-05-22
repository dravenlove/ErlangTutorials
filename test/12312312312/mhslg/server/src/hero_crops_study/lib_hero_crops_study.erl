%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 4月 2021 19:00
%%%-------------------------------------------------------------------
-module(lib_hero_crops_study).
-author("df").
-include("common.hrl").
-include("hero_crops_study.hrl").
-include("ProtoClient_10116.hrl").
-include("hero.hrl").

%% API
-export([
	get_hero_crops_study/0,
	put_hero_crops_study/1,
	put_hero_crops_study/2,
	player_hero_crops_study_handler/0
]).
-export([
	get_hero_crops_info/1,			%% 请求英雄兵种研究信息
	hero_crops_study/1,				%% 请求英雄兵种研究/突破
	hero_crops_study_remedy/1		%% 研究/突破失败补救
]).
-export([
	recover_study_time/0,			%% 恢复研究次数
	sign_in/0,
	update_hero_crops_study_skill_group/2,
	recover_study_time/2
]).


get_hero_crops_study() ->
	erlang:get(?ETS_HERO_CROPS_STUDY)
.

put_hero_crops_study(Hero_crops_study) ->
	put_hero_crops_study(Hero_crops_study,true)
.

put_hero_crops_study(Hero_crops_study,IsSaveDb) when is_record(Hero_crops_study,hero_crops_study) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_HERO_CROPS_STUDY),
	erlang:put(?ETS_HERO_CROPS_STUDY, Hero_crops_study)
.

ets_init() ->
	ets:new(?ETS_HERO_CROPS_STUDY, [?ETS_KEY_POS(#hero_crops_study.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HERO_CROPS_STUDY, {?TUPLE_INT(id, 1)}, true).


player_hero_crops_study_handler() ->
	#player_handler{
		ets = ?ETS_HERO_CROPS_STUDY,
		table_name = ?DBPLAYER_HERO_CROPS_STUDY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_hero_crops_study:load_hero_crops_study/1,
		save_func = fun db_hero_crops_study:save_hero_crops_study/1,
		get_func = fun get_hero_crops_study/0,
		put_func = fun put_hero_crops_study/2
	}.

crops_to_proto(Crops_study) ->
	Type = Crops_study#crops_study.type,
	#'ProtoHeroCropsStudy'{type = Type,level = Crops_study#crops_study.level,
		empirical = Crops_study#crops_study.empirical,fail_time = Crops_study#crops_study.fail_time,
		study_time = Crops_study#crops_study.study_time,time = lib_hero_crops_study_api:get_recovery_time(Type),
		is_break = Crops_study#crops_study.is_break
	}
.

study_max_level(Type) ->
	Barrack_id = lib_barrack_train:corps_of_barrack(Type),
	lib_inner_city_api:building_level(Barrack_id) * maps:get(value, tb_hero_corps_study_const:get(level_multiple))
.


hero_crops_study(Type,Study_type,Tick) ->
	?INFO("研究"),
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Key = Type * 1000 + Crops_study#crops_study.level,
	?JUDGE_RETURN(Crops_study#crops_study.level =< study_max_level(Type),?INFO("兵种对应兵营等级不足，不能研究")),
	?JUDGE_RETURN(Crops_study#crops_study.is_break =:= lib_hero_crops_study_api:get_tb_study(Key,need_break),?INFO("该等级未突破不能研究")),
	Time = case Study_type of
			    ?COMMON_STUDY_TYPE 	-> 1;
			    ?TEN_STUDY_TYPE		-> 10
	end,
	case enough_study_time(Type,Time)  of
    	true -> Need = lib_hero_crops_study_api:get_study_item(Key,Study_type),
				Item  = lib_item_api:conf_item_list_to_pack_item_list(Need),
				Ret = lib_player_pack:validate_remove(Item),
				?PACK_IS_SUCCESS(Ret),
				lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_HERO_CROPS_STUDY, Type)),
				use_study_time(Type,Time,Tick),
				Is_success = (rand:uniform() =< lib_hero_crops_study_api:get_tb_study(Key,success_rate)),
				case Is_success of
					true -> Success_add = lib_hero_crops_study_api:get_tb_study(Key,success_add),
							Empirical = case Study_type of
											?COMMON_STUDY_TYPE 	-> Success_add;
											?TEN_STUDY_TYPE		-> Success_add * 10
										end,
							add_empirical(Type,Empirical);
					false-> lib_hero_crops_study_api:update_crops_study(Type,(lib_hero_crops_study_api:get_crops_study(Type))#crops_study{study_fail = 1,study_fail_type = Study_type})
				end,
				Is_success;
		false-> skip
	end
.

hero_crops_break(Type,Tick) ->
	?INFO("突破"),
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Key = Type * 1000 + Crops_study#crops_study.level,
	?JUDGE_RETURN(Crops_study#crops_study.level =< study_max_level(Type),?INFO("兵种对应兵营等级不足，不能突破")),
	?JUDGE_RETURN(lib_hero_crops_study_api:get_tb_study(Key,need_break) =:= 1,?INFO("该等级不需要突破")),
	Time = lib_hero_crops_study_api:get_tb_study(Key,break_time),
	?JUDGE_RETURN(enough_study_time(Type,Time),?INFO("研究次数不足，不能突破")),
	Need = lib_hero_crops_study_api:get_break_item(Key),
	Item  = lib_item_api:conf_item_list_to_pack_item_list(Need),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_HERO_CROPS_STUDY, Type)),
	use_study_time(Type,Time,Tick),
	New_Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Is_success = (rand:uniform() =< (lib_hero_crops_study_api:get_tb_study(Key,break_rate) + New_Crops_study#crops_study.fail_time * lib_hero_crops_study_api:get_tb_study(Key,fail_add))),
	case Is_success of
		true -> [update_hero_crops_study_skill_group(HeroId,true) || HeroId <- lib_hero_crops_study_api:get_hero_list(Type)],
			lib_hero_crops_study_api:update_crops_study(Type,New_Crops_study#crops_study{is_break = 1}),
			add_empirical(Type,0);
		false-> lib_hero_crops_study_api:update_crops_study(Type,New_Crops_study#crops_study{break_fail = 1})
	end,
	Is_success

.

update_hero_crops_study_skill_group(HeroId,IsNotify)->
	KillList =
	lists:foldl(fun(Type,List) ->
		Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
		Key = Type * 1000 + Crops_study#crops_study.level,
		Skill = get_skill_key(Key,Key,Type,Type * 1000),
		case Skill of 0 -> List; _ -> [Skill|List] end
	end,[],lib_hero_crops_study_api:get_type_list(HeroId)),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_CROPS_STUDY, HeroId, KillList, IsNotify)
.

get_skill_key(OldKey,Key,Type,MinKey) ->
	case Key =:= MinKey of
		true -> 0;
		false->
			Kill = lib_hero_crops_study_api:get_tb_study(Key,activat_skills),
			case Kill of
				0 -> get_skill_key(OldKey, Key - 1,Type,MinKey);
				_ ->
					case OldKey =:= Key of
						true -> case (lib_hero_crops_study_api:get_crops_study(Type))#crops_study.is_break =:= 1 of
									true -> Kill;
									false-> 0
								end;
						false->	Kill
					end
			end
	end
.

add_empirical(Type,Empirical) ->
	?INFO("Empirical ~p",[Empirical]),
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	NowEmpirical = Crops_study#crops_study.empirical + Empirical,
	Level = Crops_study#crops_study.level,
	add_empirical(Type,Level,NowEmpirical,Level),
	lib_hero_crops_study_api:hero_crops_study_upgrade_prop(Level,Type)
.

add_empirical(Type,Level,NowEmpirical,OldLevel) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Key = Type * 1000 + Level,
	NeedEmpirical = lib_hero_crops_study_api:get_tb_study(Key,update_need),
	case Level =/= OldLevel of
		true -> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{is_break = 0});
		false-> skip
	end ,
	New_Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	case Level < study_max_level(Type) of
		true ->
			case (NeedEmpirical =:= 0) orelse (New_Crops_study#crops_study.is_break =/= lib_hero_crops_study_api:get_tb_study(Key,need_break)) of
				true -> lib_hero_crops_study_api:update_crops_study(Type,New_Crops_study#crops_study{level = Level,empirical = NowEmpirical,fail_time = 0});
				false->
					FailTime = case Level > OldLevel of
								   true -> 0;
								   false-> Crops_study#crops_study.fail_time
							   end ,
					case NowEmpirical < NeedEmpirical of
						true -> lib_hero_crops_study_api:update_crops_study(Type,New_Crops_study#crops_study{level = Level,empirical = NowEmpirical,fail_time = FailTime});
						false->  add_empirical(Type,Level + 1,NowEmpirical - NeedEmpirical,OldLevel)
					end
			end;
		false ->lib_hero_crops_study_api:update_crops_study(Type,New_Crops_study#crops_study{level = Level,empirical = NowEmpirical,fail_time = 0})
	end

.

hero_crops_study_remedy(Type,Is_remedy,Study_type) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Key = Type * 1000 + Crops_study#crops_study.level,
	Success_add = lib_hero_crops_study_api:get_tb_study(Key,success_add),
	Multiple = case Study_type of
					?COMMON_STUDY_TYPE 	-> 1;
					?TEN_STUDY_TYPE		-> 10
				end,
	Empirical =
	case Is_remedy of
		 1 -> [ItemId,Num] = lib_hero_crops_study_api:get_study_remedy_need(Key),
			 Item  = lib_item_api:conf_item_to_pack_item([ItemId,util:ceil(Num*Multiple)]),
			 Ret = lib_player_pack:validate_remove(Item),
			 ?PACK_IS_SUCCESS(Ret),
			 lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_HERO_CROPS_STUDY_REMEDY, Type)),
			 Remedy_get = lib_hero_crops_study_api:get_tb_const(remedy_get,floatvalue),
			  util:ceil(Success_add * Remedy_get * Multiple);
		 2 -> Fail_get = lib_hero_crops_study_api:get_tb_const(fail_get,floatvalue),
			  util:ceil(Success_add * Fail_get * Multiple)
	end,
	add_empirical(Type,Empirical)
.

hero_crops_break_remedy(Type,Is_remedy) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Key = Type * 1000 + Crops_study#crops_study.level,
	case Is_remedy of
		1 -> Need = lib_hero_crops_study_api:get_break_remedy_need(Key,Crops_study#crops_study.fail_time),
			Item  = lib_item_api:conf_item_to_pack_item(Need),
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_HERO_CROPS_STUDY_REMEDY, Type)),
			lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{is_break = 1}),
			[update_hero_crops_study_skill_group(HeroId,true) || HeroId <- lib_hero_crops_study_api:get_hero_list(Type)],
			add_empirical(Type,0);
		2 -> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{fail_time = Crops_study#crops_study.fail_time + 1})
	end
.

enough_study_time(Type,Time) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	OldTime = Crops_study#crops_study.study_time,
	OldTime >= Time
.
use_study_time(Type,Time,Tick) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	OldTime = Crops_study#crops_study.study_time,
	Last_add_tick = case Crops_study#crops_study.last_add_tick =:= 0 of true -> Tick;false-> Crops_study#crops_study.last_add_tick end,
	lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{study_time = OldTime - Time,last_add_tick = Last_add_tick}),
	BarrackId = lib_barrack_train:corps_of_barrack(Type),
	lib_inner_city_api:building_state_to_client(BarrackId)
.

recover_study_time()->
	Tick = lib_timer:unixtime(),
	List = lib_hero_crops_study_api:get_tb_const(corps_type,jsonvalue),
	lists:foreach(fun(Type) ->
		Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
		case Crops_study#crops_study.study_time =:= ?STUDY_MAX_TIME of
			  true ->skip;
			  false->recover_study_time(Tick,Type)
		end
	end,List)
.

recover_study_time(Tick,Type) ->
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	OldTime = Crops_study#crops_study.study_time,
	AddTime = (Tick - Crops_study#crops_study.last_add_tick) div ?STUDY_TIME_RECOVER,
	case (OldTime + AddTime) >= ?STUDY_MAX_TIME of
		true -> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{study_time = ?STUDY_MAX_TIME,last_add_tick = 0});
		false-> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{
			study_time = OldTime + AddTime,last_add_tick = Crops_study#crops_study.last_add_tick + AddTime * ?STUDY_TIME_RECOVER})
	end
.

sign_in() ->
	Tick = lib_timer:unixtime(),
	List = lib_hero_crops_study_api:get_tb_const(corps_type,jsonvalue),
	lists:foreach(fun(Type) ->
		Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
		case Crops_study#crops_study.study_fail =:= 0 of
			true  ->skip;
			false ->hero_crops_study_remedy(#'Proto10116073'{main_type = ?HERO_CROP_STUDY,type = Type,is_remedy = 2,study_type = Crops_study#crops_study.study_fail_type})
		end,
		case Crops_study#crops_study.break_fail =:= 0 of
			true  ->skip;
			false ->hero_crops_study_remedy(#'Proto10116073'{main_type = ?HERO_CROP_BREAK,type = Type,is_remedy = 2,study_type = 1})
		end,
		recover_study_time(Tick,Type)
	end,List)
.

%% ================= %%

get_hero_crops_info(Msg) ->
	recover_study_time(),
	#'Proto10116071'{type = Type} = Msg,
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Info = crops_to_proto(Crops_study),
	Respond = #'Proto50116071'{
		info = Info
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("get_hero_crops_info~p",[Respond])

.

hero_crops_study(Msg) ->
	#'Proto10116072'{main_type = Main_type,type = Type,study_type = Study_type} = Msg,
	Tick = lib_timer:unixtime(),
	Is_success =
	case Main_type of
		?HERO_CROP_STUDY -> hero_crops_study(Type,Study_type,Tick);
		?HERO_CROP_BREAK -> hero_crops_break(Type,Tick)
	end,
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
%%	?DEBUG("Is_success  ~p",[Is_success]),
	Respond = case Is_success of
				  true -> #'Proto50116072'{main_type = Main_type,is_success = 1,info = crops_to_proto(Crops_study),study_type = Study_type};
				  false-> #'Proto50116072'{main_type = Main_type,is_success = 2,info = #'ProtoHeroCropsStudy'{},study_type = Study_type};
				  _    -> ?INFO("不满足研究或突破的条件")
			  end,
	lib_send:respond_to_client(Respond),
	?INFO("hero_crops_study~p",[Respond])
.

hero_crops_study_remedy(Msg) ->
	#'Proto10116073'{main_type = Main_type,type = Type,is_remedy = Is_remedy,study_type = Study_type} = Msg,
	?INFO("Msg ~p",[Msg]),
	Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	case Main_type of
		?HERO_CROP_STUDY -> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{study_fail = 0,study_fail_type = 0}),
			hero_crops_study_remedy(Type,Is_remedy,Study_type);
		?HERO_CROP_BREAK -> lib_hero_crops_study_api:update_crops_study(Type,Crops_study#crops_study{break_fail = 0}),
			hero_crops_break_remedy(Type,Is_remedy)
	end,
	New_Crops_study = lib_hero_crops_study_api:get_crops_study(Type),
	Info = crops_to_proto(New_Crops_study),
	Respond = #'Proto50116073'{
		info = Info
	},
	lib_send:respond_to_client(Respond),
	?INFO("get_hero_crops_info~p",[Respond])
.