%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_mail
%%% Created on : 2020/8/14 0014 17:56
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_mail).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_MAIL_LIST, _, _Msg) ->
	lib_player_mail:request_mail_list();
handle(?MSG_CLIENT_SINGLE_MAIL, _, Msg) ->
	lib_player_mail:request_single_mail(Msg);
handle(?MSG_CLIENT_PICK_MAIL, _, Msg) ->
	lib_player_mail:request_pick_mail(Msg);
handle(?MSG_CLIENT_DEL_MAIL, _, Msg) ->
	lib_player_mail:request_del_mail(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
