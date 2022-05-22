%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 3:31 PM
%%%-------------------------------------------------------------------
-module(lib_pub_recruit).
-author("df").
-include("player.hrl").
-include("ProtoClient_10124.hrl").
-include("common.hrl").
-include("pub_recruit.hrl").
-include("pack.hrl").
-include("serial.hrl").
-include("science.hrl").
-include("inner_city.hrl").
-define(USE_COPPER,0).
-define(USE_MONEY,1).
-define(USE_ITEM,2).
-define(SPECIAL_POOL,hero3).
%% API
-export([
	get_player_pub_recruit/0,
	put_player_pub_recruit/1,
	put_player_pub_recruit/2,
	player_pub_recruit_handler/0,
	request_pub_recruit_info/0,
	request_pub_recruit/1,
	reset_everyday/0
]).

get_player_pub_recruit() ->
	erlang:get(?ETS_PLAYER_PUB_RECRUIT)
.

put_player_pub_recruit(Pub_recruit) when is_record(Pub_recruit, pub_recruit)  ->
	put_player_pub_recruit(Pub_recruit,true)
.
put_player_pub_recruit(Pub_recruit,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_PUB_RECRUIT),
	erlang:put(?ETS_PLAYER_PUB_RECRUIT, Pub_recruit)
.

ets_init() ->
	ets:new(?ETS_PLAYER_PUB_RECRUIT, [?ETS_KEY_POS(#pub_recruit.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PUB_RECRUIT, {?TUPLE_INT(id, 1)}, true).

player_pub_recruit_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_PUB_RECRUIT,
		table_name = ?DBPLAYER_PUB_RECRUIT,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_pub_recruit:load_pub_recruit/1,
		save_func = fun db_pub_recruit:save_pub_recruit/1,
		get_func = fun get_player_pub_recruit/0,
		put_func = fun put_player_pub_recruit/2
	}.


found_item(Now_weight,[Key|Key_list]) ->
	#{  'item_id'  := Item_id,
		'item_num' := Item_num,
		'weight'   := Weight} = tb_pool_and_weight:get(Key),
	New_weight = Now_weight - Weight,
	case New_weight =< 0 of
		true 	->[Item_id,Item_num];
		false 	->found_item(New_weight,Key_list)
	end
.
%% 从池子里面计算出一个随机的道具信息
get_item_from_pool(Pool) ->
	Tb_list = tb_pool_and_weight:get_list(),
	Key_list = lists:filter(fun(K) ->  maps:get(pool_id, tb_pool_and_weight:get(K),0) =:= Pool end,Tb_list),
	%% 获得池子的权数总和
	Total_weight = lists:foldl(fun(X, Sum) -> maps:get(weight, tb_pool_and_weight:get(X),0) + Sum end, 0, Key_list),
	Now_weight  = trunc(Total_weight * rand:uniform()),
	found_item(Now_weight,Key_list)
.

%% 把一个数随机分成N份,返回一个存放的列表
random_allocation_num(Num,N,List) ->
	case  N =:= 1 of
		true 	-> [Num|List];
		false 	-> Number = lib_random:rand(Num-N+1),
				   New_num =  Num - Number,
			       random_allocation_num(New_num,N-1,[Number|List])
	end
.
%% 从N个池子里获取N份,返回存放的列表
get_list_from_pool([Pool|Pool_list],List) ->
	[Item|_] = get_item_from_pool(Pool),
	get_list_from_pool(Pool_list,[Item|List])
;
get_list_from_pool([],List) ->
	List
.
%% 合并道具表和数量表
increase_list([Item_id|List1],[Num|List2],NewList) ->
	increase_list(List1,List2,[[Item_id,Num]|NewList])
;
increase_list([],[],NewList) ->
	NewList
.

%% 第一、二档招募
get_type_one_of_two(Pub_recruit,Type,Is_first) ->
	#{	'pieces_num' := Pieces_num,
		'one' := One_pool,
		'two' := Two_pool,
		'three' := Three_pool
	} = Pub_recruit,
	%% 爵位增加单次抽取获得的碎片数
	Title_add = title_add(Type),
	ScienceAdd = science_add(Type),
	New_pieces_num = Title_add + Pieces_num + ScienceAdd,
	%% 从三个池子中抽取
	N = 3,
	Num_list = random_allocation_num(New_pieces_num,N,[]),
	Item_list =
		case maps:is_key(first,Pub_recruit) andalso Is_first of
		true ->
			Pool = maps:get(first,Pub_recruit),
			lists:foldl(fun(_,L) -> lists:append(get_list_from_pool([Pool],[]),L) end,[],lists:seq(1,N));
		false->
			get_list_from_pool([One_pool,Two_pool,Three_pool],[])
	end,
	increase_list(Item_list,Num_list,[])
