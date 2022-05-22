%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 26. Aug 2021 8:28 PM
%%%-------------------------------------------------------------------
-module(mod_block).
-author("lichaoyu").
-include("map.hrl").
-include("troop.hrl").
-include("combat_queue.hrl").

%% API
-export([start_link/1, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([

]).

-define(FRAME,		500).	%% 多久计算一次行军
-define(MARCH_FRAME2,	4).
-define(FIGHT_DISTANCE,	20).

start_link(Block) ->
	ProcessName = lib_block:process_name(Block#block.id),
	mod_server:start_link({local, ProcessName}, ?MODULE, Block, [])
.

stop() ->
	mod_server:sync_stop(?MODULE)
.

do_init(Block) ->
	{ok, Block}
.

do_db_init(State, _Args) ->
	%% todo 数据库获取玩家部队信息
	erlang:send_after(1, self(), frame),
	{noreply, State}
.

do_call(_Info, _From, State) ->
	{reply, State, State}
.

do_cast({?PLAYER_DEL_VIEW, Pid}, State) ->
	PidViewSet = State#block.pid_view_set,
	NewPidViewSet = sets:del_element(Pid, PidViewSet),
	NewState = State#block{pid_view_set = NewPidViewSet},
	{noreply, NewState}
;
do_cast({?PLAYER_ADD_VIEW, Pid}, State) ->
	PidViewSet = State#block.pid_view_set,
	mod_server:async_apply(Pid, fun lib_player_block:notice_troop_info/1, [State#block.troop_map]),
	NewPidViewSet = sets:add_element(Pid, PidViewSet),
	NewState = State#block{pid_view_set = NewPidViewSet},
	{noreply, NewState}
;
do_cast({troop_march, Troop}, State) ->
	TroopMap = State#block.troop_map,
	CombatHero = Troop#troop.combat_hero,
	TroopId = ?TROOP_ID(CombatHero#combat_hero.id, CombatHero#combat_hero.hero_id),
	PosList = Troop#troop.pos_list,
	NewTroop =
		case maps:find(TroopId, TroopMap) of
			error ->
				case Troop#troop.state of
					?TROOP_CITY ->
						[Pos | PosList0] = PosList,
						%% todo 出生点判断
						Troop#troop{state = ?TROOP_MOVE, x = Pos#'ProtoPos'.x, y = Pos#'ProtoPos'.y, pos_list = PosList0};
					_ -> Troop
				end;
			{ok, OldTroop} ->
				OldTroop#troop{state = ?TROOP_MOVE, pos_list = PosList}
		end,
	PidList = sets:to_list(State#block.pid_view_set),
	notice_player(NewTroop, PidList),
	Pid = mod_city:pid(),
	mod_server:cast(Pid, {update_troop, NewTroop}),
	MoveTroop = State#block.move_troop,
	NewMoveTroop = case lists:member(TroopId, MoveTroop) of true -> MoveTroop; false -> [TroopId | MoveTroop] end,
	NewTroopMap = maps:put(TroopId, NewTroop, TroopMap),
	NewState = State#block{
		move_troop = NewMoveTroop,
		troop_map = NewTroopMap
	},
	{noreply, NewState}
;
do_cast(_Info, State) ->
	{noreply, State}
.

do_info(frame, State) ->
	erlang:send_after(?FRAME, self(), frame),
	NewState =
		case State#block.move_troop of
			[] -> State;
			MoveTroop ->
				Pid = mod_city:pid(),
				BlockX = State#block.x,	%% 验证能否能走
				BlockY = State#block.y,	%% 验证能否能走
				TroopMap = State#block.troop_map,
				PosTuple = State#block.pos_tuple,	%% 验证能否能走
				PidList = sets:to_list(State#block.pid_view_set),
				{NewMoveTroop, NewTroopMap} = lists:foldl(
					fun(TroopId, {MoveTroop0, TroopMap0}) ->
						Troop = maps:get(TroopId, TroopMap0),
						Speed2 = 144 / ?MARCH_FRAME2,
						{NewX, NewY, NewPosList} = calc_pos(Troop#troop.x, Troop#troop.y, Speed2, Troop#troop.pos_list),
						try element(trunc(NewX - BlockX), element(trunc(abs(NewY) - BlockY), PosTuple)) of
							?CANT_GO ->
								NewTroop = Troop#troop{state = ?TROOP_STOP},
								mod_server:cast(Pid, {update_troop, NewTroop}),
								notice_player(NewTroop, PidList),
								{MoveTroop0, maps:put(TroopId, NewTroop, TroopMap0)};
							_ ->
								NewTroop0 = Troop#troop{x = NewX, y = NewY, pos_list = NewPosList},
								if
									NewPosList =:= [] ->
										NewTroop = NewTroop0#troop{state = ?TROOP_STOP},
										mod_server:cast(Pid, {update_troop, NewTroop}),
										notice_player(NewTroop, PidList),
										{MoveTroop0, maps:put(TroopId, NewTroop, TroopMap0)};
									true ->
										mod_server:cast(Pid, {update_troop, NewTroop0}),
										{[TroopId | MoveTroop0], maps:put(TroopId, NewTroop0, TroopMap0)}
								end
						catch
							_:_  ->
								BlockId = ?BLOCK_ID(NewX, NewY),
								case lib_block:pid(BlockId) of
									undefined ->
										NewTroop = Troop#troop{state = ?TROOP_STOP},
										mod_server:cast(Pid, {update_troop, NewTroop}),
										notice_player(NewTroop, PidList),
										{MoveTroop0, maps:put(TroopId, NewTroop, TroopMap0)};
									BlockPId ->
										NewTroop0 = Troop#troop{x = NewX, y = NewY, pos_list = NewPosList},
										mod_server:cast(BlockPId, {troop_march, NewTroop0#troop{city_id = BlockId}}),
										{MoveTroop0, maps:remove(TroopId, TroopMap0)}
								end
						end



%%						if
%%							BlockId =/= Id ->
%%								case lib_block:pid(BlockId) of
%%									undefined ->
%%										mod_server:cast(Pid, {delete_troop, Troop}),
%%										notice_player(TroopId, PidList);
%%									BlockPId ->
%%										mod_server:cast(BlockPId, {troop_march, NewTroop0#troop{city_id = BlockId}})
%%								end,
%%								{MoveTroop0, maps:remove(TroopId, TroopMap0)};
%%							NewPosList =:= [] ->
%%								NewTroop = NewTroop0#troop{state = ?TROOP_STOP},
%%								mod_server:cast(Pid, {update_troop, NewTroop}),
%%								notice_player(NewTroop, PidList),
%%								{MoveTroop0, maps:put(TroopId, NewTroop, TroopMap0)};
%%							true ->
%%								mod_server:cast(Pid, {update_troop, NewTroop0}),
%%								{[TroopId | MoveTroop0], maps:put(TroopId, NewTroop0, TroopMap0)}
%%						end
					end, {[], TroopMap}, MoveTroop),
				State#block{move_troop = NewMoveTroop, troop_map = NewTroopMap}
		end,
	{noreply, NewState}
;
do_info(_Info, State) ->
	{noreply, State}
.

do_terminate(_Reason, _State) ->
	ok
.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}
.

notice_player(TroopId, PidList) when is_integer(TroopId) ->
	PlayerId = ?PLAYER_ID(TroopId),
	PlayerPid = lib_player:get_pid(PlayerId),
	mod_server:async_apply(PlayerPid, fun lib_player_troop:notice_troop/2, [1, ?HERO_ID(TroopId)]),
	[mod_server:async_apply(Pid, fun lib_player_block:notice_troop_vanish/1, [TroopId]) || Pid <- PidList]
;
notice_player(Troop, PidList) ->
	PlayerId = Troop#troop.combat_hero#combat_hero.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	mod_server:async_apply(PlayerPid, fun lib_player_troop:notice_troop/2, [0, [Troop]]),
	[mod_server:async_apply(Pid, fun lib_player_block:notice_troop_info/1, [Troop]) || Pid <- PidList]
.

calc_pos(X, Y, Speed2, [Pos | PosList0] = PosList) ->
	NextX = Pos#'ProtoPos'.x,
	NextY = Pos#'ProtoPos'.y,
	YLength = NextY - Y,
	XLength = NextX - X,
	YLength2 = YLength * YLength,
	XLength2 = XLength * XLength,
	Hypotenuse2 = YLength2 + XLength2,
	Surplus2 = Speed2 - Hypotenuse2,
	case Surplus2 > 0 of
		true -> calc_pos(NextX, NextY, Surplus2, PosList0);
		false ->
			Ratio = math:sqrt(Speed2 / Hypotenuse2),
			YArrive = Ratio * YLength + Y,
			XArrive = Ratio * XLength + X,
			{XArrive, YArrive, PosList}
	end
;
calc_pos(X, Y, _Speed, []) ->
	{X, Y, []}
.

