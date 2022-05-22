%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: util.erl
%% Created on : 2019-05-06 15:27:15
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-15 09:10:26
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(util).
-compile(export_all).

-include("common.hrl").

md5(S) ->
    lists:flatten([io_lib:format("~2.16.0b", [N])
		   || N <- binary_to_list(erlang:md5(S))]).

mod_by_recogn(Recogn) when is_integer(Recogn) ->
	to_atom("ProtoClient_" ++ integer_to_list(10000 + (Recogn div 1000) rem 10000));
mod_by_recogn(Recogn) ->
	mod_by_recogn(to_integer(Recogn)).

msgname_by_recogn(Recogn) when is_integer(Recogn) ->
	to_atom("Proto" ++ integer_to_list(Recogn));
msgname_by_recogn(Recogn) ->
	msgname_by_recogn(to_integer(Recogn)).

%% 消息类名转对应消息号
recogn_by_msgname(MsgName) ->
	StrRecogn = string:substr(util:to_list(MsgName), 6),
	util:to_integer(StrRecogn).

req_to_res_recogn(Recogn) when Recogn >= 10000000 andalso Recogn < 20000000 ->
	Recogn + 40000000;
req_to_res_recogn(Recogn) ->
	Recogn.

%% 游戏输出日志文件名
log_filename(BaseDir) ->
%    BaseDir2 = filename:join(BaseDir,to_list(node()) ++ "_"),
    log_filename(BaseDir, ".log").

log_filename(FilePrefix, FileSuffix) ->
    {{Y, M, D},{H,_,_}} = erlang:localtime(),
    NewM = one_to_two(M),
    NewD = one_to_two(D),
    NewH = one_to_two(H),
    lists:concat([FilePrefix,Y,"-",NewM,"-",NewD,"-",NewH,FileSuffix]).

one_to_two(One) ->
    Two = io_lib:format("~2..0B", [One]),
    lists:flatten(Two).

set_ref(Key,Ref) ->
	OldRef = erlang:get(Key),
	case erlang:is_reference(OldRef) of
		true -> erlang:cancel_timer(OldRef);
		_ -> ok
	end,
	put(Key, Ref).

get_ref(TimerKey) ->
	get(TimerKey).

%% 向上取整
ceil(N) ->
    T = trunc(N),
    case N == T of
      true -> T;
      false -> 1 + T
    end.

%% 向下取整
floor(X) ->
    T = trunc(X),
    case X < T of
      true -> T - 1;
      _ -> T
    end.

sleep(T) -> receive  after T -> ok end.

sleep(Min,Max) ->
    rand_sleep(Min,Max).

rand_sleep(Min,Max) ->
    SleepTime = rand(Min,Max),
    sleep(SleepTime).

rand(N) when is_integer(N) ->
    rand(1,N);
rand([]) ->
    [];
rand([_ | _] = L) ->
    Nth = rand(length(L)),
    lists:nth(Nth, L).

rand(Same, Same) -> Same;
rand(Value1, Value2) when Value1 > Value2 ->
    rand(Value2,Value1);
rand(Min,Max) ->
    M = Min - 1, 
    rand:uniform(Max - M) + M.

rand_one([]) ->
    [];
rand_one([H]) ->
    H;
rand_one(L) when is_list(L) ->
    Len = length(L),
    N = rand(1,Len),
    lists:nth(N,L).

random_sort(L) ->
	[X||{_, X} <- lists:sort([{rand:uniform(), N} || N <- L])].

weight_rand(L) ->
    Sum = lists:sum([R || {R,_V} <- L]),
	weight_rand(L, Sum).
weight_rand(L, Sum) ->
    Rand = util:rand(Sum),
    weight_rand(L,Rand,0).

weight_rand([{_R,V}],_Rand, _N) ->
    V;
weight_rand([{R,V} | T],Rand, N) ->
    case Rand >= N andalso Rand < N + R of
        true -> V;
        _ -> weight_rand(T,Rand,N + R)
    end.

%% @doc 获取远程客户端连过来的IP
get_ip(Socket) ->
    case inet:peername(Socket) of
        {ok,{IpAddr, _Port}} ->
            IpAddr2 = tuple_to_list(IpAddr),
            IpAddr3 = implode(".",IpAddr2),
            lists:flatten(lists:concat([IpAddr3]));
        {error,Reason} ->
            ?WARNING("get_ip fail,Socket:~w,Reason:~w",[Socket,Reason]),
            ""
    end.

%% @doc 在List中的每两个元素之间插入一个分隔符
implode(_S, [])-> 
    [<<>>];
implode(S, L) when is_list(L) ->    
    implode(S, L, []).
implode(_S, [H], NList) ->
    lists:reverse([thing_to_list(H) | NList]);
implode(S, [H | T], NList) ->
    L = [thing_to_list(H) | NList],
    implode(S, T, [S | L]).

make_sign(Data) ->
	Key = ?CONFIG(web_key),
    make_sign(Data,Key).

