%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_move
%%% Created on : 2020/8/5 0005 16:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_move).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").
-include("player.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_LOAD_FINISH, #player_state{sid = Sid} = _State, _) ->
	lib_send:respond_to_client_by_sid(Sid, ?MSG_RETURN_LOAD_FINISH),
	lib_player:client_load_complete(Sid);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
