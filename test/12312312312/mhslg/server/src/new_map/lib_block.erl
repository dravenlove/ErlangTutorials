%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 26. Aug 2021 7:50 PM
%%%-------------------------------------------------------------------
-module(lib_block).
-author("lichaoyu").
-include("map.hrl").

%% API
-export([
	block_run/1,
	block_list/1,
	type_map/0,

	objects/1,
	to_block/1,

	process_name/1,
	pid/1
]).

-define(WRITE_PATH(Name),	"E:/erl_test/test1/" ++ Name ++ ?TXT_SUFFIX).
-define(READ_PATH(Name),	"./src/data_conf/tile/" ++ Name ++ ?TXT_SUFFIX).
-define(EBIN_PATH,			"./ebin/").
-define(JSON_SUFFIX,		".json").
-define(TXT_SUFFIX,			".txt").
-define(JSON_PATH(Name),	?EBIN_PATH ++ Name ++ ?JSON_SUFFIX).
-define(TXT_PATH(Name),		?EBIN_PATH ++ Name ++ ?TXT_SUFFIX).
-define(DEMO_MAP,			"demo_map").		%% 模拟大世界配置
-define(WORLD_MAP,			"world_map").		%% 正式配置

-define(NAME_LIST,			[<<"way">>, <<"Lmountain">>]).
-define(CONFIG_RATIO(N),	N div 10).		%% 配置转换
-define(TILE(Config), 		list_to_binary(Config ++ "-tile")).
-define(GRID_SIZE,			150).	%% 一个格子对应txt的大小
-define(CUT_SIZE,			75).	%% 切块大小

-define(OBJECTS,	<<"objects">>).
-define(LAYERS,		<<"layers">>).
-define(X,			<<"x">>).
-define(Y,			<<"y">>).
-define(HEIGHT,		<<"height">>).
-define(WIDTH,		<<"width">>).
-define(ID,			<<"id">>).
-define(NAME,		<<"name">>).
-define(TYPE,		<<"type">>).

block_run(BlockList) ->
	run_str(BlockList, "get(_) -> 0.\n")
.
run_str([Block | BlockList], Str) ->
	Id = Block#block.id,
	X = Block#block.x div ?CUT_SIZE,
	Y = Block#block.y div ?CUT_SIZE,
	PosTuple = Block#block.pos_tuple,
	Height = tuple_size(PosTuple) div ?CUT_SIZE,
	Width = tuple_size(element(1, PosTuple)) div ?CUT_SIZE,
	YList = lists:seq(0, Height - 1),
	XList = lists:seq(0, Width - 1),
	YXList = [{X0 + X, Y0 + Y} || X0 <- XList, Y0 <- YList,
		begin
			XTuple = element(Y0 * ?CUT_SIZE + 1, PosTuple),
			element(X0 * ?CUT_SIZE + 1, XTuple) =/= ?SPACE
		end
	],
	Str0 = lists:foldl(
		fun({X0, Y0}, S) ->
			S0 = "get({" ++ integer_to_list(X0) ++ "," ++ integer_to_list(Y0) ++ "}) -> " ++ integer_to_list(Id) ++ ";\n",
			S0 ++ S
		end, Str, YXList),
	run_str(BlockList, Str0)
;
run_str([], Str) ->
	Src = "-module(tb_block_id).\n-export([get/1]).\n" ++ Str,
	{Mod, Code} = dynamic_compile:from_string(Src),
	code:purge(Mod),
	code:load_binary(Mod, Mod, Code)
.

block_list(Config) ->
	Json = lib_api:file_json(?JSON_PATH(?WORLD_MAP)),
	Layers = maps:get(?LAYERS, Json),
	XYMap = layers_map(Layers),
	TileLayer = find(?TILE(Config), Layers),
	Objects = maps:get(?OBJECTS, TileLayer),
	TypeMap = type_map(),
