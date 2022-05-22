%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_config_api
%%% Created on : 2020/8/14 0014 10:56
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_config_api).
-author("glendy").
-include("common.hrl").

-define(RECHARGE_TYPE_LIST(Type), {recharge_type_list, Type}).
-define(GIFT_RAND_GROUP_KEY(K), {gift_rand_group_key, K}).
-define(GIFT_RAND_REWARD_KEY(K), {gift_rand_reward_key, K}).
-define(GIFT_RAND_WEIGHT_KEY(K), {gift_rand_weight_key, K}).
-define(GIFT_HYBRID_GROUP_KEY(K), {gift_hybrid_group_key, K}).
-define(GIFT_HYBRID_REWARD_KEY(K), {gift_hybrid_reward_key, K}).
-define(GIFT_HYBRID_WEIGHT_KEY(K), {gift_hybrid_weight_key, K}).
-define(GIFT_HYBRID_FIXED_REWARD_KEY(K), {gift_hybrid_fixed_reward_key, K}).
-define(GIFT_FIXED_REWARD_KEY(K), {gift_fixed_reward_key, K}).
-define(GIFT_OPTION_REWARD_KEY(K), {gift_option_reward_key, K}).
-define(DISSOLVE_HERO_GROUP_KEY(K), {dissolve_hero_group_key, K}). %%英雄碎片tb导入ets表
-define(DISSOLVE_HERO_REWARD_KEY(K), {dissolve_hero_reward_key, K}).
-define(DISSOLVE_HERO_WEIGHT_KEY(K), {dissolve_hero_weight_key, K}).
-define(SHOP_GOODS_LIST_KEY(K), {shop_goods_list_key, K}).
-define(SHOP_GROUP_WEIGHT_KEY(K), {shop_group_weight_key, K}).
-define(LANGUAGE_KEY(K), {language, K}).

%% API
-export([
	reload/0,
%%	get_recharge_list_by_type/1,
	get_gift_rand_group_list/1,
	get_gift_rand_reward_list/1,
	get_gift_rand_weight/1,
	get_gift_hybrid_group_list/1,
	get_gift_hybrid_reward_list/1,
	get_gift_hybrid_weight/1,
	get_gift_hybrid_fixed_reward_list/1,
	get_gift_fixed_reward_list/1,
	get_gift_option_reward_list/1,
	get_hero_dissolve_fragment_group_list/1,
	get_hero_dissolve_fragment_reward_list/1,
	get_hero_dissolve_fragment_weight/1,
	get_shop_goods_list/1,
	get_shop_group_weight/1,
	get_language_package/1
]).

-export([
%%	load_recharge_config/0
]).
reload() ->
	%%load_recharge_config(),
	load_gift_rand_config(),
	load_gift_rand_reward_config(),
	load_gift_hybrid_config(),
	load_gift_hybrid_reward_config(),
	load_gift_hybrid_fixed_reward_config(),
	load_gift_fixed_reward_config(),
	load_gift_option_reward_config(),
	load_dissolve_hero_fragment_config(),
	load_dissolve_hero_fragment_reward_config(),
	load_shop_goods(),
	load_language_package(),
	ok.


