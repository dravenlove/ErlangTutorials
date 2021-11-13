%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 2月 2021 15:41
%%%-------------------------------------------------------------------
-module(lib_arena_setting).
-author("13661").

%% API
-compile(export_all).

get_const_int(Key) ->
	get_const_int(Key, 0)
.
get_const_int(Key, Default) ->
	Conf = tb_arena_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(int_val, Conf, Default)
	end
.

get_const_float(Key) ->
	get_const_float(Key, 0.0)
.
get_const_float(Key, Default) ->
	Conf = tb_arena_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(float_val, Conf, Default)
	end
.

get_const_string(Key) ->
	get_const_string(Key, "")
.
get_const_string(Key, Default) ->
	Conf = tb_arena_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(str_val, Conf, Default)
	end
.

get_const_list(Key) ->
	get_const_list(Key, [])
.
get_const_list(Key, Default) ->
	Conf = tb_arena_setting:get(Key),
	case Conf of
		false -> Default;
		_ -> maps:get(json_val, Conf, Default)
	end
.