.
%% 第三档招募
get_type_three(Pub_recruit,Is_first) ->
	#{	'pieces_num' := Pieces_num,
		'one' := One_pool,
		'two' := Two_pool,
		'three' := Three_pool,
		'four' := Four_pool,
		'five' := Five_pool
	} = Pub_recruit,
	%% 从五个池子中抽取
	N = 5,
	Num_list = random_allocation_num(Pieces_num,N,[]),
	Item_list =
		case maps:is_key(first,Pub_recruit) andalso Is_first of
			true ->
				Pool = maps:get(first,Pub_recruit),
				lists:foldl(fun(_,L) -> lists:append(get_list_from_pool([Pool],[]),L) end,[],lists:seq(1,N));
			false->
				get_list_from_pool([One_pool,Two_pool,Three_pool,Four_pool,Five_pool],[])
		end,
	increase_list(Item_list,Num_list,[])
.
%% 第三档加特殊池子招募
get_type_three_and_special(Pub_recruit) ->
	#{	'pieces_num' := Pieces_num,
		'one' := One_pool,
		'two' := Two_pool,
		'three' := Three_pool,
		'four' := Four_pool,
		'five' := Five_pool,
		'special' := Special_pool
	} = Pub_recruit,
	%% 先从特殊池子中招募
	[Item_id,Item_num] = get_item_from_pool(Special_pool),
	New_special_pool = Pieces_num - Item_num,
	%% 从三个池子中抽取
	N = 5,
	Num_list = random_allocation_num(New_special_pool,N,[]),
	Item_list = get_list_from_pool([One_pool,Two_pool,Three_pool,Four_pool,Five_pool],[]),
	[[Item_id,Item_num]|increase_list(Item_list,Num_list,[])]
.
%% 判断小酌可以进行招募
judge_type_one_can_recruit(Type)	->
	case Type=:=?RECRUIT_ONE of
		true -> case get_today_time() =< 0 of
					true	->false;
					false	->true
				end;
		false -> true
	end
.
%% 获取今日可用小酌总次数
get_sum_time()	->
	Pub_level = lib_inner_city_api:building_level(?BUILDING_PUB),
	Level_add = maps:get(num, tb_pub_level_and_time:get(Pub_level)),
	Pub_recruit_tb = tb_pub_recruit_type:get(1),
	#{'everyday_time' := Everyday_time} = Pub_recruit_tb,
	Everyday_time + Level_add
.

%% 获取今日可用小酌次数
get_today_time()	->
	Pub_recruit = get_player_pub_recruit(),
	Pub_level = lib_inner_city_api:building_level(?BUILDING_PUB),
	Level_add = maps:get(num, tb_pub_level_and_time:get(Pub_level)),
	Pub_recruit_tb = tb_pub_recruit_type:get(1),
	#{'everyday_time' := Everyday_time} = Pub_recruit_tb,
	Player_recruit_one_time = Everyday_time + Level_add,
	Player_recruit_one_time - Pub_recruit#pub_recruit.today_recruit
.
%% 判断是否有满足招募条件 满足则扣除道具并返回true 不满足返回false
judge_can_recruit(Pub_recruit_tb,Type,Item_type) ->
	#{  'use_prop_id' := Use_prop_id,
		'use_prop_num' := Use_prop_num,
		'item_id' := Item_id,
		'item_num' := Item_num
	} = Pub_recruit_tb,
	case judge_type_one_can_recruit(Type) of
		true ->
				try
				Item =
						case Type =:= ?RECRUIT_ONE of
						true 	->  Item1 = [Use_prop_id,Use_prop_num],
											lib_item_api:conf_item_to_pack_item(Item1);
						false 	-> case Item_type of
											 ?USE_MONEY -> Item1 = [Use_prop_id,Use_prop_num];
											 ?USE_ITEM	-> Item1 = [Item_id,Item_num]
									end,
									lib_item_api:conf_item_to_pack_item(Item1)
					end,

					Ret = lib_player_pack:validate_remove(Item),
					?PACK_IS_SUCCESS(Ret),
					lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_PUB_RECRUIT, Type)),
					true
				catch
					throw:{error, Flag} -> ?DEBUG("招募道具~p不足",[Flag]),
					false
				end;
		false -> ?DEBUG("今日小酌次数已用完"),
				false
	end
.

into_list([[Item_id,Item_num]|Item_List],List) ->
	Item =
	#'ProtoItemObj'{
		item_id = Item_id, amount = Item_num
	},
	into_list(Item_List,[Item|List])
;
into_list([],List) ->
	List
.
%% 获得爵位碎片数量加成
title_add(Type) ->
	[Num,_] = lib_nobility_api:privilege_add(?PUB_RECRUIT_ONE_INCREASE),
	case Type of
		?RECRUIT_ONE -> Num;
		_ -> 0
	end
.
%% 获得爵位额外特殊碎片数量
get_nobility_special_num(Type) ->
	[_,Num] = lib_nobility_api:privilege_add(?PUB_RECRUIT_ONE_INCREASE),
	case Type of
		?RECRUIT_ONE -> Num;
		_ -> 0
	end
