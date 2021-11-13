%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_pack_util.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_item_api).
-include("common.hrl").
-include("pack.hrl").

%% API
-export([
	item_dict_to_proto_item_list/1,

	serialize_proto_item_list/1,

	serialize_proto_item/1,             %% pack item to proto item
	unserialize_proto_item/1,           %% proto item to pack item

	item_obj_list_to_pack_item_list/1,  %%
	item_obj_to_pack_item/1,            %%

	item_obj_list_to_proto_obj_list/1,  %%
	item_obj_to_proto_obj/1,            %%

	item_obj_list_to_bson_list/1,  %%
	item_obj_to_bson/1,            %%

	bson_list_to_item_obj_list/1,  %%
	bson_to_item_obj/1,            %%

	pack_item_list_to_proto_obj_list/1, %%
	pack_item_to_proto_obj/1,           %%

	pack_item_to_item_obj/1,

	proto_obj_list_to_item_obj_list/1,  %%
	proto_obj_to_item_obj/1,            %%


	%% 奖励配置转成相关结构
	conf_item_list_to_pack_item_list/1,
	conf_item_to_pack_item/1,

	conf_item_list_to_item_obj_list/1,
	conf_item_to_item_obj/1,

	conf_item_list_to_proto_obj_list/1,
	conf_item_to_proto_obj/1,


	multi_conf_item/2,
	multi_conf_item_list/2,

	multi_item_obj/2,
	multi_item_obj_list/2,

	pack_item/2,

	merge_conf_item_list/1,
	merge_conf_item_list/2,

	merge_item_obj_list/1,
	rend/0
]).

-export([
	item_name/1,
	item_color/1,
	item_main_type/1,
	item_sub_type/1,
	is_common_item/1
]).

item_dict_to_proto_item_list(Dict) ->
	dict:fold(fun(_,PackItem, Acc) ->
		[lib_item_api:serialize_proto_item(PackItem) | Acc]
	end, [], Dict).

serialize_proto_item_list(PackItemList)->
	[lib_item_api:serialize_proto_item(PackItem) || PackItem <- PackItemList]
.

serialize_proto_item(PackItem) ->
	#'ProtoItem'{
		index = PackItem#item.item_index,
		unique_id = PackItem#item.unique_id,
		id = PackItem#item.item_id,
		amount = PackItem#item.amount,
		bind = PackItem#item.bind,
		overdue = PackItem#item.overdue,
		opt_tick = PackItem#item.opt_tick,
		remove_tick = PackItem#item.remove_tick,
		honor_title = #'ProtoHonorTitle'{
			hero_id = PackItem#item.honor_title#honor_title.hero_id,
			rand_prop = PackItem#item.honor_title#honor_title.rand_prop
		},
		equip_info = equip_to_proto(PackItem#item.equip_info),
		star_info = star_to_proto(PackItem#item.star_info)

	}.

equip_to_proto(Equip) ->
	#'ProtoHeroEquip'{
		hero_id = Equip#equip_info.hero_id,
		break_lvl = Equip#equip_info.break_through,
		up = Equip#equip_info.up,
		up_fail = Equip#equip_info.up_fail,
		attribute = element(?WASH_BEFORE, Equip#equip_info.attribute)
	}
.

star_to_proto(StarInfo) ->
	#'ProtoStar'{
		level = StarInfo#star_info.level,
		experience = StarInfo#star_info.experience,
		inlay_info = StarInfo#star_info.inlay_info
	}
.

unserialize_proto_item(ProtoItem) ->
	#item{
		item_index = ProtoItem#'ProtoItem'.index,
		unique_id = ProtoItem#'ProtoItem'.unique_id,
		item_id = ProtoItem#'ProtoItem'.id,
		amount = ProtoItem#'ProtoItem'.amount,
		bind = ProtoItem#'ProtoItem'.bind,
		opt_tick = ProtoItem#'ProtoItem'.opt_tick,
		overdue = ProtoItem#'ProtoItem'.overdue,
		remove_tick = ProtoItem#'ProtoItem'.remove_tick,
		honor_title = proto_to_honor_title(ProtoItem#'ProtoItem'.honor_title)
	}.

proto_to_honor_title(ProtoTitle) ->
	#honor_title{
		hero_id = ProtoTitle#'ProtoHonorTitle'.hero_id,
		rand_prop = ProtoTitle#'ProtoHonorTitle'.rand_prop
	}.


item_obj_list_to_pack_item_list(ItemObjList) ->
	[item_obj_to_pack_item(ItemObj) || ItemObj <- ItemObjList].
