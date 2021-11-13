%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 十一月 2020 10:19
%%%-------------------------------------------------------------------
-module(pp_chapter).
-author("13661").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_CHAPTER_TOP_INFO, _, _Msg) ->
	lib_player_chapter:request_top_info();
handle(?MSG_CLIENT_CHAPTER_INFO, _, Msg) ->
	lib_player_chapter:request_chapter_info(Msg);
handle(?MSG_CLIENT_CHAPTER_CHALLENGE, _, Msg) ->
	lib_player_chapter:request_challenge(Msg);
handle(?MSG_CLIENT_CHAPTER_BUY_TIMES, _, _Msg) ->
	lib_player_chapter:request_buy_times();
handle(?MSG_CLIENT_CHAPTER_RECEIVED, _, Msg) ->
	lib_player_chapter:request_receive_star_reward(Msg);
handle(?MSG_CLIENT_CHAPTER_SWEEP, _, Msg) ->
	lib_player_chapter:request_sweep(Msg);
handle(?MSG_CLIENT_CHAPTER_ALL_INFO, _, _Msg) ->
	lib_player_chapter:request_all_info();
handle(?MSG_CLIENT_CHAPTER_HERO_INFO, _, Msg) ->
	lib_player_chapter:request_hero_info(Msg);


handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

