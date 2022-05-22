%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 11:34 AM
%%%-------------------------------------------------------------------
-module(lib_holy_spirit_hall_api).
-author("df").
-include("common.hrl").
-include("holy_spirit_hall.hrl").
-include("hero.hrl").
%% API
-export([
	get_hall_info/1,					%% 获得单个大厅信息
	update_hall_info/1,					%% 更改单个大厅信息
	get_battle_info/2,					%% 获得单个大厅位置信息
	update_battle_info/2,				%% 更改单个大厅位置信息
	get_hall_skill_id/1,				%% 获得大厅技能id
	update_hall_skill_id/2,				%% 更改大厅技能id
	recalculate_skill_id_by_battle/1,			%% 圣灵大厅上阵英雄时计算大厅技能id
	recalculate_skill_id_by_hero_update/1,		%% 英雄信息更改时计算大厅技能id
	get_all_battle_hero/0,				%% 获得圣灵大厅全部已上阵英雄列表
	get_battle_hero_by_hall/1,			%% 获得单个大厅已上阵英雄列表
	get_can_battle_hero_by_hall/1,		%% 获得单个大厅可上阵英雄列表
	hero_is_battle/1,					%% 英雄是否上阵  否  返回0 ;是  返回上阵大厅id
	hero_battle_info/2,					%% 英雄上阵位置  查无 返回0 ;找到  返回位置id
	hero_battle/3,						%% 上阵英雄  or 下阵英雄 or 更改 位置信息(开启位置使用)
	free_place_by_hall/1,				%% 该大厅空闲位置列表

	hall_to_prop/1,						%% 圣灵大厅加成到英雄
	hall_to_proto/2						%% 用于返回前端英雄

]).
-export([
	hero_have_skill_list/1,				%% 英雄获得的圣灵大厅加成id(技能id)
	update_holy_spirit_hall_skill_group/2,
	robot_get_holy/2
]).



