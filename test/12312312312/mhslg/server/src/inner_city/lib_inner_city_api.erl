%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Dec 2020 11:47 AM
%%%-------------------------------------------------------------------L
-module(lib_inner_city_api).
-author("df").
-include("common.hrl").
-include("inner_city.hrl").
-include("hero.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10123.hrl").
%% API
-export([
	building_level/1,			%% 获得建筑等级
	building_name/1,			%% 获得建筑名称
	building_shortcut_id/1,		%% 获得建筑快捷功能id (尚未配置)
	building_upgrade_state/1,	%% 判断建筑是否在升级
	building_is_open/1,			%% 判断建筑是否开启
	building_state/1,			%% 获得建筑状态
	update_building_state/2,	%% 更改建筑状态  只有建筑状态为才可修改  成功返回true 失败返回 false
	building_info/1,			%% 获得建筑信息
	update_building_info/1,		%% 修改建筑信息
	get_resource_building_list/0, 		%% 获得已开启的资源建筑列表
	get_resource_building_output/1,		%% 获取资源建筑每小时的产出[[id,amount]] 该建筑未开启或者不是资源建筑时，返回 []
	building_to_prop/1,			%% 内城建筑英雄加成
	building_to_proto/2 		%% 用于返回前端英雄
]).
-export([
	upgrade_ok/2,				%% 建筑升级
	working_ok_to_do/1,			%% 建筑工作完成处理
	building_upgrade/2,
	building_upgrade_update_prop/1
]).
-export([
	building_state_to_client/1,			%% 建筑改变通知前端
	building_list_state_to_client/1
]).

building_level(Building_id) ->
	Building = building_info(Building_id),
	Building#building.building_lv
.

building_name(Building_id) ->
	Conf = tb_building:get(Building_id),
	case Conf of
		false -> "";
		_ -> maps:get(name, Conf, "")
	end
.
building_shortcut_id(Building_id) ->
	Building_id,
	skip
.

building_upgrade_state(Building_id) ->
	Building = building_info(Building_id),
	case Building#building.building_state =:= 1 of
		true -> true;
		false -> false
	end
.

building_is_open(Building_id) ->
	Building = building_info(Building_id),
	case Building#building.is_open of
		0 -> false;
		1 -> true
	end
.

