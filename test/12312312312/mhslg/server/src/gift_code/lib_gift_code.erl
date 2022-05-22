%%%-------------------------------------------------------------------
%%% @author cjt
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. Aug 2021 3:17 PM
%%%-------------------------------------------------------------------
-module(lib_gift_code).
-include("common.hrl").
-include("player.hrl").
-include("ProtoClient_10153.hrl").

%% API
-export([
  request_gift_code/1,
  process_gift_code_respond/2
]).

request_gift_code(Msg) ->
  #'Proto10153001'{code = Code} = Msg,
  PlayerBase = lib_player:get_player_base(),
  lib_http_api:async_post(config:get_post_url(),
    #{
      func      => gift,
      account   => lib_types:to_binary(PlayerBase#player_base.account),
      role_id   => PlayerBase#player_base.id,
      role_name => lib_types:to_binary(PlayerBase#player_base.name),
      server    => lib_types:to_binary(PlayerBase#player_base.server_flag),
      level     => PlayerBase#player_base.level,
      vip_level => lib_player:player_vip(),
      fighting  => PlayerBase#player_base.force,
      account   => lib_types:to_binary(PlayerBase#player_base.account),
      package   => PlayerBase#player_base.market,
      channel   => lib_types:to_binary(PlayerBase#player_base.agent),
      code      => lib_types:to_binary(Code)
    }, self(), fun process_gift_code_respond/2, []),
  lib_send:respond_to_client(?MSG_RETURN_GIFT_CODE, 0)
.

process_gift_code_respond(RespondBody, _CallBackArgs) ->
  Ret =
    case RespondBody of
      <<"1000">> -> ?ERROR_GIFT_CODE_SUCCESS;
      <<"1001">> -> ?ERROR_GIFT_CODE_INVALID;
      <<"1002">> -> ?ERROR_GIFT_CODE_INVALID;
      <<"1003">> -> ?ERROR_GIFT_CODE_USED;
      <<"1004">> -> ?ERROR_GIFT_CODE_INVALID;
      <<"1005">> -> ?ERROR_GIFT_CODE_ALREADY_USED;
      <<"1006">> -> ?ERROR_GIFT_CODE_INVALID;
      _ ->
        0
    end,
  ?INFO("RespondBody ~w~n", [RespondBody]),
  lib_send:respond_to_client(?MSG_RETURN_GIFT_CODE, Ret)
.
