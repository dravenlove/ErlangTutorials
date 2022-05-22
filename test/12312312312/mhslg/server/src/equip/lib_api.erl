%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 11. Aug 2021 10:18 AM
%%%-------------------------------------------------------------------
-module(lib_api).
-author("lichaoyu").

%% API
-export([		%% 列表 list
	list_del_excess/1,
	list_index/2
]).

-export([		%% 文件 file
	file_json/1,
	file_binary/1
]).

%% 列表去重
list_del_excess(L) ->
	list_del_excess(L, [])
.
list_del_excess([I | L], L1) ->
	L2 =
		case lists:member(I, L1) of
			true -> L1;
			false -> [I | L1]
		end,
	list_del_excess(L, L2)
;
list_del_excess([], L) ->
	L
.

%% 获取元素在列表的位置
list_index(E, L) ->
	list_index(E, L, 1)
.
list_index(E, [E | _L], I) ->
	I
;
list_index(E, [_E0 | L], I) ->
	list_index(E, L, I + 1)
;
list_index(_E, [], _I) ->
	0
.


%% 读取文件json格式
file_json(Path) ->
	{ok, FileBinary} = file:read_file(Path),
	jsx:decode(FileBinary, [return_maps])
.

%% 读取文件binary格式
file_binary(Path) ->
	file_binary(Path, 1024 * 1024)
.
file_binary(Path, Size) ->
	{ok, File} = file:open(Path, [raw, binary]),
	{ok, Binary} = file:read(File, Size),
	Binary
.
