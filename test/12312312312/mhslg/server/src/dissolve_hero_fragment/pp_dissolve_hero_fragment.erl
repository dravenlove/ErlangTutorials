%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_dissolve_hero_fragment
%%% Created on : 2021/1/5 11:02
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_dissolve_hero_fragment).
-author("yc").
-include("common.hrl").

%% API
-export([
  handle/3
]).

handle(?MSG_CLIENT_CHANGE_STATE, _, Msg)->
  lib_player_dissolve_hero_fragment:do_change_state(Msg)
;
handle(?MSG_CLIENT_DISSOLVE_HERO_FRAGMENT, _, Msg)->
  lib_player_dissolve_hero_fragment:do_dissolve_fragment(Msg)
;
handle(?MSG_CLIENT_DISSOLVE_HERO_INTERFACE, _, Msg)->
  lib_player_dissolve_hero_fragment:do_interface(Msg)
.


