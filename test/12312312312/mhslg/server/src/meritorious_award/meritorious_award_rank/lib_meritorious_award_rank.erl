%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 2月 2021 11:11
%%%-------------------------------------------------------------------
-module(lib_meritorious_award_rank).
-author("df").
-include("common.hrl").
-include("meritorious_award.hrl").
-include("player.hrl").
-include("ProtoClient_10142.hrl").
-include("ProtoPublic.hrl").
-include("season_and_day.hrl").

-define(MERITORIOUS_RANK_KEY, meritorious_rank_key).


%% API
%% 玩家进程调用
-export([
	get_rank/0						%% 获取战功排行榜

]).

-export([
	get_meritorious_rank_gather/0,
	put_meritorious_rank_gather/1,
	send_rank_award_to_mail/1,		%% 发送战功排行奖励
	reset_rank/0					%% 清空排行榜信息
]).

-export([
	nobility_meritorious/1,			%% 获取爵位战功
	clean_nobility_meritorious/1,	%% 清除爵位战功
	get_player_meritorious/1,
	update_player_meritorious/2,
	city_fight_count_meritorious/6,	%% 城池战斗调用计算战功
	update_kill_add/2,				%% 玩家更新歼敌加成
	update_damage_add/2,			%% 玩家更新战损加成
	update_show/2,
	test_get_meritorious/1,			%% 测试命令
	player_unreceived/0,
	rank_mail/1
]).
-export([
	sync_apply/1,
	async_apply/1,
	async_apply/2
]).

get_meritorious_rank_gather() ->
	erlang:get(?MERITORIOUS_RANK_KEY)
.
put_meritorious_rank_gather(Meritorious_rank_gather) when is_record(Meritorious_rank_gather, meritorious_rank_gather)  ->
	erlang:put(?MERITORIOUS_RANK_KEY,Meritorious_rank_gather)
.
sync_apply(Func) ->
	PlayerId = lib_player:player_id(),
	mod_server:sync_apply(mod_meritorious_rank:get_pid(), Func, [PlayerId])
.
async_apply(Func) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_meritorious_rank:get_pid(), Func, [PlayerShow,Player_pid])
.
async_apply(Func,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_meritorious_rank:get_pid(), Func, [PlayerShow,Player_pid] ++ Args)
.