%%	write_txt(?WRITE_PATH("1"), (block(hd(Objects), XYMap, TypeMap))#block.pos_tuple)
	[block(Object, XYMap, TypeMap) || Object <- Objects, maps:get(?NAME, Object) =/= <<>>]
.
%% 将地块类型txt导入map
type_map() ->
	TypeList = [
		<<"00">>, <<"01">>, <<"02">>, <<"03">>, <<"04">>,
		<<"05">>, <<"06">>, <<"07">>, <<"08">>, <<"09">>,
		<<"11">>, <<"12">>, <<"13">>, <<"14">>,
		<<"15">>, <<"16">>, <<"17">>, <<"18">>, <<"19">>,
		<<"20">>, <<"21">>, <<"22">>, <<"23">>
	],
	List = [{Type, type(Type)} || Type <- TypeList],
	maps:from_list(List)
.
type(Type) ->
	Type0 = binary_to_list(Type),
	{ok, FileBinary} = file:read_file(?TXT_PATH(Type0)),
	type_txt_binary(FileBinary, [], [])
.
type_txt_binary(<<$\n, Binary/binary>>, XList, YXList) ->
	XList0 = lists:reverse(XList),
	type_txt_binary(Binary, [], [XList0 | YXList])
;
type_txt_binary(<<?CANT_GO, Binary/binary>>, XList, YXList) ->
	type_txt_binary(Binary, [?CANT_GO | XList], YXList)
;
type_txt_binary(<<?CAN_GO, Binary/binary>>, XList, YXList) ->
	type_txt_binary(Binary, [?CAN_GO | XList], YXList)
;
type_txt_binary(<<?CANT_FIGHT, Binary/binary>>, XList, YXList) ->
	type_txt_binary(Binary, [?CANT_FIGHT | XList], YXList)
;
type_txt_binary(<<>>, XList, YXList) ->
	[XList | YXList]
.
%% 将json中layers的路和山导入到map
layers_map(Layers) ->
	layers_map(Layers, [])
.
layers_map([Layer | Layers], List) ->
	<<_:2/binary, Name0/binary>> = maps:get(?NAME, Layer),
	List0 =
		case lists:member(Name0, ?NAME_LIST) of
			false -> List;
			true ->
				Objects = maps:get(?OBJECTS, Layer),
				List1 = [object(Object) || Object <- Objects],
				List1 ++ List
		end,
	layers_map(Layers, List0)
;
layers_map([], List) ->
	maps:from_list(List)
.
object(Object) ->
	X = ?CONFIG_RATIO(maps:get(?X, Object)),
	Y = ?CONFIG_RATIO((maps:get(?Y, Object) - maps:get(?HEIGHT, Object))),
	Type = maps:get(?TYPE, Object),
	{{X, Y}, Type}
.
%% 处理一个地块
block(Object, XYMap, TypeMap) ->
	Height = ?CONFIG_RATIO(maps:get(?HEIGHT, Object)),
	Width = ?CONFIG_RATIO(maps:get(?WIDTH, Object)),
	InitYXList = init_y_x_list((Width + 2) * ?GRID_SIZE, (Height + 2) * ?GRID_SIZE, ?SPACE),
	Type = maps:get(?TYPE, Object),
	AddTileYXList = set_y_x_list(maps:get(Type, TypeMap), ?GRID_SIZE, ?GRID_SIZE, InitYXList),
	X = ?CONFIG_RATIO(maps:get(?X, Object)),
	Y = ?CONFIG_RATIO(maps:get(?Y, Object)) - Height,
	XList = lists:seq(X - 1, X + Width),
	YList = lists:seq(Y - 1, Y + Height),
	XYList = [{X0 - X + 1, Y0 - Y + 1, maps:get(OtherType, TypeMap)}
		|| X0 <- XList, Y0 <- YList,
		(OtherType = maps:get({X0, Y0}, XYMap, false)) =/= false],
	AddOtherYXList = add_other_y_x_list(XYList, AddTileYXList),
	CutYXList = cut_y_x_list(Type, AddOtherYXList),
	Tuple = to_tuple(CutYXList),
	to_block(Object#{
		?X => X * ?GRID_SIZE - ?CUT_SIZE,
		?Y => Y * ?GRID_SIZE - ?CUT_SIZE,
		pos_tuple => Tuple
	})
.
%% 初始化地块
init_y_x_list(Width, Height, Define)->
	WidthList = lists:duplicate(Width, Define),
	lists:duplicate(Height, WidthList)
.
%% 添加山脉和安全区域
add_other_y_x_list([{X, Y, YXList} | List], Tuple) ->
	Tuple0 = set_y_x_list(YXList, X * ?GRID_SIZE, Y * ?GRID_SIZE, Tuple),
	add_other_y_x_list(List, Tuple0)
;
add_other_y_x_list([], Tuple) ->
	Tuple
.
set_y_x_list(YXList, X, Y, YXTuple) ->
	{YList1, YList2} = lists:split(Y, YXTuple),
	{YList, YList3} = lists:split(length(YXList), YList2),
	YList0 = set_y_list(YXList, YList, X),
	YList1 ++ YList0 ++ YList3
.
set_y_list([L1 | YXList], [L2 | List], X) ->
	[set_x_list(L1, X, L2) | set_y_list(YXList, List, X)]
;
set_y_list([], [], _X) ->
	[]
.
set_x_list(XList, X, XTuple) ->
	{XList1, XList2} = lists:split(X, XTuple),
	{_, XList3} = lists:split(length(XList), XList2),
	XList1 ++ XList ++ XList3
.
%% 切图成常规大小
cut_y_x_list(Type, YXList) ->
	TypeYXList = type_list(Type),
	YXList0 = lists:nthtail(?CUT_SIZE, YXList),
	cut_y_x_list(TypeYXList, YXList0, [])
.
cut_y_x_list([TypeXList | TypeYXList], BlockYXList, YXList) ->
	{BlockYXList1, BlockYXList2} = lists:split(?CUT_SIZE, BlockYXList),
	YXList0 = [cut_x_list(TypeXList, lists:nthtail(?CUT_SIZE, BlockXList), []) || BlockXList <- BlockYXList1],
	cut_y_x_list(TypeYXList, BlockYXList2, YXList ++ YXList0)
;
cut_y_x_list([], _YXList, YXList) ->
	YXList
