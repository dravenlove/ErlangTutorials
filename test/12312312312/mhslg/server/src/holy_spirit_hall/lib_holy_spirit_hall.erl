%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 11:33 AM
%%%-------------------------------------------------------------------
-module(lib_holy_spirit_hall).
-author("df").
-include("common.hrl").
-include("holy_spirit_hall.hrl").
-include("ProtoClient_10131.hrl").
-include("ProtoPublic.hrl").
-include("inner_city.hrl").

%% API
-export([
	get_holy_spirit_hall/0,
	put_holy_spirit_hall/1,
	put_holy_spirit_hall/2,
	player_holy_spirit_hall_handler/0,
	request_holy_spirit_hall_info/0,
	request_hero_info/1,
	request_update_batter_hero/1,
	request_unlock_place/1,
	request_upgrade/1,
	request_one_key_battle/1
]).
-export([
	get_hero_max_grade/1,		%% 英雄可获得最高评分
	get_battle/3,
	hero_grade/2,				%% 计算英雄评分 有上限
	hero_grade/1				%% 计算英雄评分 无上限
]).

get_holy_spirit_hall() ->
	erlang:get(?ETS_PLAYER_HOLY_SPIRIT_HALL)
.

put_holy_spirit_hall(Holy_spirit_hall) when is_record(Holy_spirit_hall, holy_spirit_hall)  ->
	put_holy_spirit_hall(Holy_spirit_hall,true)
.
put_holy_spirit_hall(Online_gift,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_HOLY_SPIRIT_HALL),
	erlang:put(?ETS_PLAYER_HOLY_SPIRIT_HALL, Online_gift)
.