%% 按键名排序后,值+key组成一个list后生成md5值
make_sign(Data,Key) ->
    Data2 = lists:sort(Data),
    Data3 = [util:to_list(Val) || {_Key,Val} <- Data2] ++ [Key],
    Str = lists:concat(Data3),
    util:md5(Str).

%%f2s(N) when is_integer(N) ->
%%    integer_to_list(N) ++ ".00";
f2s(F) when is_float(F) ->
    [A] = io_lib:format("~.2f", [F]), A.

term_to_string(Term) ->
    binary_to_list(list_to_binary(io_lib:format("~w",[Term]))).

term_to_bitstring(Term) ->
    erlang:list_to_bitstring(io_lib:format("~w", [Term])).

string_to_term(String) when is_binary(String) ->
    string_to_term(to_list(String));
string_to_term(String) ->
    case erl_scan:string(String ++ ".") of
      {ok, Tokens, _} ->
          case erl_parse:parse_term(Tokens) of
              {ok, Term} -> 
                  Term;
              Err ->
                  try
                      String = false
                  catch
                      _:_ ->
                          ?WARNING("Parse Term Error,String:~w,Err:~w",[String,Err])
                  end,
                  undefined
          end;
      Error -> 
          ?WARNING("erl Scan Error,String:~w,Err:~w",[String,Error]),
          undefined
    end.

ip_string_format(IpString) ->
	try
		[case S of $,->$.;S1->S1 end || S <- util:to_list(IpString), S/=${ andalso S/=$} ]
	catch
		_:_ ->
			IpString
	end.

bitstring_to_term(undefined) -> undefined;
bitstring_to_term(BitString) when is_binary(BitString) ->
    string_to_term(binary_to_list(BitString)).

to_integer(Msg) when is_integer(Msg) -> Msg;
to_integer(Msg) when is_binary(Msg) ->
    Msg2 = binary_to_list(Msg), list_to_integer(Msg2);
to_integer(Msg) when is_list(Msg) ->
    list_to_integer(Msg);
to_integer(Msg) when is_float(Msg) -> round(Msg);
to_integer(Msg) when is_boolean(Msg) ->
	if
		Msg =:= true -> 1;
		true -> 0
	end;
to_integer(_Msg) -> throw(other_value).

to_float(Msg) when is_integer(Msg) -> Msg;
to_float(Msg) when is_binary(Msg) ->
    to_float(to_list(Msg));
to_float(Msg) when is_float(Msg) -> Msg;
to_float(Msg) when is_list(Msg) -> 
    try 
        erlang:list_to_float(Msg)
    catch _:_ ->
        erlang:list_to_integer(Msg)
    end;
to_float(_Msg) -> throw(other_value).

to_binary(Msg) when is_binary(Msg) -> Msg;
to_binary(Msg) when is_atom(Msg) ->
    list_to_binary(atom_to_list(Msg));
to_binary(Msg) when is_list(Msg) ->
    unicode:characters_to_binary(Msg, utf8);
to_binary(Msg) when is_integer(Msg) ->
    list_to_binary(integer_to_list(Msg));
to_binary(Msg) when is_float(Msg) ->
    list_to_binary(f2s(Msg));
to_binary(Msg) when is_tuple(Msg) ->	%% 此处不能处理带中文的tuple
    list_to_binary(tuple_to_list(Msg));
to_binary(_Msg) -> throw(other_value).

to_atom(Msg) when is_atom(Msg) -> Msg;
to_atom(Msg) when is_binary(Msg) ->
    list_to_atom2(binary_to_list(Msg));
to_atom(Msg) when is_list(Msg) ->
    list_to_atom2(Msg);
to_atom(Msg) when is_integer(Msg) ->
    list_to_atom2(erlang:integer_to_list(Msg));
to_atom(_) -> throw(other_value).

list_to_atom2(List) when is_list(List) ->
    case catch list_to_existing_atom(List) of
      {'EXIT', _} -> erlang:list_to_atom(List);
      Atom when is_atom(Atom) -> Atom
    end.

to_list(Msg) when is_list(Msg) -> Msg;
to_list(Msg) when is_atom(Msg) -> atom_to_list(Msg);
%%to_list(Msg) when is_binary(Msg) -> binary_to_list(Msg);
to_list(Msg) when is_binary(Msg) -> unicode:characters_to_list(Msg, utf8);
to_list(Msg) when is_integer(Msg) ->
    integer_to_list(Msg);
to_list(Msg) when is_float(Msg) -> f2s(Msg);
to_list(Msg) when is_tuple(Msg) -> tuple_to_list(Msg);
to_list(_) -> throw(other_value).

thing_to_list(X) when is_integer(X) ->
    integer_to_list(X);
thing_to_list(X) when is_float(X)   ->
    float_to_list(X);
thing_to_list(X) when is_atom(X)    -> 
    atom_to_list(X);
thing_to_list(X) when is_binary(X)  -> 
    binary_to_list(X);
