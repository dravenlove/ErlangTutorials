%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 5月 2021 15:41
%%%-------------------------------------------------------------------
-module(mod_season).
-author("13661").

-include("base.hrl").
-include("mongodb.hrl").
-include("season.hrl").

%% API
-export([start_link/1, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

start_link(LoopMap) ->
    mod_server:start_link({local, ?MODULE}, ?MODULE, [LoopMap], []).

stop() ->
    mod_server:sync_stop(?MODULE).

do_init([LoopMap]) ->
    erlang:put(?SEASON_LOOP_MAP, LoopMap),
    erlang:process_flag(trap_exit, true),

    CurTick = lib_timer:unixtime(),
    NextFiveTick = lib_timer:next_refresh_tick(CurTick),
    erlang:send_after((NextFiveTick - CurTick) * 1000, self(), five_timer),

    lib_season:init_refresh_season(CurTick),
    

    {ok, undefined}.

do_db_init(State, _Args) ->

    {noreply, State}.

do_call(_Info, _From, State) ->
    {reply, State, State}.

do_cast(_Info, State) ->
    {noreply, State}.

do_info(five_timer, State) ->
    CurTick = lib_timer:unixtime(),
    NextFiveTick = lib_timer:next_refresh_tick(CurTick),
    erlang:send_after((NextFiveTick - CurTick) * 1000, self(), five_timer),

    lib_season:five_refresh_season(),

    {noreply, State}
;
% do_info(back_refresh_season, State) ->
%     erlang:send_after(lib_timer:minute_second() * 1000, self(), back_refresh_season),

%     {CurSeason, _} = lib_season_api:season_info(),
%     QueryBson = #{
%         ?BSONSET_BSON(season, #{
%             ?BSONSET_INT(<<"$gte">>, CurSeason)
%         })
%     },
%     mongo_poolboy:async_find(?MMO_POOL, ?DBPLAYER_RANK, QueryBson, 0, 0, self(), fun lib_season:world_back_refresh_season/1, []),
%     {noreply, State};
do_info(_Info, State) ->
    {noreply, State}.

do_terminate(_Reason, _State) ->
    ok.

do_code_change(_Mod, State) ->
    mod_server:put_callback_mod(?MODULE),
    {ok, State}.