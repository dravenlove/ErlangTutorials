%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_head_icon).

-include("common.hrl").
-include("player.hrl").
-include("head_icon.hrl").
-include("ProtoClient_10120.hrl").

%% API
-export([
	active_head/1,
	have_head/1,
	use_head/1,
	new_role_init/0,
	process_hero_active/1,
	request_head_icon_list/0,
	request_head_icon_use/1
]).


%% API
-export([
	get_player_head_icon/0,
	put_player_head_icon/1,
	put_player_head_icon/2,
	ets_init/0,
	build_index/0,
	player_head_icon_handler/0
]).

get_player_head_icon() ->
	erlang:get(?ETS_PLAYER_HEAD_ICON).

put_player_head_icon(PlayerHeadIcon) ->
	put_player_head_icon(PlayerHeadIcon, true).
put_player_head_icon(PlayerHeadIcon, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_HEAD_ICON),
	erlang:put(?ETS_PLAYER_HEAD_ICON, PlayerHeadIcon).

ets_init() ->
	ets:new(?ETS_PLAYER_HEAD_ICON, [?ETS_KEY_POS(#player_head_icon.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HEAD_ICON, {?TUPLE_INT(id, 1)}, true).

player_head_icon_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_HEAD_ICON,
		table_name = ?DBPLAYER_HEAD_ICON,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_head_icon:load_player_head_icon/1,
		save_func = fun db_player_head_icon:save_player_head_icon/1,
		get_func = fun get_player_head_icon/0,
		put_func = fun put_player_head_icon/2
	}.

have_head(HeadId) ->
	PlayerrHead = get_player_head_icon(),
	dict:is_key(HeadId, PlayerrHead#player_head_icon.head_dict).

active_head(HeadId) ->
	try
	    ?JUDGE_RETURN(lists:member(HeadId, tb_role_head:get_list()), 0),
	    ?JUDGE_RETURN(have_head(HeadId) =:= false, 0),
	    PlayerHead = get_player_head_icon(),
		HeadDict = dict:store(HeadId, #head_icon{
			head_id = HeadId,
			active_tick = lib_timer:unixtime()
		}, PlayerHead#player_head_icon.head_dict),
	    lib_send:respond_to_client(#'Proto80120003'{head_id = HeadId}),
		put_player_head_icon(PlayerHead#player_head_icon{head_dict = HeadDict})
	catch
	    _:_  -> ok
	end.

use_head(HeadId) ->
	?JUDGE_RETURN(lists:member(HeadId, tb_role_head:get_list()), ?ERROR_CONFIG_NOT_EXISTENT),
	?JUDGE_RETURN(have_head(HeadId) =:= true, ?ERROR_CLIENT_OPERATOR),
	PlayerBase = lib_player:get_player_base(),
	?JUDGE_RETURN(HeadId =/= PlayerBase#player_base.head_icon, ?ERROR_CLIENT_OPERATOR),
	NewPlayerBase = PlayerBase#player_base{head_icon = HeadId},
	lib_player:put_player_base(NewPlayerBase, false),
	lib_player_process:process_player_use_head(NewPlayerBase).


request_head_icon_list() ->
	PlayerHead = get_player_head_icon(),
	Info =
	dict:fold(fun(_, Head, Acc) ->
		[#'ProtoPairLong'{
			key = Head#head_icon.head_id,
			value = Head#head_icon.active_tick
		} | Acc]
	end, [], PlayerHead#player_head_icon.head_dict),
	Respond = #'Proto50120001'{
		info = Info
	},
	lib_send:respond_to_client(Respond).

request_head_icon_use(Msg) ->
	#'Proto10120002'{head_id = HeadId} = Msg,
	use_head(HeadId),
	Respond = #'Proto50120002'{
		head_id = HeadId
	},
	lib_send:respond_to_client(Respond).

new_role_init() ->
	PlayerBase = lib_player:get_player_base(),
	Sex = PlayerBase#player_base.sex,
	Conf = tb_role_sex:get(Sex),
	HeadId = maps:get(head_id, Conf),
	try
	    use_head(HeadId)
	catch
	    _:_  -> ok
	end.

process_hero_active(HeroId) ->
	try
		Conf = tb_hero:get(HeroId),
		HeadId = maps:get(head_id, Conf, 0),
		?JUDGE_RETURN(HeadId > 0, 0),
		active_head(HeadId)
	catch
	    _:_  -> ok
	end.