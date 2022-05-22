%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: config
%%% Created on : 2020/7/29 0029 19:31
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(config).
-author("glendy").
-include("common.hrl").

%% API
-export([
	load_game_config/0,
	mmo_pool_size/0,
	backstage_pool_size/0,
	mongo_host/0,
	mongo_port/0,
	mongo_mmo_db/0,
	mongo_back_db/0,
	mysql_serial_db/0,
	mysql_serial_pool_options/0,
	mysql_serial_options/0,
	get_log_level/0,
	tcp_accept_amount/0,
	tcp_max_connect/0,
	server_type/0,
	server_port/0,
	md5_key/0,
	server_flag/0,
	server_id/0,
	server_id/1,
	agent_code/1,
	open_datetime/0,
	open_tick/0,
	combine_datetime/0,
	combine_tick/0,
	combine_time/0,
	cluster_node/0,
	world_node/0,
	is_cluster/0,
	get_post_url/0,
	language/0
]).

-export([
	is_clear_master/0,
	is_remove_slave/0,
	is_merge/0,
	is_copy_person/0,
	merge_master/0,
	merge_slave/0,
	merge_mongo_pool_size/0,
	merge_batchsize/0,
	copy_players/0,
	remove_merge_login/0
]).
-export([
	get_open_days/0,
	get_open_days/1
]).

load_game_config() ->
	case check_syntax("./config/game_server.config") of
		{ok, TermList}  ->
			term_to_beam("game_server_config", TermList);
		Reason ->
            io:format("check Config syntax error[game_server.config], Reason:~p~n",[Reason]),
			{Reason, "game_server.config"}
	end.

check_syntax(ConfigName) ->
	case file:consult(ConfigName) of
		{ok, TermList = [_|_]} ->
			[HTearmList | _] = TermList,
%%			{ok, AppName} = application:get_application(),
			AppName = game_server,
			case lists:keyfind(AppName, 1, HTearmList) of
				{AppName, AppTermList} ->
					check_fromat_duplicate(AppTermList, []);
				_ ->
					{error, "NotAppName"}
			end;
		Reason ->
			{error, Reason}
	end.

check_fromat_duplicate([], Acc) ->
	{ok, Acc};
check_fromat_duplicate([{Key, _Value} = Term|Left], Acc) ->
	case lists:keymember(Key, 1, Acc) of
		true -> {error, key_duplicate, Key};
		false -> check_fromat_duplicate(Left, [Term|Acc])
	end;
check_fromat_duplicate([Term|_],_Acc) ->
	{error,format_error,Term}.

term_to_beam(ModuleName,TermList) ->
	Erl = term_to_erl(ModuleName,TermList),
	ModuleName2 = ModuleName++".erl",
	{Mod,Code} = dynamic_compile:from_string(Erl),
	code:purge(Mod),
	code:load_binary(Mod, ModuleName2, Code),
	{ok,Mod}.

term_to_erl(ModuleName,TermList) ->
	StrValue = lists:flatten(term_to_erl2(TermList,"")),
	StrList = lists:flatten(io_lib:format("     ~w\n", [TermList])),
	"
	-module(" ++ ModuleName ++ ").
    -export([all/0,lookup/1,lookup/2]).

    all()->"++ StrList ++".

    lookup(Key) ->
      case Key of
        " ++ StrValue ++ "
        _ -> undefined
    end.

    lookup(Key, Default) ->
      case Key of
        " ++ StrValue ++ "
        _ -> Default
    end.
".

term_to_erl2([],Sum) ->
	Sum;
term_to_erl2([{Key, Value}|Left],Acc) ->
	term_to_erl2(Left,
		[io_lib:format("       ~w -> ~w;\n",[Key, Value]) | Acc]).

mmo_pool_size() ->
	?CONFIG(mmo_size, 10).

backstage_pool_size() ->
	?CONFIG(backstage_size, 10).

mongo_host() ->
	case config:server_type() of
		merge -> lib_merge_mongo:get_master_host();
		_ -> ?CONFIG(mongo_host)
	end.

mongo_port() ->
	case config:server_type() of
		merge -> lib_merge_mongo:get_master_port();
		_ -> ?CONFIG(mongo_port)
	end.

mongo_mmo_db() ->
	case config:server_type() of
		merge -> lib_merge_mongo:get_master_mmo();
		_ -> ?CONFIG(mongo_db)
	end.

mongo_back_db() ->
	case config:server_type() of
		merge -> lib_merge_mongo:get_master_back();
		_ -> ?CONFIG(mongo_back)
	end.

mysql_serial_db() ->
	?CONFIG(mysql_serialdb).

mysql_serial_pool_options() ->
	[
		{size, 4},
		{worker_module, mysql},
		{max_overflow, 8}
	].

