%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 三月 2021 16:05
%%%-------------------------------------------------------------------
-module(mod_cluster_group).
-author("13661").

-include("common.hrl").
-include("cluster.hrl").

%% API
-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

start_link() ->
    mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
    mod_server:sync_stop(?MODULE).

do_init([]) ->
    erlang:process_flag(trap_exit, true),
    ets:new(?ETS_CLUSTER_GROUP, [{keypos, #cluster_group.group_id}, named_table, protected, set, {read_concurrency,true}]),
    ets:new(?ETS_CLUSTER_SERVER_GROUP, [{keypos, 1}, named_table, protected, set, {read_concurrency,true}]),

    {ok, undefined}.

do_db_init(State, []) ->
    GroupList = db_cluster_group:load_cluster_group(), 
    refresh_group(GroupList),
    
    erlang:send_after(lib_timer:minute_second(), self(), min_timer),
    {noreply, State}.

do_call(_Info, _From, State) ->
    {reply, State, State}.

do_cast(_Info, State) ->
    {noreply, State}.

do_info(min_timer, State) ->
    ?INFO("load back cluster group"),
    erlang:send_after(lib_timer:minute_second() * 1000, self(), min_timer),
    
    GroupList = db_cluster_group:load_cluster_group(),
    {NewList, DelList, UpdateList} = refresh_group(GroupList),

    [process_new_group(Group) || Group <- NewList],
    [process_del_group(Group) || Group <- DelList],
    [process_group_update(Group) || Group <- UpdateList],

    {noreply, State}
;
do_info(_Info, State) ->
    {noreply, State}.

do_terminate(_Reason, _State) ->
    ok.

do_code_change(_Mod, State) ->
    mod_server:put_callback_mod(?MODULE),
    {ok, State}.

refresh_group(GroupList) ->
    OldGroupList = ets:tab2list(?ETS_CLUSTER_GROUP),

    GroupMap = 
    lists:foldl(fun(Group, Map) -> 
        maps:put(Group#cluster_group.group_id, Group, Map)    
    end, maps:new(), GroupList),

    OldGroupMap = 
    lists:foldl(fun(Group, Map) -> 
        maps:put(Group#cluster_group.group_id, Group, Map)    
    end, maps:new(), OldGroupList),

    ServerGroupList =
    maps:fold(fun(GroupId, Group, List) -> 
        lists:foldl(fun(Server, List1) -> 
            [{Server#cluster_server.server_flag, GroupId} | List1]
        end, List, Group#cluster_group.server_list)  
    end, [], GroupMap),

    ets:safe_fixtable(?ETS_CLUSTER_GROUP, true),
    ets:safe_fixtable(?ETS_CLUSTER_SERVER_GROUP, true),

    {NewGroupList, UpdateGroupList} = 
    lib_common:list_foldl(fun(Group, {NewList, UpdateList} = Acc) -> 
        GroupId = Group#cluster_group.group_id,
        case maps:is_key(GroupId, OldGroupMap) of
            false -> 
                ets:insert(?ETS_CLUSTER_GROUP, Group),
                {[Group | NewList], UpdateList};
            true ->
                OldGroup = maps:get(GroupId, OldGroupMap),
                ?JUDGE_CONTINUE(OldGroup#cluster_group.update_tick =/= Group#cluster_group.update_tick, Acc),
                ets:insert(?ETS_CLUSTER_GROUP, Group),
                {NewList, [Group | UpdateList]}
        end
    end, {[], []}, GroupList),

    DelGroupList =
    lib_common:map_fold(fun(GroupId, Group, List) -> 
        ?JUDGE_CONTINUE(not maps:is_key(GroupId, GroupMap), List),
        ets:delete(?ETS_CLUSTER_GROUP, GroupId),
        [Group | List]
    end, [], OldGroupMap),

    ets:delete_all_objects(?ETS_CLUSTER_SERVER_GROUP),
    ets:insert(?ETS_CLUSTER_SERVER_GROUP, ServerGroupList),

    ets:safe_fixtable(?ETS_CLUSTER_GROUP, false),
    ets:safe_fixtable(?ETS_CLUSTER_SERVER_GROUP, false),

    {NewGroupList, DelGroupList, UpdateGroupList}
.

process_new_group(Group) ->
    ?INFO("cluster group new : ~p ~p", [Group#cluster_group.group_id, Group#cluster_group.server_list]),
    pass
.

process_del_group(Group) ->
    ?INFO("cluster group del : ~p ~p", [Group#cluster_group.group_id, Group#cluster_group.server_list]),
    pass
.

process_group_update(Group) ->
    ?INFO("cluster group update : ~p ~p", [Group#cluster_group.group_id, Group#cluster_group.server_list]),
    pass
.