%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 16:22
%%%-------------------------------------------------------------------
-module(lib_dragon_palace_adventure_api).
-author("df").


-include("common.hrl").
-include("dragon_palace_adventure.hrl").
-include("ProtoClient_10140.hrl").

%% API
-export([
	async_apply/2,
	sync_apply/2
]).
-export([
	get_player_dragon_palace_adventure/1,   	%% 获得玩家龙殿探险信息
	update_player_dragon_palace_adventure/1, 	%% 更改玩家龙殿探险信息
	get_dragon_palace_id_list/0,				%% 获得龙殿id列表
	get_dragon_palace_info/2,					%% 根据龙殿id获取信息
	update_dragon_palace_info/2,				%% 更改龙殿信息
	save_fight_info/3,							%% 储存战斗结果
	delete_fight_info/3,						%% 删除战斗结果
	add_be_rob_time/2,							%% 增加被掠夺的次数
	get_be_rob_time/2,							%% 获得被掠夺次数
	add_rob_time/1,								%% 增加掠夺次数
	reset_player_dragon_palace_adventure/0,		%% 重置玩家龙殿探险信息
	all_adventure_player/0,						%% 判断玩家是否探险完成
	add_adventure_info/2,						%% 增加探险信息
	delete_adventure_info/2,					%% 删除探险信息
	reset_rob_player/1,							%% 重置指定掠夺对象
	revenge_success_add_info/3					%% 复仇成功增加标识
]).
-export([
	reset_system_refresh/1, 						%% 通用时间刷新
	reset_info/0,									%% 执行刷新
	world_trend_change/2							%% 天下大势改变处理
	%% todo 天下大势改变时,正在进行探险的龙殿进行处理
]).
%% 异步调用
async_apply(Fun,Parameters) ->
	mod_server:async_apply(mod_expedition:get_pid(),Fun, Parameters)
.

%% 同步调用
sync_apply(Fun,Parameters) ->
	mod_server:sync_apply(mod_expedition:get_pid(),Fun, Parameters)
.

