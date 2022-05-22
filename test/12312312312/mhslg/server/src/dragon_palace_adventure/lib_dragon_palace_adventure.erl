%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 10:09
%%%-------------------------------------------------------------------
-module(lib_dragon_palace_adventure).
-author("df").
-include("common.hrl").
-include("dragon_palace_adventure.hrl").
-include("ProtoClient_10140.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("player.hrl").
-include("hero.hrl").
-include("ProtoClient_10102.hrl").
-define(DRAGON_PALACE_ADVENTURE_KEY, country_warehouse_key).

%% API
-export([
	get_dragon_palace_adventure/0,
	put_dragon_palace_adventure/1
]).

-export([
	request_dragon_palace_info/0,			%% 请求龙殿探险信息
	request_dragon_palace_hero_list/0,		%% 请求龙殿英雄列表
	send_hero_expeditions/1,				%% 派遣英雄进行龙殿寻宝
	send_hero_rob/1,						%% 派遣英雄进行掠夺
	look_report/0,							%% 查看战报
	find_rob_player/1,						%% 寻找可掠夺玩家
	request_astrology/1,					%% 请求龙殿寻宝占星
	get_dragon_palace_item/1				%% 领取龙殿寻宝道具
]).

-export([
	judge_dragon_palace_is_open/1,			%% 判断龙殿是否开启
	item_to_proto/1,
	item_add/2,
	hero_info_to_proto/2

]).
get_dragon_palace_adventure() ->
	erlang:get(?DRAGON_PALACE_ADVENTURE_KEY)
.
put_dragon_palace_adventure(Dragon_palace_adventure_gather) when is_record(Dragon_palace_adventure_gather, dragon_palace_adventure_gather)  ->
	erlang:put(?DRAGON_PALACE_ADVENTURE_KEY,Dragon_palace_adventure_gather)
.
async_apply(Func) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_expedition:get_pid(), Func, [PlayerShow,Player_pid])
.
async_apply(Func,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_expedition:get_pid(), Func, [PlayerShow,Player_pid] ++ Args)
.

sync_apply(Fun,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:sync_apply(mod_expedition:get_pid(),Fun, [PlayerShow,Player_pid] ++ Args)
.

rob_times(PlayerId) ->
	Player_dragon_palace_info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerId),
	Rob_num = maps:get(value, tb_dragon_palace_const:get(rob_num)),
	Rob_num - Player_dragon_palace_info#dragon_palace_adventure.rob_time

