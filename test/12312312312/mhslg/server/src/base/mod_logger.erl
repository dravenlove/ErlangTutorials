%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_logger
%%% Created on : 2020/5/6 0006 11:09
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_logger).
-behaviour(mod_server).
-author("glendy").
-include("common.hrl").

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	critical_msg/4,
	error_msg/4,
	warning_msg/4,
	info_msg/4,
	debug_msg/4,
	async_log_msg/4
]).

-record(logger_state, {
	log_list = [],	%% [{date_integer, log_msg_string}]
	date = 0,	%% 年 * 1000000 + 月 * 10000 + 日 * 100 + 时
	fd = undefined,	%% 日志文件句柄
	filename = ""	%% 日志文件路径
}).

-define(LOG_FILE_OPTION,[append, {delayed_write, 64 * 1024, 500}, {encoding,utf8}]).
-define(LOG_BASE_DIR, "./logs").
-define(LOG_MICROSEC, 5 * 1000).
-define(LOG_GC_MICROSEC, 3600 * 1000).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

do_init([]) ->
	State = create_new_log(#logger_state{}, lib_timer:to_localtime(lib_timer:unixtime())),
	erlang:send_after(?LOG_MICROSEC, self(), write_timer),
	erlang:send_after(?LOG_GC_MICROSEC, self(), gc_timer),
	{ok, State}.

do_db_init(State, _Args) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(write_timer, State) ->
	erlang:send_after(?LOG_MICROSEC, self(), write_timer),
	NewState = write_log(State),
	{noreply, NewState};
do_info(gc_timer, State) ->
	erlang:send_after(?LOG_GC_MICROSEC, self(), gc_timer),
	erlang:garbage_collect(self()),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, State) ->
	NewState = write_log(State),
	close_log(NewState),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_log_base_dir() ->
	?LOG_BASE_DIR.

date_to_date_integer({{Year, Month, Day}, {Hour, _, _}}) ->
	Year * 1000000 + Month * 10000 + Day * 100 + Hour.

date_integer_to_date(DateInt) ->
	Year = DateInt div 1000000,
	Month = (DateInt rem 1000000) div 10000,
	Day = (DateInt rem 10000) div 100,
	Hour = DateInt rem 100,
	{{Year, Month, Day}, {Hour, 0, 0}}.

create_new_log(State, Date) ->
	{{Year, Month, Day}, {Hour, _, _}} = Date,
	DateInt = date_to_date_integer(Date),
	BaseDir = get_log_base_dir(),
	filelib:ensure_dir(BaseDir),
	FileName = lists:flatten(io_lib:format("~ts/~w-~.2.0w-~.2.0w-~.2.0w.log", [BaseDir, Year, Month, Day, Hour])),
	case file:open(FileName, ?LOG_FILE_OPTION) of
		{ok, Fd} ->
			State#logger_state{fd = Fd, filename = FileName, date = DateInt};
		_Error ->
			State
	end.

close_log(State) ->
	#logger_state{
		fd = Fd
	} = State,
	if
		Fd =/= undefined ->
			try
				file:sync(Fd),
				file:close(Fd)
			catch
			    _:_Reason  -> skip
%%				_:Reason  ->
%%					io:format("log error: ~p ~n", [Reason])
			end,
			State#logger_state{fd = undefined, filename = "", date = 0};
		true -> State
	end.

notify_logmsg(LogLevel, TypeName, Module, Line, Format, Args) ->
	ConfLogLevel = config:get_log_level(),
	if
		LogLevel =< ConfLogLevel ->
			NowTick = lib_timer:unixtime(),
			{_, {H, M, S}} = NowDate = lib_timer:to_localtime(NowTick),
			Content = io_lib:format("[~.2.0w:~.2.0w:~.2.0w][~ts][~p][~w:~w] " ++ Format ++ "~n", [H, M, S, TypeName, self(), Module, Line | Args]),
			NowDateInt = date_to_date_integer(NowDate),
			mod_server:async_status(mod_logger, fun mod_logger:async_log_msg/4, [LogLevel, NowDateInt, Content]);
		true -> skip
	end.

critical_msg(Module, Line, Format, Args) ->
	notify_logmsg(?LOG_CRIT_LEVEL, "CRIT", Module, Line, Format, Args).

error_msg(Module, Line, Format, Args) ->
	notify_logmsg(?LOG_ERROR_LEVEL, "ERROR", Module, Line, Format, Args).

warning_msg(Module, Line, Format, Args) ->
	notify_logmsg(?LOG_WARN_LEVEL, "WARN", Module, Line, Format, Args).

info_msg(Module, Line, Format, Args) ->
	notify_logmsg(?LOG_INFO_LEVEL, "INFO", Module, Line, Format, Args).

debug_msg(Module, Line, Format, Args) ->
	notify_logmsg(?LOG_DEBUG_LEVEL, "DEBUG", Module, Line, Format, Args).

async_log_msg(State, _LogLevel, NowDateInt, Content) ->
	ConfLogLevel = config:get_log_level(),
	if
		ConfLogLevel > ?LOG_DEBUG_LEVEL ->
			try
				io:format(Content)
			catch
			    _:_  -> skip
			end;
		true -> skip
	end,
	#logger_state{
		log_list = LogList
	} = State,
	NewState = State#logger_state{
		log_list = [{NowDateInt, Content} | LogList]
	},
	{ok, NewState}.

write_log(State) ->
	#logger_state{
		log_list = LogList,
		date = FileDateInt,
		fd = Fd
	} = State,
	{LogDateInt, ContentList, NewLogList} = log_list_to_content_list(lists:reverse(LogList)),
	if
		LogDateInt =< 0 -> State;
		true ->
			case check_same_log_date_integer(FileDateInt, LogDateInt) of
				true ->
					io_lib_report(Fd, ContentList),
					State#logger_state{
						log_list = NewLogList
					};
				_ ->
					NewState1 = close_log(State),
					#logger_state{
						fd = NewFd
					} = NewState2 = create_new_log(NewState1, date_integer_to_date(LogDateInt)),
					io_lib_report(NewFd, ContentList),
					NewState2#logger_state{
						log_list = NewLogList
					}
			end
	end.

check_same_log_date_integer(FileDateInt, LogDateInt) ->
	FileDateInt =:= LogDateInt.

log_list_to_content_list([]) ->
	{0, [], []};
log_list_to_content_list(LogList) ->
	{LogDateInt, _} = lists:nth(1, LogList),
	log_list_to_content_list(LogDateInt, "", LogList).
log_list_to_content_list(LogDateInt, ContentList, []) ->
	{LogDateInt, lists:reverse(ContentList), []};
log_list_to_content_list(LogDateInt, ContentList, [{CurDateInt, Content} | T] = LogList) ->
	if
		LogDateInt =:= CurDateInt ->
			log_list_to_content_list(LogDateInt, [Content | ContentList], T);
		true ->
			{LogDateInt, ContentList, lists:reverse(LogList)}
	end.

io_lib_report(Fd, ContentList) ->
	try
		io:format(Fd, "~ts", [ContentList]),
		file:sync(Fd)
	catch
		_:_ -> skip
%%		_:Reason  ->
%%			io:format("io_lib_report error: ~w ~w ~n", [Reason, ContentList])
	end.
