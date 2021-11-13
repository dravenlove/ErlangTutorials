%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_mutual
%%% Created on : 2021/8/19 10:18
%%% @author leever liangxingwu@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_mutual).
-author("leever").
-include("common.hrl").
-include("inner_city.hrl").

%% API
-export([
	bson_to_mutual_list/1,
	mutual_list_to_bson/1,
	save_mutual/0,
	load_mutual/0
]).

load_mutual() ->
	case mongo_poolboy:find_one(?MMO_POOL,?DB_MUTUAL,#{?BSONSET_INT(id, 1)}) of
		Res = #{} -> #mutual_status{mutual = bson_to_mutual_list(Res)};
		_ -> #mutual_status{}
	end
.
save_mutual() ->
	MutualStatus = mod_mutual:get_mutual(),
	BsonMutualList = mutual_list_to_bson(MutualStatus#mutual_status.mutual),
	Bson = #{
		?BSONSET_LIST(mutual_status, BsonMutualList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_MUTUAL,
		#{?BSONSET_INT(<<"id">>, 1)},
		#{<<"$set">> => Bson})
.
mutual_list_to_bson(MutualList) ->
	lists:foldr(fun(Mutual,Acc) ->
		[#{
			?BSONSET_BSON(proto_show_role , lib_player:show_role_to_bson(Mutual#mutual.proto_show_role)),		%% 玩家信息 => #ProtoShowRole
			?BSONSET_INT(building_id , Mutual#mutual.building_id),			%% 建筑id
			?BSONSET_INT(building_lv , Mutual#mutual.building_lv),			%% 建筑等级
			?BSONSET_INT(mutual_times , Mutual#mutual.mutual_times),           %% 势力互助完成次数
			?BSONSET_INT(mutual_total_times , Mutual#mutual.mutual_total_times),     %% 势力互助总次数
			?BSONSET_LIST(mutual_player_list , Mutual#mutual.mutual_player_list),    %% 助力过的玩家id列表
			?BSONSET_BOOL(is_mutual , Mutual#mutual.is_mutual),			%% 是否助力过：获取时标记用
			?BSONSET_INT(update_tick , Mutual#mutual.update_tick),				%% 更新的时间戳
			?BSONSET_INT(country_id , Mutual#mutual.country_id)				%% 势力
		}|Acc]
				end,[],MutualList)
.
bson_to_mutual_list(BsonMutualList) ->
	lists:foldr(fun(Mutual,Acc) ->
		[#mutual{
			proto_show_role = lib_player:bson_to_show_role(?BSON_BSON(Mutual , protoMutual_show_role)),		%% 玩家信息 => #ProtoShowRole
			building_id = ?BSON_INT(Mutual , building_id),			%% 建筑id
			building_lv = ?BSON_INT(Mutual , building_lv),			%% 建筑等级
			mutual_times = ?BSON_INT(Mutual , mutual_times),           %% 势力互助完成次数
			mutual_total_times = ?BSON_INT(Mutual , mutual_total_times),     %% 势力互助总次数
			mutual_player_list = ?BSON_LIST(Mutual , mutual_player_list),    %% 助力过的玩家id列表
			is_mutual = ?BSON_BOOL(Mutual , is_mutual),			%% 是否助力过：获取时标记用
			update_tick = ?BSON_INT(Mutual , update_tick),				%% 更新的时间戳
			country_id = ?BSON_INT(Mutual , country_id)				%% 势力
		}|Acc]
				end,[],BsonMutualList)
.