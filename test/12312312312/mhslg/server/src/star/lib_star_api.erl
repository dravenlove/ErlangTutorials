%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 6月 2021 11:00
%%%-------------------------------------------------------------------
-module(lib_star_api).
-author("df").
-include("common.hrl").
-include("hero.hrl").
%% API
-export([
	get_const/2,
	experience_item/0,
	special_experience_item/0,
	type_list/0,
	inlay_type_list/0
]).

-export([
	hero_star_info_to_prop/1,
	hero_star_info_to_proto/2,
	get_hero_star/1,
	update_hero_star/2,
	get_star_inlay/3,
	update_star_inlay/4
]).


get_const(Key,Type) ->
	maps:get(Type, tb_star_const:get(Key))
.
experience_item() ->
	get_const(experience_item,jsonvalue)
.
special_experience_item() ->
	get_const(special_experience_item,jsonvalue)
.

type_list() ->
	lists:usort([maps:get(type, tb_star_type:get(Key))||Key <- tb_star_type:get_list()])
.
inlay_type_list() ->
	lists:usort([maps:get(inlay_type, tb_star_type:get(Key))||Key <- tb_star_type:get_list()])
.

hero_star_info_to_prop(Hero) ->
	HeroStar = Hero#hero.hero_star,
	InlayList = maps:fold(fun(_Type,StarType,L1)->
		maps:fold(fun(_InlayType,Star,L2)->
			case Star#star.inlay =:= 0 of
				true -> L2;
				false -> [Star#star.inlay|L2]
			end
		end,[],StarType#star_type.star_map) ++ L1
	end,[],HeroStar#star_hero.star_type_map),
	PropList = lists:foldr(fun(UniqueId,L)->
		{Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
		case Check of
			 false -> L;
			 true  ->
				 StarInfo = PackItem#item.star_info,
				 Key = PackItem#item.item_id * 100 + StarInfo#star_info.level,
				 Props = maps:get(props, tb_star_prop:get(Key),#{}),
				 [lib_fight_prop:cfg_prop_dict_from_conf(Props)|L]
		end
	end,[],InlayList),
	lib_fight_prop:increase_prop(PropList)
.

hero_star_info_to_proto(ProtoHero, #hero{id = HeroId}) ->
	StarInfo = star_info_to_proto(HeroId),
	ProtoHero#'ProtoHero'{
		hero_star_info = StarInfo
	}
.
star_info_to_proto(HeroId) ->
	lists:foldl(fun(Type,L1)->
		Inlay_info =
			lists:foldl(fun(Inlay_type,L2)->
				#star{inlay = Inlay} = get_star_inlay(HeroId,Type,Inlay_type),
				Info =
				case Inlay =:= 0 of
					true -> [0,0];
					false-> {_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, Inlay),
						StarInfo = PackItem#item.star_info,
						[Inlay,PackItem#item.item_id * 100 + StarInfo#star_info.level]
				end,
				[#'ProtoStarInlay'{inlay_type = Inlay_type,info = Info}|L2]
			end,[],inlay_type_list()),
		[#'ProtoHeroStar'{type = Type,inlay_info = Inlay_info}|L1]
	end,[],type_list())
.

get_hero_star(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	Hero#hero.hero_star
.

update_hero_star(HeroId,HeroStar) when is_record(HeroStar,star_hero) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{hero_star = HeroStar},?HERO_UPDATE_STAR_INFO),
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_STAR_INFO)
.

get_star_type(HeroId,Type) ->
	HeroStar = get_hero_star(HeroId),
	maps:get(Type,HeroStar#star_hero.star_type_map,#star_type{type = Type})
.

update_star_type(HeroId,Type,StarType) when is_record(StarType,star_type) ->
	HeroStar = get_hero_star(HeroId),
	NewMap = maps:put(Type,StarType,HeroStar#star_hero.star_type_map),
	update_hero_star(HeroId,HeroStar#star_hero{star_type_map = NewMap})
.

get_star_inlay(HeroId,Type,Inlay_type) ->
	StarType = get_star_type(HeroId,Type),
	maps:get(Inlay_type,StarType#star_type.star_map,#star{inlay_type = Inlay_type})
.
update_star_inlay(HeroId,Type,Inlay_type,StarInlay) when is_record(StarInlay, star)->
	StarType = get_star_type(HeroId,Type),
	NewMap = maps:put(Inlay_type,StarInlay,StarType#star_type.star_map),
	update_star_type(HeroId,Type,StarType#star_type{star_map = NewMap})
.