%%%% 充值配置相关
%%load_recharge_config() ->
%%	load_recharge_config(#{}, tb_recharge:get_list()).
%%load_recharge_config(_TypeMap, []) ->
%%	ok;
%%load_recharge_config(TypeMap, [Id | T]) ->
%%	Conf = tb_recharge:get(Id),
%%	Type = maps:get(type, Conf),
%%	NewTypeMap = update_config_cache_list(?RECHARGE_TYPE_LIST(Type), Id, TypeMap),
%%	load_recharge_config(NewTypeMap, T).
%%
%%%% 充值类型返回对应的充值id列表
%%get_recharge_list_by_type(Type) ->
%%	lib_cache:fetch(?RECHARGE_TYPE_LIST(Type), []).



%% 随机礼包掉落组表
load_gift_rand_config() ->
	load_gift_rand_config(tb_gift_rand_group:get_list(), #{}).
load_gift_rand_config([], _DictMap) ->
	ok;
load_gift_rand_config([Id | T], DictMap) ->
	Conf = tb_gift_rand_group:get(Id),
	Key = maps:get('dropgroup_id', Conf),
	NewDictMap = update_config_cache_list(?GIFT_RAND_GROUP_KEY(Key), Id, DictMap),
	load_gift_rand_config(T, NewDictMap).

get_gift_rand_group_list(GroupId) ->
	lib_cache:fetch(?GIFT_RAND_GROUP_KEY(GroupId), []).

%% 随机礼包奖励表
load_gift_rand_reward_config() ->
	load_gift_rand_reward_config(tb_gift_rand_reward:get_list(), #{}, #{}).
load_gift_rand_reward_config([], _DictMap, _WeightDict) ->
	ok;
load_gift_rand_reward_config([Id | T], DictMap, WeightDict) ->
	RewardConf = tb_gift_rand_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?GIFT_RAND_REWARD_KEY(RewardID), Id, DictMap),
	Weight = maps:get('weight', RewardConf, 0),
	NewWeightDict = add_key_value(?GIFT_RAND_WEIGHT_KEY(RewardID), Weight, WeightDict),
	load_gift_rand_reward_config(T, NewDictMap, NewWeightDict).

get_gift_rand_reward_list(RewardID) ->
	lib_cache:fetch(?GIFT_RAND_REWARD_KEY(RewardID), []).
get_gift_rand_weight(RewardID) ->
	lib_cache:fetch(?GIFT_RAND_WEIGHT_KEY(RewardID), []).

%% 混合礼包掉落组表
load_gift_hybrid_config() ->
	load_gift_hybrid_config(tb_gift_hybrid_group:get_list(), #{}).
load_gift_hybrid_config([], _DictMap) ->
	ok;
load_gift_hybrid_config([Id | T], DictMap) ->
	Conf = tb_gift_hybrid_group:get(Id),
	Key = maps:get('dropgroup_id', Conf),
	NewDictMap = update_config_cache_list(?GIFT_HYBRID_GROUP_KEY(Key), Id, DictMap),
	load_gift_hybrid_config(T, NewDictMap).

get_gift_hybrid_group_list(GroupId) ->
	lib_cache:fetch(?GIFT_HYBRID_GROUP_KEY(GroupId), []).

%% 混合礼包奖励表
load_gift_hybrid_reward_config() ->
	load_gift_hybrid_reward_config(tb_gift_hybrid_reward:get_list(), #{}, #{}).
load_gift_hybrid_reward_config([], _DictMap, _WeightDict) ->
	ok;
load_gift_hybrid_reward_config([Id | T], DictMap, WeightDict) ->
	RewardConf = tb_gift_hybrid_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?GIFT_HYBRID_REWARD_KEY(RewardID), Id, DictMap),
	Weight = maps:get('weight', RewardConf),
	NewWeightDict = add_key_value(?GIFT_HYBRID_WEIGHT_KEY(RewardID), Weight, WeightDict),
	load_gift_hybrid_reward_config(T, NewDictMap, NewWeightDict).

get_gift_hybrid_reward_list(RewardID) ->
	lib_cache:fetch(?GIFT_HYBRID_REWARD_KEY(RewardID), []).
get_gift_hybrid_weight(RewardID) ->
	lib_cache:fetch(?GIFT_HYBRID_WEIGHT_KEY(RewardID), []).

%% 混合礼包固定奖励表
load_gift_hybrid_fixed_reward_config() ->
	load_gift_hybrid_fixed_reward_config(tb_gift_hybrid_fixed_reward:get_list(), #{}).
load_gift_hybrid_fixed_reward_config([], _DictMap) ->
	ok;
load_gift_hybrid_fixed_reward_config([Id | T], DictMap) ->
	RewardConf = tb_gift_hybrid_fixed_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?GIFT_HYBRID_FIXED_REWARD_KEY(RewardID), Id, DictMap),
	load_gift_hybrid_fixed_reward_config(T, NewDictMap).
get_gift_hybrid_fixed_reward_list(RewardID) ->
	lib_cache:fetch(?GIFT_HYBRID_FIXED_REWARD_KEY(RewardID), []).

%% 固定礼包奖励表
load_gift_fixed_reward_config() ->
	load_gift_fixed_reward_config(tb_gift_fixed_reward:get_list(), #{}).
load_gift_fixed_reward_config([], _DictMap) ->
	ok;
load_gift_fixed_reward_config([Id | T], DictMap) ->
	RewardConf = tb_gift_fixed_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?GIFT_FIXED_REWARD_KEY(RewardID), Id, DictMap),
	load_gift_fixed_reward_config(T, NewDictMap).

get_gift_fixed_reward_list(RewardID) ->
	lib_cache:fetch(?GIFT_FIXED_REWARD_KEY(RewardID), []).

%% 自选礼包奖励表
load_gift_option_reward_config() ->
	load_gift_option_reward_config(tb_gift_option_reward:get_list(), #{}).
load_gift_option_reward_config([], _DictMap) ->
	ok;
load_gift_option_reward_config([Id | T], DictMap) ->
	RewardConf = tb_gift_option_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?GIFT_OPTION_REWARD_KEY(RewardID), Id, DictMap),
	load_gift_option_reward_config(T, NewDictMap).

get_gift_option_reward_list(RewardID) ->
	lib_cache:fetch(?GIFT_OPTION_REWARD_KEY(RewardID), []).

%% 英雄碎片分解掉落组表
load_dissolve_hero_fragment_config() ->
	load_dissolve_hero_fragment_config(tb_hero_fragment_group:get_list(), #{}).
load_dissolve_hero_fragment_config([], _DictMap) ->
	ok;
load_dissolve_hero_fragment_config([Id | T], DictMap) ->
	Conf = tb_hero_fragment_group:get(Id),
	Key = maps:get('dropgroup_id', Conf),
	NewDictMap = update_config_cache_list(?DISSOLVE_HERO_GROUP_KEY(Key), Id, DictMap),
	load_dissolve_hero_fragment_config(T, NewDictMap).

get_hero_dissolve_fragment_group_list(GroupId) ->
	lib_cache:fetch(?DISSOLVE_HERO_GROUP_KEY(GroupId), []).

%% 英雄碎片分解奖励表
load_dissolve_hero_fragment_reward_config() ->
	load_dissolve_hero_fragment_reward_config(tb_hero_fragment_reward:get_list(), #{}, #{}).
load_dissolve_hero_fragment_reward_config([], _DictMap, _WeightDict) ->
	ok;
load_dissolve_hero_fragment_reward_config([Id | T], DictMap, WeightDict) ->
	RewardConf = tb_hero_fragment_reward:get(Id),
	RewardID = maps:get('drop_id', RewardConf),
	NewDictMap = update_config_cache_list(?DISSOLVE_HERO_REWARD_KEY(RewardID), Id, DictMap),
	Weight = maps:get('weight', RewardConf, 0),
	NewWeightDict = add_key_value(?DISSOLVE_HERO_WEIGHT_KEY(RewardID), Weight, WeightDict),
	load_dissolve_hero_fragment_reward_config(T, NewDictMap, NewWeightDict).


get_hero_dissolve_fragment_reward_list(RewardID) ->
	lib_cache:fetch(?DISSOLVE_HERO_REWARD_KEY(RewardID), []).
get_hero_dissolve_fragment_weight(RewardID) ->
	lib_cache:fetch(?DISSOLVE_HERO_WEIGHT_KEY(RewardID), []).


%% 商店随机商品
load_shop_goods() ->
	load_shop_goods(tb_shop_goods:get_list(), maps:new(), maps:new())
.
load_shop_goods([], _GroupMap, _WeightMap) ->
	ok
;
load_shop_goods([Id | T], GroupMap, WeightMap) ->
	Conf = tb_shop_goods:get(Id),
	GroupId = maps:get(group, Conf),
	Weight = maps:get(weight, Conf),

	NewGroupMap = update_config_cache_list(?SHOP_GOODS_LIST_KEY(GroupId), [Id, Weight], GroupMap),
	NewWeightMap = add_key_value(?SHOP_GROUP_WEIGHT_KEY(GroupId), Weight, WeightMap),

	load_shop_goods(T, NewGroupMap, NewWeightMap)
.

get_shop_goods_list(GroupId) ->
	lib_cache:fetch(?SHOP_GOODS_LIST_KEY(GroupId), [])
.
get_shop_group_weight(GroupId) ->
	lib_cache:fetch(?SHOP_GROUP_WEIGHT_KEY(GroupId), 0)
.



%% 语言包
load_language_package() ->
	%load_language_package([config:language()]).
	load_language_package(tb_language:get_list()).
load_language_package([]) ->
	ok;
load_language_package([Language | T]) ->
	LanguagePackage = language:language_package(Language),
	lib_cache:set(?LANGUAGE_KEY(Language), LanguagePackage),
	load_language_package(T).
get_language_package(Language) ->
	lib_cache:fetch(?LANGUAGE_KEY(Language), []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
update_config_cache_list(CacheKey, Value, TypeMap) ->
	case maps:is_key(CacheKey, TypeMap) of
		true ->
			List = lib_cache:fetch(CacheKey, []),
			lib_cache:set(CacheKey, List ++ [Value]),
			TypeMap;
		_ ->
			lib_cache:set(CacheKey, [Value]),
			maps:put(CacheKey, 1, TypeMap)
	end.

add_key_value(CacheKey, Value, DictSet) ->
	case maps:is_key(CacheKey, DictSet) of
		true ->
			Value0 = lib_cache:fetch(CacheKey, 0),
			lib_cache:set(CacheKey, Value0 + Value),
			maps:put(CacheKey, Value + Value0, DictSet);
		_ ->
			lib_cache:set(CacheKey, Value),
			maps:put(CacheKey, Value, DictSet)
	end.
