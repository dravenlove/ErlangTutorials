%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十一月 2020 10:38
%%%-------------------------------------------------------------------
-module(lib_hero_prop).
-author("13661").

-include("log.hrl").
-include("base.hrl").
-include("hero.hrl").
-include("fight_prop.hrl").

%% API
-export([
	sign_in/0,
	sign_out/0,
	init_hero_prop/1,
	prop_add/2,				%% 获取英雄内政属性加成
	check_and_refresh_all_hero_prop/0,
	validate_base_prop_update/2,
	calc_hero_prop/1
]).
-export([
	fetch_hero_prop/2,
	update_hero_prop/2,
	update_all_hero_prop/0
]).

prop_add(HeroId, PropType) ->
	HeroProp = lib_hero_api:hero_prop(HeroId),
	util:dict_get(PropType, HeroProp, 0)
.

hero_prop_list(Hero) when is_record(Hero, hero)->
	List = [
		{?HERO_PROP_TYPE_INIT, fun lib_hero:calc_init_prop/1, [Hero]},
		{?HERO_PROP_TYPE_LEVEL, fun lib_hero_level:calc_level_prop/1, [Hero]},
		{?HERO_PROP_TYPE_STAR, fun lib_hero_star:calc_star_prop/1, [Hero]},
		{?HERO_PROP_TYPE_CORPS_LEVEL, fun lib_hero_corps:calc_corps_level_prop/1, [Hero]},
		{?HERO_PROP_TYPE_CORPS_STAGE, fun lib_hero_corps:calc_corps_stage_prop/1, [Hero]},
		{?HERO_PROP_TYPE_SKILL_LEARNING, fun lib_hero_skill_learning:calc_skill_learning_prop/1, [Hero]},
		{?HERO_PROP_TYPE_HONOR_TITLE, fun lib_honor_title:calc_honor_title_prop/1, [Hero]},
		{?HERO_PROP_TYPE_EQUIP, fun lib_equip_api:calc_equip_prop/1, [Hero]},
		{?HOLY_SPIRIT_HALL_ADDITION, fun lib_holy_spirit_hall_api:hall_to_prop/1, [Hero]},
		{?HERO_PROP_SCIENCE, fun lib_player_science:calc_science_prop/1, [Hero]},
		{?HERO_PROP_INNER_CITY, fun lib_inner_city_api:building_to_prop/1, [Hero]},
		{?HERO_PROP_DESTINY, fun lib_hero_destiny:hero_destiny_to_prop/1, [Hero]},
		{?HERO_PROP_GENIUS, fun lib_hero_genius:calc_genius_prop/1, [Hero]},
		{?HERO_CROPS_STUDY, fun lib_hero_crops_study_api:hero_crops_study_to_prop/1, [Hero]},
		{?HERO_STAR_INFO, fun lib_star_api:hero_star_info_to_prop/1, [Hero]},
		{?HERO_PROP_ASSIST, fun lib_hero_assist:calc_assist_prop/1, [Hero]},
		{?HERO_PROP_TYPE_FORMATION, fun lib_hero_formation:calc_formation_prop/1, [Hero]}
	],

	RunList = [{Fun, Arg} || {_Type, Fun, Arg} <- List],
	lib_common:try_run(RunList, dict:new())
.

calc_hero_prop(Hero) when is_record(Hero, hero) ->
	PropList = hero_prop_list(Hero),
	lib_fight_prop:increase_prop(PropList)
%%	PropList = hero_prop_list(Hero),
%%	TotalProp = lib_fight_prop:increase_prop_dict(PropList),
%%	PropBase = lib_fight_prop:hero_to_prop_base(Hero),
%%	lib_fight_prop:parsing_cfg_prop_dict(PropBase, TotalProp)
.

fetch_hero_prop(HeroId, Index) ->
	Hero = lib_hero_api:hero_info(HeroId),
	PropList = hero_prop_list(Hero),
	lists:nth(Index, PropList)
.

sign_in() ->
	refresh_all_hero_prop()
.

sign_out() ->
	check_and_refresh_all_hero_prop()
.

validate_base_prop_update(OldPropDict, NewPropDict) ->
	lib_common:list_foldl(fun(PropName, Flag) ->
		OldProp = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, OldPropDict),
		NewProp = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, NewPropDict),
		?JUDGE_BREAK(OldProp =:= NewProp, true),
		Flag
  	end, false, ?PROP_BASE_LIST)
.

init_hero_prop(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	PrevPropDict = Hero#hero.prop_dict,
	ConfPropDict = calc_hero_prop(Hero),
	PropBase = lib_fight_prop:hero_to_prop_base(Hero),
	PropDict = lib_fight_prop:parsing_cfg_prop_dict(PropBase, ConfPropDict),
	Force = lib_fight_prop:calc_force(PropBase, ConfPropDict),
	lib_hero_api:update_hero(Hero#hero{
		prev_prop_dict = PrevPropDict,
		prop_dict = PropDict,
		force = Force
	})
