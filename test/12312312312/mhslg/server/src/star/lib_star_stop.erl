%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 6月 2021 10:55
%%%-------------------------------------------------------------------
-module(lib_star_stop).
-author("df").
-include("common.hrl").
-include("chat.hrl").
-include("player.hrl").
-include("ProtoClient_10151.hrl").
-export([
	get_player_star/0,
	put_player_star/1,
	put_player_star/2,
	player_star_handler/0
]).
%% API
-export([
	reset_everyday/0,
	get_star_stop/0,
	star_astrology/1,
	star_resolve/1
]).

get_player_star() ->
	erlang:get(?ETS_STAR)
.

put_player_star(Player_star) when is_record(Player_star, player_star)  ->
	put_player_star(Player_star,true)
.
put_player_star(Player_star,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_STAR),
	erlang:put(?ETS_STAR, Player_star)
.

ets_init() ->
	ets:new(?ETS_STAR, [?ETS_KEY_POS(#player_star.player_id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PLAYER_STAR, {?TUPLE_INT(id, 1)}, true).

player_star_handler() ->
	#player_handler{
		ets = ?ETS_STAR,
		table_name = ?DBPLAYER_PLAYER_STAR,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_star:load_player_star/1,
		save_func = fun db_star:save_player_star/1,
		get_func = fun get_player_star/0,
		put_func = fun put_player_star/2
	}.

reset_everyday() ->
	?DEBUG("更新玩家星座次数"),
	Player_star = get_player_star(),
	put_player_star(Player_star#player_star{buy_time = lib_star_api:get_const(buy_num,value)})
.

get_star_stop() ->
	Player_star = get_player_star(),
	Respond =
		#'Proto50151001'{
			buy_time = Player_star#player_star.buy_time
		},
	lib_send:respond_to_client(Respond),
	?DEBUG("get_star_stop: ~p ~n",[Respond])
.
star_astrology(Msg) ->
	#'Proto10151002'{time = Time} = Msg,
	#player_star{buy_time = Buy_time} = Player_star = get_player_star(),
	?JUDGE_RETURN(Buy_time >= Time,0),
	%% 消耗
	[UseItem,Mum] = maps:get(jsonvalue, tb_star_const:get(buy_money)),
	Use = lib_item_api:conf_item_to_pack_item([UseItem,Mum * Time]),
	Ret = lib_player_pack:validate_remove(Use),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Use, ?REMOVE_SERIAL(?USE_STAR_STOP_ASTROLOGY, Time)),
	%% 获取
	AllItem = get_item(Time),
	Item_list = lib_item_api:merge_conf_item_list(AllItem),
	Item = lib_item_api:conf_item_list_to_item_obj_list(Item_list),
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_STAR_STOP_ASTROLOGY, 1),true, 1),
	put_player_star(Player_star#player_star{buy_time = Buy_time - Time}),
	broadCase(AllItem),
	Respond =
		#'Proto50151002'{
			buy_time = Buy_time - Time
		},
	lib_player_process:process_divination(Time),
	lib_send:respond_to_client(Respond),
	?DEBUG("star_astrology: ~p ~n",[Respond])
.


star_resolve(Msg) ->
	#'Proto10151003'{item_list = ID_list} = Msg,
	?JUDGE_RETURN(is_can_delete(ID_list),?INFO("物品被镶嵌，不能分解 或 道具不存在")),
	%% 获得
	GetItem = resolve_item(ID_list),
	Get_Item_list = lib_item_api:merge_conf_item_list(GetItem),
	Item = lib_item_api:conf_item_list_to_item_obj_list(Get_Item_list),
	%% 消耗
	Item_list = lists:foldl(fun(UniqueId,L)-> {_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId), [PackItem|L] end,[],ID_list),
	lib_player_pack:remove_item_unique_id(?PACK_TYPE_TITLE, Item_list, #serial_obj{remove_serial_type = ?USE_STAR_STOP_RESOLVE}),
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_STAR_STOP_RESOLVE, 1),true, 1),
	lib_send:respond_to_client(?MSG_RETURN_STAR_RESOLVE),
	?DEBUG("star_resolve ~n")