.
cut_x_list([?SPACE | TypeXList], BlockXList, XList) ->
	{_BlockXList1, BlockXList2} = lists:split(?CUT_SIZE, BlockXList),
	List0 = lists:duplicate(?CUT_SIZE, ?SPACE),
	cut_x_list(TypeXList, BlockXList2, XList ++ List0)
;
cut_x_list([?CANT_GO | TypeXList], BlockXList, XList) ->
	{BlockXList1, BlockXList2} = lists:split(?CUT_SIZE, BlockXList),
	cut_x_list(TypeXList, BlockXList2, XList ++ BlockXList1)
;
cut_x_list([], _BlockXList, XList) ->
	XList
.
%% 转换
to_tuple(YXList) ->
	list_to_tuple([list_to_tuple(XList) || XList <- YXList])
.

%%write_txt(PATH, Tuple) ->
%%	XTupleList0 = tuple_to_list(Tuple),
%%	XTupleList = lists:reverse(XTupleList0),
%%%%	List = [tuple_to_list(XTuple) || XTuple <- XTupleList],
%%	List = lists:foldl(
%%		fun(XTuple, List0) ->
%%			XList = tuple_to_list(XTuple),
%%			XList ++ "\n" ++ List0
%%		end, [], XTupleList),
%%	Binary = list_to_binary(List),
%%	file:write_file(PATH, Binary)
%%.

objects(Name) ->
	Json = lib_api:file_json(?JSON_PATH(Name)),
	Layers = maps:get(<<"layers">>, Json),
	Layer = find(Name, Layers),
	maps:get(<<"objects">>, Layer)
.
find(Name, [Layers | LayersList]) ->
	case maps:get(<<"name">>, Layers) of
		Name -> Layers;
		_ -> find(Name, LayersList)
	end
.

to_block(Object) ->
	ObjectList = maps:to_list(Object),
	lists:foldl(fun to_block/2, #block{}, ObjectList)
.
to_block({?NAME, Data}, Block) ->
	Block#block{id = binary_to_integer(Data)}
;
to_block({?X, Data}, Block) ->
	Block#block{x = Data}
;
to_block({?Y, Data}, Block) ->
	Block#block{y = Data}
;
to_block({pos_tuple, Data}, Block) ->
	Block#block{pos_tuple = Data}
;
to_block(_, Block) ->
	Block
.

process_name(Name) ->
	list_to_atom("mod_block_" ++ integer_to_list(Name))
.

pid(Name) ->
	ProcessName = process_name(Name),
	whereis(ProcessName)
.

-define(BLOCK_TYPE_1, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ]
]).
-define(BLOCK_TYPE_2, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$ ,$ ,$ ,$ ,$ ,$ ,$0,$0,$0,$0],
	[$ ,$ ,$ ,$ ,$ ,$ ,$ ,$ ,$0,$0,$0,$0]
]).
-define(BLOCK_TYPE_3, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0]
]).
-define(BLOCK_TYPE_4, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$ ,$ ,$ ,$ ,$ ,$ ],
	[$0,$0,$0,$0,$ ,$ ,$ ,$ ,$ ,$ ]
]).
-define(BLOCK_TYPE_5, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$ ,$ ,$ ,$ ],
	[$ ,$ ,$0,$0,$0,$0,$ ,$ ,$ ,$ ]
]).
-define(BLOCK_TYPE_6, 	[
	[$0,$0,$0,$0,$ ,$ ,$ ,$ ,$ ,$ ,$ ,$ ],
	[$0,$0,$0,$0,$ ,$ ,$ ,$ ,$ ,$ ,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0]
]).
-define(BLOCK_TYPE_7, 	[
	[$ ,$ ,$ ,$ ,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$ ,$ ,$ ,$ ,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$ ,$ ],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0,$0]
]).
-define(BLOCK_TYPE_8, 	[
	[$ ,$ ,$ ,$ ,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$ ,$ ,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0],
	[$ ,$ ,$0,$0,$0,$0,$0,$0,$0,$0]
]).
-define(BLOCK_TYPE_9, 	[
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0],
	[$0,$0,$0,$0,$0,$0,$0,$0,$0,$0]
]).
%%type_list(Type, Size) ->
%%	TypeList = type_list(Type),
%%	lists:foldl(
%%		fun(XList, List0) ->
%%			NewXList = lists:foldl(
%%				fun(I, List1) ->
%%					List1 ++ lists:duplicate(Size, I)
%%				end, [], XList),
%%			List0 ++ lists:duplicate(Size, NewXList)
%%		end, [], TypeList)
%%.
type_list(<<"01">>) -> ?BLOCK_TYPE_1;
type_list(<<"02">>) -> ?BLOCK_TYPE_2;
type_list(<<"03">>) -> ?BLOCK_TYPE_3;
type_list(<<"04">>) -> ?BLOCK_TYPE_4;
type_list(<<"05">>) -> ?BLOCK_TYPE_5;
type_list(<<"06">>) -> ?BLOCK_TYPE_6;
type_list(<<"07">>) -> ?BLOCK_TYPE_7;
type_list(<<"08">>) -> ?BLOCK_TYPE_8;
type_list(<<"09">>) -> ?BLOCK_TYPE_9.
