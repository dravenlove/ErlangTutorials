%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 10:37
%%%-------------------------------------------------------------------
-module(lib_hero_destiny).
-author("df").
-include("ProtoClient_10116.hrl").
-include("ProtoPublic.hrl").
-include("hero.hrl").
-include("common.hrl").
%% API
-export([
	destiny_is_can_activate/2,			%% 判断英雄命运是否能激活
	add_hero_destiny/2,					%% 激活英雄命运
	hero_destiny_to_proto/2,
	hero_destiny_to_prop/1,
	update_hero_destiny_skill_group/2
]).

%% API
-export([
	request_hero_destiny_info/1,	%% 请求英雄命运信息
	activate_hero_destiny/1			%% 请求激活英雄命运
]).

-export([
	destiny_hero_destiny/2,			%% 判断两个英雄是否有命运关系
	robot_get_destiny/1
]).

destiny_is_can_activate(HeroId,DestinyId) ->
	case (judging_condition(HeroId,DestinyId) =:= true) andalso is_activate(HeroId,DestinyId) =:= false of
		true 	-> true;
		false 	-> false
	end
.

%% 条件类型：0-无需条件，1-拥有指定具体英雄id，2-拥有指定英雄性别，3-拥有指定英雄类型，4-拥有指定英雄品质
judging_condition(DestinyHeroId,DestinyId) ->
	Condition_type = maps:get(activation_conditions_type, tb_hero_destiny:get(DestinyId)),
	Condition = maps:get(activation_conditions, tb_hero_destiny:get(DestinyId),0),
	Hero_id_list = lists:filter(fun(E)-> E =/= DestinyHeroId end,lib_hero_api:hero_id_list()),
	case Condition_type of
		0 -> true;
		1 -> lib_hero_api:is_have_hero(Condition);
		2 -> lists:any(fun(HeroId)-> maps:get(sex, tb_hero:get(HeroId)) =:= Condition end,Hero_id_list);
		3 -> lists:any(fun(HeroId)-> maps:get(hero_type, tb_hero:get(HeroId)) =:= Condition end,Hero_id_list);
		4 -> lists:any(fun(HeroId)-> maps:get(quality, tb_hero:get(HeroId)) =:= Condition end,Hero_id_list)
	end

.

%% 是否已激活
is_activate(HeroId,DestinyId) ->
	#hero{activate_destiny_list = List} = lib_hero_api:hero_info(HeroId),
	lists:member(DestinyId, List)
.


add_hero_destiny(HeroId,DestinyId) ->
	#hero{activate_destiny_list = List} = Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{activate_destiny_list = [DestinyId|List]})
.

hero_destiny_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		hero_destiny_list = Hero#hero.activate_destiny_list
	}
.

hero_destiny_to_prop(Hero) ->
	#hero{activate_destiny_list = List} = Hero,
	PropList = lists:foldl(fun(E,TbList)->
		Props = maps:get(props, tb_hero_destiny:get(E),#{}),
		[lib_fight_prop:cfg_prop_dict_from_conf(Props)|TbList]
	end,[],List),
	lib_fight_prop:increase_prop(PropList)
.

update_hero_destiny_skill_group(HeroId,IsNotify) ->
	#hero{activate_destiny_list = List} = lib_hero_api:hero_info(HeroId),
	SkillList = lists:foldl(fun(DestinyId,L)->
		Skill = maps:get(skill, tb_hero_destiny:get(DestinyId),0),
		case Skill of
			0 -> L;
			_ -> [Skill|L]
		end
	end,[],List),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_DESTINY, HeroId, SkillList, IsNotify)
.
get_destiny_type(HeroId,[DestinyId|DestinyList]) ->
	Type = case is_activate(HeroId,DestinyId) of
			   true	 -> 1;
			   false -> 0
		   end,
	Proto = #'ProtoKeyValue'{key = DestinyId,value = Type},
	get_destiny_type(HeroId,DestinyList,[Proto])
.
get_destiny_type(HeroId,[DestinyId|DestinyList],ProtoList) ->
	Type = case is_activate(HeroId,DestinyId) of
			   true	 -> 1;
			   false -> 0
		   end,
	Proto = #'ProtoKeyValue'{key = DestinyId,value = Type},
	get_destiny_type(HeroId,DestinyList,[ProtoList|Proto])
;
get_destiny_type(_HeroId,[],ProtoList) ->
	ProtoList
.

destiny_hero_destiny(HeroId1,HeroId2) ->
	Key_list = tb_hero_destiny:get_list(),
	HeroId1_Key_list = lists:filter(fun(Key)->(maps:get(hero_id, tb_hero_destiny:get(Key)) =:= HeroId1 andalso maps:get(activation_conditions_type, tb_hero_destiny:get(Key)) =:= 1)end,Key_list),
	case lists:any(fun(Key)-> maps:get(activation_conditions, tb_hero_destiny:get(Key)) =:= HeroId2 end,HeroId1_Key_list) of
		true -> true;
		false ->
			HeroId2_Key_list = lists:filter(fun(Key)->(maps:get(hero_id, tb_hero_destiny:get(Key)) =:= HeroId2 andalso maps:get(activation_conditions_type, tb_hero_destiny:get(Key)) =:= 1)end,Key_list),
			lists:any(fun(Key)-> maps:get(activation_conditions, tb_hero_destiny:get(Key)) =:= HeroId1 end,HeroId2_Key_list)
	end
.

%%-----------------------%%

request_hero_destiny_info(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_134), ?INFO("功能未开启")),
	HeroId = Msg#'Proto10116061'.hero_id,
	DestinyList = lists:filter(fun(E)->
		maps:get(hero_id, tb_hero_destiny:get(E)) =:= HeroId
	end, tb_hero_destiny:get_list()),
	ProtoList = get_destiny_type(HeroId,DestinyList),
	Respond = #'Proto50116061'{destiny_list = ProtoList},
	lib_send:respond_to_client(Respond),
	?DEBUG("request_hero_destiny_info: ~p ~n",[Respond])
.

activate_hero_destiny(Msg)	->
	#'Proto10116062'{hero_id = HeroId,destiny_id = DestinyId} = Msg,
	case destiny_is_can_activate(HeroId,DestinyId)  of
		false -> ?DEBUG("~p 的命运 ~p 不能激活 ",[HeroId,DestinyId]);
		true  -> add_hero_destiny(HeroId,DestinyId),
				update_hero_destiny_skill_group(HeroId,true),
				lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_DESTINY),
				Hero = lib_hero_api:hero_info(HeroId),
				lib_hero_api:notify_hero_update(Hero,?HERO_UPDATE_DESTINY)
	end
.

robot_get_destiny(Hero_id) ->
	{SkillList,PropList} =
	lists:foldl(fun(Key,{List1,List2}) ->
		Conf = tb_hero_destiny:get(Key),
		case Hero_id =:= maps:get(hero_id,Conf) of
			true -> NewList1 = case maps:is_key(skill,Conf) of true -> [maps:get(skill,Conf)|List1];false -> List1 end,
					NewList2 = case maps:is_key(props,Conf) of true -> [lib_fight_prop:cfg_prop_dict_from_conf(maps:get(props,Conf))|List2];false -> List2 end,
					{NewList1,NewList2};
			false-> {List1,List2}
		end
	end,{[],[]}, tb_hero_destiny:get_list()),
	{SkillList,lib_fight_prop:increase_prop(PropList)}
.