mysql_serial_options() ->
	[
		{host, ?CONFIG(mysql_host)},
		{port, ?CONFIG(mysql_port)},
		{user, ?CONFIG(mysql_usr)},
		{password, ?CONFIG(mysql_pwd)},
		{database, ?CONFIG(mysql_serialdb)}
	].

get_log_level() ->
	?CONFIG(log_level, ?LOG_INFO_LEVEL).

tcp_accept_amount() ->
	?CONFIG(accept_amount).
tcp_max_connect() ->
	?CONFIG(max_connect).

server_type() ->
	?CONFIG(server_type).

server_port() ->
	?CONFIG(server_port).

md5_key() ->
	?CONFIG(md5_key).

server_flag() ->
	?CONFIG(server_flag).

server_id() ->
	server_id(server_flag()).
server_id(ServerFlag) ->
	try
		Value = lib_types:to_integer([V || V <- ServerFlag, $0 =< V andalso V =< $9]),
		case string:left(ServerFlag, 2) of
			"fy" ->
				Value + 100000;
			_ ->
				Value
		end
	catch
		_:_ -> 0
	end.

agent_code(_Agent) ->
	0.

%% 开服日期, 返回{{年,月,日}, {0, 0, 0}}
open_datetime() ->
	OpenDate = ?CONFIG(open_date),
	OpenTime = ?CONFIG(open_time, 0),
	Year = OpenDate div 10000,
	Month = (OpenDate rem 10000) div 100,
	Day = OpenDate rem 100,
	Hour = OpenTime div 100,
	Min = OpenTime rem 100,
	{{Year, Month, Day}, {Hour, Min, 0}}.

%% 开服时间戳
open_tick() ->
	OpenDateTime = open_datetime(),
	lib_timer:unixtime(OpenDateTime).

%% 合服日期, 返回{{年,月,日}, {0, 0, 0}}
combine_datetime() ->
	OpenDate = ?CONFIG(combine_date),
	Year = OpenDate div 10000,
	Month = (OpenDate rem 10000) div 100,
	Day = OpenDate rem 100,
	{{Year, Month, Day}, {0, 0, 0}}.

%% 合服时间戳
combine_tick() ->
	CombineDateTime = combine_datetime(),
	lib_timer:unixtime(CombineDateTime).

%% 配置的跨服节点
cluster_node() ->
	lib_types:to_atom(?CONFIG(cluster_node)).

%% 配置的世界节点
world_node() ->
	lib_types:to_atom(?CONFIG(world_node)).

is_cluster() ->
	server_type() == ?SERVER_TYPE_CLUSTER.

%% 合服次数
combine_time() ->
	?CONFIG(combine_time).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
is_clear_master() ->
	Val = ?CONFIG(remove_master, 0),
	(Val =:= 1).

is_remove_slave() ->
	Val = ?CONFIG(remove_slave, 0),
	(Val =:= 1).

is_merge() ->
	Val = ?CONFIG(merge, 0),
	(Val =:= 1).

is_copy_person() ->
	Val = ?CONFIG(person, 0),
	(Val =:= 1).

merge_master() ->
	?CONFIG(master).

merge_slave() ->
	?CONFIG(slave).

merge_mongo_pool_size() ->
	?CONFIG(merge_mongo_pool, 10).

merge_batchsize() ->
	?CONFIG(merge_batchsize, 100).

copy_players() ->
	?CONFIG(copy_players, []).

remove_merge_login() ->
	?CONFIG(remove_merge_login).

get_open_days() ->
	get_open_days(lib_timer:unixtime())
.
get_open_days(Tick) ->
	{CUR_YMD, _} = lib_timer:to_localtime(Tick),
	{OPEN_YMD, _} = open_datetime(),

	CurZeroTick = lib_timer:unixtime({CUR_YMD, {0,0,0}}),
	OpenZeroTick = lib_timer:unixtime({OPEN_YMD, {0,0,0}}),

	Diff = (CurZeroTick - OpenZeroTick) div lib_timer:day_second(),

	case Diff >= 0 of
		true -> Diff + 1;
		false -> Diff
	end
.

get_data_center() ->
	?CONFIG(center, "http://192.168.18.200:3010").

get_data_center_req_url() ->
	?CONFIG(center_req_url, "/connector/server").

get_post_url()->
	SrcAddr = get_data_center(),
	SrcUri = get_data_center_req_url(),

	SrcAddr1 = string:strip(SrcAddr),
	SrcUri1 = string:strip(SrcUri),

	SrcAddr2 = case lists:last(SrcAddr1) =:= $/ of
				   false -> SrcAddr1;
				   true -> string:sub_string(SrcAddr1, 1, string:len(SrcAddr1) - 1)
			   end,

	SrcUri2 = case lists:last(SrcUri1) =:= $/ of
				  false -> SrcUri1;
				  true -> string:sub_string(SrcUri1, 1, string:len(SrcUri1) - 1)
			  end,

	string:concat(SrcAddr2, SrcUri2).

language() ->
	?CONFIG(language, ?LANGUAGE_CN).