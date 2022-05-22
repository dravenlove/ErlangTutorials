%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_backstage_chat_limit
%%% Created on : 2021/1/19 14:48
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_backstage_chat_limit).
-author("yc").
-include("common.hrl").
-include("chat.hrl").

%%-record(chat_limit_state, {}).
-define(MIN,60).

%% API
-export([start/0, start_link/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2,stop/0,get_pid/0]).
-export([do_player_get_chat_setting/3,
  player_get_chat_setting/2]).

start() ->
  mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
  mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
  mod_server:sync_stop(?MODULE).

get_pid() ->
  erlang:whereis(?MODULE).

do_init([]) ->
  ?INFO("mod_cluster_group started: ~p ~n", [self()]),
  {ok, dict:new()}.

do_db_init(State, []) ->
  New_state = update_backstage_chat_limit(State),
  ?DEBUG("is dict  ~p ~n",[New_state]),
  erlang:send_after(1000 * ?MIN, self(), min_timer),
  {noreply, New_state}.

do_call(_Info, _From, State) ->
  {reply,State,State}.

do_cast(_Info, State) ->
  {noreply, State}.

do_info(min_timer, State) ->
  erlang:send_after(1000 * ?MIN, self(), min_timer),
  NewState = update_backstage_chat_limit(State),
  {noreply, NewState};
do_info(_Info, State) ->
  {noreply, State}.

do_terminate(_Reason, _State) ->
  ?INFO("mod_backstage_chat_limit stop~n").


do_code_change(_Mod, State) ->
  mod_server:put_callback_mod(?MODULE),
  {ok, State}.

player_get_chat_setting(PlayerId, AgentCode) ->
  mod_server:async_status(mod_backstage_chat_limit:get_pid(), fun mod_backstage_chat_limit:do_player_get_chat_setting/3 , [PlayerId, AgentCode]).

do_player_get_chat_setting(State,PlayerId, AgentCode) ->
  ChatLimitDict = State,
  ?DEBUG("is dict ~p ~n",[State]),
  ChatLimitRecord  =
    case dict:is_key(AgentCode, ChatLimitDict) of
      true ->
        dict:fetch(AgentCode, ChatLimitDict);
      false ->
        case dict:is_key(-1, ChatLimitDict) of
          true -> dict:fetch(-1, ChatLimitDict);
          false -> #backstage_chat_limit{}
        end
    end,
  lib_player_chat_limit:update_chat_limit_setting(PlayerId, ChatLimitRecord),
  {ok,State}
.



update_backstage_chat_limit(OldChatLimitDict) ->
  ChatLimitDict = db_backstage_chat_limit:load_backstage_chat_limit(),
%%  OldChatLimitDict = get_chat_setting_dict(),
  IsUpdate =
    try
      dict:map(fun(AgentCode, ChatLimitRecord) ->
        ?JUDGE_RETURN(dict:is_key(AgentCode, OldChatLimitDict), true),
        OldChatLimitRecord = dict:fetch(AgentCode, OldChatLimitDict),
        ?JUDGE_RETURN(ChatLimitRecord#backstage_chat_limit.update_tick =/= OldChatLimitRecord#backstage_chat_limit.update_tick, true)
               end, ChatLimitDict),
      false
    catch
      throw : {error, RetFlag} -> RetFlag
    end,
  case IsUpdate of
    true ->
      ChatLimitDict;
    _ ->
      OldChatLimitDict
  end.