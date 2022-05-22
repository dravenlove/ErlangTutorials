%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: db_player_pack.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_pack).
-include("common.hrl").

%% API
-export([
	load_player_pack/1,
	save_player_pack/1,
	item_to_bson/1,
	bson_to_pack_item/1,

	pack_item_list_to_bson_list/1,
	bson_list_to_pack_item_list/1
]).

load_player_pack(PlayerId) ->
	?DEBUG("load player pack: ~p~n", [PlayerId]),
	PackageDict = lib_player_pack:init_package_dict(),
	case mongo_poolboy:find(?MMO_POOL, ?DBPLAYER_PACK, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		BsonList = [_ | _] ->
			NewPackageDict = bson_list_to_package_dict(PackageDict, BsonList),
			#player_package{
				id = PlayerId,
				dict = NewPackageDict
			};
		_ ->
			#player_package{
				id = PlayerId,
				dict = PackageDict
			}
	end.

bson_list_to_package_dict(PackageDict, []) ->
	PackageDict;
bson_list_to_package_dict(PackageDict, [Bson | T]) ->
	Package = bson_to_package(Bson),
	NewPackageDict = dict:store(Package#package.package_type, Package, PackageDict),
	bson_list_to_package_dict(NewPackageDict, T).

bson_to_package(Bson) ->
	Type = ?BSON_INT(Bson, <<"type">>),
	BsonItemList = ?BSON_LIST(Bson, item_list),
	ItemDict = lists:foldl(fun(BsonItem, ItemDictAcc0) ->
		#item{unique_id = UniqueId} = PackItem = bson_to_pack_item(BsonItem),
		dict:store(UniqueId, PackItem, ItemDictAcc0)
	end, dict:new(), BsonItemList),

	PackageConf = tb_package:get(Type),
	MaxSize = maps:get(max_size, PackageConf, 0),
	#package{
		max_size = MaxSize,
		dict = ItemDict,
		package_type = Type,
		pack_unique_id = ?BSON_INT(Bson, pack_unique_id)
	}.

bson_to_pack_item(BsonItem) ->
	#item{
		unique_id = ?BSON_INT_DEFAULT(BsonItem, unique_id, 0),
		equip_info = bson_to_equip(?BSON_BSON_DEFAULT(BsonItem, equip_info, #{})),
		item_id = ?BSON_INT(BsonItem, item_id),
		amount = ?BSON_INT(BsonItem, amount),
		item_index = ?BSON_INT(BsonItem, item_index),
		bind = ?BSON_INT(BsonItem, bind),
		opt_tick = ?BSON_INT_DEFAULT(BsonItem, opt_tick, 0),
		overdue = ?BSON_INT_DEFAULT(BsonItem, overdue, 0),
		notify_overdue = ?BSON_BOOL(BsonItem, notify_overdue),
		remove_tick = ?BSON_INT_DEFAULT(BsonItem, remove_tick, 0),
		honor_title = bson_to_honor_title(?BSON_BSON(BsonItem, honor_title)),
		star_info = db_star:bson_to_star_info(?BSON_BSON(BsonItem, star_info))
	}.

bson_to_equip(Bson) ->
	if Bson =/= #{} ->
		#equip_info{
			hero_id = ?BSON_INT(Bson, hero_id),
			break_through = ?BSON_INT(Bson, break_through),
			up = ?BSON_INT(Bson, up),
			up_fail = ?BSON_INT(Bson, up_fail),
			attribute = list_to_tuple(?BSON_LIST(Bson, attribute))
		};
		true ->
			#equip_info{}
	end
.

bson_to_honor_title(Bson) ->
	#honor_title{
		hero_id = ?BSON_INT(Bson, hero_id),
		rand_prop = ?BSON_LIST(Bson, rand_prop)
	}.

save_player_pack(PlayerPack) ->
	#player_package{
		id = PlayerId,
		dict = PackageDict
	} = PlayerPack,
	?DEBUG("save player pack: ~w", [PlayerId]),
	dict:map(fun(_PackType, Package) ->
		save_player_package(PlayerId, Package)
	end, PackageDict).

save_player_package(PlayerId, Package) ->
	Bson = package_to_bson(Package),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PACK,
		#{?BSONSET_INT(<<"id">>, PlayerId), ?BSONSET_INT(<<"type">>, Package#package.package_type)},
		#{<<"$set">> => Bson}).

package_to_bson(Package) ->
	#{
		?BSONSET_INT(<<"type">>, Package#package.package_type),
		?BSONSET_INT(<<"max_size">>, Package#package.max_size),
		?BSONSET_INT(<<"pack_unique_id">>, Package#package.pack_unique_id),
		?BSONSET_LIST(<<"item_list">>, item_dict_to_bson_list(Package#package.dict))
	}.

item_dict_to_bson_list(ItemDict) ->
	dict:fold(fun(_UnId, PackItem, Acc) ->
		[item_to_bson(PackItem) | Acc]
	end, [], ItemDict).

item_to_bson(PackItem) ->
	#{
		?BSONSET_INT(<<"unique_id">>, PackItem#item.unique_id),
		?BSONSET_LIST(<<"equip_info">>, equip_info_to_bson(PackItem#item.equip_info)),
		?BSONSET_INT(<<"item_id">>, PackItem#item.item_id),
		?BSONSET_INT(<<"amount">>, PackItem#item.amount),
		?BSONSET_INT(<<"bind">>, PackItem#item.bind),
		?BSONSET_INT(<<"item_index">>, PackItem#item.item_index),
		?BSONSET_INT(<<"opt_tick">>, PackItem#item.opt_tick),
		?BSONSET_INT(<<"overdue">>, PackItem#item.overdue),
		?BSONSET_BOOL(<<"notify_overdue">>, PackItem#item.notify_overdue),
		?BSONSET_INT(<<"remove_tick">>, PackItem#item.remove_tick),
		?BSONSET_BSON(<<"honor_title">>, honor_title_to_bson(PackItem#item.honor_title)),
		?BSONSET_BSON(<<"star_info">>, db_star:star_info_to_bson(PackItem#item.star_info))

	}.

equip_info_to_bson(Equip) ->
	#{
		?BSONSET_INT(<<"hero_id">>, Equip#equip_info.hero_id),
		?BSONSET_INT(<<"break_through">>, Equip#equip_info.break_through),
		?BSONSET_INT(<<"up">>, Equip#equip_info.up),
		?BSONSET_INT(<<"up_fail">>, Equip#equip_info.up_fail),
		?BSONSET_LIST(<<"attribute">>, tuple_to_list(Equip#equip_info.attribute))
	}
.

honor_title_to_bson(Title) ->
	#{
		?BSONSET_INT(<<"hero_id">>, Title#honor_title.hero_id),
		?BSONSET_LIST(<<"rand_prop">>, Title#honor_title.rand_prop)
	}.

pack_item_list_to_bson_list(Items) ->
	lists:foldl(fun(Item, Acc) ->
		[item_to_bson(Item) | Acc]
	end, [], Items).

bson_list_to_pack_item_list(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		[bson_to_pack_item(Bson) | Acc]
	end, [], BsonList).