item_obj_to_pack_item(ItemObj) when is_record(ItemObj, item_obj)->
	pack_item(ItemObj#item_obj.item_id, ItemObj#item_obj.amount)
.

item_obj_list_to_proto_obj_list(ItemObjList) ->
	[item_obj_to_proto_obj(ItemObj) || ItemObj <- ItemObjList].
item_obj_to_proto_obj(undefined) ->
	undefined
;
item_obj_to_proto_obj(ItemObj) ->
	#'ProtoItemObj'{
		item_id = ItemObj#item_obj.item_id,
		amount = ItemObj#item_obj.amount,
		effect = ItemObj#item_obj.effect,
		flag = ItemObj#item_obj.flag
	}.

item_obj_list_to_bson_list(ItemObjList) ->
	[item_obj_to_bson(ItemObj) || ItemObj <- ItemObjList].
item_obj_to_bson(undefined) ->
	undefined
;
item_obj_to_bson(ItemObj) ->
	#{
		?BSONSET_INT(<<"item_id">>, ItemObj#item_obj.item_id),
		?BSONSET_INT(<<"amount">>, ItemObj#item_obj.amount),
		?BSONSET_INT(<<"effect">>, ItemObj#item_obj.effect),
		?BSONSET_INT(<<"flag">>, ItemObj#item_obj.flag)
	}.

pack_item_list_to_proto_obj_list(PackItemList) ->
	[pack_item_to_proto_obj(PackItem) || PackItem <- PackItemList].
pack_item_to_proto_obj(PackItem) ->
	#'ProtoItemObj'{
		item_id = PackItem#item.item_id,
		amount = PackItem#item.amount
	}.

pack_item_to_item_obj(PackItem) ->
	#item_obj{
		item_id = PackItem#item.item_id,
		amount = PackItem#item.amount
	}.

proto_obj_list_to_item_obj_list(ProtoObjList) ->
	[proto_obj_to_item_obj(ProtoObj) || ProtoObj <- ProtoObjList].
proto_obj_to_item_obj(ProtoObj) ->
	#item_obj{
		item_id = ProtoObj#'ProtoItemObj'.item_id,
		amount = ProtoObj#'ProtoItemObj'.amount,
		effect = ProtoObj#'ProtoItemObj'.effect,
		flag = ProtoObj#'ProtoItemObj'.flag
	}.

bson_list_to_item_obj_list(BsonList) ->
	[proto_obj_to_item_obj(Bson) || Bson <- BsonList].
bson_to_item_obj(undefined) ->
	undefined
;
bson_to_item_obj(Bson) ->
	#item_obj{
		item_id = ?BSON_INT(Bson, <<"item_id">>),
		amount = ?BSON_INT(Bson, <<"amount">>),
		effect =?BSON_INT(Bson, <<"effect">>),
		flag = ?BSON_INT(Bson, <<"flag">>)
	}.

conf_item_list_to_pack_item_list(ConfList) ->
	conf_item_list_to_pack_item_list([], ConfList).
conf_item_list_to_pack_item_list(PackItemList, []) ->
	PackItemList;
conf_item_list_to_pack_item_list(PackItemList, [[ItemId, ItemAmount] | T]) ->
	PackItem = pack_item(ItemId, ItemAmount),
	conf_item_list_to_pack_item_list([PackItem | PackItemList], T).
conf_item_to_pack_item([ItemId, ItemAmount | _] = _Conf) ->
	pack_item(ItemId, ItemAmount).

pack_item(ItemId, ItemAmount) ->
	Conf = tb_item:get(ItemId),
	case maps:get(type, Conf) =:= ?PACK_TYPE_EQUIP andalso maps:get(sub_type, Conf) =:= ?HE_XIN of
		true ->
			Attribute =
				case maps:find(fix_append, Conf) of
					{ok, Value} -> Value;
					error ->
						Color = maps:get(color, Conf),
						Append = random_append(Color),
						case lib_api:list_index(?DEFINE_BREAK, ?EQUIP_APPEND_CONDITION) of
							0 -> Append;
							Index -> lib_equip_api:append_activate(Append, Color, Index)
						end
				end,
			#item{item_id = ItemId, amount = ItemAmount, equip_info = #equip_info{attribute = {Attribute}}};
		false -> #item{item_id = ItemId, amount = ItemAmount}
	end
.

random_append(Color) ->
	random_append(Color, 1) ++ random_append(Color, 2) ++ random_append(Color, 3)
