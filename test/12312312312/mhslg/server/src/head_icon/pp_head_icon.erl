%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 18:17
%%%-------------------------------------------------------------------
-module(pp_head_icon).

-include("msgcode.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_HEAD_ICON_LIST, _, _Msg)->
	lib_head_icon:request_head_icon_list();

handle(?MSG_CLIENT_HEAD_ICON_USE, _, Msg)->
	lib_head_icon:request_head_icon_use(Msg);

handle(_,_,_)->
	throw({error, -1})
.