get_player_dragon_palace_adventure(PlayerId) ->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	maps:get(PlayerId, Gather#dragon_palace_adventure_gather.dragon_palace_adventure_map, #dragon_palace_adventure{player_id = PlayerId})

.

update_player_dragon_palace_adventure(Dragon_palace_adventure) when is_record(Dragon_palace_adventure, dragon_palace_adventure)->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Map = Gather#dragon_palace_adventure_gather.dragon_palace_adventure_map,
	NewMap = maps:put(Dragon_palace_adventure#dragon_palace_adventure.player_id, Dragon_palace_adventure, Map),
	lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{dragon_palace_adventure_map = NewMap})
.

get_dragon_palace_id_list() ->
	[?FOREST_DRAGON_PALACE,?LAVA_DRAGON_PALACE,?CRYSTAL_DRAGON_PALACE]
.

get_dragon_palace_info(PlayerId,Type) ->
	Dict = get_player_dragon_palace_adventure(PlayerId),
	?DICT_FETCH(Type,Dict#dragon_palace_adventure.adventure_info,#adventure{type = Type})
.

update_dragon_palace_info(PlayerId,Dragon_palace_info) when is_record(Dragon_palace_info,adventure) ->
	Dict = get_player_dragon_palace_adventure(PlayerId),
	New_dict = dict:store(Dragon_palace_info#adventure.type,Dragon_palace_info,Dict#dragon_palace_adventure.adventure_info),
	update_player_dragon_palace_adventure(Dict#dragon_palace_adventure{adventure_info = New_dict})
.

save_fight_info(PlayerId,Type,Rob_info)when is_record(Rob_info, rob) ->
	Dragon_palace_adventure = get_player_dragon_palace_adventure(PlayerId),
	case Type of
		?ROB 	->save_rob_info(Dragon_palace_adventure,Rob_info);
		?BE_ROB ->save_be_rob_info(Dragon_palace_adventure,Rob_info)
	end
.

save_rob_info(Dragon_palace_adventure,Rob_info)when is_record(Rob_info,rob) ->
	New_dict = dict:store(Rob_info#rob.combat_id,Rob_info,Dragon_palace_adventure#dragon_palace_adventure.rob_info),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{rob_info = New_dict})
.
save_be_rob_info(Dragon_palace_adventure,Rob_info)when is_record(Rob_info,rob) ->
	New_dict = dict:store(Rob_info#rob.combat_id,Rob_info,Dragon_palace_adventure#dragon_palace_adventure.be_rob_info),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{be_rob_info = New_dict})
.

delete_fight_info(PlayerId,Type,Combat_id) ->
	Dragon_palace_adventure = get_player_dragon_palace_adventure(PlayerId),
	case Type of
		?ROB 	->delete_rob_info(Dragon_palace_adventure,Combat_id);
		?BE_ROB ->delete_be_rob_info(Dragon_palace_adventure,Combat_id)
	end,
	db_fight:delete_fight_record(Combat_id)
.

delete_rob_info(Dragon_palace_adventure,Combat_id) ->
	New_dict = dict:erase(Combat_id,Dragon_palace_adventure#dragon_palace_adventure.rob_info),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{rob_info = New_dict})
.
delete_be_rob_info(Dragon_palace_adventure,Combat_id) ->
	New_dict = dict:erase(Combat_id,Dragon_palace_adventure#dragon_palace_adventure.be_rob_info),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{be_rob_info = New_dict})
.

add_be_rob_time(PlayerId,Type) ->
	Dict = get_player_dragon_palace_adventure(PlayerId),
	Be_robs = ?DICT_FETCH(Type,Dict#dragon_palace_adventure.be_robs,#be_rob{type = Type}),
	New_Be_rob = Be_robs#be_rob{time = Be_robs#be_rob.time + 1},
	update_player_dragon_palace_adventure(Dict#dragon_palace_adventure{be_robs = dict:store(Type,New_Be_rob,Dict#dragon_palace_adventure.be_robs)})
.

get_be_rob_time(PlayerId,Type) ->
	Dict = get_player_dragon_palace_adventure(PlayerId),
	Be_robs = ?DICT_FETCH(Type,Dict#dragon_palace_adventure.be_robs,#be_rob{type = Type}),
	Be_robs#be_rob.time
.

add_rob_time(Player_id) ->
	Dragon_palace_adventure = get_player_dragon_palace_adventure(Player_id),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{
		rob_time = Dragon_palace_adventure#dragon_palace_adventure.rob_time + 1})
.

reset_rob_player(Player_id) ->
	Dragon_palace_adventure = get_player_dragon_palace_adventure(Player_id),
	update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{rob_player_id = 0})
.

revenge_success_add_info(PlayerId,Is_revenge,IsWin) ->
	case IsWin andalso (Is_revenge =/= 0) of
		true -> Dragon_palace_adventure = get_player_dragon_palace_adventure(PlayerId),
				Rob_info = dict:fetch(Is_revenge,Dragon_palace_adventure#dragon_palace_adventure.rob_info),
				New_dict = dict:store(Rob_info#rob.combat_id,Rob_info#rob{is_revenge_success = 1},Dragon_palace_adventure#dragon_palace_adventure.rob_info),
				update_player_dragon_palace_adventure(Dragon_palace_adventure#dragon_palace_adventure{rob_info = New_dict});
		false -> ?INFO("复仇失败")
	end
.

reset_player_dragon_palace_adventure() ->
	?DEBUG("刷新玩家信息"),
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Player_list = maps:keys(Gather#dragon_palace_adventure_gather.dragon_palace_adventure_map),
	New_Map =
	lists:foldr(fun(PlayerId,Map)->
		Info = get_player_dragon_palace_adventure(PlayerId),
		maps:put(PlayerId,Info#dragon_palace_adventure{
			rob_time = 0, be_robs = dict:new(), astrology_id = 0,
			free_astrology_time = 0, rob_player_id = 0
		},Map)
	end,maps:new(),Player_list),
	lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{dragon_palace_adventure_map = New_Map})
.


all_adventure_player() ->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Map = Gather#dragon_palace_adventure_gather.adventure_info_map,
	Key_list = maps:keys(Map),
%%	?DEBUG("Key_list ~p",[Key_list]),
	case Key_list =:= [] of
		true ->skip;
		false->
			lists:foreach(fun(Key)->
				#adventure_info{id = PlayerId,type = Type} = maps:get(Key,Map),
				player_is_adventure_finish(PlayerId,Type)
			end,Key_list)
	end
.

player_is_adventure_finish(PlayerId,Type) ->
	Dict = get_dragon_palace_info(PlayerId,Type),
	AdventureTime = maps:get(timevalue, tb_dragon_palace_const:get(treasure_time)),
	case lib_timer:unixtime() >= (AdventureTime + Dict#adventure.start_tick) of
		true ->	?DEBUG("玩家:~p ,探险完成",[PlayerId]),
			update_dragon_palace_info(PlayerId,Dict#adventure{expedition_state = 2}),
				delete_adventure_info(PlayerId,Type),
			   inform_client(PlayerId,Type);
		false-> skip
	end
.

inform_client(PlayerId,Type) ->
	Player_pid = lib_player:get_pid(PlayerId),
	Dict = get_dragon_palace_info(PlayerId,Type),
	case Player_pid =:= undefined of
		true -> skip;
		false->
			Is_open = case lib_dragon_palace_adventure:judge_dragon_palace_is_open(Type) of
						  true -> 1;
						  false-> 0
					  end,
			Award = lib_dragon_palace_adventure:item_add(Dict#adventure.dragon_gem,Dict#adventure.item),
			Respond = #'Proto80140009'{info = #'ProtoDragonPalace'{
				type =  Dict#adventure.type, expedition_state = Dict#adventure.expedition_state,
				is_open = Is_open, time = 0, is_can_rob = 0, hero_list = lib_dragon_palace_adventure:hero_info_to_proto(Dict#adventure.hero_list),
				item_list = lib_dragon_palace_adventure:item_to_proto(Award) }},
			lib_send:respond_to_client_by_pid(Player_pid, Respond),
			?DEBUG("is_adventure_finish_ok ~p",[Respond])
	end
.

add_adventure_info(PlayerId,Type) ->
	?DEBUG("增加探险信息"),
	Key = PlayerId * 10 + Type,
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Map = Gather#dragon_palace_adventure_gather.adventure_info_map,
	New_map = maps:put(Key,#adventure_info{key = Key,id = PlayerId,type = Type},Map),
	lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{
		adventure_info_map = New_map
	})
.

delete_adventure_info(PlayerId,Type) ->
	Key = PlayerId * 10 + Type,
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Map = Gather#dragon_palace_adventure_gather.adventure_info_map,
	New_map = maps:remove(Key,Map),
	lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{
		adventure_info_map = New_map
	})
.

reset_system_refresh(CurTick) ->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	Last_reset_tick = Gather#dragon_palace_adventure_gather.system_refresh_tick,
	Refresh_time = maps:get(timevalue, tb_const:get(refresh_time)),
	Refresh_tick = lib_timer:current_zero_unixtime(CurTick) + Refresh_time,
	case not lib_timer:is_same_day(Last_reset_tick,CurTick) andalso (CurTick >= Refresh_tick)  of
		true ->
			lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{system_refresh_tick = Refresh_tick}),
			?INFO("mod_expedition reset_system_refresh.~n"),
			reset_info();
		false ->
			skip
	end
.


reset_info()  ->
	RunList = [
		fun reset_player_dragon_palace_adventure/0
	],
	lib_common:try_run(RunList)
.


world_trend_change(Stage,OldStage) ->
	Tick = lib_timer:unixtime(),
	%% 天下大势未到第三阶段
	case OldStage < 3  of
		 true -> skip;
		 false-> case Stage < 3 of
					  true ->dispose_dragon_palace(?LAVA_DRAGON_PALACE,Tick);
					  false-> case Stage < 4 of
								   true ->dispose_dragon_palace(?CRYSTAL_DRAGON_PALACE,Tick);
								   false->skip
						end
				end
	end
.

dispose_dragon_palace(Type,Tick) ->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	List = maps:fold(fun(Map,L) ->
			case Map#adventure_info.type =:= Type of
				 true -> [Map#adventure_info.id|L];
				 false-> L
		end
	end,[],Gather#dragon_palace_adventure_gather.adventure_info_map),
	lists:foreach(fun(PlayerId)->
		Dict = get_dragon_palace_info(PlayerId,Type),
		?DEBUG("天下大势改变,玩家:~p 的龙殿 ~p 提前探险完成",[PlayerId,Type]),
		AdventureTime = maps:get(timevalue, tb_dragon_palace_const:get(treasure_time)),
		Ratio = (Tick - Dict#adventure.start_tick) / AdventureTime,
		[DragonGemId,OldNum] = Dict#adventure.dragon_gem,
		NewDragonGem = [DragonGemId,util:ceil(OldNum * Ratio)],
		NewItem = case  Dict#adventure.item =:= [] of
					   true ->[];
					   false->[Id,Num] = Dict#adventure.item,
						   [Id,util:ceil(Num * Ratio)]
		end,
		update_dragon_palace_info(PlayerId,Dict#adventure{expedition_state = 2,dragon_gem = NewDragonGem,
			item = NewItem}),
		delete_adventure_info(PlayerId,Type),
		inform_client(PlayerId,Type)
	end,List)
.