%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 三月 2021 14:37
%%%-------------------------------------------------------------------
-module(lib_cluster_grouop).
-author("13661").

-include("base.hrl").
-include("ets.hrl").
-include("cluster.hrl").

%% API
-export([
    is_have_group/1,           
    group_server_list/1,
    group_server_flag_list/1,
    server_group_id/1
]).

is_have_group(GroupId) ->
    ets:member(?ETS_CLUSTER_GROUP, GroupId)
.

group_info(GroupId) ->
    [Group] = ets:lookup(?ETS_CLUSTER_GROUP, GroupId),
    Group
.

group_server_list(GroupId) ->
    Group = group_info(GroupId),
    Group#cluster_group.server_list
.

group_server_flag_list(GroupId) ->
    ServerList = group_server_list(GroupId),
    [Server#cluster_server.server_flag || Server <- ServerList]
.

server_group_id(ServerFlag) ->
    case ets:member(?ETS_CLUSTER_SERVER_GROUP, ServerFlag) of
        false -> 0;
        true -> ets:lookup_elememt(?ETS_CLUSTER_SERVER_GROUP, ServerFlag, 2)
    end
.