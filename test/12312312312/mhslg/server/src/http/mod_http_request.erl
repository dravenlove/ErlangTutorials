%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_http_request
%%% Created on : 2020/9/28 18:46
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_http_request).
-behaviour(mod_server).
-author("glendy").
-include("common.hrl").

-record(http_state, {}).

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0
]).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:stop(get_pid()).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	{ok, #http_state{}}.

do_db_init(State, _Args) ->
	inets:start(),
	ssl:start(),
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.
