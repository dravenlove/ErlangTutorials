%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 2月 2021 11:00
%%%-------------------------------------------------------------------
-module(lib_meritorious_award).
-author("df").
-include("common.hrl").
-include("meritorious_award.hrl").
-include("ProtoClient_10142.hrl").
-include("ProtoPublic.hrl").
-include("nobility.hrl").
-include("player.hrl").



-export([
	request_meritorious_award_info/0,				%% 请求战功奖励界面
	get_meritorious_award/1,						%% 领取战功奖励
	get_all_meritorious_award/0,					%% 一键领取战功奖励
	meritorious_to_proto/0,							%% 发送战功给前端
	meritorious_to_proto/1							%%
]).

-export([
	sign_in/0,
	get_sum/1,
	update_kill/0,
	update_damage/0,
	get_unreceived_award/1							%% 获取未领取的奖励
]).


request_meritorious_award_info()->
	lib_meritorious_award_rank:async_apply(fun request_meritorious_award_info/2)
.

request_meritorious_award_info(PlayerShow,Player_pid) ->
	PlayerId = PlayerShow#player_show.id,
	count_award_info(PlayerId),
	Meritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	Respond = #'Proto50142001'{
		award_info = award_info_to_proto(PlayerId),stage = Meritorious_award#meritorious.stage,
		meritorious = Meritorious_award#meritorious.meritorious,circulation_award = Meritorious_award#meritorious.circulation_award,
		get_circulation_award = Meritorious_award#meritorious.get_circulation_award
	},
	lib_send:respond_to_client_by_pid(Player_pid,Respond),
	?DEBUG("request_meritorious_award_info: ~p ~n",[Respond])
.
get_meritorious_award(Msg)->
	#'Proto10142003'{grade = Grade} = Msg,
	lib_meritorious_award_rank:async_apply(fun get_meritorious_award/3, [Grade])
.

get_meritorious_award(PlayerShow,Player_pid,Grade)->
	PlayerId = PlayerShow#player_show.id,
	#meritorious{circulation_award = Circulation_award} = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	case (get_award_info(PlayerId,Grade) =:= 1) or (Circulation_award >= 1) of
		true  ->
			get_meritorious_award_item(PlayerId,get_sum(PlayerId),Grade),
			lib_send:respond_to_client_by_pid(Player_pid,?MSG_RETURN_GET_MERITORIOUS_AWARD),
			request_meritorious_award_info(PlayerShow,Player_pid)
		;
		false -> ?DEBUG("该奖励为解锁或者已领取")
	end
.

get_all_meritorious_award() ->
	lib_meritorious_award_rank:async_apply(fun get_all_meritorious_award/2)
.

get_all_meritorious_award(PlayerShow,Player_pid)->
	PlayerId = PlayerShow#player_show.id,
	count_award_info(PlayerId),
	Award = get_unreceived_award(PlayerId),
	case Award =:= [] of
		 true ->?DEBUG("当前无奖励可领取");
		 false->
			Item = lib_item_api:conf_item_list_to_pack_item_list(lib_item_api:merge_conf_item_list(Award)),
			mod_server:async_apply(Player_pid,fun add_item/1,[Item]),
			?DEBUG("get_all_meritorious_award ~p",[?MSG_RETURN_GET_ALL_MERITORIOUS_AWARD]),
			 request_meritorious_award_info(PlayerShow,Player_pid)
	end
.

sign_in() ->
	KillAdd = lib_nobility_api:privilege_add(?COUNTRY_WAR_DEFEAT_SOLDIER),
	DamageAdd = lib_nobility_api:privilege_add(?MULTIPLY_BATTLE_COUNT),
	lib_meritorious_award_rank:update_show(KillAdd,DamageAdd),
	meritorious_to_proto()
.

update_kill() ->
	PlayerId = lib_player:player_id(),
	Add = lib_nobility_api:privilege_add(?COUNTRY_WAR_DEFEAT_SOLDIER),
	mod_server:async_apply(mod_meritorious_rank:get_pid(), fun lib_meritorious_award_rank:update_kill_add/2, [PlayerId, Add])
.
update_damage() ->
	PlayerId = lib_player:player_id(),
	Add = lib_nobility_api:privilege_add(?MULTIPLY_BATTLE_COUNT),
	mod_server:async_apply(mod_meritorious_rank:get_pid(), fun lib_meritorious_award_rank:update_damage_add/2, [PlayerId, Add])
.

meritorious_to_proto() ->
	lib_meritorious_award_rank:async_apply( fun meritorious_to_proto/2)
.

