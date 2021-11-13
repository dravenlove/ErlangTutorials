%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 18:17
%%%-------------------------------------------------------------------
-module(pp_function_open).
-author("13661").

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_OPEN_FUNCTION_LIST, _, _Msg)->
	lib_function_open:request_open_function_list()
;

handle(_,_,_)->
	throw({error, -1})
.
