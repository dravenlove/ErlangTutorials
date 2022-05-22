%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 三月 2021 16:06
%%%-------------------------------------------------------------------
-module(db_cluster_group).
-author("13661").

-include("common.hrl").
-include("cluster.hrl").

%% API
-export([
    load_cluster_group/0
]).

bson_to_cluster_server(Bson) ->
    #cluster_server{
        server_flag = ?BSON_STRING(Bson, server_flag),
        country = ?BSON_INT(Bson, country)
    }
.

bson_to_cluster_group(Bson) ->
    #cluster_group{
        group_id = ?BSON_INT(Bson, group_id),
        server_list = [bson_to_cluster_server(BsonServer) || BsonServer <- ?BSON_LIST(Bson, server_list)],
        update_tick = ?BSON_INT(Bson, update_tick)
    }
.

% cluster_server_to_bson(Server) when is_record(Server, cluster_server) ->
%     #{
%         ?BSONSET_STRING(server_flag, Server#cluster_server.server_flag),
%         ?BSONSET_INT(country, Server#cluster_server.country)
%     }
% .

% cluster_group_to_bson(Group) when is_record(Group, cluster_group) ->
%     #{
%         ?BSONSET_INT(group_id, Group#cluster_group.group_id),
%         ?BSONSET_INT(update_tick, Group#cluster_group.update_tick),
%         ?BSONSET_LIST(server_list, [cluster_server_to_bson(Server) || Server <- Group#cluster_group.server_list])
%     }
% .

load_cluster_group() ->
    GroupList = 
	case mongo_poolboy:find(?BACK_POOL, ?DBBACK_CLUSTER_GROUP, #{}) of
		BsonList = [_|_] ->
			[bson_to_cluster_group(BsonGroup) || BsonGroup <- BsonList];
		_ ->
			[]
	end,

    % lists:map(fun(Group) ->
    %     QueryBson = #{
    %         ?BSONSET_BOOL(update, true),
    %         ?BSONSET_INT(group_id, Group#cluster_group.group_id),
    %         ?BSONSET_INT(update_tick, Group#cluster_group.update_tick)
    %     },
    %     UpdateBson = #{
    %         ?BSONSET_BSON("$set", #{
    %             ?BSONSET_BOOL(update, false)
    %         })
    %     },
    %     ?INFO("write mongo ~p ~p", [Group#cluster_group.group_id, Group#cluster_group.update_tick]),
    %     mongo_poolboy:async_update(?BACK_POOL,?DBBACK_CLUSTER_GROUP, QueryBson, UpdateBson, false, false)    
    % end, GroupList),

    GroupList
.