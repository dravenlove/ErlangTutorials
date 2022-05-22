%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 15:46
%%%-------------------------------------------------------------------
-module(lib_country_setting).
-author("13661").

-compile(export_all).

get_const_int(Key) ->
	get_const_int(Key, 0)
.
get_const_int(Key, Default) ->
	Conf = tb_country_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(int_val, Conf, Default)
	end
.

get_const_float(Key) ->
	get_const_float(Key, 0.0)
.
get_const_float(Key, Default) ->
	Conf = tb_country_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(float_val, Conf, Default)
	end
.

get_const_string(Key) ->
	get_const_string(Key, "")
.
get_const_string(Key, Default) ->
	Conf = tb_country_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(str_val, Conf, Default)
	end
.

get_const_list(Key) ->
	get_const_list(Key, [])
.
get_const_list(Key, Default) ->
	Conf = tb_country_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(json_val, Conf, Default)
	end
.

get_config_item_list(Key) ->
	ConfItemList = get_const_list(Key),
	lib_item_api:conf_item_list_to_item_obj_list(ConfItemList)
.

impeach_duration() ->
	get_const_int(?FUNCTION_NAME) * lib_timer:minute_second().
impeach_cost() ->
	get_config_item_list(?FUNCTION_NAME).
king_protect_time() ->
	get_const_int(?FUNCTION_NAME) * lib_timer:minute_second().

king_change_rebate() ->
	get_const_int(?FUNCTION_NAME)
.

order_max_times(Type) ->
	Conf = tb_country_order:get(Type),
	case Conf =/= false of
		false -> 0;
		true -> maps:get(max_times, Conf, 0)
	end
.

order_duration(Type) ->
	Conf = tb_country_order:get(Type),
	case Conf =/= false of
		false -> 0;
		true -> maps:get(duration, Conf, 0) * lib_timer:minute_second()
	end
.

order_rate(Type) ->
	Conf = tb_country_order:get(Type),
	case Conf =/= false of
		false -> 0;
		true -> maps:get(rate, Conf, 0)
	end
.

order_cost(Type) ->
	Conf = tb_country_order:get(Type),
	case Conf =/= false of
		false -> 0;
		true -> lib_item_api:conf_item_list_to_item_obj_list(maps:get(cost, Conf, []))
	end
.

order_reward(Type) ->
	Conf = tb_country_order:get(Type),
	case Conf =/= false of
		false -> 0;
		true -> lib_item_api:conf_item_list_to_item_obj_list(maps:get(reward, Conf, []))
	end
.

rank_number() ->
	get_const_int(?FUNCTION_NAME)
.

tax_revenue_time() ->
	get_const_list(?FUNCTION_NAME, [0, 0])
.

tax_revenue_rate() ->
	get_const_list(?FUNCTION_NAME)
.

city_master_order_cost() ->
	get_config_item_list(?FUNCTION_NAME)
.

city_master_order_reward() ->
	get_config_item_list(?FUNCTION_NAME)
.

city_master_order_rate() ->
	get_const_int(?FUNCTION_NAME)
.

city_master_order_duration() ->
	get_const_int(?FUNCTION_NAME) * lib_timer:minute_second()
.

send_salary_time() ->
	get_const_int(?FUNCTION_NAME)
.