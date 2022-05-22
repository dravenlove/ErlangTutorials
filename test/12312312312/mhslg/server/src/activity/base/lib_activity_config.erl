%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 六月 2021 17:59
%%%-------------------------------------------------------------------
-module(lib_activity_config).
-author("13661").

-include("activity.hrl").

%% API
-export([
  use_new_activity_assist/2,
  use_login_assist/2
]).
-export([ %%暂不实装
  is_process_sign_in/2,
  is_process_sign_out/2,
  is_process_level_upgrade/2,
  is_process_reset_everyday/2,
  is_process_recharge/2
]).

%%是否使用新活动红点
use_new_activity_assist(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

%%是否使用活动登陆红点
use_login_assist(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

%%以下暂不实装

is_process_sign_in(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_sign_out(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_level_upgrade(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_reset_everyday(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_recharge(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.