meritorious_to_proto(PlayerShow,Player_pid) ->
	Meritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerShow#player_show.id),
	mod_server:async_apply(Player_pid, fun meritorious_to_proto/1, [Meritorious_award#meritorious.meritorious])
.

meritorious_to_proto(Meritorious) ->
	Respond = #'Proto80142005'{
		meritorious = Meritorious
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("meritorious_to_proto: ~p ~n",[Respond])
.

get_meritorious_award_item(PlayerId,Sum,Grade) ->
	Award =
	case Grade of
		0 -> add_get_circulation_award(PlayerId,1),
			get_circulation_award(Sum);
		_ -> update_award_info(PlayerId,Grade,2),
			get_grade_award(Sum,Grade)
	end,
	Item = lib_item_api:conf_item_to_pack_item(Award),
	mod_server:async_apply(lib_player:get_pid(PlayerId),fun add_item/1,[Item])
.

%% 获得某个档次的奖励状态
get_award_info(PlayerId,Grade) ->
	Meritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	maps:get(Grade,Meritorious_award#meritorious.award_info,0)
.

%% 更新某个档次的状态
update_award_info(PlayerId,Grade,Type) ->
	?DEBUG("更新 ~p档的状态为 ~p",[Grade,Type]),
	Meritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	New_award_info = maps:put(Grade,Type,Meritorious_award#meritorious.award_info),
	lib_meritorious_award_rank:update_player_meritorious(PlayerId,Meritorious_award#meritorious{award_info = New_award_info})
.

add_get_circulation_award(PlayerId,Num) ->
	?DEBUG("领取-----~p个循环奖励",[Num]),
	#meritorious{get_circulation_award = Get_circulation_award,circulation_award = Circulation_award} = Meritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	lib_meritorious_award_rank:update_player_meritorious(PlayerId,Meritorious_award#meritorious{get_circulation_award = Get_circulation_award + Num,
		circulation_award = Circulation_award - Num})
.

get_sum(PlayerId) ->
	Season = lib_season_and_days_api:get_season(),
	#meritorious{stage = Stage} = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	1 * 10000 + Season * 100 + Stage
.

%% 计算奖励信息
count_award_info(PlayerId)->
	#meritorious{meritorious = Meritorious,get_circulation_award = Get_circulation_award} = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	Key = maps:get(value, tb_meritorious_award_const:get(grade)),
	count_award_info(PlayerId,Key,get_sum(PlayerId),Meritorious),
	%% 计算是否有循环奖励
	#{'start_meritorious' := Start_meritorious, 'meritorious' := OneMeritorious} = tb_meritorious_circulation_award:get(get_sum(PlayerId)),
	case Meritorious >= Start_meritorious of
		false -> skip;
		true  -> NewMeritorious_award = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
			Circulation_award_num = ((Meritorious - Start_meritorious) div OneMeritorious) - Get_circulation_award,
			lib_meritorious_award_rank:update_player_meritorious(PlayerId,NewMeritorious_award#meritorious{circulation_award = Circulation_award_num})

	end
.

%% 基础奖励
count_award_info(PlayerId,Key,Sum,Meritorious) ->
	case Key =:= 0 of
		true ->skip;
		false->
			Value = get_award_info(PlayerId,Key),
			Need_Meritorious = maps:get(meritorious, tb_meritorious_award:get(Sum * 100 + Key)),
			case (Value =:= 0) andalso (Meritorious >= Need_Meritorious) of
				true  ->update_award_info(PlayerId,Key,1);
				false ->skip
			end,
			count_award_info(PlayerId,Key - 1,Sum,Meritorious)
	end
.
award_info_to_proto(PlayerId) ->
	Key = maps:get(value, tb_meritorious_award_const:get(grade)),
	award_info_to_proto(PlayerId,Key,[])
.
award_info_to_proto(PlayerId,Key,List) ->
	case Key =:= 0 of
		true ->List;
		false->
			Value = get_award_info(PlayerId,Key),
			Proto = #'ProtoKeyValue'{key = Key,value = Value},
			award_info_to_proto(PlayerId,Key - 1,[Proto|List])
	end
.

get_circulation_award(Key) ->
	maps:get(award, tb_meritorious_circulation_award:get(Key))
.

get_grade_award(Sum,Grade) ->
	maps:get(award, tb_meritorious_award:get(Sum * 100 + Grade),[])
.

%% 获取未领取的奖励
get_unreceived_award(PlayerId) ->
	#meritorious{award_info = Award_info,circulation_award = Circulation_award} = lib_meritorious_award_rank:get_player_meritorious(PlayerId),
	Grade_list = lists:filter(fun(Grade)-> get_award_info(PlayerId,Grade) =:= 1 end,maps:keys(Award_info)),
	Sum = get_sum(PlayerId),
	Award_item = lists:foldr(fun(Grade,List)->
		update_award_info(PlayerId,Grade,2),
		Award = get_grade_award(Sum,Grade),
		case Award =:= [] of
			true ->List;
			false ->[Award|List]
		end end,[],Grade_list),
	Circulation_award_item =
		case Circulation_award =:= 0 of
			true -> [];
			false-> add_get_circulation_award(PlayerId,Circulation_award),
				[Id,Num] = get_circulation_award(Sum),
				[[Id,Num * Circulation_award]]
		end,
	case (Award_item =:= []) andalso (Circulation_award_item =:= [])  of
		true ->[];
		false->Award_item ++ Circulation_award_item
	end
.

add_item(Item) ->
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_MERITORIOUS_AWARD, 1)),
	lib_send:respond_to_client(?MSG_RETURN_GET_ALL_MERITORIOUS_AWARD)
.