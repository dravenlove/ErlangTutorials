%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 2月 2021 11:00
%%%-------------------------------------------------------------------

-module(pp_meritorious_award).
-author("df").
-include("common.hrl").

-export([
	handle/3
]).


handle(?MSG_CLIENT_MERITORIOUS_AWARD_INFO, _, _) ->
	lib_meritorious_award:request_meritorious_award_info();


handle(?MSG_CLIENT_MERITORIOUS_AWARD_RANK, _, _) ->
	lib_meritorious_award_rank:get_rank();


handle(?MSG_CLIENT_GET_MERITORIOUS_AWARD, _, Msg) ->
	lib_meritorious_award:get_meritorious_award(Msg);


handle(?MSG_CLIENT_GET_ALL_MERITORIOUS_AWARD, _, _) ->
	lib_meritorious_award:get_all_meritorious_award();

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.