.

refresh_all_hero_prop() ->
	PlayerHero = lib_hero:get_player_hero(),
	#player_hero{
		hero_dict = HeroDict
	} = PlayerHero,

	NewHeroDict =
	dict:fold(fun(HeroId, Hero, Dict) ->
		PrevPropDict = Hero#hero.prop_dict,
		ConfPropDict = calc_hero_prop(Hero),
		PropBase = lib_fight_prop:hero_to_prop_base(Hero),
		PropDict = lib_fight_prop:parsing_cfg_prop_dict(PropBase, ConfPropDict),
		Force = lib_fight_prop:calc_force(PropBase, ConfPropDict),
		dict:store(HeroId, Hero#hero{
			prev_prop_dict = PrevPropDict,
			prop_dict = PropDict,
			force = Force
		}, Dict)
	end, dict:new(), HeroDict),

	lib_hero:put_player_hero(PlayerHero#player_hero{
		prop_all_update = false,
		hero_dict = NewHeroDict,
		prop_update_sets = sets:new()
	}),

	lib_common:dict_map(fun(HeroId, Hero) ->
		?JUDGE_CONTINUE(validate_base_prop_update(Hero#hero.prev_prop_dict, Hero#hero.prop_dict)),
		process_base_prop_update(HeroId)
	end, NewHeroDict)
.

check_and_refresh_all_hero_prop() ->
	PlayerHero = lib_hero:get_player_hero(),
	#player_hero{
		hero_dict = HeroDict,
		prop_all_update = AllUpdate,
		prop_update_sets = PropUpdateSet
	} = PlayerHero,

	case AllUpdate of
		true ->
			refresh_all_hero_prop();
		false ->
			NewHeroDict =
			lib_common:set_fold(fun(HeroId, Dict) ->
				?JUDGE_CONTINUE(dict:is_key(HeroId, HeroDict), Dict),

				Hero = dict:fetch(HeroId, HeroDict),
				PrevPropDict = Hero#hero.prop_dict,
				ConfPropDict = calc_hero_prop(Hero),
				PropBase = lib_fight_prop:hero_to_prop_base(Hero),
				PropDict = lib_fight_prop:parsing_cfg_prop_dict(PropBase, ConfPropDict),
				Force = lib_fight_prop:calc_force(PropBase, ConfPropDict),
				dict:store(HeroId, Hero#hero{
					prev_prop_dict = PrevPropDict,
					prop_dict = PropDict,
					force = Force
				}, Dict)
            end, HeroDict, PropUpdateSet),

			case sets:size(PropUpdateSet) > 0 of
				false -> skip;
				true ->
					lib_hero:put_player_hero(PlayerHero#player_hero{
						hero_dict = NewHeroDict,
						prop_update_sets = sets:new()
					})
			end,

			lib_common:list_map(fun(HeroId) ->
				?JUDGE_CONTINUE(dict:is_key(HeroId, HeroDict)),
				Hero = dict:fetch(HeroId, NewHeroDict),
				case lib_troops_api:is_troops(HeroId) of
					false -> skip;
					true ->
						ComBatHero = lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_to_hero_base(Hero)),
						lib_troops_api:async(fun lib_troops_api:u_combat_hero/1, [ComBatHero])
				end,
				?JUDGE_CONTINUE(validate_base_prop_update(Hero#hero.prev_prop_dict, Hero#hero.prop_dict)),
				process_base_prop_update(HeroId)
			end, sets:to_list(PropUpdateSet))
	end,

	case AllUpdate orelse sets:size(PropUpdateSet) > 0 of
		false -> skip;
		true -> lib_player:check_player_force()
	end
.

update_hero_prop(HeroId, Type) ->
	?INFO("~p ~ts update hero prop ~p ~p", [lib_player:player_id(), lib_player:player_name(), HeroId, Type]),
	PlayerHero = lib_hero:get_player_hero(),
	UpdateSet = PlayerHero#player_hero.prop_update_sets,
	lib_hero:put_player_hero(PlayerHero#player_hero{prop_update_sets = sets:add_element(HeroId, UpdateSet)})
.

update_all_hero_prop() ->
	PlayerHero = lib_hero:get_player_hero(),
	lib_hero:put_player_hero(PlayerHero#player_hero{prop_all_update = true})
.

process_base_prop_update(HeroId) ->
	?INFO("hero base prop update ~p ~p", [lib_player:player_id(), HeroId]),

	update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	lib_hero_skill_learning:update_learning_skill_group(HeroId, false)
.