ets_init() ->
	ets:new(?ETS_PLAYER_HOLY_SPIRIT_HALL, [?ETS_KEY_POS(#holy_spirit_hall.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HOLY_SPIRIT_HALL, {?TUPLE_INT(id, 1)}, true).

player_holy_spirit_hall_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_HOLY_SPIRIT_HALL,
		table_name = ?DBPLAYER_HOLY_SPIRIT_HALL,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_holy_spirit_hall:load_holy_spirit_hall/1,
		save_func = fun db_holy_spirit_hall:save_holy_spirit_hall/1,
		get_func = fun get_holy_spirit_hall/0,
		put_func = fun put_holy_spirit_hall/2
	}.

%% 技能id变成group字段 去除配置表没有的技能
skill_id_to_group(Hero_skill_list)->
	Group_list = lists:foldl(fun(E,List)-> [maps:get(group, tb_skill:get(E),0)|List]  end,[],Hero_skill_list),
	ALL_group_list = tb_skill_to_hall_score:get_list(),
	lists:filter(fun(Group)-> lists:member(Group,ALL_group_list) =:= true end,Group_list)

.
%% 单个英雄最高评分
get_hero_max_grade(HallId) ->
	#hall{level = Level} = lib_holy_spirit_hall_api:get_hall_info(HallId),
	Key = HallId * 1000 + Level,
	maps:get(hero_limit_score, tb_holy_spirit_hall_up:get(Key))
.
%% 计算单个英雄分数  有上限
hero_grade(HeroId,HeroMax) ->
	case HeroId =:= 0 of
		true -> 0;
		false->	%% 英雄评分
			Sum  = hero_grade(HeroId),
			case Sum > HeroMax of
				true -> HeroMax;
				false->	Sum
			end
	end
.
%% 计算单个英雄分数  无上限
hero_grade(HeroId) ->
	%% 单个英雄评分=5×英雄等级+5×兵种总阶数+技能评分+装备评分+星级评分
	Hero_level = lib_hero_api:hero_level(HeroId),
	Hero_stage = lib_hero_api:hero_front_stage(HeroId) + lib_hero_api:hero_back_stage(HeroId),
	Hero_skill_list  = lib_hero_api:hero_skill_list(HeroId),
	%% 带等级英雄技能id变成group字段
	Group_list = skill_id_to_group(Hero_skill_list),
	Skill_Grade =  lists:foldl(fun(E,Sum)-> maps:get(hall_score, tb_skill_to_hall_score:get(E),0) + Sum  end,0,Group_list),
	Hero_equip_list = lib_equip_api:get_break_by_hero(HeroId),
	Equip_Grade = lists:foldl(fun(E,Sum)-> maps:get(hall_score, tb_equip_color_to_hall_score:get(E),0) + Sum  end,0,Hero_equip_list),
	Hero_star = lib_hero_api:hero_star(HeroId),
	Hero_quality = lib_hero_api:hero_quality(HeroId),
	Key = Hero_quality * 100 + Hero_star,
	Stat_Grade = maps:get(hall_score, tb_hero_star_to_hall_score:get(Key),0),
	%% 英雄评分
	Hero_level * 5 + Hero_stage * 5 + Skill_Grade + Equip_Grade + Stat_Grade
.

%% 计算单个大厅分数
get_battle(Place,HallId,HeroMax) ->
	get_battle(Place,HallId,HeroMax,0)
.
get_battle(Place,HallId,_HeroMax,Grade) ->
	case Place =:= 0 of
		true ->  Grade;
		false -> #battle{grade = HeroGrade} = lib_holy_spirit_hall_api:get_battle_info(HallId,Place),
				 get_battle(Place - 1,HallId,_HeroMax, Grade + HeroGrade)
	end
.

%% 上阵英雄列表
get_work_list(HallId) ->
	HeroMax = get_hero_max_grade(HallId),
	Hero_list = lib_holy_spirit_hall_api:get_battle_hero_by_hall(HallId),
	get_hero_info_list(Hero_list,HeroMax)
.


%% 获取英雄信息列表  有英雄评分无上限  星级有限制
get_hero_info_list(Hero_list,HeroMax)  ->
	get_hero_info_list(Hero_list,[],HeroMax)
.

get_hero_info_list([HeroId|Hero_list],List,HeroMax) ->
	Hero_level = lib_hero_api:hero_level(HeroId),
	Star = lib_hero_api:hero_star(HeroId),
	%% 限制的英雄评分
	RestrictHeroGrade = hero_grade(HeroId,HeroMax),
	%% 无限制的英雄评分
	HeroGrade = hero_grade(HeroId),
	Grade_level_id_list = tb_holy_spirit_hall_grade:get_list(),
	Point = RestrictHeroGrade / HeroMax,
	[Grade_level] =	lists:filter(fun(E) ->
		(Point  >= maps:get(left_point, tb_holy_spirit_hall_grade:get(E))) andalso
		(Point < maps:get(right_point, tb_holy_spirit_hall_grade:get(E)))
	end,Grade_level_id_list),
	Is_battle = lib_holy_spirit_hall_api:hero_is_battle(HeroId),
	Hero = #'ProtoHeroGarde'{hero_id = HeroId ,hero_level = Hero_level,star = Star,grade = HeroGrade,grade_level = Grade_level,is_battle = Is_battle},
	get_hero_info_list(Hero_list,[Hero|List],HeroMax)

;
get_hero_info_list([],List,_HeroMax) ->
	List
.

%% 位置列表
get_type_list(Place,HallId) ->
	get_type_list(Place,HallId,[])
.
get_type_list(Place,HallId,Work_list) ->
	case Place =:= 0 of
		true -> Work_list;
		false->	#battle{hero_id = Hero_id} = lib_holy_spirit_hall_api:get_battle_info(HallId,Place),
				Work = #'ProtoKeyValue'{key = Place,value = Hero_id},
				get_type_list(Place - 1,HallId,[Work|Work_list])
	end
.


%% 计算单个大厅信息
get_hall([HallId|Hall_list],ProtoHall_list) ->
	#hall{level = Level} = lib_holy_spirit_hall_api:get_hall_info(HallId),
	Work_list = get_work_list(HallId),
	HeroMax = get_hero_max_grade(HallId),
	Grade = get_battle(?PLACE,HallId,HeroMax),
	Type_list = get_type_list(?PLACE,HallId),
	Hall = #'ProtoHolySpiritHall'{
		id = HallId,level = Level, grade = Grade,work_list = Work_list,type_list = Type_list
	},
	get_hall(Hall_list,[Hall|ProtoHall_list])
;
get_hall([],ProtoHall_list) ->
	ProtoHall_list
.

%% 开启位置需要道具
open_place_need(HallId,Place) ->
	#{    'first_place_cost' := First_place_cost, 'second_place_cost' := Second_place_cost, 'third_place_cost' := Third_place_cost} = tb_holy_spirit_hall_base:get(HallId),
	Gold_id = maps:get(value, tb_const:get(gold)),
	Num =
	case Place of
		?ONE_PLACE	 -> First_place_cost;
		?TWO_PLACE 	 -> Second_place_cost;
		?THREE_PLACE -> Third_place_cost
	end,
	[Gold_id,Num]
.
%% 大厅升级需要道具
upgrade_need(HallId) ->
	#hall{level = Level} = lib_holy_spirit_hall_api:get_hall_info(HallId),
	Key = HallId * 1000 + Level + 1,
	#{  'coin_cost_amount' := Coin_cost_amount,
		'cost_item_id' := Cost_item_id,
		'cost_item_amount' := Cost_item_amount
	} = tb_holy_spirit_hall_up:get(Key),
	Coin_id = maps:get(value, tb_const:get(money)),
	[[Coin_id,Coin_cost_amount],[Cost_item_id,Cost_item_amount]]
