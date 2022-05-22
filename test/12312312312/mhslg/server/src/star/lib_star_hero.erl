%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 6月 2021 10:59
%%%-------------------------------------------------------------------
-module(lib_star_hero).
-author("df").
-include("common.hrl").
-include("ProtoClient_10151.hrl").
-include("hero.hrl").
%% API
-export([
	get_star_max_lv/0,
	update_star_item/1,
	upgrade_star_item/1,
	reset/1
]).

get_star_max_lv()->
	Respond =
		#'Proto50151004'{
			level_info = get_max_lv()
		},
	lib_send:respond_to_client(Respond),
	?INFO("get_star_max_lv: ~p ~n",[Respond])

.

update_star_item(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_136), ?INFO("功能未开启")),
	#'Proto10151005'{hero_id = Hero_id,type = Type,inlay_type = Inlay_type,item_id = Item_id} = Msg,
	?DEBUG("~p",[Msg]),
	?INFO("free  -----  ~p",[lib_troops_api:is_free(Hero_id)]),
	?JUDGE_RETURN(lib_troops_api:is_free(Hero_id),?ERROR_HERO_STAR_BUSY),
	?JUDGE_RETURN(is_can_inlay(Hero_id,Type,Inlay_type,Item_id),?INFO("不能装备")),
	#star{inlay = OldInlay} = Star = lib_star_api:get_star_inlay(Hero_id,Type,Inlay_type),
	case OldInlay of
		0 -> skip;
		_ -> update_star_item(OldInlay,[])
	end,
	lib_star_api:update_star_inlay(Hero_id,Type,Inlay_type,Star#star{inlay_type = Inlay_type,inlay = Item_id}),
	case Item_id of
		 0 -> skip;
		 _ -> update_star_item(Item_id,[Hero_id,Type,Inlay_type])
	end
.

upgrade_star_item(Msg) ->
	#'Proto10151006'{hero_id = HeroId,item_id = UniqueId,ues_item = Ues_item} = Msg,
	{_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
	#star_info{level = OldLv,experience = OldExp} = Star_info = PackItem#item.star_info,
	SubType = maps:get(sub_type, tb_item:get(PackItem#item.item_id)),
	MAX_LV = get_max_lv(SubType),
	?JUDGE_RETURN(OldLv < MAX_LV,?DEBUG("大于最高等级，不能升级")),
	%% 消耗
	Use = lib_item_api:conf_item_to_pack_item([Ues_item,1]),
	Ret = lib_player_pack:validate_remove(Use),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Use, ?REMOVE_SERIAL(?USE_STAR_ITEM_UPGRADE, 1)),
	ItemType = maps:get(param1, tb_item:get(PackItem#item.item_id)),
	NewExp = OldExp + maps:get(param1, tb_item:get(Ues_item)),
	NewLv = get_new_level(OldLv,NewExp,ItemType,MAX_LV),
	lib_player_pack:update_item(?PACK_TYPE_TITLE, PackItem#item{star_info = Star_info#star_info{level = NewLv,experience = NewExp}}),
	case OldLv =/= NewExp of
		 true  ->   lib_hero_api:notify_hero_update(HeroId, ?HERO_UPDATE_STAR_INFO),
			 		lib_hero_prop:update_hero_prop(HeroId, ?HERO_STAR_INFO);
		 false ->	skip
	end,
	lib_send:respond_to_client(?MSG_RETURN_UPGRADE_STAR_ITEM)
.


update_star_item(UniqueId,NewInfo) ->
	{_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
	Star_info = PackItem#item.star_info,
	lib_player_pack:update_item(?PACK_TYPE_TITLE, PackItem#item{star_info = Star_info#star_info{inlay_info = NewInfo}})
.

get_new_level(OldLv,NewExp,ItemType,MAX_LV) ->
	Key = ItemType * 100 + OldLv,
	#{'l_type' := L_type, 'r_type' := R_type} = tb_star_upgrade:get(Key),
	case OldLv >= MAX_LV of
		 true -> OldLv;
		 false-> if
					 (L_type =< NewExp) andalso (R_type > NewExp) -> OldLv;
					 NewExp < L_type -> get_new_level(OldLv - 1,NewExp,ItemType,MAX_LV);
					 NewExp >= R_type -> get_new_level(OldLv + 1,NewExp,ItemType,MAX_LV);
					 true -> OldLv
				 end
	end
.

get_max_lv() ->
	List = lib_star_api:get_const(type_list,jsonvalue),
	[#'ProtoKeyValue'{key = Type,value = get_max_lv(Type) }|| Type <- List]
.

get_max_lv(Type) ->
	ConditionsType = case Type =< 4 of true -> 1;false -> 2 end,
	BasicsLv =
	lists:foldl(fun([Key,Value],Lv) ->
		case Key =:= ConditionsType of true -> Value;false -> Lv end
	end,0,lib_star_api:get_const(max_level,jsonvalue)),
	Key =
	lists:foldl(fun([T,ID],ScienceID)->
		case T =:= Type of
			true -> ID;
			false-> ScienceID
		end
	end,0,lib_star_api:get_const(star_science,jsonvalue)),
	ScienceType = maps:get(type, tb_science:get(Key)),
	BasicsLv + lib_player_science_api:get_effect_value(ScienceType,Type)
.

is_can_inlay(Hero_id,Type,Inlay_type,UniqueId) ->
	case UniqueId of
		0 -> true;
		_ -> Key = Type * 100 + Inlay_type,
			{_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
			SubType = maps:get(sub_type, tb_item:get(PackItem#item.item_id)),
			StarInfo = PackItem#item.star_info,
			case (maps:get(item_type, tb_star_type:get(Key)) =:= SubType) andalso (StarInfo#star_info.inlay_info =:= []) of
				true -> %% 金色特殊规则
					case Inlay_type =:= 1 of
						true -> judge_golden(Hero_id,Type,Inlay_type,PackItem);
						false -> true
					end;
				false-> false
			end
	end
.
judge_golden(Hero_id,Type,Inlay_type,PackItem) ->
	HeroStar = lib_star_api:get_hero_star(Hero_id),
	List = lists:delete(Type,maps:keys(HeroStar#star_hero.star_type_map)),
	lists:all(fun(K)->
		Star = lib_star_api:get_star_inlay(Hero_id,K,Inlay_type),
		case Star#star.inlay =:= 0 of
			 true -> true;
			 false-> {_Check, NewPackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, Star#star.inlay),
					 PackItem#item.item_id =/= NewPackItem#item.item_id
		end
	end,List)
.

reset(Hero_id) ->
	Star = lib_star_api:get_hero_star(Hero_id),
	maps:fold(fun(_Type,StarTypeMap,_) ->
		maps:fold(fun(_Inlay_type,StarInfo,_) ->
			OldInlay = StarInfo#star.inlay,
			case OldInlay of
				0 -> skip;
				_ -> ?INFO("update_star_item"),update_star_item(OldInlay,[])
			end
		end,0,StarTypeMap)
	end,0,Star#star_hero.star_type_map),
	Hero = lib_hero_api:hero_info(Hero_id),
	NewHero = Hero#hero{hero_star = #star_hero{}},
	lib_hero_api:update_hero(NewHero, ?HERO_UPDATE_STAR_INFO)
.