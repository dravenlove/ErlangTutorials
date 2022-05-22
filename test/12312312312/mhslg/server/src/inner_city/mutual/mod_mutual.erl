%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_inner_city
%%% Created on : 2021/8/9 20:52
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_mutual).
-author("leever").
-include("common.hrl").
-include("inner_city.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10123.hrl").
-behavior(mod_server).


%% API
-export([start/0, do_init/1,do_db_init/2, do_call/3, do_cast/2, do_info/2, do_terminate/2, do_code_change/2,get_pid/0]).
-export([
	get_mutual/0,
	put_mutual/1,
	auto_mutual/0
]).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], []).

do_init([]) ->
	erlang:send_after(10*1000, self(), mutual_time),
	{ok, {}}.

get_pid() ->
	erlang:whereis(?MODULE).

do_db_init(State, _Args) ->
	mod_mutual:put_mutual(db_mutual:load_mutual()),
	{noreply, State}.

do_call(Info, _From, State) ->
	{reply, Info, State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(mutual_time, State) ->
	erlang:send_after(10 * 1000, self(), mutual_time),
	mod_mutual:auto_mutual(),
	{noreply, State};

do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, State) ->
	db_mutual:save_mutual(),
	?INFO("mod mututal stop"),
	{ok, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

put_mutual(MutualStatus) ->
	erlang:put(?MODULE, MutualStatus).

get_mutual() ->
	erlang:get(?MODULE).

%% 自动助力
auto_mutual() ->
	MutualStatus = mod_mutual:get_mutual(),
	#mutual_status{mutual = MutualList} = MutualStatus,
	NowTick = lib_timer:unixtime(),
	lists:foreach(fun(Mutual) ->
		#mutual{update_tick = UpdateTick,mutual_times = MutualTimes} = Mutual,
		case MutualTimes < ?MUTUAL_TOTAL_TIMES of
			true ->	case (NowTick - UpdateTick) > ?MUTUAL_AUTO_TIME of
						   true -> lib_mutual:do_mutual(Mutual);
						   false -> skip
					   end;
			false -> ?DEBUG("该建筑助力次数已用完，无法助力！~n")
		end
				  end,MutualList).