get_rank_info(PlayerId) ->
	RankGather = get_meritorious_rank_gather(),
	maps:get(PlayerId,RankGather#meritorious_rank_gather.rank_map,#meritorious_rank{player_id = PlayerId})
.

update_rank_info(Rank) when is_record(Rank, meritorious_rank) ->
	RankGather = get_meritorious_rank_gather(),
	NewRankMap = maps:put(Rank#meritorious_rank.player_id,Rank,RankGather#meritorious_rank_gather.rank_map),
	put_meritorious_rank_gather(RankGather#meritorious_rank_gather{rank_map = NewRankMap})

.

nobility_meritorious(PlayerId) ->
	(get_player_meritorious(PlayerId))#meritorious.add_up_meritorious
.
clean_nobility_meritorious(PlayerId) ->
	Meritorious = (get_player_meritorious(PlayerId))#meritorious{add_up_meritorious = 0},
	update_player_meritorious(PlayerId, Meritorious)
.
get_player_meritorious(PlayerId) ->
	Gather = get_meritorious_rank_gather(),
	Map = Gather#meritorious_rank_gather.meritorious_map,
	maps:get(PlayerId,Map,#meritorious{player_id = PlayerId})
.
update_player_meritorious(PlayerId,Meritorious)when is_record(Meritorious,meritorious) ->
	Gather = get_meritorious_rank_gather(),
	Map = Gather#meritorious_rank_gather.meritorious_map,
	New_map = maps:put(PlayerId,Meritorious,Map),
	put_meritorious_rank_gather(Gather#meritorious_rank_gather{meritorious_map = New_map})
.

is_in_rank(PlayerId) ->
	RankGather = get_meritorious_rank_gather(),
	maps:is_key(PlayerId,RankGather#meritorious_rank_gather.rank_map)
.

rank_info_to_proto([]) ->
	[]
;
rank_info_to_proto(IdList) ->
	lists:foldr(fun(PlayerId,List)->
		RankInfo = get_rank_info(PlayerId),
		PlayerShow = RankInfo#meritorious_rank.show,
		[#'ProtoRank'{rank = RankInfo#meritorious_rank.rank,value = RankInfo#meritorious_rank.meritorious,rank_tick = RankInfo#meritorious_rank.tick,
			player_show = #'ProtoShowRole'{
				id = PlayerId,name = PlayerShow#player_show.name,country = PlayerShow#player_show.country,head_icon = PlayerShow#player_show.head_icon
			}}|List]
	end,[],IdList)
.

%% 判断分数是否高于排行榜最后一名
exceed_the_last(IdList,Meritorious) ->
	PlayerId = lists:filter(fun(PlayerId) -> Info = get_rank_info(PlayerId),Info#meritorious_rank.rank =:= 100 end,IdList),
	Min = case PlayerId =:= [] of
			  true -> 0;
			  false->Info = get_rank_info(PlayerId),
				  Info#meritorious_rank.meritorious
		end,
	Meritorious > Min
.

%% 排列排行榜
arrange_rank() ->
	RankGather = get_meritorious_rank_gather(),
	IdList = maps:keys(RankGather#meritorious_rank_gather.rank_map),
	List = lists:foldr(fun(PlayerId,List)->
			Info = get_rank_info(PlayerId),[{PlayerId,Info#meritorious_rank.meritorious}|List]
		end,[],IdList),
	Orderly_list = lists:reverse(lists:keysort(2, List)),
	NewMap = arrange_rank(Orderly_list,1,maps:new()),
	put_meritorious_rank_gather(RankGather#meritorious_rank_gather{rank_map = NewMap})
.
arrange_rank([{PlayerId,_}|Orderly_list],Rank,Map) ->
	case Rank > 100 of
		 true -> Map;
		 false-> Info = get_rank_info(PlayerId),
			NewMap = maps:put(PlayerId,Info#meritorious_rank{rank = Rank},Map),
			arrange_rank(Orderly_list,Rank + 1,NewMap)
	end
;
arrange_rank([],_Rank,Map) ->
	Map
.

get_rank_award(PlayerId,Type) ->
	Season = lib_season_and_days_api:get_season(),
	#meritorious_rank{rank = Rank} = get_rank_info(PlayerId),
	Key = 1 * 100000 + Season * 1000 + Rank,
	?INFO("Key ~p",[Key]),
	maps:get(Type, tb_meritorious_rank_award:get(Key))
.


%% 城池战斗调用
city_fight_count_meritorious(PlayerId,Kill,Enemy_ranks,Is_NPC,Damage,MilitaryId) ->
	Is_NPC_add =
		case Is_NPC =:= true of
			true ->maps:get(value, tb_meritorious_award_const:get(npc_coefficient));
			false->maps:get(value, tb_meritorious_award_const:get(player_coefficient))
		end,
	Kill_add = maps:get(floatvalue, tb_meritorious_award_const:get(kill_coefficient)),
	Damage_add = maps:get(floatvalue, tb_meritorious_award_const:get(damage_coefficient)),
	Military_add =
	case MilitaryId =:= 0 of
		 true -> 1 ;
		 false-> 1 + (maps:get(rate, tb_country_order:get(MilitaryId)) / 100)
	end,
	PlayerMeritorious = get_player_meritorious(PlayerId),
	Nobility_Kill_add = PlayerMeritorious#meritorious.kill_add + 1,
	Nobility_Damage_Add = PlayerMeritorious#meritorious.damage_add + 1,
	%% 战功=（歼敌系数*歼敌数*爵位加成系数*敌军等级*是否NPC系数+战损系数*战损*爵位加成系数）*军令加成系数
	Meritorious = lib_common:floor((Kill_add*Kill*Nobility_Kill_add*Enemy_ranks*Is_NPC_add + Damage_add*Damage*Nobility_Damage_Add)* Military_add),
	add_meritorious(PlayerId,Meritorious)
.

add_meritorious(PlayerId,Meritorious) ->
	PlayerMeritorious = get_player_meritorious(PlayerId),
	NewMeritorious = PlayerMeritorious#meritorious.meritorious + Meritorious,
	update_player_meritorious(PlayerId,PlayerMeritorious#meritorious{meritorious = PlayerMeritorious#meritorious.meritorious + Meritorious,
		add_up_meritorious = PlayerMeritorious#meritorious.add_up_meritorious + Meritorious,tick = lib_timer:unixtime()}),
	update_rank(PlayerId,PlayerMeritorious#meritorious.show,NewMeritorious),
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true ->  mod_server:async_apply(Pid,fun lib_meritorious_award:meritorious_to_proto/1,[NewMeritorious])
	end,
	lib_open_server_rank:mod_add_grade(PlayerId,?OPEN_SERVER_TASK_TYPE_5,Meritorious,lib_timer:unixtime())

.
%=============%
update_show(KillAdd,DamageAdd) ->
	async_apply(fun update_show/4,[KillAdd,DamageAdd])
.
update_show(PlayerShow,_Player_pid,KillAdd,DamageAdd) ->
	PlayerId = PlayerShow#player_show.id,
	Meritorious = get_player_meritorious(PlayerId),
	update_player_meritorious(PlayerId,Meritorious#meritorious{
		player_id = PlayerId,show = PlayerShow,kill_add = KillAdd,damage_add = DamageAdd
	})
.

get_rank() ->
	async_apply(fun get_rank/2)
.

get_rank(_PlayerShow,Player_pid) ->
	RankGather = get_meritorious_rank_gather(),
	IdList = maps:keys(RankGather#meritorious_rank_gather.rank_map),
	Respond = #'Proto50142002'{rank_info = rank_info_to_proto(IdList)},
	lib_send:respond_to_client_by_pid(Player_pid, Respond)
%%	?DEBUG("request_dragon_palace_info:~p",[Respond])
.

update_rank(PlayerId,PlayerShow,Meritorious) ->
	RankGather = get_meritorious_rank_gather(),
	IdList = maps:keys(RankGather#meritorious_rank_gather.rank_map),
	ListLength = lists:foldr(fun(_Id,Sum)-> Sum + 1 end,0,IdList),
	case is_in_rank(PlayerId) of
		 true -> Rank = get_rank_info(PlayerId),
			 update_rank_info(Rank#meritorious_rank{meritorious = Meritorious,tick = lib_timer:unixtime()});
		 false-> case (ListLength < 100) orelse exceed_the_last(IdList,Meritorious) of
					 true ->update_rank_info(#meritorious_rank{player_id = PlayerId,show = PlayerShow,
						  tick = lib_timer:unixtime(),meritorious = Meritorious});
					 false -> skip
				end
	end,
	arrange_rank()
.

-define(DAY_AWARD,day_award).	%% 每日战功排行奖励
-define(YEAR_AWARD,year_award).	%% 年度战功排行奖励

send_rank_award_to_mail(Tick) ->
	rank_mail(?DAY_AWARD),
	case lib_season_and_days_api:season(Tick) =:= ?WINTER of
		true ->	rank_mail(?YEAR_AWARD),
				reset_rank(),
				player_unreceived() ;
		false-> skip
	end
.

rank_mail(Type) ->
	RankGather = get_meritorious_rank_gather(),
	RankGather#meritorious_rank_gather.rank_map,
	MapId = case Type of
				?DAY_AWARD -> ?INFO("发送每日奖励~n"),?MAP_MERITORIOUS_DAY_AWARD;
				?YEAR_AWARD-> ?INFO("发送年度奖励~n"),?MAP_MERITORIOUS_YEAR_AWARD
			end,
	maps:fold(fun(PlayerId,RankInfo,_) ->
		Item_list = get_rank_award(PlayerId,Type),
		?INFO("玩家排名 ~p~n",[RankInfo#meritorious_rank.rank]),
		lib_mail_api:fast_send_mail(PlayerId, MapId, [RankInfo#meritorious_rank.rank],
			lib_item_api:conf_item_list_to_pack_item_list(Item_list), ?ADD_MERITORIOUS_RANK)
		end,0,RankGather#meritorious_rank_gather.rank_map)
.

player_unreceived() ->
	Gather = get_meritorious_rank_gather(),
	[player_unreceived(PlayerId)|| PlayerId <- maps:keys(Gather#meritorious_rank_gather.meritorious_map)]
.

player_unreceived(PlayerId) ->
	?INFO("发送战功奖励未领取奖励"),
	Meritorious_award = get_player_meritorious(PlayerId),
	UnreceivedItem = lib_meritorious_award:get_unreceived_award(PlayerId),
	%% 查询未领取的玩家奖励,发送邮件
	case UnreceivedItem =:= [] of
		true ->skip;
		false->lib_mail_api:fast_send_mail(PlayerId, ?MAP_UNRECEIVED_AWARD, [],
			lib_item_api:conf_item_list_to_pack_item_list(UnreceivedItem), ?ADD_MERITORIOUS_RANK)
	end,
	OldStage = Meritorious_award#meritorious.stage,
	Stage = case Meritorious_award#meritorious.meritorious >= maps:get(start_meritorious, tb_meritorious_circulation_award:get(lib_meritorious_award:get_sum(PlayerId)))  of
				true -> case maps:get(value, tb_meritorious_award_const:get(max_stage)) =:= OldStage of
							true -> OldStage;
							false-> OldStage + 1
						end;
				false -> OldStage
			end,
	update_player_meritorious(PlayerId,(get_player_meritorious(PlayerId))#meritorious{
		meritorious = 0,stage = Stage,tick = 0,award_info = maps:new(),get_circulation_award = 0,circulation_award = 0
	}),
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true ->  mod_server:async_apply(Pid,fun lib_meritorious_award:meritorious_to_proto/1,[0])
	end.

reset_rank() ->
	Gather = get_meritorious_rank_gather(),
	put_meritorious_rank_gather(Gather#meritorious_rank_gather{
		rank_map = maps:new()
	})
.

update_kill_add(PlayerId, KillAdd) ->
	Meritorious = get_player_meritorious(PlayerId),
	update_player_meritorious(PlayerId,Meritorious#meritorious{kill_add = KillAdd})
.
update_damage_add(PlayerId, DamageAdd) ->
	Meritorious = get_player_meritorious(PlayerId),
	update_player_meritorious(PlayerId,Meritorious#meritorious{damage_add = DamageAdd})
.

%%================================%%

%% 命令加战功
test_get_meritorious(Meritorious) ->
	mod_server:async_apply(mod_meritorious_rank:get_pid(), fun add_meritorious/2, [lib_player:player_id(),Meritorious])

.