%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_season_activity
%%% Created on : 2021/7/12 17:53
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_season_activity).
-author("leever").
-include("common.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_SEASON_ACTIVITY, _, _Msg) ->
	lib_player_season_activity:season_activity_info();
handle(?MSG_CLIENT_SPRING, _, _Msg) ->
	lib_player_season_activity:spring_info();
handle(?MSG_CLIENT_SUMMER, _, _Msg) ->
	lib_player_season_activity:summer_info();
handle(?MSG_CLIENT_AUTUMN, _, _Msg) ->
	lib_player_season_activity:autumn_info();
handle(?MSG_CLIENT_WINTER, _, Msg) ->
	lib_player_season_activity:winter_info(Msg);

handle(?MSG_CLIENT_SPRING_FORWARD, _, Msg) ->
	lib_player_season_activity:spring_forward(Msg);
handle(?MSG_CLIENT_SPRING_ONE_AWARD, _, Msg) ->
	lib_player_season_activity:spring_one_award(Msg);
handle(?MSG_CLIENT_SPRING_FINAL_AWARD, _, _Msg) ->
	lib_player_season_activity:spring_final_award();

handle(?MSG_CLIENT_SUMMER_CAMPFIRE_AWARD, _, Msg) ->
	lib_player_season_activity:summer_campfire_award(Msg);
handle(?MSG_CLIENT_SUMMER_RECHARGE_CAMPFIRE, _, Msg) ->
	lib_player_season_activity:summer_recharge_campfire(Msg);

handle(?MSG_CLIENT_AUTUMN_FORWARD, _, Msg) ->
	lib_player_season_activity:autumn_forward(Msg);
handle(?MSG_CLIENT_AUTUMN_FIGHT, _, _Msg) ->
	lib_player_season_activity:autumn_fight();
handle(?MSG_CLIENT_AUTUMN_ONE_AWARD, _, Msg) ->
	lib_player_season_activity:autumn_one_award(Msg);
handle(?MSG_CLIENT_AUTUMN_FINAL_AWARD, _, _Msg) ->
	lib_player_season_activity:autumn_final_award();

handle(?MSG_CLIENT_WINTER_RANK, _, Msg) ->
	lib_player_season_activity:winter_rank(Msg);
handle(?MSG_CLIENT_WINTER_FINAL_RANK, _, _Msg) ->
	lib_player_season_activity:winter_final_rank();


handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.