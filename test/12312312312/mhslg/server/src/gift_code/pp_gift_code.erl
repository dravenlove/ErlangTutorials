%%%-------------------------------------------------------------------
%%% @author cjt
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. Aug 2021 3:15 PM
%%%-------------------------------------------------------------------
-module(pp_gift_code).
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_GIFT_CODE, _, Msg) ->
  lib_gift_code:request_gift_code(Msg).
