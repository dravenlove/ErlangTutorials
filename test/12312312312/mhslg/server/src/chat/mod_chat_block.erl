%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_chat_block
%%% Created on : 2021/1/22 15:55
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_chat_block).
-author("yc").
-include("common.hrl").
-include("chat_block.hrl").
-include("ProtoClient_10105.hrl").

-define(BLOCK_TIME,60*1000).


%% API
-export([
  start/0,start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2,get_pid/0
]).
-export([
  request_block_one_player/4,
  do_sign_in/1,
  ban_player_id/5,
  do_msg_active_ban/3,
  do_get_state_two/3,
  do_request_block_list/2,
  do_request_ban_list/1,
  get_data/0,
  put_data/1,
  new_player_no_speak_dict/0
]).

start() ->
  mod_server:start({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
  mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
  mod_server:sync_stop(?MODULE).

get_pid() ->
  erlang:whereis(?MODULE).

do_init([]) ->
  erlang:process_flag(trap_exit, true),
  erlang:send_after(?BLOCK_TIME, self(), check_block_timeout),
  {ok, #chat_block{}}.

do_db_init(_State,_Args) ->
  New_state = db_player_chat_limit:load_chat_block(),
  Dict = case New_state#'chat_block'.player_no_speak_dict == dict:new() of
           true -> lists:foldl(fun(CountryId,Acc) ->
             dict:store(CountryId,[],Acc)
             end,dict:new(),lib_map_api:all_country())
         end,
  put_data(New_state#'chat_block'{player_no_speak_dict = Dict}),
  {noreply, New_state}.

do_call(_Info, _From, State) ->
  {reply,ok,State}.

do_cast(_Info, State) ->
  {noreply, State}.

do_info(check_block_timeout, _State) ->
  State = get_data(),
    erlang:send_after(?BLOCK_TIME, self(), check_block_timeout),
  {noreply, State};
do_info(Info, State) ->
  ?INFO("~p recv: ~p", [?MODULE, Info]),
  {noreply, State}.

do_terminate(_Reason, _State) ->
  State = get_data(),
  db_player_chat_limit:save_chat_block(State),
  ok.

do_code_change(_Mod, State) ->
  mod_server:put_callback_mod(?MODULE),
  {ok, State}.

request_block_one_player(_State,State_new,Player_id,My_id) ->
  State = get_data(),
 try
   Dict = State#'chat_block'.player_block,
   List = ?DICT_FETCH(My_id,Dict,[]),
   New_list = case State_new of
                ?BLOCK -> case lists:any(fun(X) -> X == Player_id end,List) of
                            true -> List;
                            _ -> [Player_id|List]
                          end
                ;
                ?NO_BLOCK -> case lists:any(fun(X) -> X == Player_id end,List) of
                               true -> lists:delete(Player_id,List);
                               _ -> List
                             end
              end,
   New_dict = dict:store(My_id,New_list,Dict),
   New_State = State#'chat_block'{player_block = New_dict},
     put_data(New_State),
   {ok,New_State}
 catch
     _:_  -> {error,erlang:get_stacktrace()}
 end
.

do_sign_in(_State) ->
  State = get_data(),
  try
    {ok,State}
  catch
      _:_  -> {error,erlang:get_stacktrace()}
  end
.

ban_player_id(_State,Player_id,State_id,Country_id,My_id) ->
  State = get_data(),
  try
      List =  dict:fetch(Country_id,State#'chat_block'.player_no_speak_dict),
      New_list = case State_id of
                   ?BLOCK -> case lists:any(fun(X) -> X == Player_id end,List) of
                               true -> List;
                               _ -> [Player_id|List]
                             end
                   ;
                   ?NO_BLOCK -> case lists:any(fun(X) -> X == Player_id end,List) of
                                  true -> lists:delete(Player_id,List);
                                  _ -> List
                                end
                 end,
      New_state = State#'chat_block'{player_no_speak_dict = dict:store(Country_id,New_list,State#'chat_block'.player_no_speak_dict)},
        put_data(New_state),
        mod_server:async_apply(lib_player:get_pid(My_id),fun lib_player_chat_block:msg_active_ban/2,[Player_id,State_id]),
      {ok,New_state}
  catch
    throw:{error, _ErrCode} -> ?DEBUG("~p",[erlang:get_stacktrace()])
  end
.

do_msg_active_ban(_State,Player_id,Country_id) ->
  State = get_data(),
  List = dict:fetch(Country_id,State#'chat_block'.player_no_speak_dict),

  Player_state = case lists:any(fun(X) -> X == Player_id end,List) of
                   true -> ?BLOCK;
                   _ -> ?NO_BLOCK
                 end,
  Pid = lib_player:get_pid(Player_id),
  Respond = #'Proto80105011'{state = Player_state},
  lib_send:respond_to_client_by_pid(Pid,Respond),
  {ok,State}
.

do_get_state_two(_State,_Player_id,_Country_id) ->
  State = get_data(),
  Dict = State#'chat_block'.player_no_speak_dict,
  {ok,Dict}
.

do_request_block_list(_State,My_id) ->
  State = get_data(),
  Dict = State#'chat_block'.player_block,
  List = ?DICT_FETCH(My_id,Dict,[]),
  mod_server:async_apply(lib_player:get_pid(My_id),fun lib_player_chat_block:msg_active_block/1,[List]),
  {ok,State}
  .

do_request_ban_list(_State) ->
  State = get_data(),
  {ok,State}
.

get_data() ->
  erlang:get(?MODULE)
.

put_data(Data) when is_record(Data,chat_block) ->
  erlang:put(?MODULE,Data)
.

%%赛季更新
new_player_no_speak_dict() ->
  _State = get_data()

  .

%%update_player_no_speak_dict() ->
%%  List = lib_map_api:

