%% 在同一台计算机启动两个节点
%% 用案例1的程序让程序在两个节点跑起来

%% erl -sname "节点名称"
%% 在第一个节点启动服务器
%% 第二个几点用rpc:call/4调用函数
%% 有一个重要的点,节点名称应该用''括起来,他是一个原子

%%-module(test2).
%%-export([]).
