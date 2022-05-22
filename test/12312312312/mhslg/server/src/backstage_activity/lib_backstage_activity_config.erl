%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 三月 2020 18:22
%%%-------------------------------------------------------------------
-module(lib_backstage_activity_config).
-author("13661").

-include("backstage_activity.hrl").

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
  is_process_recharge/2,
  is_process_consume/2,
  is_process_vip_level_up/2,
  is_process_chapter_win/2
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

is_process_consume(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_vip_level_up(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.

is_process_chapter_win(MainType, _SubType) ->
  case MainType of
    _ -> false
  end
.