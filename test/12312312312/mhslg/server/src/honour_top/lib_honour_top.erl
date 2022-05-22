%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 11:07
%%%-------------------------------------------------------------------
-module(lib_honour_top).
-author("df").
-include("common.hrl").
-include("honour_top.hrl").
-include("hero.hrl").
-include("player.hrl").
-include("ProtoClient_10149.hrl").
-include("ProtoPublic.hrl").
-include("season_and_day.hrl").
-define(HONOUR_TOP_KEY, honour_top_key).
%% API
-export([
	get_honour_top_gather/0,
	put_honour_top_gather/1
]).
-export([
	async_apply/1,
	async_apply/2,
	sync_apply/2
]).
-export([
	get_honour_top_info/5,
	get_honour_top_apply_info/2,
	honour_top_apply/5,
	honour_top_worship/2,
	get_honour_top_report/4,
	get_honour_top_final/2,
	get_honour_top_bet_info/2,
	honour_top_bet_on/4,
	get_apply_hero/2,
	refresh_every_day/2,
	use_honour_top/3,

	sign_out/2
]).
get_honour_top_gather() ->
	erlang:get(?HONOUR_TOP_KEY)
.
put_honour_top_gather(Honour_top_gather) when is_record(Honour_top_gather, honour_top_gather)  ->
	erlang:put(?HONOUR_TOP_KEY,Honour_top_gather)
.
async_apply(Func) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_honour_top:get_pid(), Func, [Player_pid,PlayerShow])
.
async_apply(Func,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_honour_top:get_pid(), Func, [Player_pid,PlayerShow] ++ Args)
.
sync_apply(Fun,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:sync_apply(mod_honour_top:get_pid(),Fun, [Player_pid,PlayerShow] ++ Args)
.

get_honour_top_info(PlayerPid,PlayerShow,Stage,Group,Type)->
	Gather = lib_honour_top:get_honour_top_gather(),
	PlayerId = PlayerShow#player_show.id,
	{New_stage,Times,New_group,Info} = get_info(PlayerId,Stage,Group,Type),
	case New_stage of
		 ?EIGHT_STAGE 	 -> get_honour_top_final(PlayerPid,PlayerShow);
		 ?OVER_STAGE	 -> get_honour_top_final(PlayerPid,PlayerShow);
		 ?ACTIVITY_OVER  -> get_honour_top_apply_info(PlayerPid,PlayerShow);
		 _ -> 	Player = lib_honour_top_api:get_player_info(PlayerId),
				Respond = #'Proto50149001'{
					stage = New_stage,
					times = Times,
					group = New_group,
					info = Info,
					tick = lib_timer:unixtime(),
					activity_time = lib_honour_top_api:get_activity_time(),
					is_apply = Player#player_honour_top.is_apply,
					is_fight = Gather#honour_top_gather.is_fight
				},
				lib_send:respond_to_client_by_pid(PlayerPid, Respond),
				?INFO("get_honour_top_info :~p",[Respond])
	end
.
get_honour_top_apply_info(PlayerPid,PlayerShow)->
	Gather = lib_honour_top:get_honour_top_gather(),
	Info = get_top_three(),
	PlayerId = PlayerShow#player_show.id,
	Player = lib_honour_top_api:get_player_info(PlayerId),
	Respond = #'Proto50149002'{
		info = Info,
		is_worship = Player#player_honour_top.is_worship,
		activity_time = lib_honour_top_api:get_activity_time(),
		is_apply = Player#player_honour_top.is_apply,
		apply_num = Gather#honour_top_gather.apply_num
	},
	lib_send:respond_to_client_by_pid(PlayerPid, Respond),
	?INFO("get_honour_top_apply_info :~p",[Respond])
