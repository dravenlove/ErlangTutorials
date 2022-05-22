%% 热更新模块
%% u:u().       热更代码
%% u:code().    执行函数
%% u:m().       编译代码
%% author: kongqingquan<kqqsysu@gmail.com>

-module(u).
-author('kqqsysu@gmail.com').

-include("log.hrl").

-define(BEAM_PATH,beam_path()).

%-export([u/0,u/1,code/0,m/0]).
-compile(export_all).

u() ->
    ?WARNING("======= begin reload code ========="),
    Mods = get_changed_mods(),
    u(Mods),
    ?WARNING("======= reload code finish ========").

u(Mod) when is_atom(Mod) ->
    u([Mod]);
u([Mod |T])->
	try
    	?INFO("reload ~s~n",[Mod]),
    	reload(Mod)
	catch
		Err:Reason ->
			?ERROR("reload[~p] error ~p:~p~n", [Mod, Err, Reason])
	end,
    u(T);
u([]) -> ok.

reload(Mod) ->
    code:purge(Mod),
    code:load_file(Mod).

get_changed_mods() ->
    {ok,FileList} = file:list_dir(?BEAM_PATH),
    get_changed_mods(FileList,[]).

get_changed_mods([File | T],Mods) ->
    Mods2 =
    case string:tokens(File,".") of
        [StrMod,"beam"] ->
            Mod = list_to_atom(StrMod),
            FileVsn = get_file_vsn(File),
            CodeVsn = get_code_vsn(Mod),
            case FileVsn of
                CodeVsn -> Mods;
                _ -> [Mod | Mods]
            end;
        _ -> Mods
    end,
    get_changed_mods(T,Mods2);
get_changed_mods([],Mods) -> Mods.

get_file_vsn(File) ->
    File2 = filename:join(?BEAM_PATH, File),
    case beam_lib:version(File2) of
        {ok,{_Mod,[Vsn]}} -> Vsn;
        _ -> false
    end.

get_code_vsn(Mod) ->
    Attr = Mod:module_info(attributes),
    case lists:keyfind(vsn,1,Attr) of
        {vsn,[Vsn]} -> Vsn;
        _ -> error
    end.

%% ====================================================
%% ====================== code ========================
%% ====================================================
code() ->
    CmdFile = "./cmd.txt",
    code(CmdFile).
code(CmdFile)->
    u(),
    case file:open(CmdFile,read) of
        {ok,Fd} ->
            eval_file(Fd),
            file:close(Fd),
            file:rename(CmdFile,CmdFile ++ "_");
        {error,Reasion} ->
            ?ERROR("open file:~s fail:~w~n",[CmdFile,Reasion])
    end.

eval_file(Fd) ->
    case file:read_line(Fd) of
        {ok,Str} ->
            ?WARNING("eval code:~w~n",[Str]),
            eval(Str),
            eval_file(Fd);
        eof -> ok
    end.

%% @doc 解析函数
eval(ErlStr) ->
    try
        {Result, _Bindings} = eval(ErlStr, erl_eval:new_bindings()),
        ?ERROR("Eval Result:~w~n",[Result])
    catch
        _:Err ->
            ?ERROR("eval Err:~w~n",[Err])
    end.

eval(ErlStr, Bindings) ->
    case check_valid(ErlStr) of
        true ->
            try eval_action(ErlStr, Bindings) of
                {value, Value, NewBindings} ->
                    {Value, NewBindings}
                catch
                    _:Error ->
                        {Error, Bindings}
                end;
            false ->
                {"illegal expression", Bindings}
        end.
eval_action(ErlStr, Bindings) ->
    {ok, Tokens, _EndLocation} = erl_scan:string(ErlStr),
    %% 表达式字符串后面要以点号结束
    NewTokens = 
    case lists:reverse(Tokens) of
        [{dot, _} | _] -> Tokens;
        TokensReverse -> lists:reverse([{dot, 1} | TokensReverse])
    end,
    {ok, ExprList} = erl_parse:parse_exprs(NewTokens),
    erl_eval:exprs(ExprList, Bindings).


%l @doc 检查表达式是否含有非法语句
check_valid(ErlStr) ->
    REList = ["application(.*)stop", "os(.*)cmd(.*)rm"],
    check_valid(REList, ErlStr, true).
check_valid([], _ErlStr, Bool) ->
    Bool;
check_valid([RE | R], ErlStr, Bool) ->
    case re:run(ErlStr, RE) of
        {match, _Captured} ->
            false;
        _ ->
            check_valid(R, ErlStr, Bool)
    end.

beam_path() ->
    Path = code:which(?MODULE),
    filename:dirname(Path).

%% ====================================================
%% ======================= m ==========================
%% ====================================================

m() ->
    m:all(),
    u().
