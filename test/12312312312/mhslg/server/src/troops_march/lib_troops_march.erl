%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%	地图进程调用进行部队行军
%%% @end
%%% Created : 02. 12月 2020 16:52
%%%-------------------------------------------------------------------
-module(lib_troops_march).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").

%% API
-export([
	put_troops/1,			%% 地图部队数据
	get_troops/0,
	put_troops_march/1,		%% 部队行军数据
	get_troops_march/0,
	troops_march_go_of_country/1

]).
-export([
	insert/1,		%% 地图进程调用
	lookup/0,		%% 全部部队
	lookup/1,		%% 单个部队
	select/1,		%% 查询条件
	combat_hero/1	%% 战斗信息
]).

put_troops(Troops) ->
	erlang:put(troops, Troops)
.
get_troops() ->
	erlang:get(troops)
.

insert(Troops) ->
	ets:insert(?ETS_TROOPS, Troops)
.
lookup() ->
	ets:tab2list(?ETS_TROOPS)
.
lookup(TroopsId) ->
	hd(ets:lookup(?ETS_TROOPS, TroopsId))
.
select(Info) ->
	ets:select(?ETS_TROOPS, Info)
.

combat_hero(TroopsId) ->
	(lookup(TroopsId))#troops.combat_hero
.



put_troops_march(TroopsMarch) ->
	erlang:put(troops_march, TroopsMarch)
.
get_troops_march() ->
	erlang:get(troops_march)
.

%%玩家登录通知地图行军数据
%%troops_march_go_of_country(Country) ->
%%	?DEBUG("troops_march_go_of_country ~p", [Country]),
%%	TroopsList = lib_troops_api:troops(get_troops_march()),
%%	[X || X <- TroopsList, X#troops.combat_hero#combat_hero.country =:= Country]
%%.
troops_march_go_of_country(CityIdSets) ->
	TroopsList = lib_troops_api:troops(get_troops_march()),
	[X || X <- TroopsList, sets:is_element(X#troops.city_id, CityIdSets)]
.
