%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十一月 2020 15:35
%%%-------------------------------------------------------------------
-module(lib_const_api).
-author("13661").

%% API
-export([
	get_const_int/1,
	get_const_int/2,
	get_const_float/1,
	get_const_float/2,
	get_const_string/1,
	get_const_string/2,
	get_const_list/1,
	get_const_list/2
]).

get_const_int(Key) ->
	get_const_int(Key, 0)
.
get_const_int(Key, Default) ->
	Conf = tb_const:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(value, Conf, Default)
	end
.

get_const_float(Key) ->
	get_const_float(Key, 0.0)
.
get_const_float(Key, Default) ->
	Conf = tb_const:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(floatvalue, Conf, Default)
	end
.

get_const_string(Key) ->
	get_const_string(Key, "")
.
get_const_string(Key, Default) ->
	Conf = tb_const:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(strvalue, Conf, Default)
	end
.

get_const_list(Key) ->
	get_const_list(Key, [])
.
get_const_list(Key, Default) ->
	Conf = tb_const:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(jsonvalue, Conf, Default)
	end
.