.
random_append(Color, Index) ->
	Conf = tb_equip_append_bin:get(?EQUIP_APPEND_BIN_ID(Color, Index)),
	SingleTypeList = maps:get(single_type, Conf),
	SingleWeightList = maps:get(single_weight, Conf),
	SingleType = lib_equip_api:random_one_weight(SingleTypeList, SingleWeightList),
	Single = ?EQUIP_APPEND_ID(SingleType, 0),
	Double =
		case lib_random:rand(100) < maps:get(double, Conf) of
			true ->
				DoubleTypeList = maps:get(double_type, Conf),
				DoubleWeightList = maps:get(double_weight, Conf),
				DoubleType = lib_equip_api:random_one_weight(DoubleTypeList, DoubleWeightList),
				?EQUIP_APPEND_ID(DoubleType, 0);
			false -> 0
		end,
	[Single, Double]
.

conf_item_list_to_item_obj_list(ConfList) ->
	[conf_item_to_item_obj(Conf) || Conf <- ConfList].
conf_item_to_item_obj([Id, Amount, Effect, Flag | _]) ->
	?ITEM_OBJ(Id, Amount, Effect, Flag);
conf_item_to_item_obj([Id, Amount, Effect | _]) ->
	?ITEM_OBJ(Id, Amount, Effect);
conf_item_to_item_obj([Id, Amount | _]) ->
	?ITEM_OBJ(Id, Amount).

conf_item_list_to_proto_obj_list(ConfList) ->
	[conf_item_to_proto_obj(Conf) || Conf <- ConfList].
conf_item_to_proto_obj([Id, Amount, Effect, Flag | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount, Effect, Flag);
conf_item_to_proto_obj([Id, Amount, Effect | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount, Effect);
conf_item_to_proto_obj([Id, Amount | _]) ->
	?PROTO_ITEM_OBJ(Id, Amount).

multi_conf_item([Id, Amount | L], Multi)->
	[Id, lib_common:floor(Amount * Multi)] ++ L.
multi_conf_item_list(ConfList, Multi) ->
	[multi_conf_item(ConfItem, Multi) || ConfItem <- ConfList].

multi_item_obj(#item_obj{amount = Amount} = ItemObj, Multi) ->
	ItemObj#item_obj{amount = lib_common:floor(Amount * Multi)}.
multi_item_obj_list(ItemObjList, Multi)->
	[multi_item_obj(ItemObj, Multi) || ItemObj <- ItemObjList].

merge_conf_item_list(List) ->
	Map =
	lists:foldl(fun([Id, Number], Map) ->
		OldNumber = maps:get(Id, Map, 0),
		NewNumber = OldNumber + Number,
		maps:put(Id, NewNumber, Map)
	end, maps:new(), List),

	maps:fold(fun(Id, Number, List1) ->
		[[Id, Number] | List1]
    end, [], Map)
.
merge_conf_item_list(List1, List2) ->
	Map1 =
	lists:foldl(fun([Id, Number], Map) ->
		OldNumber = maps:get(Id, Map, 0),
		NewNumber = OldNumber + Number,
		maps:put(Id, NewNumber, Map)
    end, maps:new(), List1),

	Map2 =
	lists:foldl(fun([Id, Number], Map) ->
		OldNumber = maps:get(Id, Map, 0),
		NewNumber = OldNumber + Number,
		maps:put(Id, NewNumber, Map)
    end, maps:new(), List2),

	Map3 =
	maps:fold(fun(Id, Number, Map) ->
		OldNumber = maps:get(Id, Map, 0),
		NewNumber = OldNumber + Number,
		maps:put(Id, NewNumber, Map)
    end, Map1, Map2),

	maps:fold(fun(Id, Number, List) -> [[Id, Number] | List] end, [], Map3)
.

merge_item_obj_list(ItemObjList) ->
	Map =
	lists:foldl(fun(#item_obj{item_id = Id, amount = Number}, Map) ->
		OldNumber = maps:get(Id, Map, 0),
		NewNumber = OldNumber + Number,
		maps:put(Id, NewNumber, Map)
	end, maps:new(), ItemObjList),

	maps:fold(fun(Id, Number, List1) ->
		[?ITEM_OBJ(Id, Number) | List1]
    end, [], Map)
.

item_name(ItemId) ->
	Conf = tb_item:get(ItemId),
	Name = maps:get(name, Conf, ""),
	language:auto(Name).
%%	PrefName = maps:get(prefname, Conf, ""),
%%	lib_types:to_list(PrefName) ++ lib_types:to_list(Name).

item_color(ItemId) ->
	Conf = tb_item:get(ItemId),
	maps:get(color, Conf, 0)
.

item_main_type(ItemId) ->
	Conf = tb_item:get(ItemId),
	maps:get(main_type, Conf, 0)
.

item_sub_type(ItemId) ->
	Conf = tb_item:get(ItemId),
	maps:get(sub_type, Conf, 0)
.

is_common_item(ItemId) ->
	item_main_type(ItemId) =:= ?ITEM_MAIN_TYPE_COMMON
.

rend() ->
	rend.