thing_to_list(X) when is_list(X)    -> 
    X.

int_to_long(High, Low) when is_integer(High) andalso is_integer(Low) ->
	Bin = <<Low:32/little, High:32/little>>,
	<<Value:64/little>> = Bin,
	Value;
int_to_long(High, Low) ->
	int_to_long(to_integer(High), to_integer(Low)).

long_to_int(Value) when is_integer(Value) ->
	Bin = <<Value:64/little>>,
	<<Low:32/little, High:32/little>> = Bin,
	{High, Low};
long_to_int(Value) ->
	long_to_int(to_integer(Value)).

%% 防止各种乱码问题
format_chinese(Content, Args) ->
	NewArgs = [util:to_binary(V) || V <- Args],
	util:to_binary(io_lib:format(util:to_list(Content), NewArgs)).

%% 判断某个整数值在列表
%% 参数: 检查值, 列表
is_in_list(Value, List) ->
	lists:any(fun(V) -> V =:= Value end, List).

%%取元素最多的列
get_max_length_list(List1, List2) when length(List1) < length(List2)->
	List2;
get_max_length_list(List1, _List2) ->
	List1.

%% 初始化指定大小的列表
init_list(Size, _InitValue) when Size =< 0->
	[];
init_list(Size, InitValue) ->
	lists:duplicate(Size, InitValue).

%% 保证列表的最小大小
list_resize(List, Size, _InitValue) when length(List) >= Size ->
	List;
list_resize(List, Size, InitValue) ->
	AddSize = Size - length(List),
	list_resize_append(List, AddSize, InitValue).
list_resize_append(List, AddSize, InitValue) ->
	List ++ lists:duplicate(AddSize, InitValue).

%% 把List第N个元素替换为V值，返回新的列表
list_replace(V, N, List) ->
	{_, NewList} = 
		lists:foldl(fun(Value, {AccIndex0, AccList0}) ->
			if 
				AccIndex0 =:= N -> {AccIndex0 + 1, [V | AccList0]};
				true -> {AccIndex0 + 1, [Value | AccList0]}
			end
		end, {1, []}, List),
	lists:reverse(NewList).

%% 把值为V的元素删除
list_remove(V, List) ->
	[ V1 || V1 <- List, V1 =/= V ].

list_find_by_two_key(KV1, KN1, KV2, KN2, List) ->
	try
		lists:foldl(
			fun(Value, Acc0) ->
				ValueList = to_list(Value),
				V1 = lists:nth(KN1, ValueList),
				V2 = lists:nth(KN2, ValueList),
				if
					KV1 =:= V1 andalso KV2 =:= V2 -> throw({ok, Value});
					true -> Acc0
				end
			end, false, List)
	catch
	    throw:{ok, VRet}  -> VRet
	end.

list_store_by_two_key(KV1, KN1, KV2, KN2, List, Tuple) ->
	{HasKey, NewList} =
		lists:foldr(
			fun(Value, {_, AccList0}) ->
				ValueList = to_list(Value),
				V1 = lists:nth(KN1, ValueList),
				V2 = lists:nth(KN2, ValueList),
				if
					KV1 =:= V1 andalso KV2 =:= V2 -> {true, [Tuple | AccList0]};
					true -> {false, [Value | AccList0]}
				end
			end, {false, []}, List),
	if
		HasKey =:= true -> NewList;
		true -> [Tuple | NewList]
	end.

%% 查找Dict字典的键Key的值
dict_get(Key, Dict, Default) ->
	case dict:find(Key, Dict) of
		{ok, Value} -> Value;
		_ -> Default
	end.

%% 查找Dict字典的键Key的值,找到相加
dict_get_add(Key, Dict, Default) ->
	case dict:find(Key, Dict) of
		{ok, Value} -> Value + Default;
		_ -> Default
	end
.

%% Dict全部值
dict_values(Dict) ->
	dict:fold(fun(_, V, L) -> [V | L] end, [], Dict).

%% 去掉 ~
check_valid1(ErlStr) ->
  re:replace(ErlStr, "~{1,999}", "~~", [global, {return, binary}]).

%%获取元素在列表中的位置
get_obj_index(Obj, List) ->
  get_ListsIndex(Obj, List, 1).

get_ListsIndex(Obj, [First | Other], Index) ->
  case First =:= Obj of
    true ->
      Index;
    false ->
      get_ListsIndex(Obj, Other, Index + 1)
  end;
get_ListsIndex(_Obj, [], _Index) ->
  undefined.

%% 合并两个maps值相加
maps_merge(Left, Right) ->
	List = maps:to_list(Left),
	merge(List, Right)
.
merge([{K, V} | L], M) ->
	V2 =
		if
			is_list(V) -> V1 = maps:get(K, M, []), V1 ++ V;
			true -> V1 = maps:get(K, M, 0), V1 + V
		end,
	M1 = maps:put(K, V2, M),
	merge(L, M1)
;
merge([], M) ->
	M
.