.
science_add(Type)->
	lib_player_science_api:get_effect_value(?EFFECT_PUB_REWARD_NUMBER_ADD,Type)
.
%% 外部接口 -----------------

%% 请求酒馆信息
request_pub_recruit_info() ->
	Pub_recruit = get_player_pub_recruit(),
	Residue_degree = get_today_time(),
	Sum_time = get_sum_time(),
	Pub_recruit_tb = tb_pub_recruit_type:get(3),
	#{'trigger_num' := Trigger_num} = Pub_recruit_tb,
	Respond = #'Proto50124001'{
		residue_degree = Residue_degree,
		sum_degree = Sum_time,
		time_to_special = Trigger_num - Pub_recruit#pub_recruit.num
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("request_pub_recruit_info: ~p ~n",[Respond])
.

%% 请求酒馆招募
request_pub_recruit(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_112), ?INFO("功能未开启")),
	#'Proto10124002'{type = Type,item_type = Item_type} = Msg,
	?DEBUG("请求酒馆招募   ~p",[Msg]),
	Pub_recruit = get_player_pub_recruit(),
	Buy_type = Pub_recruit#pub_recruit.buy_type,
	?DEBUG("Buy_type   ~p",[Buy_type]),
	IS_first = case lists:member(Type,Buy_type) of
				   true -> false;
				   false-> put_player_pub_recruit(Pub_recruit#pub_recruit{buy_type = [Type|Buy_type]}),true
			   end,
	New_Pub_recruit = get_player_pub_recruit(),
	Pub_recruit_tb = tb_pub_recruit_type:get(Type),
		case judge_can_recruit(Pub_recruit_tb,Type,Item_type) of
			true 	-> Item_list =
						case Type =:= ?RECRUIT_THREE of
						   true 	-> 	#{'trigger_num' := Trigger_num} = Pub_recruit_tb,
							   			%% 判断是否加入特殊池子
							  			 case Pub_recruit#pub_recruit.num =:= Trigger_num of
											 true 	->	put_player_pub_recruit(New_Pub_recruit#pub_recruit{num = 0 }),
												 		get_type_three_and_special(Pub_recruit_tb);
											 false	->
														put_player_pub_recruit(New_Pub_recruit#pub_recruit{num = Pub_recruit#pub_recruit.num +1 }),
												 		get_type_three(Pub_recruit_tb,IS_first)
										 end;
						   %% 第1、2档招募
						   false	 ->  get_type_one_of_two(Pub_recruit_tb,Type,IS_first)
					     end,
						#{ 'money_id' := Money_id, 'money_num' := Money_num} = Pub_recruit_tb,
						New_ItemList = case Money_id =:= 0 of
										 true -> Item_list;
										 false ->[[Money_id,Money_num]|Item_list]
									 end,
						New_NobilityItemList =
						case get_nobility_special_num(Type)  of
							0 -> New_ItemList;
							_ -> [Item_id,_] = get_item_from_pool(<<"hero4">>),
								 Num = get_nobility_special_num(Type),
								 [[Item_id,Num]|New_ItemList]
						end,
						Item = lib_item_api:conf_item_list_to_pack_item_list(New_NobilityItemList),
						lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_PUB_RECRUIT, Type), true, 0),
						if
							Type =:= ?RECRUIT_ONE	-> put_player_pub_recruit(New_Pub_recruit#pub_recruit{today_recruit = Pub_recruit#pub_recruit.today_recruit + 1});
							true -> skip
						end,
						Pub_recruit1 = get_player_pub_recruit(),
						Item_proto_list = into_list(New_NobilityItemList,[]),
						Residue_degree = get_today_time(),
						Sum_time = get_sum_time(),
						Pub_recruit_tb1 = tb_pub_recruit_type:get(3),
				        #{'trigger_num' := Trigger_num1} = Pub_recruit_tb1,
						Respond = #'Proto50124002'{
							item_list = Item_proto_list,
							type = Type,
							surplus_time = Residue_degree,
							sum_degree = Sum_time,
							time_to_special = Trigger_num1 - Pub_recruit1#pub_recruit.num
						},
						lib_send:respond_to_client(Respond),
						?DEBUG("request_pub_recruit: ~p ~n",[Respond]),
						lib_player_process:process_pub_recruit(Type)
					;
			false 	->  case Item_type of
							 ?USE_COPPER -> throw({error, ?ERROR_COPPER_AMOUNT});
							 ?USE_MONEY -> throw({error, ?ERROR_GOLD_AMOUNT});
							 ?USE_ITEM  -> throw({error, ?ERR_PACK_AMOUNT})
						 end
		end

.

reset_everyday() ->
	Pub_recruit = get_player_pub_recruit(),
	put_player_pub_recruit(Pub_recruit#pub_recruit{today_recruit = 0})
.