.
-define(APPLY,	1).		%% 报名
-define(CHANGE,	2).		%% 更改阵容
honour_top_apply(PlayerPid,PlayerShow,HeroList,Type,Force)->
	PlayerId = PlayerShow#player_show.id,
	Gather = get_honour_top_gather(),
	case Type of
		?APPLY -> case (lib_season_and_days_api:get_season() =:= lib_honour_top_api:const(open_season,value)) orelse (Gather#honour_top_gather.apply_num >= ?APPLY_MAX) of
					  true -> ?INFO("不在报名时间内或报名人数已满");
					  false-> ?INFO("报名"),
						  Player = lib_honour_top_api:get_player_info(PlayerId),
						  lib_honour_top_api:update_player_info(PlayerId,Player#player_honour_top{player_id = PlayerId,
						  show = PlayerShow#player_show{force = Force},hero_info = HeroList,is_apply = 1}),
						  put_honour_top_gather((get_honour_top_gather())#honour_top_gather{apply_num = Gather#honour_top_gather.apply_num + 1}),
						  Item = lib_honour_top_api:const(apply_get,jsonvalue),
						  mod_server:async_apply(PlayerPid,fun lib_player_honour_top:honour_top_get_item/1,[Item])
				  end;
		?CHANGE-> Player = lib_honour_top_api:get_player_info(PlayerId),
			case Player#player_honour_top.is_apply =:= 0 of
				true -> ?INFO("未报名,不能更改阵容");
				false-> Show = Player#player_honour_top.show,
					lib_honour_top_api:update_player_info(PlayerId,Player#player_honour_top{
						show = Show#player_show{force = Force},hero_info = HeroList})

			end
	end,
	get_honour_top_apply_info(PlayerPid,PlayerShow)

.
honour_top_worship(PlayerPid,PlayerShow)->
	PlayerId = PlayerShow#player_show.id,
	Player = lib_honour_top_api:get_player_info(PlayerId),
	case Player#player_honour_top.is_worship =:= 1 of
		true -> ?DEBUG("今日已膜拜,不能再次膜拜");
		false-> lib_honour_top_api:update_player_info(PlayerId,Player#player_honour_top{is_worship = 1}),
			Item = lib_honour_top_api:const(worship,jsonvalue),
			mod_server:async_apply(PlayerPid,fun lib_player_honour_top:honour_top_get_item/1,[Item]),
			get_honour_top_apply_info(PlayerPid,PlayerShow)
	end

.
get_honour_top_report(PlayerPid,_PlayerShow,Stage,Group)->
	Info = get_report_info(Stage,Group),
	Respond = #'Proto50149005'{
		report_info = Info
	},
	lib_send:respond_to_client_by_pid(PlayerPid, Respond),
	?DEBUG("get_honour_top_report :~p",[Respond])
.
get_honour_top_final(PlayerPid,PlayerShow)->
	Gather = lib_honour_top:get_honour_top_gather(),
	{_Stage,Times} = lib_honour_top_api:get_stage_and_times(),
	Player = lib_honour_top_api:get_player_info(PlayerShow#player_show.id),
	Respond = #'Proto50149006'{
		player_info = get_info(?EIGHT_STAGE,1),
		reoprt = get_report_info(?EIGHT_STAGE,1),
		tick = lib_timer:unixtime(),
		times = Times,
		activity_time = lib_honour_top_api:get_activity_time(),
		is_fight = Gather#honour_top_gather.is_fight,
		bet = Player#player_honour_top.bet
	},
	lib_send:respond_to_client_by_pid(PlayerPid, Respond),
	?DEBUG("get_honour_top_report :~p",[Respond])
.
get_honour_top_bet_info(PlayerPid,PlayerShow)->
	Player = lib_honour_top_api:get_player_info(PlayerShow#player_show.id),
	Respond = #'Proto50149007'{
		info = bet_info(),
		bet = Player#player_honour_top.bet
	},
	lib_send:respond_to_client_by_pid(PlayerPid, Respond),
	?INFO("get_honour_top_report :~p",[Respond])
.
honour_top_bet_on(_PlayerPid,PlayerShow,Rank,Money)->
	PlayerId = PlayerShow#player_show.id,
	lib_honour_top_api:player_bet(PlayerId,Rank,Money)
.

get_apply_hero(PlayerPid,PlayerShow)->
	PlayerId = PlayerShow#player_show.id,
	PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),
	List = [ HeroBase#hero_base.id || HeroBase <- PlayerInfo#player_honour_top.hero_info],
	Respond = #'Proto50149009'{
		hero_list = List
	},
	lib_send:respond_to_client_by_pid(PlayerPid, Respond),
	?DEBUG("get_honour_top_report :~p",[Respond])
.

use_honour_top(_PlayerPid,PlayerShow,Type) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	PlayerId = PlayerShow#player_show.id,
	List =
	case Type of
		1 -> [PlayerId|Gather#honour_top_gather.online_player];
		2 -> lists:delete(PlayerId,Gather#honour_top_gather.online_player)
	end,
	put_honour_top_gather(Gather#honour_top_gather{online_player = List})

.
refresh_every_day(_PlayerPid,PlayerShow) ->
	PlayerId = PlayerShow#player_show.id,
	PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),
	lib_honour_top_api:update_player_info(PlayerId,PlayerInfo#player_honour_top{is_worship = 0})
.
%% ==================== %%
-define(FIND,	1).
-define(SELECT, 2).
get_info(PlayerId,Stage,Group,Type) ->
	{NewStage,Times} = lib_honour_top_api:get_stage_and_times(),
	case Type of
		?FIND   ->
			Group_map = lib_honour_top_api:get_player_group(PlayerId,NewStage),
			NewGroup = case Group_map#player_group_map.group =:= 0 of
						   true -> 1;
						   false-> Group_map#player_group_map.group
					   end,
			{NewStage,Times,NewGroup,get_info(NewStage,NewGroup)};
		?SELECT -> {Stage,Times,Group,get_info(Stage,Group)}
	end
.
get_info(Stage,Group) ->
	Info = lib_honour_top_api:get_group_info(Stage,Group),
	maps:fold(fun(_PlayerId,Player_grade_info,List) ->
		[player_to_proto(Player_grade_info)|List]
			  end,[],Info#group_map.player_grade_info)
.
player_to_proto(Player_grade_info) ->
	Player = lib_honour_top_api:get_player_info(Player_grade_info#player_grade_info.player_id),
	#'ProtoHonourTop'{
		player = lib_common:player_show_to_proto(Player#player_honour_top.show),
		rank = Player_grade_info#player_grade_info.rank,
		win = Player_grade_info#player_grade_info.win,lose = Player_grade_info#player_grade_info.lose
	}
.
get_top_three() ->
	lists:foldl(fun(Rank,L) ->
		Top_eight = lib_honour_top_api:get_top_eight(Rank),
		PlayerId = Top_eight#top_eight.player_id,
		case PlayerId =:= 0 of
			 true -> L;
			 false-> [#'ProtoHonourTop'{
					 player = lib_common:player_show_to_proto(Top_eight#top_eight.show),
					 rank = Rank,
					 hero_id = Top_eight#top_eight.show_hero_id
				 }|L]
		end
	end,[],maps:get(jsonvalue, tb_honour_top_const:get(show_list)))
.


get_report_info(Stage,GroupId) ->
	GroupInfo = lib_honour_top_api:get_group_info(Stage,GroupId),
	maps:fold(fun(Times,Report_map,L) ->
		Times = Report_map#report_map.times,
		[#'ProtoHonourTopReport'{times = Times,report = get_report_to_proto(Stage,GroupId,Times)}|L]
	end,[],GroupInfo#group_map.report_map)
.
get_report_to_proto(Stage,GroupId,Times) ->
	lists:foldl(fun(Report,L)->
		[#'ProtoReport'{
			left_show = lib_common:player_show_to_proto(Report#report.l_show),
			right_show = lib_common:player_show_to_proto(Report#report.r_show),
			winner = Report#report.win,info1 = Report#report.record_id,info2 = Report#report.id
		}|L]
	end,[],lib_honour_top_api:get_report_list(Times,Stage,GroupId))
.
bet_info() ->
	Gather = lib_honour_top:get_honour_top_gather(),
	lists:foldl(fun(BetId,L) ->
		BetInfo = lib_honour_top_api:get_bet_info(BetId),
		[#'ProtoHonourTop'{
			player = lib_common:player_show_to_proto(BetInfo#bet_map.be_bet_show),
			rank = BetInfo#bet_map.id,
			odds = lib_honour_top_api:get_now_odds(BetId),
			money = BetInfo#bet_map.money
		}|L]
	end,[],maps:keys(Gather#honour_top_gather.bet_map))
.
sign_out(PlayerPid,PlayerShow) ->
	Player = lib_honour_top_api:get_player_info(PlayerShow#player_show.id),
	case Player#player_honour_top.is_apply =:= 1 of
		true ->	mod_server:async_apply(PlayerPid,fun lib_player_honour_top:sign_out/1,[Player])	;
		false-> skip
	end
.