.
%% 获得大厅空闲可上阵英雄前N名
get_can_battle_hero(Num,HallId) ->
	Hero_list = lib_holy_spirit_hall_api:get_can_battle_hero_by_hall(HallId),
	List = get_can_battle_hero(Hero_list,HallId,[]),
	A = lists:keysort(2, List),
	B = lists:unzip(A),
	{Id_list,_} = B,
	lists:sublist(lists:reverse(Id_list), Num)
.
get_can_battle_hero([HeroId|Hero_list],HallId,List) ->
	HeroMax = get_hero_max_grade(HallId),
	Grade = hero_grade(HeroId,HeroMax),
	Old_Hall = lib_holy_spirit_hall_api:hero_is_battle(HeroId),
	case Old_Hall of
		0 -> get_can_battle_hero(Hero_list,HallId,[{HeroId,Grade}|List]);
		_ -> get_can_battle_hero(Hero_list,HallId,List)
	end

;
get_can_battle_hero([],_HallId,List) ->
	List
.


%% 循环列表上阵英雄
battle_by_list([Place|List],[HeroId|Hero_list],HallId) ->
	lib_holy_spirit_hall_api:hero_battle(HeroId,HallId,Place),
	battle_by_list(List,Hero_list,HallId)
;
battle_by_list(_Place,[],_HallId) ->
	skip
.
%%----------------%%
%% 请求圣灵大厅信息
request_holy_spirit_hall_info() ->
	Hall_Id_list = tb_holy_spirit_hall_base:get_list(),
	Hall_list = lists:reverse(get_hall(Hall_Id_list,[])),
	Respond = #'Proto50131001'{
		hall_list = Hall_list
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("通知圣灵大厅 ~n")
%%	?DEBUG("request_holy_spirit_hall_info: ~p ~n",[Respond])
.
%% 请求英雄信息
request_hero_info(Msg) ->
	#'Proto10131002'{type = HallId} = Msg,
	Hero_list = lib_holy_spirit_hall_api:get_can_battle_hero_by_hall(HallId),
	HeroMax = get_hero_max_grade(HallId),
	Hero_info_list = get_hero_info_list(Hero_list,HeroMax),
	Respond = #'Proto50131002'{
		hero_list = Hero_info_list
	},
	lib_send:respond_to_client(Respond)
%%	?DEBUG("request_hero_info: ~p ~n",[Respond])
.

%% 请求更换上阵英雄
request_update_batter_hero(Msg) ->
	#'Proto10131003'{id = HallId,type = Place,hero_id = HeroId} = Msg,
	%% 获得该位置是否上阵了英雄
	#battle{hero_id = Battle_Hero_Id} = lib_holy_spirit_hall_api:get_battle_info(HallId,Place),
	try
		?JUDGE_RETURN(Battle_Hero_Id =/= -1, "this place not open"),
		?JUDGE_RETURN(Battle_Hero_Id =/= HeroId, "this hero is battle in here"),
		?JUDGE_RETURN(lists:member(HeroId,lib_holy_spirit_hall_api:get_can_battle_hero_by_hall(HallId)), "this hero can not battle in this hall"),
		Hero_Battle_Hall = lib_holy_spirit_hall_api:hero_is_battle(HeroId),
		%% 该英雄是否已上阵
		case Hero_Battle_Hall =:= 0 of
			true  -> lib_holy_spirit_hall_api:hero_battle(HeroId,HallId,Place),lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(HallId);
			false ->
				OldPlace = lib_holy_spirit_hall_api:hero_battle_info(HeroId,Hero_Battle_Hall),
				%% 该位置是否有上阵英雄
				case Battle_Hero_Id =:= 0 of
								false  -> case lists:member(Battle_Hero_Id,lib_holy_spirit_hall_api:get_can_battle_hero_by_hall(Hero_Battle_Hall)) of
											 true -> %% 交换上阵位置
													 lib_holy_spirit_hall_api:hero_battle(HeroId,HallId,Place),
													 lib_holy_spirit_hall_api:hero_battle(Battle_Hero_Id,Hero_Battle_Hall,OldPlace);
											 false-> lib_holy_spirit_hall_api:hero_battle(HeroId,HallId,Place),
													 %% 原先位置置空
													 lib_holy_spirit_hall_api:hero_battle(0,Hero_Battle_Hall,OldPlace)
										end;

								true -> lib_holy_spirit_hall_api:hero_battle(HeroId,HallId,Place),
									     %% 原先位置置空
										 lib_holy_spirit_hall_api:hero_battle(0,Hero_Battle_Hall,OldPlace)

				end,
				case HallId =:= Hero_Battle_Hall of
					true  -> lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(HallId);
					false -> lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(HallId),
						lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(Hero_Battle_Hall)
				end
		end,
		%% 计算发送整个大厅信息
		request_holy_spirit_hall_info()
		catch
			throw: {error, Flag} -> ?DEBUG("~p",[Flag])
		end
