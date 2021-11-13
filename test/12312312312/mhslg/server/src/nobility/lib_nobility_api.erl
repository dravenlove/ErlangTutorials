%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 2:20 PM
%%%-------------------------------------------------------------------
-module(lib_nobility_api).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([		%% 通用
	is_nobility/1,			%% 是否爵位id
	is_privilege/2,			%% 是否该爵位或低级的特权
	is_condition/2,			%% 是否该爵位条件
	nobility/1,				%% 获取爵位配置
	privilege/1,			%% 获取特权列表
	condition/1				%% 获取条件列表
]).


-export([		%% 玩家进程调用
	calc_privilege_prop/0,			%% 计算玩家特权属性加成
	player_nobility/0,				%% 玩家的爵位信息
	get_nobility/0,					%% 爵位
	get_privilege/0,				%% 特权
	condition_schedule/1,			%% 配置条件完成进度
	condition_finish/1,				%% 配置条件是否完成

	lord_mansion_limit/0,			%% 获取领主府的上限等级
	get_condition_num/1,			%% 获取条件数量记录
	is_finish/1,					%% 判断该条件是否完成
	privilege_add/1,				%% 获取特权加成
	is_open/1,						%% 判断该特权是否激活
	is_reach/1						%% 判断爵位等级是否达成

]).

-define(OPEN, 1).
-define(CLOSE, 0).

is_nobility(NobilityId) ->
	is_map(tb_nobility_base:get(NobilityId))
.
is_privilege(PrivilegeId, NobilityId) ->
	List = tb_nobility_base:get_list(),
	lists:any(
		fun(X) ->
			X =< NobilityId andalso lists:member(PrivilegeId, maps:get(privilege, tb_nobility_base:get(X), []))
		end, List)
.
is_condition(ConditionId, NobilityId) ->
	lists:member(ConditionId, condition(NobilityId))
.
nobility(NobilityId) ->
	tb_nobility_base:get(NobilityId)
.
privilege(NobilityId) ->
	maps:get(privilege, nobility(NobilityId), [])
.
condition(NobilityId) ->
	maps:get(condition, nobility(NobilityId), [])
.
init_privilege_maps() ->
	lists:foldl(
		fun(Privilege, Map) ->
			Conf = tb_nobility_privilege:get(Privilege),
			Type = maps:get(big, Conf),
			case maps:get(para1, Conf, 1) of
				1 ->
					case maps:is_key(Type, Map) of
						true -> Map;
						false -> maps:put(Type, {0}, Map)
					end;
				Index ->
					V = maps:get(Type, Map),
					case tuple_size(V) < Index of
						true -> maps:put(Type, erlang:insert_element(Index, V, 0), Map);
						false -> Map
					end
			end
		end, maps:new(), tb_nobility_privilege:get_list())
.

calc_privilege_prop() ->
	PlayerNobility = player_nobility(),
	Init = init_privilege_maps(),
	NewProp = sets:fold(
		fun(Privilege, Map) ->
			Conf = tb_nobility_privilege:get(Privilege),
			Type = maps:get(big, Conf),
			V1 =
				case maps:find(para1, Conf) of
					error -> {?OPEN};
					{ok, Index} ->
						V = maps:get(Type, Map),
						setelement(Index, V, maps:get(para2, Conf) + element(Index, V))
				end,
			maps:update(Type, V1, Map)
		end, Init, PlayerNobility#player_nobility.privilege),
	NewProp1 = maps:map(
		fun(Type, V) ->
			Value =
				case V of
					{V1} -> V1;
					V1 -> tuple_to_list(V1)
				end,
			case lists:member(Type, ?PRIVILEGE_FLOAT_LIST) of
				true ->
					case is_list(Value) of
						true -> [X / 100 || X <- Value];
						false -> Value / 100
					end;
				false -> Value
			end
		end, NewProp),
	lib_player_nobility:put_nobility(PlayerNobility#player_nobility{prop = NewProp1})
.

player_nobility() ->
	lib_player_nobility:get_nobility()
.
get_nobility() ->
	(player_nobility())#player_nobility.nobility
.
get_privilege() ->
	(player_nobility())#player_nobility.privilege
.
get_prop() ->
	(player_nobility())#player_nobility.prop
.
lord_mansion_limit() ->
	NobilityId = get_nobility(),
	maps:get(limit, tb_nobility_base:get(NobilityId))
.

get_condition_num(Conf) ->
	case maps:get(big, Conf) of
		?PRIVILEGE ->
			sets:size(get_privilege());
		?HERO_COLOR ->
			Color = maps:get(para2, Conf),
			lib_hero_api:hero_color_num(Color);
		?FEAT_NUM ->
			lib_city_building_api:total_feat();
		?SOLDIER ->
			lib_barrack_train_api:get_accumulated_training_num();
		?GOVERNMENT_AFFAIRS ->
			lib_player_government_task:total_time();
		?INNER_CITY_LEVEL ->
			InnerCityId = maps:get(para2, Conf),
			lib_inner_city_api:building_level(InnerCityId);
		?HERO_SKILL ->
			SkillNum = maps:get(para2, Conf),
			SkillLevel = maps:get(para3, Conf),
			lib_hero_api:hero_skill_num(SkillNum, SkillLevel);
		?DISSOLVE_HERO_FRAGMENT ->
			lib_player_dissolve_hero_fragment:get_time();
		?CITY_BUILDING_COUNT ->
			lib_city_building_api:total_build_val();
		?VISIT_LETTER ->
			lib_city_visiting_api:total_num();
		?EQUIP_MAKE ->
			lib_equip_api:make_num();
		?ACCOUNT_BOOK_TAXATION ->
			lib_city_industry_api:total_time(2);
		?DA_GOVERNMENT_AFFAIRS ->
			lib_player_government_task:nobility_time();
		?DA_BATTLE_COUNT ->
			lib_meritorious_award_rank:sync_apply(fun lib_meritorious_award_rank:nobility_meritorious/1);
		_ -> 0
	end
.
is_finish(Conf) ->
	Goal = maps:get(para1, Conf),
	Goal =< get_condition_num(Conf)
.
condition_schedule(ConditionIdList) ->
	[get_condition_num(tb_nobility_conition:get(X)) || X <- ConditionIdList]
.
condition_finish(ConditionIdList) ->
	[is_finish(tb_nobility_conition:get(X)) || X <- ConditionIdList]
.
privilege_add(Type) ->
	PropMap = get_prop(),
	maps:get(Type, PropMap)
.
is_open(PrivilegeId) ->
	PrivilegeSets = get_privilege(),
	sets:is_element(PrivilegeId, PrivilegeSets)
.
is_reach(NobilityId) ->
	get_nobility() >= NobilityId
.





