%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_chat
%%% Created on : 2020/8/6 0006 14:32
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_chat).
-behavior(mod_server).
-author("glendy").
-include("log.hrl").
-include("chat.hrl").
-include("common.hrl").
-include("map.hrl").

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0,
	get_info/0,
	put_info/1
]).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(180 * 1000, self(), voice_timeout),
	erlang:send_after(1 * 1000, self(), one_min),
	erlang:send_after(lib_timer:next_zero_time() * 1000, self(), private_history_timeout),
	erlang:send_after(lib_timer:next_min_time() * 1000, self(), count_online_timer),
	%% 注意，不能在此处调用server_sup的start_child接口
	{ok, #chat_state{}}.

do_db_init(State, _Args) ->
%%	WorldRegName = mod_channel:get_channel_process_name(?CHANNEL_WORLD, 0),
	mod_channel:start(?CHANNEL_WORLD, 0),
	mod_channel:start(?CHANNEL_SYSTEM, 0),
	mod_channel:start(?CHANNEL_CLUSTER, 0),
	lists:foldl(fun(Val,_Acc) ->
		mod_channel:start(?CHANNEL_COUNTRY, Val),
		mod_channel:start(?CHANNEL_GOVERNOR, Val)
		end,[],lib_map_api:player_country()),
%%	server_sup:start_child(WorldRegName, mod_channel, start_link, [?CHANNEL_WORLD, 0], transient),
	{noreply, State}.
do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(voice_timeout, State) ->
	erlang:send_after(180 * 1000, self(), voice_timeout),
	NewState = lib_chat:remove_chat_voice_expire(State),
	{noreply, NewState};
do_info(private_history_timeout, State) ->
	erlang:send_after(lib_timer:next_zero_time() * 1000, self(), private_history_timeout),
	NewState = lib_chat_history:remove_private_history_expire(State),
	{noreply, NewState};
do_info(count_online_timer, State) ->
	erlang:send_after(lib_timer:next_min_time() * 1000, self(), count_online_timer),
	lib_chat:serial_online_users(State),
	{noreply, State};
do_info(one_min, State) ->
	erlang:send_after(lib_timer:next_min_time() * 1000, self(), one_min),
	put_info(State),
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	mod_channel:stop(?CHANNEL_WORLD, 0),
	mod_channel:stop(?CHANNEL_SYSTEM, 0),
	mod_channel:stop(?CHANNEL_CLUSTER, 0),
	lists:foldl(fun(Val,_Acc) ->
		mod_channel:stop(?CHANNEL_COUNTRY, Val),
		mod_channel:stop(?CHANNEL_GOVERNOR, Val)
							end,[],lib_map_api:player_country()),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.


get_info() ->
	erlang:get(?MODULE).
put_info(Info) ->
	erlang:put(?MODULE, Info).