.
%% 请求解锁位置
request_unlock_place(Msg) ->
	#'Proto10131004'{id = HallId,type = Place} = Msg,
	#battle{hero_id = Battle_Hero_Id} = lib_holy_spirit_hall_api:get_battle_info(HallId,Place),
	case Battle_Hero_Id =:= -1 of
		true ->
			ItemList = open_place_need(HallId,Place),
			Item = lib_item_api:conf_item_to_pack_item(ItemList),
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_OPEN_PLACE, Place)),
			lib_holy_spirit_hall_api:hero_battle(0,HallId,Place),
			Type_list = get_type_list(Place,HallId),
			Respond = #'Proto50131004'{
				type_list  = Type_list
			},
			lib_send:respond_to_client(Respond),
			?DEBUG("request_unlock_place: ~p ~n",[Respond]);

		false ->?DEBUG("error! this Place:~p already open",[Place])
	end
.



%% 圣灵大厅升级
request_upgrade(Msg) ->
	#'Proto10131005'{id = HallId} = Msg,
	Lord_mansion_level = lib_inner_city_api:building_level(?BUILDING_LORD_MANSION),
	#hall{level = Level} = lib_holy_spirit_hall_api:get_hall_info(HallId),
	Key = HallId * 1000 + Level,
	Conf = tb_holy_spirit_hall_up:get(Key),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CLIENT_OPERATOR),
	Limit_level  = maps:get(limit_level, Conf),
	case Lord_mansion_level >= Limit_level of
		 true -> ItemList = upgrade_need(HallId),
%%			  	 ?DEBUG("~p",[ItemList]),
				 Item = lib_item_api:conf_item_list_to_pack_item_list(ItemList),
				 Ret = lib_player_pack:validate_remove(Item),
				 ?PACK_IS_SUCCESS(Ret),
				 lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_UPGRADE_HOLY_SPIRIT_HALL, HallId)),
			 	 Hall = lib_holy_spirit_hall_api:get_hall_info(HallId),
			 	 lib_holy_spirit_hall_api:update_hall_info(Hall#hall{level = Hall#hall.level + 1}),
			 	 [lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update(HeroId) || HeroId <- lib_holy_spirit_hall_api:get_battle_hero_by_hall(HallId)],
				 lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(HallId),
				 %% 计算发送整个大厅信息
				 request_holy_spirit_hall_info();
		false -> ?DEBUG("领主府等级为:~p,不满足升级需要的~p级",[Lord_mansion_level,Limit_level])
	end

.
%% 请求圣灵大厅一键上阵
request_one_key_battle(Msg) ->
	#'Proto10131006'{id = HallId} = Msg,
	List = lists:sort(lib_holy_spirit_hall_api:free_place_by_hall(HallId)),
	Num = lists:foldr(fun(_E, Sum) -> Sum + 1  end, 0, List),
	case List =/= [] of
		 true -> %% 获得战力最高前N名,可上阵的空闲英雄
			 	 Hero_list = get_can_battle_hero(Num,HallId),
			 	 battle_by_list(List,Hero_list,HallId),
			 	 lib_holy_spirit_hall_api:recalculate_skill_id_by_battle(HallId),
				 %% 计算发送整个大厅信息
			 	 ?DEBUG("计算发送整个大厅信息"),
			     request_holy_spirit_hall_info();
		false -> ?DEBUG("not free place,can not one_key_battle")
	end
.









