%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_login
%%% Created on : 2020/8/3 0003 21:39
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_login).
-author("glendy").
-include("mongodb.hrl").

%% API
-export([
	fetch_role_list/1
]).

fetch_role_list(Account) ->
	mongo_poolboy:find(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"account">>, Account)}).
