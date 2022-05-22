%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 4月 2021 19:01
%%%-------------------------------------------------------------------
-module(lib_hero_crops_study_api).
-author("df").
-include("common.hrl").
-include("hero_crops_study.hrl").
-include("hero.hrl").
%% API
-export([
	get_crops_study/1,
	update_crops_study/2,
	get_recovery_time/1,				%% 获得下次增加研究次数时间
	get_hero_list/1,					%% 根据兵种获得英雄id列表
	get_type_list/1,
	hero_crops_study_upgrade_prop/2,	%% 兵种升级处理

	hero_crops_study_to_prop/1,
	hero_crops_study_to_proto/2,

	add_study_time/1					%% 研究次数恢复满
]).


-export([
	get_tb_const/2,
	get_tb_study/2,
	get_study_item/2,
	get_break_item/1,
	get_study_remedy_need/1,
	get_break_remedy_need/2
]).



get_crops_study(Type)->
	Hero_crops_study = lib_hero_crops_study:get_hero_crops_study(),
	maps:get(Type,Hero_crops_study#hero_crops_study.study_maps,#crops_study{
		type = Type,study_time = ?STUDY_MAX_TIME
	})
.

update_crops_study(Type,Crops_study) when is_record(Crops_study,crops_study)->
	Hero_crops_study = lib_hero_crops_study:get_hero_crops_study(),
	NewMap = maps:put(Type,Crops_study,Hero_crops_study#hero_crops_study.study_maps),
	lib_hero_crops_study:put_hero_crops_study(Hero_crops_study#hero_crops_study{
		study_maps = NewMap
	})
.

get_recovery_time(Type) ->
	Crops_study = get_crops_study(Type),
	Tick = lib_timer:unixtime(),
	case ?STUDY_TIME_RECOVER - (Tick - Crops_study#crops_study.last_add_tick) < 0 of
		true -> lib_hero_crops_study:recover_study_time(Tick,Type);
		false-> skip
	end,
	New_Crops_study = get_crops_study(Type),
	case Crops_study#crops_study.study_time =:= ?STUDY_MAX_TIME of
		true  -> 0;
		false -> ?STUDY_TIME_RECOVER - (Tick - New_Crops_study#crops_study.last_add_tick)
	end
.

get_hero_list(Type) ->
	HeroList = lib_hero_api:hero_id_list(),
	lists:filter(fun(Id) ->
		{FrontType, BackType} = lib_hero_api:hero_corps_type(Id),
		(FrontType =:= Type) orelse (BackType =:= Type)
	end,HeroList)
.

get_type_list(HeroId) ->
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	[FrontType,BackType]
.
hero_crops_study_to_prop(#hero{id = Hero_id}) ->
	List = hero_get_type(Hero_id),
	PropList = lists:foldr(fun(Type,L)->
		Crops_study = get_crops_study(Type),
		Key = Type * 1000 + Crops_study#crops_study.level,
		[lib_fight_prop:cfg_prop_dict_from_conf(tb_hero_corps_study:get(Key))|L]
	 end,[],List),
	lib_fight_prop:increase_prop(PropList)
.

hero_get_type(Hero_id) ->
	{FrontType, BackType} = lib_hero_api:hero_corps_type(Hero_id),
	[FrontType, BackType]
.

hero_crops_study_upgrade_prop(Level,Type) ->
	Crops_study = get_crops_study(Type),
	case Level =/= Crops_study#crops_study.level of
		 true ->HeroId_list = get_hero_list(Type),
			 update_hero_prop(HeroId_list);
		 false -> skip
	end
.

update_hero_prop([]) ->
	skip
;
update_hero_prop(HeroId_list) ->
	update_hero_prop(HeroId_list,[])
.

update_hero_prop([Hero_id|Hero_list],HeroList) ->
	Hero = lib_hero_api:hero_info(Hero_id),
	%% 重新计算英雄信息
	lib_hero_prop:update_hero_prop(Hero_id, ?HERO_CROPS_STUDY),
	update_hero_prop(Hero_list,[Hero|HeroList])
;
update_hero_prop([],HeroList) ->
	%% 通知前端更新英雄信息
	lib_hero_api:notify_hero_update(HeroList,?HERO_UPDATE_CROPS_STUDY)
.

hero_crops_study_to_proto(ProtoHero, #hero{id = Hero_id}) ->
	List = hero_get_type(Hero_id),
	Hero_crops_study = hero_crops_study_proto(List),
	ProtoHero#'ProtoHero'{
		hero_crops_study = Hero_crops_study
	}
.
hero_crops_study_proto(List) ->
	lists:foldl(fun(Type,L) ->
		Crops_study = get_crops_study(Type),
		[#'ProtoKeyValue'{key = Type,value = Crops_study#crops_study.level}|L]
	end,[],List)

.
%% ======= %%
-define(ITEM1, lib_hero_crops_study_api:get_tb_const(item1,value)).
-define(ITEM2, lib_hero_crops_study_api:get_tb_const(item2,value)).

get_tb_const(Key,Type)->
	maps:get(Type, tb_hero_corps_study_const:get(Key))
.

get_tb_study(Key,Type)->
	maps:get(Type, tb_hero_corps_study:get(Key),0)
.

get_study_item(Key,Study_type) ->
	Num1 = get_tb_study(Key,item1),
	Num2 = get_tb_study(Key,item2),
	Multiple = case Study_type of
				   ?COMMON_STUDY_TYPE	-> 1;
				   ?TEN_STUDY_TYPE 		-> 10
			   end,
	[[?ITEM1,Num1 * Multiple],[?ITEM2,Num2 * Multiple]]
.

get_break_item(Key) ->
	Num1 = get_tb_study(Key,break_item1),
	Num2 = get_tb_study(Key,break_item2),
	[[?ITEM1,Num1],[?ITEM2,Num2]]
.

get_study_remedy_need(Key) ->
	[get_tb_const(money,value),get_tb_study(Key,remedy)]
.

get_break_remedy_need(Key,Fail_time) ->
	[get_tb_const(money,value),(get_tb_study(Key,first_remedy) - Fail_time * get_tb_study(Key,advance_remedy))]
.

add_study_time(Type) ->
	Crops_study = get_crops_study(Type),
	update_crops_study(Type,Crops_study#crops_study{study_time = ?STUDY_MAX_TIME,last_add_tick = 0})

.