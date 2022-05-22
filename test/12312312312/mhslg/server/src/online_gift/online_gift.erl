%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 11月 2020 15:07
%%%-------------------------------------------------------------------
-module(online_gift).
-author("df").
-include("player.hrl").
-include("ProtoClient_10115.hrl").
-include("common.hrl").
-include("ProtoPublic.hrl").
-include("online_gift.hrl").
-include("pack.hrl").
-include("inner_city.hrl").

%% API
-export([
	player_online_gift_handler/0,
	sign_in/0,
	sign_out/0,
	process_reset_every_day/0,					%% 每日刷新
	request_online_gift_info/0,					%% 请求在线奖励信息
	request_online_gift_receive/1,				%% 领取在线奖励
	online_gift_recharge_compensate/0,			%% 充值补偿
	online_gift_icon/0							%% 在线奖励图标判断
]).




get_player_online_gift() ->
	erlang:get(?ETS_ONLINE_GIFT)
.

put_player_online_gift(Online_gift) when is_record(Online_gift, player_online_gift)  ->
	put_player_online_gift(Online_gift,true)
.
put_player_online_gift(Online_gift,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_ONLINE_GIFT),
	erlang:put(?ETS_ONLINE_GIFT, Online_gift)
.

ets_init() ->
	ets:new(?ETS_ONLINE_GIFT, [?ETS_KEY_POS(#player_online_gift.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_ONLINE_GIFT, {?TUPLE_INT(id, 1)}, true).

player_online_gift_handler() ->
	#player_handler{
		ets = ?ETS_ONLINE_GIFT,
		table_name = ?DBPLAYER_ONLINE_GIFT,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_online_gift:load_online_gift/1,
		save_func = fun db_online_gift:save_online_gift/1,
		get_func = fun get_player_online_gift/0,
		put_func = fun put_player_online_gift/2
	}.

%%每日刷新
process_reset_every_day() ->
	Online_gift = get_player_online_gift(),
	put_player_online_gift(Online_gift#player_online_gift{
		today_accumulative_time = 0, recharge_state = 0, online_gift_state = 0,
		is_receive_all = 0, icon_state = 2
	})
.

get_gift_id_list() ->
	List =
	lists:foldr(fun(K,L)->
		[maps:get(reward_id, tb_online_gift:get(K))|L]
	end,[], tb_online_gift:get_list()),
	lists:usort(List)
.

get_time()->
	List =
		lists:foldr(fun(K,L)->
			[{maps:get(reward_id, tb_online_gift:get(K)),maps:get(time, tb_online_gift:get(K))}|L]
	end,[], tb_online_gift:get_list()),
	lists:usort(List)
.
get_time(GiftId) ->
	[{_,Time}] =
	lists:filter(fun({Id,_})->
		Id =:= GiftId
	end,get_time()),
	Time
.
get_max_id() ->
	lists:max(get_gift_id_list())
.
get_min_id() ->
	lists:min(get_gift_id_list())
.

%%此次上线在线时间
get_online_time() ->
	PlayerBase = lib_player:get_player_base(),	%%获取登录时间
	Play_login_time = PlayerBase#player_base.login_tick,
	%% 获取当前时间戳,单位秒
	Play_now_time = lib_timer:unixtime(),
	%%在线时间
	Play_now_time - Play_login_time.

%%保存今日累计在线时间--下线时调用
sign_out() ->
	Online_gift = get_player_online_gift(),
	Time = get_online_time(),
	Time1 = Online_gift#player_online_gift.today_accumulative_time,
	New_time = Time + Time1,
	put_player_online_gift(Online_gift#player_online_gift{today_accumulative_time = New_time})
.
sign_in() ->
	Online_gift = get_player_online_gift(),
	Respond = #'Proto80115003'{type = Online_gift#player_online_gift.icon_state,is_get_all = Online_gift#player_online_gift.is_receive_all},
	lib_send:respond_to_client(Respond),
	?DEBUG("online_gift_sign_in: ~p ~n",[Respond])

.

%%获取今日累计在线时间
get_today_accumulative_time() ->
	Online_gift = get_player_online_gift(),
	Time = get_online_time(),
	Time1 = Online_gift#player_online_gift.today_accumulative_time,
	Time + Time1.


%%判断礼包阶段
judge_time() ->
	Online_gift = get_player_online_gift(),
	Gift_state = Online_gift#player_online_gift.online_gift_state,
	case Gift_state =:= get_max_id() of
		true -> Gift_state;
		false->case Gift_state =:= 0 of
				   true -> get_min_id();
				   false-> Gift_state + 1
			   end
	end
.


%%礼品接收状态
set_gift_receive_state(Gift_id) ->
	Online_gift = get_player_online_gift(),
	%%当日礼包领取完毕设置状态d
	case (Gift_id =:= get_max_id()) of
		true  -> put_player_online_gift(Online_gift#player_online_gift{icon_state = 2,online_gift_state = Gift_id,is_receive_all = 1}),
			New_Online_gift = get_player_online_gift(),
			Respond = #'Proto80115003'{type = New_Online_gift#player_online_gift.icon_state,is_get_all = New_Online_gift#player_online_gift.is_receive_all},
			lib_send:respond_to_client(Respond)
		;%%设置为领取完所有礼包
		false -> put_player_online_gift(Online_gift#player_online_gift{online_gift_state = Gift_id})
	end

.

%%是否领取完全部礼包
is_receive_all_gift() ->
	Online_gift = get_player_online_gift(),
	Online_gift#player_online_gift.is_receive_all
.

%%更改图标状态
set_icon_state(State) ->
	Online_gift = get_player_online_gift(),
	case State =:= 1 of
		 true ->
			 BuildingInfo = lib_inner_city:get_buildings_info(?BUILDING_TRADE_SHIP),
			 lib_inner_city:update_inner_building(BuildingInfo#building{building_state = ?BUILDING_GET_ITEM}),
			 lib_inner_city_api:building_state_to_client(?BUILDING_TRADE_SHIP);
		 false-> skip
	end,
	put_player_online_gift(Online_gift#player_online_gift{icon_state = State})
.

%%在线奖励图标
online_gift_icon() ->
	Online_gift = get_player_online_gift(),
	case is_receive_all_gift() =:= 1 of
		true 	-> 	skip;
		false 	->	Online_time = get_today_accumulative_time(),
					Need_time = get_time(judge_time()),
					Type = case (Need_time - Online_time) =< 0 of
							true -> 1;
							false-> 2
							end,
					case Type =:= Online_gift#player_online_gift.icon_state of
						true 	-> 	skip;
						false 	->
							set_icon_state(Type),
							Respond = #'Proto80115003'{type = Type,is_get_all = Online_gift#player_online_gift.is_receive_all},
							lib_send:respond_to_client(Respond),
							?DEBUG("online_gift_icon: ~p ~n",[Respond])

					end
	end
.


%%请求在线礼包信息
request_online_gift_info() ->
	?DEBUG("接收到请求"),
	Online_gift = get_player_online_gift(),
	Online_time = get_today_accumulative_time(),
	Gift_id = judge_time(),
	Need_time = Need_time = get_time(Gift_id),
	Respond =
		#'Proto50115001'{
			gift_id = Gift_id,
			surplus_time = case (Need_time - Online_time) =< 0 of
							   true  -> 0;
							   false -> Need_time - Online_time
						   end,
			is_double = Online_gift#player_online_gift.recharge_state,
			is_get_all = Online_gift#player_online_gift.is_receive_all
		},
	lib_send:respond_to_client(Respond),
	?DEBUG("online_gift_info: ~p ~n",[Respond])
.

get_award_list(Id,Is_double) ->
	Multiple =
		case Is_double of
			0 -> 1;
			1 -> 2
		end,
	List =
		lists:filter(fun(K)->
			maps:get(reward_id, tb_online_gift:get(K)) =:= Id
					 end, tb_online_gift:get_list()),
	lists:foldr(fun(K,L)->
		#{ 'item_id' := Item_id, 'num' := Num} = tb_online_gift:get(K),[[Item_id,Num * Multiple]|L]
				end,[],List)
.

%% 判断是否到领取时间
is_can_receive(Gift_id) ->
	Time = get_today_accumulative_time(),
	Need_time = Need_time = get_time(Gift_id),
	Time >= Need_time
.

%%接受在线奖励礼物
request_online_gift_receive(Msg) ->
	?DEBUG("接受在线奖励礼物"),
	#'Proto10115002'{gift_id =  Gift_id} = Msg,
	Online_gift = get_player_online_gift(),
	case is_can_receive(Gift_id) andalso (Online_gift#player_online_gift.is_receive_all =/= 1) of
		true ->
				Item_list = get_award_list(Gift_id,Online_gift#player_online_gift.recharge_state),
				Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
				lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_ONLINE_GIFT, Gift_id)),
				%%领取完该礼包状态设置为 1
				set_gift_receive_state(Gift_id),
				%%当日礼包领取完毕设置状态
				case (Gift_id =:= get_max_id()) of
					true  ->  skip;
					false ->  request_online_gift_info() %%返回下一个阶段礼包的信息
				end,
				%%回复客户端
				lib_send:respond_to_client(?MSG_RETURN_ONLINE_GIFT_CLICK),
				lib_inner_city:leisure_building(?BUILDING_TRADE_SHIP);
		false -> ?DEBUG("未到领取时间：~p",[Gift_id])
	end

.

%% todo 等待充值功能完成加入充值页面调用
%%在线礼包充值补偿
online_gift_recharge_compensate() ->
	Online_gift = get_player_online_gift(),
	case  Online_gift#player_online_gift.recharge_state of
		0 ->
			%%更改充值状态为1
			put_player_online_gift(Online_gift#player_online_gift{recharge_state = 1}),
			Online_gift_state = Online_gift#player_online_gift.online_gift_state,
			Id_list = lists:filter(fun(Id) ->
				Id =< Online_gift_state
			end,get_gift_id_list()),
			Item_list = mail_item_list(Id_list,[]),
			lib_mail_api:fast_send_mail(lib_player:player_id(), ?ONLINE_GIFT_MAIL_ID, [],
				lib_item_api:conf_item_list_to_pack_item_list(Item_list), ?ADD_ONLINE_GIFT);
		1 ->skip
	end
.


mail_item_list([Gift_id|Id_list],List) ->
	Item_list = get_award_list(Gift_id,0),
	mail_item_list(Id_list, Item_list ++ List)
;

mail_item_list([],Item_list) ->
	Item_list
.





