-module(type).

%% 指定数据和函数类型

-spec plan(point(), point()) -> route().
-type direction() :: north | south | east | west.
-type point() :: {integer(), integer()}.
-type route() :: [{go, direction(), integer()}].

%% -spec 规定了函数能传入的参数和输出的变量结果类型.
%% -type 规定了这个变量会含有的变量类型,比如direction规定输出的必须是上述四个之一,点规定输出必须是两个整数元组.

%% -spec 这个指定函数类型同样也可以写注解-spec plan(From :: point(), To :: point()) -> route().
%% -type :: 后的 A..B代表范围只能从A到B.

%% 不透明类型:
%% 通过-opaque fun() :: [{}] 创建不透明类型即其他模块也可以使用

%% dialyzer:
%% 使用需要对打算使用的所有标准类型库建立缓存.
%% dialyzer --build_plt --apps erts kernel stdlib 这步的操作生成erts kernel stdlib的PLT,持久性查询表
%% 接下来只需要对想分析的文件使用即可 dialyzer test.erl
