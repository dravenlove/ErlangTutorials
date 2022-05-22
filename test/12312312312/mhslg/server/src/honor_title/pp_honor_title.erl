%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 18:17
%%%-------------------------------------------------------------------
-module(pp_honor_title).

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_HONOR_TITLE_PUT_ON, _, Msg)->
	lib_honor_title:request_put_on(Msg);

handle(?MSG_CLIENT_HONOR_TITLE_TAKE_OFF, _, Msg)->
	lib_honor_title:request_take_off(Msg);

handle(_,_,_)->
	throw({error, -1})
.