%% 更改建筑状态时会发送Proto80123002通知前端改建筑状态改变
update_building_state(Building_id,State) ->
	Building  = building_info(Building_id),
	update_building_info(Building#building{building_state = State}),
	?DEBUG("更改在状态为~p",[State])
.



building_state(Building_id) ->
	Building  = building_info(Building_id),
	Building#building.building_state
.


upgrade_ok(Building_id,Level) ->
	lib_player_process:all_process_building_upgrade(Building_id,Level),
	building_upgrade_update_prop(Building_id)
.


update_building_info(Building) ->
	lib_inner_city:update_inner_building(Building),
	building_state_to_client(Building#building.building_id),
	upgrade_ok(Building#building.building_id,Building#building.building_lv)
.

building_info(Building_id) ->
	lib_inner_city:get_buildings_info(Building_id)
.

%% 单个建筑改变状态时通知前端
building_state_to_client(Building_id) ->
	building_list_state_to_client([Building_id])
.

%% 多个建筑改变状态时通知前端
building_list_state_to_client(BuildingIdList) ->
	lib_inner_city:inspect_is_work_ok(),
	Respond = #'Proto80123002'{
		building_list = [lib_inner_city:building_state(Building_id) || Building_id <- BuildingIdList]
	},
	?DEBUG("building_state_to_client~p",[Respond]),
	lib_send:respond_to_client(Respond)
.


%%　获得已开启的资源建筑列表
get_resource_building_list() ->
	Building_list = tb_building:get_list(),
	get_resource_building_list(Building_list,[])
.
get_resource_building_list([BuildingId|Building_list],Resource_building_list) ->
	#building{is_open = Is_open,is_resource_building = Is_resource_building} = building_info(BuildingId),
	case Is_open =:= 1 andalso Is_resource_building =:= 1 of
		true -> get_resource_building_list(Building_list,[BuildingId|Resource_building_list]);
		false-> get_resource_building_list(Building_list,Resource_building_list)
	end
;
get_resource_building_list([],Resource_building_list) ->
	Resource_building_list
.

%% 获取资源建筑每小时的产出[[id,amount]] 该建筑未开启或者不是资源建筑时，返回 []
get_resource_building_output(Building) ->
	List = get_resource_building_list(),
	case lists:member(Building, List) of
		true  -> #building{	building_lv = Lv, class_id_big = Class_id_big, class_id = Class_id} = building_info(Building),
				%% 键为大类id+小类id+等级
				Key = Class_id_big * 10000 + Class_id * 100 + Lv,
				Building_production = tb_building_production:get(Key),
				%% 计算资源建筑产出
				#{
					'item_id' := Item_id,
					'production_unit_time' := Production_unit_time,
					'time_yield' := Time_yield
				} = Building_production,
				[[Item_id,util:floor((Production_unit_time / 3600) * Time_yield)]]
				;
		false -> []
	end
.

get_prop_open_building() ->
	Key_list = tb_building_upgrade_prop:get_list(),
	List = lists:foldr(fun(E,List)-> Building_id = maps:get(building_id, tb_building_upgrade_prop:get(E)),[Building_id|List] end,[],Key_list),
	Building_list = lists:usort(List),
	lists:filter(fun(Building_id)-> Building = lib_inner_city:get_buildings_info(Building_id), Building#building.is_open =:= 1 end,Building_list)
.

building_to_prop(_Hero) ->
	Open_building = get_prop_open_building(),
	PropList =
		case Open_building =:= [] of
			false  ->
				lists:foldr(fun(Building_id,List) ->
					#building{building_lv = Level,class_id = Class_id,class_id_big = Class_id_big} = lib_inner_city:get_buildings_info(Building_id),
					Key = Class_id_big * 10000 + Class_id * 100 + Level,
					Tb = tb_building_upgrade_prop:get(Key),
					Prop = lib_fight_prop:cfg_prop_dict_from_conf(Tb),
					[Prop|List]
				end,[],Open_building);
			true  -> []
		end,
	lib_fight_prop:increase_prop(PropList)
.

building_to_proto(ProtoHero, _Hero) ->
	Building_list = get_prop_open_building(),
	ProtoHero#'ProtoHero'{
		building_list = Building_list
	}
.


%% 建筑升级更新prop
building_upgrade_update_prop(BuildingId) ->
	#building{building_lv = Level,class_id = Class_id,class_id_big = Class_id_big} = lib_inner_city:get_buildings_info(BuildingId),
	Key = Class_id_big * 10000 + Class_id * 100 + Level,
	Tb = tb_building_upgrade_prop:get(Key),
	case Tb =:= false of
		true -> skip;
		false-> HeroId_list = lib_hero_api:hero_id_list(),
				update_hero_prop(HeroId_list)
	end
.

update_hero_prop(Hero_list) ->
	case Hero_list =:= [] of
		 true -> skip;
		 false-> update_hero_prop(Hero_list,[])
	end
.
update_hero_prop([Hero_id|Hero_list],HeroList) ->
	Hero = lib_hero_api:hero_info(Hero_id),
	%% 重新计算英雄信息
	lib_hero_prop:update_hero_prop(Hero_id, ?HERO_PROP_INNER_CITY),
	update_hero_prop(Hero_list,[Hero|HeroList])
;
update_hero_prop([],HeroList) ->
	%% 通知前端更新英雄信息
	?INFO("通知前端更新英雄信息"),
	lib_hero_api:notify_hero_update(HeroList,?HERO_UPDATE_INNER_CITY)
.

building_upgrade(BuildingId,Lv) ->
	Building = building_info(BuildingId),
	update_building_info(Building#building{building_lv = Lv}),
	lib_inner_city:inspect_building_is_open()
.

working_ok_to_do(Working_ok_list) ->
	[building_working_ok_to_do(BuildingId)||BuildingId <- Working_ok_list]

.
building_working_ok_to_do(BuildingId) ->
	Config = tb_building:get(BuildingId),
	Class_id_big = maps:get(class_id_big,Config),
	if
		Class_id_big =:= 106 -> lib_barrack_train:barrack_auto_train();
		true -> skip
	end
.