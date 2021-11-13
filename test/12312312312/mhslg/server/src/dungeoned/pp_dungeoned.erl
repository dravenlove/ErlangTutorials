%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 18:17
%%%-------------------------------------------------------------------
-module(pp_dungeoned).

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_DUNGEONED_FIGHT, _, Msg)->
	lib_player_dungeoned:request_fight(Msg);

handle(?MSG_CLIENT_DUNGEONED_REWARD, _, _)->
	lib_player_dungeoned:request_reward();

handle(?MSG_CLIENT_DUNGEONED_BUY_TIMES, _, _)->
	lib_player_dungeoned:request_buy_times();

handle(?MSG_CLIENT_DUNGEONED_RANK_LIST, _, _)->
	lib_player_dungeoned:request_rank_list();

handle(_,_,_)->
	throw({error, -1}).