.
dragon_palace_info(PlayerShow,Player_pid) ->
	Player_dragon_palace_info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerShow#player_show.id),
	Dragon_palace_info = dragon_palace_info_to_proto(PlayerShow#player_show.id,0),
	Respond = #'Proto50140001'{
		info = Dragon_palace_info,
		astrology = Player_dragon_palace_info#dragon_palace_adventure.astrology_id,
		rob_times = rob_times(PlayerShow#player_show.id),
		rob_player_id = Player_dragon_palace_info#dragon_palace_adventure.rob_player_id
	},
	lib_dragon_palace_adventure_api:update_player_dragon_palace_adventure(
		Player_dragon_palace_info#dragon_palace_adventure{show = PlayerShow}),
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("request_dragon_palace_info:~p",[Respond])
.

hero_info_to_proto(Hero_list) ->
	lists:foldr(fun(HeroInfo,List)->
		[#'ProtoHeroBase'{id = HeroInfo#hero_base.id, level = HeroInfo#hero_base.level,
		star =  HeroInfo#hero_base.star,force = HeroInfo#hero_base.force}|List]
	 end,[],Hero_list)
.

dragon_palace_info_to_proto(Player_id,R_PlayerId) ->
	Key_list = [?FOREST_DRAGON_PALACE,?LAVA_DRAGON_PALACE,?CRYSTAL_DRAGON_PALACE],
	lists:foldr(fun(Type,List) ->
		Dict = lib_dragon_palace_adventure_api:get_dragon_palace_info(Player_id,Type),
		Is_open = case judge_dragon_palace_is_open(Dict#adventure.type) of
					  true -> 1;
					  false-> 0
				  end,
		Adventure_num = maps:get(timevalue, tb_dragon_palace_const:get(treasure_time)),
		Time = case (Dict#adventure.expedition_state =:= 1) andalso ((Adventure_num + Dict#adventure.start_tick) >= lib_timer:unixtime()) of
				   true -> Adventure_num - (lib_timer:unixtime() - Dict#adventure.start_tick);
				   false-> 0
			   end,
		Is_can_rob = case R_PlayerId =:= 0 of
						 true -> 0;
					 	 false-> case judge_adventure_can_be_rob(Player_id,Type) of
									 true -> 1;
									 false-> 0
								 end
					 end,
		Award = item_add(Dict#adventure.dragon_gem,Dict#adventure.item),
		?DEBUG("Award ~p",[Award]),
		[#'ProtoDragonPalace'{
			type =  Dict#adventure.type,
			expedition_state = Dict#adventure.expedition_state,
			is_open = Is_open,
			time = Time,
			is_can_rob = Is_can_rob,
			hero_list = hero_info_to_proto(Dict#adventure.hero_list),
			item_list = item_to_proto(Award),
			be_rob_num = Dict#adventure.be_rob_dragon_gem,
			be_rob_time = [Dict#adventure.be_rob,Dict#adventure.be_rob_success]
		}|List]
	end,[],Key_list)
.

judge_dragon_palace_is_open(Type) ->
	%% 获取当前天下大势的阶段,判断是否开启相应龙殿
	%% todo
	case Type of
		?FOREST_DRAGON_PALACE -> true;
		_ -> true
	end
.
item_add([],_Item) ->
	[]
;
item_add(Dragon_gem,[]) ->
	[Dragon_gem]
;
item_add(Dragon_gem,Item) ->
	[Dragon_gem] ++ [Item]
.

item_to_proto(Award) ->
	lists:reverse(lists:foldr(fun([Item_id,Num],List)->
		[#'ProtoKeyValue'{key = Item_id,value = Num}|List]
				end,[],Award))
.

get_adventure_hero_list(Player_id) ->
	Dragon_palace_id_list = lib_dragon_palace_adventure_api:get_dragon_palace_id_list(),
	lists:foldr(fun(Type,List)->
		Dict = lib_dragon_palace_adventure_api:get_dragon_palace_info(Player_id,Type),
		Hero_list = lists:foldr(fun(Hero,ListId)-> [Hero#hero_base.id|ListId] end,[],Dict#adventure.hero_list),
		List ++ Hero_list
	end,[],Dragon_palace_id_list)
.

dragon_palace_hero_info(PlayerShow,Player_pid) ->
	In_adventure_list = get_adventure_hero_list(PlayerShow#player_show.id),
	mod_server:async_apply(Player_pid,fun request_dragon_palace_hero_list/1,[In_adventure_list])
.

request_dragon_palace_hero_list(In_adventure_list) ->
	Hero_id_list = lib_hero_api:hero_id_list(),
	Respond = #'Proto50140002'{
		hero_list = hero_info_to_proto(Hero_id_list,In_adventure_list)
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("request_dragon_palace_hero_list:~p",[Respond])
.

hero_info_to_proto([],_) ->
	[]
;

hero_info_to_proto(Hero_id_list,In_adventure_list) ->
	%% 判断英雄是否为其他英雄副将
	lists:foldr(fun(Hero_id,List)->
		?DEBUG("Hero_id ~p",[Hero_id]),
		HeroType = case lib_hero_assist:hero_is_assist(Hero_id) of
					   true  -> 2;
					   false ->case lists:member(Hero_id,In_adventure_list) of
								   true  -> 1;
								   false -> 0
							   end
				   end,
		[#'ProtoKeyValue'{key = Hero_id,value = HeroType}|List]
	end,[],Hero_id_list)
.
get_astrology_type(Astrology_id) ->
	maps:get(type, tb_dragon_palace_astrology:get(Astrology_id))
.

get_dragon_palace_dragon_gem(Type,Astrology_id) ->
	Item_id = maps:get(value, tb_dragon_palace_const:get(dragon_gem)),
	Num =
		case Type of
			?FOREST_DRAGON_PALACE 	->maps:get(value, tb_dragon_palace_const:get(forest_initial_num));
			?LAVA_DRAGON_PALACE  	->maps:get(value, tb_dragon_palace_const:get(lava_initial_num));
			?CRYSTAL_DRAGON_PALACE 	->maps:get(value, tb_dragon_palace_const:get(crystal_initial_num))
		end,
	Astrology_effect =
	case Astrology_id =:= 0 of
		true -> 1;
		false-> Astrology_type = get_astrology_type(Astrology_id),
			case Astrology_type =:= ?ASTROLOGY_ADD_ARAGON_GEM of
				true -> 1 + maps:get(result2, tb_dragon_palace_astrology:get(Astrology_id));
				false-> 1
			end
	end,
	[Item_id,util:ceil(Num * Astrology_effect)]
.

get_dragon_palace_additional_item(Type,Astrology_id) ->
	case Astrology_id =:= 0 of
		true -> [];
		false-> Astrology_type = get_astrology_type(Astrology_id),
			case Astrology_type =:= ?ASTROLOGY_ADD_ITEM of
				true  -> Item_list = maps:get(result1 , tb_dragon_palace_astrology:get(Astrology_id)),
					lists:nth(Type,Item_list); %% 龙殿的类型根据顺序对应列表里面的道具
				false -> []
			end
	end
.

get_hero_info(Hero_id_list) ->
	lists:foldr(fun(HeroId,List)->
		Hero_base = lib_hero_api:hero_base_info(HeroId),[Hero_base|List]
	end,[],Hero_id_list)
.

send_hero_expeditions(PlayerShow,Player_pid,Type,Hero_list) ->
	Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerShow#player_show.id),
	Astrology_id = Dict#dragon_palace_adventure.astrology_id,
	lib_dragon_palace_adventure_api:update_dragon_palace_info(PlayerShow#player_show.id,#adventure{
		type = Type,expedition_state = 1,start_tick = lib_timer:unixtime(),hero_list = Hero_list,
		dragon_gem = get_dragon_palace_dragon_gem(Type,Astrology_id),
		item =  get_dragon_palace_additional_item(Type,Astrology_id)
	}),
	?DEBUG("更新龙殿信息"),
	lib_dragon_palace_adventure_api:add_adventure_info(PlayerShow#player_show.id,Type),
	lib_send:respond_to_client_by_pid(Player_pid, ?MSG_RETURN_SEND_HERO_EXPEDITIONS),
	?DEBUG("send_hero_expeditions")


.

%% 获得可掠夺的龙晶
get_rob_dragon_gem(B_R_player_id,Type) ->
	Dragon_palace_info = lib_dragon_palace_adventure_api:get_dragon_palace_info(B_R_player_id,Type),
	Ratio =
		case Type of
			?FOREST_DRAGON_PALACE 	->maps:get(floatvalue, tb_dragon_palace_const:get(forest_rob_ratio));
			?LAVA_DRAGON_PALACE  	->maps:get(floatvalue, tb_dragon_palace_const:get(lava_rob_ratio));
			?CRYSTAL_DRAGON_PALACE 	->maps:get(floatvalue, tb_dragon_palace_const:get(crystal_rob_ratio))
		end,
	[Item_id,Num] = Dragon_palace_info#adventure.dragon_gem,
	[Item_id,util:ceil(Num * Ratio)]
.

%% 战斗新星对应的奖励
get_rob_dragon_gem_as_star([Item_id,Num],Star) ->
	[Denominator,Numerator] =
		case Star of
			1 ->maps:get(jsonvalue, tb_dragon_palace_const:get(rob_one_star));
			2 ->maps:get(jsonvalue, tb_dragon_palace_const:get(rob_two_star));
			3 ->maps:get(jsonvalue, tb_dragon_palace_const:get(rob_three_star))
		end,
	[Item_id,util:ceil(Num * Numerator / Denominator)]
.


hero_fight_info(Info,Map) ->
	case Info =/= false of
		 true ->
			 Combat_hero = Info#fight_wastage.fighter,
			 ?DEBUG("英雄：~p  是否胜利：~p",[Combat_hero#combat_hero.hero_id,Info#fight_wastage.is_win]),
			 maps:put(Combat_hero#combat_hero.hero_id,Info#fight_wastage.is_win,Map);
		false-> Map
end

.

hero_fight_to_map(FightResultList) ->
	lists:foldr(fun(FightResult,{L_Map,R_Map})->
		L_info = FightResult#fight_result.l_wastage,
		R_info = FightResult#fight_result.r_wastage,
		{hero_fight_info(L_info,L_Map),hero_fight_info(R_info,R_Map)}
	end,{maps:new(),maps:new()},FightResultList)
.

look_report(PlayerShow,Player_pid) ->
	PlayerId = PlayerShow#player_show.id,
	Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerId),
	Rob_info = grand_to_proto(PlayerId,Dict#dragon_palace_adventure.rob_info,?ROB),
	Be_Rob_info = grand_to_proto(PlayerId,Dict#dragon_palace_adventure.be_rob_info,?BE_ROB),
	Respond = #'Proto50140005'{rob_info = Rob_info,be_rob_info = Be_Rob_info},
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?INFO("look_report ~p",[Respond])
.

is_win(Is_win) ->
	case Is_win of
		 true ->1;
		 false->0
	end
.

grand_to_proto(PlayerId,InfoDict,Type) ->
	case InfoDict =:= dict:new() of
		 true -> [];
		 false->
				Now = lib_timer:unixtime(),
				dict:fold(fun(Combat_id,Info,List) ->
					Show = Info#rob.show,
					case (Now - Info#rob.tick) > (24 * 3600) of
						true -> lib_dragon_palace_adventure_api:delete_fight_info(PlayerId,Type,Combat_id),
								List;
						false -> [#'ProroBattlefieldReport'{item_list = Info#rob.item, time = Info#rob.tick,
							player_id = Info#rob.player_id,name = Show#player_show.name,country = Show#player_show.country ,type = Info#rob.type,my_hero_fighter_info = fight_info_to_proto(Info#rob.fight_info),
							adverse_hero_fighter_info = fight_info_to_proto(Info#rob.adverse_fight_info),record_id = Info#rob.record_id,is_revenge_success = Info#rob.is_revenge_success}|List]
					end
				end,[],InfoDict)
	end
.
fight_info_to_proto(Fight_info_map) ->
	Key_list = maps:keys(Fight_info_map),
	lists:foldr(fun(Key,List)-> [#'ProtoKeyValue'{key = Key,value = is_win(maps:get(Key,Fight_info_map))}|List]end,[],Key_list)
.

%% 玩家判断
judge_player_can_be_rob(R_PlayerId,BR_PlayerId) ->
	#dragon_palace_adventure{adventure_info  = Adventure_info,rob_info = Rob_info} = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(BR_PlayerId),
	KeyList = dict:fetch_keys(Adventure_info),
	RobInfoList = dict:fetch_keys(Rob_info),

	try
		%% 判断有进行探且该龙殿未达到掠夺上限
		?JUDGE_RETURN(lists:filter(fun(Type)->
			Adventure = dict:fetch(Type, Adventure_info),
			Time = get_can_rob_time(Type),
			((Adventure#adventure.expedition_state =:= 1) andalso
				(lib_dragon_palace_adventure_api:get_be_rob_time(BR_PlayerId,Adventure#adventure.type) < Time))
		end,KeyList) =/= [], false),
		?JUDGE_RETURN(lists:foldr(fun(Key,RobTime) ->
			Rob = dict:fetch(Key, Rob_info),
			case Rob#rob.player_id =:= R_PlayerId of
				true -> RobTime + 1;
				false-> RobTime
			end
		end,0,RobInfoList)=< maps:get(value, tb_dragon_palace_const:get(rob_num)),false),
		%%
		true
	catch
		throw:{error, _Flag} -> false
	end
.

%% 单个龙殿判断
judge_adventure_can_be_rob(BR_PlayerId,Type) ->
	Adventure = lib_dragon_palace_adventure_api:get_dragon_palace_info(BR_PlayerId,Type),
	Time = get_can_rob_time(Type),
	try
		?JUDGE_RETURN(Adventure#adventure.expedition_state =:= 1, false),
		?JUDGE_RETURN((lib_dragon_palace_adventure_api:get_be_rob_time(BR_PlayerId,Type) =< Time),false),
		true
	catch
		throw:{error, _Flag} -> false
	end
.

get_can_rob_time(Type)->
	case Type of
		   ?FOREST_DRAGON_PALACE 	->maps:get(value, tb_dragon_palace_const:get(forest_be_rob_num));
		   ?LAVA_DRAGON_PALACE 		->maps:get(value, tb_dragon_palace_const:get(lava_be_rob_num));
		   ?CRYSTAL_DRAGON_PALACE  	->maps:get(value, tb_dragon_palace_const:get(crystal_be_rob_num))
	end
.

find_be_rob_player(PlayerShow) ->
	Dragon_palace_adventure = get_dragon_palace_adventure(),
	Player_list = maps:keys(Dragon_palace_adventure#dragon_palace_adventure_gather.dragon_palace_adventure_map),
	Can_rob_list =
	lists:filter(fun(BR_PlayerId)->
		Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(BR_PlayerId),
		Show = Dict#dragon_palace_adventure.show,
		((PlayerShow#player_show.country =/= Show#player_show.country) andalso (judge_player_can_be_rob(PlayerShow#player_show.id,BR_PlayerId) =:= true))
	end,Player_list),
	case Can_rob_list =:= [] of
		true -> 0;
		false->	Length = lists:flatlength(Can_rob_list),
			lists:nth(util:rand(1,Length),Can_rob_list)
	end
.

find_rob_player(PlayerShow,Player_pid) ->
	Info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerShow#player_show.id),
	find_rob_player(PlayerShow,Player_pid,Info#dragon_palace_adventure.rob_player_id)
.

find_rob_player(PlayerShow,Player_pid,BR_Player_Id) ->
	BR_PlayerId =
		case BR_Player_Id of
			0 -> find_be_rob_player(PlayerShow);
			_ -> case judge_player_can_be_rob(PlayerShow#player_show.id,BR_Player_Id)  of
					 true -> BR_Player_Id;
					 false-> find_be_rob_player(PlayerShow)
				 end
		end,
	Respond = case BR_PlayerId =:= 0 of
		true -> #'Proto50140006'{info = #'ProtoDragonPalace'{},player_info = #'ProtoShowRole'{}};
		false-> Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(BR_PlayerId),
				Show = Dict#dragon_palace_adventure.show,
				#'Proto50140006'{info = dragon_palace_info_to_proto(BR_PlayerId,PlayerShow#player_show.id),
				player_info = #'ProtoShowRole'{id = BR_PlayerId,name = Show#player_show.name,country = Show#player_show.country}}
	end,
	NewDict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerShow#player_show.id),
	lib_dragon_palace_adventure_api:update_player_dragon_palace_adventure(NewDict#dragon_palace_adventure{rob_player_id = BR_PlayerId}),
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("find_rob_player ~p",[Respond])
.

find_rob_player_no_root(PlayerShow,Player_pid,BR_PlayerId) ->
	Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(BR_PlayerId),
	Show = Dict#dragon_palace_adventure.show,
	Respond = #'Proto50140006'{info = dragon_palace_info_to_proto(BR_PlayerId,PlayerShow#player_show.id),
		player_info = #'ProtoShowRole'{id = BR_PlayerId,name = Show#player_show.name,country = Show#player_show.country}},
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("find_rob_player_no_root ~p",[Respond])
.

get_astrology_id() ->
	Key_list = tb_dragon_palace_astrology:get_list(),
	%% 获得池子的权数总和
	Total_weight = lists:foldl(fun(X, Sum) -> maps:get(weight, tb_dragon_palace_astrology:get(X),0) + Sum end, 0, Key_list),
	Now_weight  = trunc(Total_weight * rand:uniform()),
	found_astrology_id(Now_weight,Key_list)
.
found_astrology_id(Now_weight,[Key|Key_list]) ->
	#{'weight'   := Weight} = tb_dragon_palace_astrology:get(Key),
	New_weight = Now_weight - Weight,
	case New_weight =< 0 of
		true 	-> Key ;
		false 	->found_astrology_id(New_weight,Key_list)
	end
.

request_astrology(PlayerShow,Player_pid,Type) ->
	Dict = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(PlayerShow#player_show.id),
	case (Type =:= ?DPA_ASTROLOGY_FREE) andalso (Dict#dragon_palace_adventure.free_astrology_time =:= maps:get(value, tb_dragon_palace_const:get(refresh_times))) of
		false -> Astrology_id = get_astrology_id(),
			Respond = #'Proto50140007'{id = Astrology_id},
			case Type of
				?DPA_ASTROLOGY_FREE 	-> lib_dragon_palace_adventure_api:update_player_dragon_palace_adventure(Dict#dragon_palace_adventure{astrology_id = Astrology_id});
				?DPA_ASTROLOGY_UES_ITEM -> lib_dragon_palace_adventure_api:update_player_dragon_palace_adventure(Dict#dragon_palace_adventure{astrology_id = Astrology_id,
					free_astrology_time = Dict#dragon_palace_adventure.free_astrology_time + 1})
			end,
			lib_send:respond_to_client_by_pid(Player_pid, Respond),
			?DEBUG("request_astrology ~p",[Respond]);
		true -> ?DEBUG("免费占星次数已满")
	end
.

get_dragon_palace_item(PlayerShow,_Player_pid,Type) ->
	Dict = lib_dragon_palace_adventure_api:get_dragon_palace_info(PlayerShow#player_show.id,Type),
	case Dict#adventure.expedition_state =:= 2 of
		true -> Award = item_add(Dict#adventure.dragon_gem,Dict#adventure.item),
			lib_dragon_palace_adventure_api:update_dragon_palace_info(PlayerShow#player_show.id,Dict#adventure{expedition_state = 0,start_tick = 0,
			hero_list = [],dragon_gem = [],item = []}),
			Award
		;
		false-> ?DEBUG("该龙殿未探险或未探险完成"),[]
	end
.
%%======================%%
%%======================%%


request_dragon_palace_info() ->
	%% 异步调用向前端发送龙殿信息
	async_apply(fun dragon_palace_info/2)
.

request_dragon_palace_hero_list() ->
	async_apply(fun dragon_palace_hero_info/2)
.

send_hero_expeditions(Msg) ->
	#'Proto10140003'{type = Type,hero_list = Hero_id_list} = Msg,
	case Hero_id_list =:= [] of
		 false ->
			 %% 异步调用向请求派遣英雄探险
			 Hero_info = get_hero_info(Hero_id_list),
			 async_apply(fun send_hero_expeditions/4,[Type,Hero_info]);
		 true -> ?DEBUG("英雄列表为空.不能探险")
	end
.

send_hero_rob(Msg) ->
	#'Proto10140004'{player_id = BeRob_player_id,type = Type,hero_list = Hero_id_list,is_revenge = Is_revenge} = Msg,
	?DEBUG("Msg~p",[Msg]),
	Rob_player_id = lib_player:player_id(),
	Rob_hero_info = get_hero_info(Hero_id_list),
	{BeRob_hero_info,B_R_player_show,BuffList,Basics_Item} = sync_apply(fun send_hero_rob/5 ,[Rob_player_id,BeRob_player_id,Type]),
	R_player_show = lib_player:player_show(),
	{Award,Callback_data,Result_msg,IsWin} = request_dragon_palace_fight(R_player_show,Rob_hero_info,B_R_player_show,BeRob_hero_info,Type,BuffList,Basics_Item),
	case Award =/= [] of
		true -> Item = lib_item_api:conf_item_to_pack_item(Award),
			lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_DRAGON_PALACE_ROB, Type), true, 0);
		false-> skip
	end,
	lib_player_process:process_dragon_rob(),
	lib_send:respond_to_client(Callback_data),
	lib_send:respond_to_client(Result_msg),
	lib_dragon_palace_adventure_api:revenge_success_add_info(lib_player:player_id(),Is_revenge,IsWin)
.

send_hero_rob(PlayerShow,_Player_pid,R_player_id,B_R_player_id,Type) ->
	case rob_times(PlayerShow#player_show.id) > 0 of
		false ->?INFO("掠夺次数不足");
		true  ->#dragon_palace_adventure{astrology_id = Astrology_id} = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(R_player_id),
				BuffList =
					case Astrology_id =:= 0 of
					 true -> [];
					 false-> Astrology_type = get_astrology_type(Astrology_id),
						 case Astrology_type =:= ?ASTROLOGY_FIGHT_BUFF  of
								true -> maps:get(result3, tb_dragon_palace_astrology:get(Astrology_id));
								false-> []
						 end
					end,
				#dragon_palace_adventure{show = B_R_player_show} = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(B_R_player_id),
				#adventure{hero_list = B_R_hero_info} = lib_dragon_palace_adventure_api:get_dragon_palace_info(B_R_player_id,Type),
				Basics_Item = get_rob_dragon_gem(B_R_player_id,Type),
				{B_R_hero_info,B_R_player_show,BuffList,Basics_Item}
	end
.

look_report() ->
	async_apply(fun look_report/2)
.

find_rob_player(Msg) ->
	?DEBUG("Msg ---  :~p",[Msg]),
	#'Proto10140006'{type = Type,player_id = PlayerId} = Msg,
	case Type of
		?DPA_FREE -> async_apply(fun find_rob_player/2);
		?DPA_UES_ITEM -> Need_item = maps:get(jsonvalue, tb_dragon_palace_const:get(refresh_rob_player)),
					Item = lib_item_api:conf_item_to_pack_item(Need_item),
					Ret = lib_player_pack:validate_remove(Item),
					?PACK_IS_SUCCESS(Ret),
					lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_DRAGON_PALACE_ROB, Type)),
					async_apply(fun find_rob_player/3,[0]);
		?DPA_REVENGE -> async_apply(fun find_rob_player_no_root/3,[PlayerId])
	end
.

request_astrology(Msg) ->
	#'Proto10140007'{type = Type} = Msg,
	case Type of
		?DPA_ASTROLOGY_FREE 	-> skip;
		?DPA_ASTROLOGY_UES_ITEM ->  Need_item = maps:get(jsonvalue, tb_dragon_palace_const:get(refresh_astrology)),
					Item = lib_item_api:conf_item_to_pack_item(Need_item),
					Ret = lib_player_pack:validate_remove(Item),
					?PACK_IS_SUCCESS(Ret),
					lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_DRAGON_PALACE_ASTROLOGY, Type))
	end,
	async_apply(fun request_astrology/3,[Type])
.

get_dragon_palace_item(Msg) ->
	#'Proto10140008'{type = Type} = Msg,
	Award = sync_apply(fun get_dragon_palace_item/3,[Type]),
	Item = lib_item_api:conf_item_list_to_pack_item_list(Award),
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_DRAGON_PALACE_ADVENTURE, Type)),
	lib_send:respond_to_client(?MSG_RETURN_GET_DRAGON_PALACE_ITEM),
	?DEBUG("get_dragon_palace_item ~p",[?MSG_RETURN_GET_DRAGON_PALACE_ITEM])
.

%% 请求进行战斗
request_dragon_palace_fight(R_player_show,Rob_hero_info,B_R_player_show,BeRob_hero_info,Type,BuffList,Basics_Item) ->

%%	?DEBUG("我方英雄信息 ~p",[R_hero_info_L]),
%%	?DEBUG("敌方英雄信息 ~p",[B_R_hero_info_L]),

	Result = lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_DRAGON_PALACE,
		l_fighters = lib_combat_queue_api:hero_list_fighters(R_player_show, Rob_hero_info),
		l_buff_list = BuffList,
		r_fighters = lib_combat_queue_api:hero_list_fighters(B_R_player_show, BeRob_hero_info),
		fight_type = ?FIGHT_TYPE2,
		save_record = true
	}),
	Data = Result#combat_callback.callback_data,
	IsWin = Data#callback_data0.win_type =:= ?FIGHTER_TYPE_L,

	case IsWin of
		true ->
			FightResultList = Data#callback_data0.fight_result,
%%			?DEBUG("战斗信息   ~p",[FightResultList]),
			{TroopsFlag, DieNumber} =
				lib_common:list_foldl(fun(FightResult, {Flag, Number}) ->
					Wastage = FightResult#fight_result.l_wastage,
					?JUDGE_CONTINUE(Wastage =/= false, {Flag, Number + 1}),
					Total = Wastage#fight_wastage.start_front + Wastage#fight_wastage.start_back,
					Left = Wastage#fight_wastage.over_front + Wastage#fight_wastage.over_back,
					?INFO("dragon palace rob result ~p ~p ~p ~p ~p", [Flag, Left, Total, Wastage#fight_wastage.is_win, Number]),
					{Flag andalso ((Left / Total * 100) >= 30), ?IIF(Wastage#fight_wastage.is_win, Number, Number + 1)}
				end, {true, 0}, FightResultList),

			Star =
				if
					IsWin andalso TroopsFlag andalso DieNumber =:= 0 -> 3;
					IsWin andalso TroopsFlag -> 2;
					IsWin andalso DieNumber =:= 0 -> 2;
					IsWin -> 1;
					true -> 0
				end,
			Rob_Item = get_rob_dragon_gem_as_star(Basics_Item,Star),
			Rob = #rob{
				combat_id = Data#callback_data0.record_id,tick = lib_timer:unixtime(),type = Type,
				star = Star,item = Rob_Item,record_id = Data#callback_data0.record_id},
			{L_info,R_info} = hero_fight_to_map(FightResultList),
			Result_msg = result_msg_add_reward_star(Data#callback_data0.result_msg,Rob_Item,Star),
			async_apply(fun save_rob_info/9 ,[R_player_show#player_show.id,B_R_player_show#player_show.id,Rob,L_info,R_info,Type,Rob_Item]),
			{Rob_Item,Data#callback_data0.msg,Result_msg,IsWin}

		;
		false->
			async_apply(fun add_be_tob_time/3, [B_R_player_show#player_show.id]),
			{[],Data#callback_data0.msg,Data#callback_data0.result_msg,IsWin}
	end
.

result_msg_add_reward_star(Msg, RewardList,Star) ->
	?DEBUG("RewardList ~p",[RewardList]),
	Proto = lib_item_api:conf_item_to_proto_obj(RewardList),
	Msg#'Proto80102007'{reward =  Proto,param1 = Star}.

save_rob_info(_PlayerShow,_Player_pid,R_player_id,B_R_player_id,Rob,L_info,R_info,Type,Rob_Item) ->
	R_Player_info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(R_player_id),
	B_R_Player_info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(B_R_player_id),
	%% 保存战斗信息
	lib_dragon_palace_adventure_api:save_fight_info(R_player_id,?ROB,Rob#rob{player_id = B_R_player_id,
		show = B_R_Player_info#dragon_palace_adventure.show, fight_info = L_info,adverse_fight_info = R_info}),
	lib_dragon_palace_adventure_api:save_fight_info(B_R_player_id,?BE_ROB,Rob#rob{player_id = R_player_id,
		show = R_Player_info#dragon_palace_adventure.show, fight_info = R_info,adverse_fight_info = L_info}),
	%% 减少可掠夺次数
	lib_dragon_palace_adventure_api:add_rob_time(R_player_id),
	%% 增加被掠夺
	lib_dragon_palace_adventure_api:add_be_rob_time(B_R_player_id,Type),
	lib_dragon_palace_adventure_api:reset_rob_player(R_player_id),
	%% 增加龙殿信息
	Info = lib_dragon_palace_adventure_api:get_dragon_palace_info(B_R_player_id,Type),
	[Item,Num] = Info#adventure.dragon_gem,
	[_,Num1] = Rob_Item,
	lib_dragon_palace_adventure_api:update_dragon_palace_info(B_R_player_id,Info#adventure{
		dragon_gem = [Item,(Num - Num1)], be_rob_dragon_gem = Info#adventure.be_rob_dragon_gem + Num1,
		be_rob = Info#adventure.be_rob + 1,be_rob_success = Info#adventure.be_rob_success + 1
	})
.

add_be_tob_time(_PlayerShow,_Player_pid,B_R_player_id) ->
	Info = lib_dragon_palace_adventure_api:get_player_dragon_palace_adventure(B_R_player_id),
	lib_dragon_palace_adventure_api:update_dragon_palace_info(B_R_player_id,Info#adventure{be_rob = Info#adventure.be_rob + 1})
.