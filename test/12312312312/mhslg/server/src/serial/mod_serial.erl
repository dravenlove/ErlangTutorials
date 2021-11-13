%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_serial.erl
%% Created on : 2019-05-23 10:08:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-23 10:08:00
%% Description: 流水进程
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_serial).
-behaviour(mod_server).
-include("common.hrl").

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	get_pid/0,
	push_serial_sql/1,
	create_table/0
]).

-record(serial_state, {sql_list = []}).
-define(SQL_FILE_OPTION,[append, {delayed_write, 64 * 1024, 500}, {encoding,utf8}]).
-define(TRY_TIMES, 1).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

do_init([]) ->
	erlang:send_after(5000, self(), serial_write),
	{ok, #serial_state{sql_list = []}}.

do_db_init(State, _Args) ->
	lib_serial_create:create_database(),
	lib_serial_create:create_table(),
	{noreply, State}.

do_call(_Info, _From, State) ->
    {reply, State, State}.

do_cast({add_sql, Sql, Args}, #serial_state{sql_list = SqlList} = State) ->
	{noreply, State#serial_state{sql_list = [{Sql, Args} | SqlList]}};
do_cast({create_table}, State) ->
	lib_serial_create:create_table(),
	{noreply, State};
do_cast(_Info, State) ->
	{noreply, State}.

do_info(serial_write, #serial_state{sql_list = []} = State) ->
	erlang:send_after(10000, self(), serial_write),
	{noreply, State};
do_info(serial_write, #serial_state{sql_list = SqlList} = State) ->
	erlang:send_after(5000, self(), serial_write),
	try
		MysqlResult = mysql_poolboy:transaction(?SERIALDB_POOL, fun(Pid, SqlList2) -> 
			lists:foldl(fun({Sql, Args}, FailSqlListAcc0) -> 
				case Args of
					[] ->
						case mysql:query(Pid, Sql) of
							{error, Reason} ->
								?ERROR("mysql error[~p]~n ~ts~n ", [Reason, Sql]),
								[{Sql, Args} | FailSqlListAcc0];
							_ -> FailSqlListAcc0
						end;
					_ ->
						case mysql:query(Pid, Sql, Args) of
							{error, Reason} ->
								?ERROR("mysql error[~p]~n ~ts ~n", [Reason, Sql]),
								[{Sql, Args} | FailSqlListAcc0];
							_ -> FailSqlListAcc0
						end
				end
			end, [], SqlList2)
		end, [SqlList], ?TRY_TIMES),
		case MysqlResult of
			{atomic, []} ->
				{noreply, State#serial_state{sql_list = []}};
			{_, FailSqlList} ->
				%%把sql写入文件
				write_fail_sql_to_file(FailSqlList),
				{noreply, State#serial_state{sql_list = []}}
		end
	catch
		_ : Reason ->
			?ERROR("serial write: ~p ~n", [Reason]),
			%%把sql写入文件
			write_fail_sql_to_file(SqlList),
			{noreply, State#serial_state{sql_list = []}}
	end;
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, State) ->
	do_info(serial_write, State),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

write_fail_sql_to_file(SqlList) ->
	{ok, File} = file:open("serial_fail.sql", ?SQL_FILE_OPTION),
	try
		lists:foreach(fun({Sql, Args}) ->
			case Args of
				[] ->
					try
						io:format(File, "~ts;~n", [Sql])
					catch
						_:_ ->
							file:write(File, Sql),
							file:write(File,";\n")
					end;
				_ ->
					file:write(File, Sql),
					file:write(File,io_lib:format("~p~n", [Args]))
			end
									end, SqlList)
	catch
		_:Reason ->
			?ERROR("Sql write filed ~p ~n ~p",[Reason,erlang:get_stacktrace()])
	end,
	file:close(File).

push_serial_sql(Sql) ->
	push_serial_sql(Sql, []).

push_serial_sql(Sql, Args) ->
	mod_server:cast(?MODULE, {add_sql, Sql, Args}).

create_table() ->
	mod_server:cast(?MODULE, {create_table}).