.



get_item(Time) ->
	Season = lib_season_and_days_api:get_season(),
	MaxSeason = maps:get(value, tb_star_const:get(last_season)),
	Condition = ?IIF(Season > MaxSeason,MaxSeason,Season),
	KeyList = lists:filter(fun(K)->
		maps:get(season, tb_star_pool:get(K)) =:= Condition
	 end, tb_star_pool:get_list()),
	Sum = lists:foldl(fun(Key,SUM) ->
		maps:get(weight, tb_star_pool:get(Key)) + SUM
	end,0, KeyList),
	lists:foldl(fun(_key,List) ->
		[get_pool_item(Sum,KeyList)|List]
	end,[],lists:seq(1,Time))
.
get_pool_item(Sum,KeyList)->
	Rand = Sum * rand:uniform(),
	pool_item(Rand, KeyList)
.
pool_item(Rand,[Key|List]) ->
	Info = tb_star_pool:get(Key),
	Now = Rand - maps:get(weight,Info),
	case Now =< 0 of
		true -> [maps:get(item_id,Info),maps:get(item_num,Info)];
		false-> pool_item(Now,List)
	end
.

%% 判断是否被镶嵌
is_can_delete([UniqueId|ID_list]) ->
	{Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
	Star_info = PackItem#item.star_info,
	case Star_info#star_info.inlay_info =/= [] orelse  Check =/= true of
		 true -> true;
		 false-> is_can_delete(ID_list)
	end;
is_can_delete([]) ->
	true
.

resolve_item(ID_list) ->
	lists:foldl(fun(UniqueId,List)->
		{_Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
		lists:append(resolve_one(PackItem),List)
	end,[],ID_list)
.

resolve_one(PackItem)->
	Star_info = PackItem#item.star_info,
	SubType = maps:get(sub_type, tb_item:get(PackItem#item.item_id)),
	%% 1-4对应神纹 5-8对应星辰
	case SubType =< 4 of
  		true ->get_experience(Star_info#star_info.experience,lib_star_api:experience_item(),[lib_star_api:get_const(resolve,jsonvalue)]);
		false->get_experience(Star_info#star_info.experience,lib_star_api:special_experience_item(),[lib_star_api:get_const(special_resolve,jsonvalue)])
	end
.
get_experience(Experience,Experience_List,ResolveList)->
	case Experience =:= 0 of
		 true -> ResolveList;
		 false->
			 ItemID = lists:last(Experience_List),
			 Param1 = maps:get(param1, tb_item:get(ItemID)),
			 New_Experience_List = lists:delete(ItemID,Experience_List),
			 Num = Experience div Param1,
			 NewExperience = Experience rem Param1,
			 Item = [ItemID,Num],
			 get_experience(NewExperience,New_Experience_List,[Item|ResolveList])
    end
.
broadCase(ItemList) ->
	List =
	lists:foldl(fun([ID,_Num],L) ->
		Config = tb_item:get(ID),
		case maps:get(sub_type,Config) =< 4 of true -> [ID|L];false -> L end
	end,[],ItemList),
	[star_BroadCase(ItemId)|| ItemId <- List]
.
star_BroadCase(ItemId) ->
	?DEBUG("发送广播  ~p",[ItemId]),
	Show = lib_player:player_show(),
	ShoutMsg0 = lib_broadcast_api:push_broad_arg(lib_broadcast_api:create_broadcast(?STAR_BROAD),?BROAD_TYPE_COUNTRY_ID, Show#player_show.country ),
	ShoutMsg1 = lib_broadcast_api:push_broad_arg(ShoutMsg0,  ?BROAD_TYPE_ROLE_INFO,#'ProtoBroadRole'{role_id = Show#player_show.id,role_name = Show#player_show.name}),
	ShoutMsg = lib_broadcast_api:push_broad_arg(ShoutMsg1,?BROAD_TYPE_STAR, ItemId),
	lib_broadcast_api:send_all_system(ShoutMsg).