get_hall_info(HallId)->
	Holy_spirit_hall = lib_holy_spirit_hall:get_holy_spirit_hall(),
	Dict = Holy_spirit_hall#holy_spirit_hall.hall,
	?DICT_FETCH(HallId,Dict,#hall{id = HallId})
.

update_hall_info(Hall) when is_record(Hall, hall) ->
	Holy_spirit_hall = lib_holy_spirit_hall:get_holy_spirit_hall(),
	Dict = Holy_spirit_hall#holy_spirit_hall.hall,
	NewDict = dict:store(Hall#hall.id,Hall,Dict),
	lib_holy_spirit_hall:put_holy_spirit_hall(Holy_spirit_hall#holy_spirit_hall{hall = NewDict})
.

get_battle_info(HallId,Place)->
	Hall = get_hall_info(HallId),
	Dict = Hall#hall.battles,
	#{'open_num' := Open_num} = tb_holy_spirit_hall_base:get(HallId),
	Type =
		case Place =< Open_num of
			true -> 0;
			false-> -1
		end,
	?DICT_FETCH(Place,Dict,#battle{place = Place,hero_id = Type})
.

update_battle_info(HallId,Battle) when is_record(Battle, battle)->
	Hall = get_hall_info(HallId),
	Dict = Hall#hall.battles,
	NewDict = dict:store(Battle#battle.place,Battle,Dict),
	update_hall_info(Hall#hall{battles = NewDict})
.

get_old_hall_skill_id(HallId) ->
	Hall = get_hall_info(HallId),
	Hall#hall.hall_skill_id
.

update_hall_skill_id(HallId,Skill_id) ->
	Hall = get_hall_info(HallId),
	update_hall_info(Hall#hall{hall_skill_id = Skill_id}),
	Hero_list = get_can_battle_hero_by_hall(HallId),
	[update_holy_spirit_hall_skill_group(HeroId,true) || HeroId <- Hero_list],
	update_hero_prop(Hero_list,[])
.
%% 更新英雄属性
update_hero_prop([HeroId|List],HeroList) ->
	Hero = lib_hero_api:hero_info(HeroId),
	%% 重新计算英雄信息
	lib_hero_prop:update_hero_prop(HeroId, ?HOLY_SPIRIT_HALL_ADDITION),
	update_hero_prop(List,[Hero|HeroList])
;

update_hero_prop([],HeroList)->
	%% 通知前端更新英雄信息
	lib_hero_api:notify_hero_update(HeroList,?HERO_UPDATE_TYPE_HALL_INFO)
.

recalculate_skill_id_by_battle(HallId) ->
	SkillId = get_hall_skill_id(HallId),
	OldSkillId = get_old_hall_skill_id(HallId),
	case SkillId =/= OldSkillId of
		true -> update_hall_skill_id(HallId,SkillId);
		false-> skip
	end
.
recalculate_skill_id_by_hero_update(HeroId) ->
	HallId = hero_is_battle(HeroId),
	case HallId =/= 0 of
		true ->
				Battle = hero_battle_info(HeroId,HallId),
				HeroMax = lib_holy_spirit_hall:get_hero_max_grade(HallId),
				BattleInfo = get_battle_info(HallId,Battle),
				update_battle_info(HallId,BattleInfo#battle{grade = lib_holy_spirit_hall:hero_grade(HeroId,HeroMax)}),
				recalculate_skill_id_by_battle(HallId);
		false->skip
	end
.

get_battle_hero_by_hall(HallId) ->
	get_battle_hero_by_hall(HallId,[],?PLACE)

.
get_battle_hero_by_hall(HallId,List,Place) ->
	case Place =:= 0 of
		true  -> List;
		false -> #battle{hero_id = Hero_id} = get_battle_info(HallId,Place),
			case (Hero_id =:= 0) or (Hero_id =:= -1) of
				true  -> get_battle_hero_by_hall(HallId,List,Place - 1);
				false -> get_battle_hero_by_hall(HallId,[Hero_id|List],Place - 1)
			end
	end
.

get_all_battle_hero() ->
	Hall_Id_list = tb_holy_spirit_hall_base:get_list(),
	get_all_battle_hero(Hall_Id_list,[])
.
get_all_battle_hero([HallId|Hall_Id_list],List) ->
	New = get_battle_hero_by_hall(HallId),
	get_all_battle_hero(Hall_Id_list,List ++ New)
;
get_all_battle_hero([],List) ->
	List
.


get_can_battle_hero_by_hall(HallId) ->
	List = lib_hero_api:hero_id_list(),
	get_can_battle_hero_by_hall(HallId,List,[])

.
get_can_battle_hero_by_hall(HallId,[HeroId|HeroId_list],List) ->
	#{   'hero_type' := Need_Hero_type,  'troops_type' := Troops_type} = tb_holy_spirit_hall_base:get(HallId),
	Hero_type = lib_hero_api:hero_type(HeroId),
	Front_corps = lib_hero_api:hero_front_corps(HeroId),
	Back_corps = lib_hero_api:hero_back_corps(HeroId),
	case (Need_Hero_type =:= Hero_type) or  (Troops_type =:= Front_corps) or (Troops_type =:= Back_corps) of
		true  -> get_can_battle_hero_by_hall(HallId,HeroId_list,[HeroId|List]) ;
		false -> get_can_battle_hero_by_hall(HallId,HeroId_list,List)
	end
;
get_can_battle_hero_by_hall(_HallId,[],List) ->
	List
.

hero_is_battle(Hero_id) ->
	List = get_all_battle_hero(),
	case lists:member(Hero_id,List) of
		false -> 0;
		true  -> hero_battle_hall(Hero_id)

	end
.

hero_battle_hall(Hero_id) ->
	Hall_Id_list = tb_holy_spirit_hall_base:get_list(),
	hero_battle_hall(Hall_Id_list,Hero_id)
.
hero_battle_hall([HallId|Hall_Id_list],Hero_id) ->
	List = get_battle_hero_by_hall(HallId),
	case lists:member(Hero_id,List) of
		true  -> HallId;
		false -> hero_battle_hall(Hall_Id_list,Hero_id)
	end

;
hero_battle_hall([],_Hero_id) ->
	0
.

hero_battle_info(Hero_id,HallId) ->
	hero_battle_info(Hero_id,HallId,?PLACE)
.
hero_battle_info(Hero_id,HallId,Place) ->
	case Place =:= 0 of
		true -> 0;
		false->	#battle{hero_id = Battle_hero_id} = get_battle_info(HallId,Place),
			case Battle_hero_id =:= Hero_id of
				true -> Place;
				false-> hero_battle_info(Hero_id,HallId,Place - 1)
			end
	end
.

hero_battle(Hero_id,HallId,Place) ->
	Max = lib_holy_spirit_hall:get_hero_max_grade(HallId),
	Battle = #battle{
		place = Place,hero_id = Hero_id,grade = lib_holy_spirit_hall:hero_grade(Hero_id,Max)
	},
	update_battle_info(HallId,Battle)
.

free_place_by_hall(HallId) ->
	#battle{hero_id = Battle_hero_id} = get_battle_info(HallId,?PLACE),
	case Battle_hero_id =:= 0 of
		true -> free_place_by_hall(HallId,?PLACE - 1,[?PLACE]);
		false-> free_place_by_hall(HallId,?PLACE - 1,[])
	end
.

free_place_by_hall(HallId,Place,List) ->
	#battle{hero_id = Battle_hero_id} = get_battle_info(HallId,Place),
	case Place =:= 0 of
		true -> List;
		false->	case Battle_hero_id =:= 0 of
					   true -> free_place_by_hall(HallId,Place - 1,[Place|List]);
					   false-> free_place_by_hall(HallId,Place - 1,List)
				   end
	end
.

hall_to_prop(#hero{id = Hero_id}) ->
	HallList = hero_get_prop(Hero_id),
	PropList = lists:foldr(fun(Skill,List)->
		[lib_fight_prop:cfg_prop_dict_from_conf(tb_skill:get(Skill))|List]
	end,[],hero_get_hall_skill_id(HallList)),
	lib_fight_prop:increase_prop(PropList)
.

hall_to_proto(ProtoHero, Hero) ->
	HallList = hero_get_prop(Hero#hero.id),
	KillIdList  = hero_get_hall_skill_id(HallList),
	ProtoHero#'ProtoHero'{
		hall_skill_list = KillIdList
	}
.

hero_get_prop(Hero_id) ->
	Hall_list = tb_holy_spirit_hall_base:get_list(),
	hero_get_prop(Hero_id,Hall_list,[])
.
hero_get_prop(HeroId,[HallId|Hall_list],List) ->
	#{   'hero_type' := Need_Hero_type,  'troops_type' := Troops_type} = tb_holy_spirit_hall_base:get(HallId),
	Hero_type = lib_hero_api:hero_type(HeroId),
	Front_corps = lib_hero_api:hero_front_corps(HeroId),
	Back_corps = lib_hero_api:hero_back_corps(HeroId),
	case (Need_Hero_type =:= Hero_type) orelse  (Troops_type =:= Front_corps) orelse (Troops_type =:= Back_corps) of
		true -> hero_get_prop(HeroId,Hall_list,[HallId|List]);
		false-> hero_get_prop(HeroId,Hall_list,List)
	end
;
hero_get_prop(_Hero_id,[],List) ->
	List
.

get_hall_skill_id(HallId)->
	HeroMax = lib_holy_spirit_hall:get_hero_max_grade(HallId),
	HallGrade = lib_holy_spirit_hall:get_battle(?PLACE,HallId,HeroMax),
	KeyList = lists:filter(fun(E)->
		maps:get(hall_id, tb_hall_prop:get(E)) =:= HallId end,
	tb_hall_prop:get_list()),
	[Id] = lists:filter(fun(E)->
		((maps:get(point_left, tb_hall_prop:get(E)) =< HallGrade) andalso (maps:get(point_right, tb_hall_prop:get(E)) >= HallGrade))
	end,KeyList),
	maps:get(skill_id, tb_hall_prop:get(Id),0)
.

hero_get_hall_skill_id(HallList) ->
	hero_get_hall_skill_id(HallList,[])
.
hero_get_hall_skill_id([HallId|HallList],Skill_List) ->
	SkillId = get_hall_skill_id(HallId),
	case SkillId =:= 0 of
		true -> hero_get_hall_skill_id(HallList,Skill_List);
		false -> hero_get_hall_skill_id(HallList,[SkillId|Skill_List])
	end
;
hero_get_hall_skill_id([],Skill_List) ->
	Skill_List
.

hero_have_skill_list(HeroId) ->
	HallList = hero_get_prop(HeroId),
	hero_get_hall_skill_id(HallList)
.

update_holy_spirit_hall_skill_group(HeroId,IsNotify) ->
	KillList = hero_have_skill_list(HeroId),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_HOLY_SPIRIT_HALL, HeroId, KillList, IsNotify)
.

robot_get_holy(Hero_base,Robot_id) ->
	case tb_robot:get(Robot_id) of
		false -> {[],dict:new()};
		_ ->
			Conf = tb_monster_base:get(Hero_base#hero_base.robot_base_id),
			Holy_skill_list = maps:get(holy_skill,tb_robot:get(Robot_id),[]),
			case Holy_skill_list =:= [] of
				true -> {[],dict:new()};
				false->	{SkillList,PropList} =
					lists:foldl(fun(Holy_skill,{SkillList,List}) ->
						HallId = Holy_skill div 1000,
						#{   'hero_type' := Need_Hero_type,  'troops_type' := Troops_type} = tb_holy_spirit_hall_base:get(HallId),
						Hero_type = maps:get(hero_type,Conf),
						case (Need_Hero_type =:= Hero_type) or  (Troops_type =:= Hero_base#hero_base.former_type) or (Troops_type =:= Hero_base#hero_base.latter_type) of
							true  -> Skill = tb_hall_prop:get(Holy_skill),
								Prop = lib_fight_prop:cfg_prop_dict_from_conf(tb_skill:get(Skill)),
								{[Skill|SkillList],[Prop|List]};
							false -> {SkillList,List}
						end
					end,{[],[]},Holy_skill_list),
					{SkillList,lib_fight_prop:increase_prop(PropList)}
			end
	end
.

