%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 08. Mar 2021 8:54 PM
%%%-------------------------------------------------------------------
-module(db_equip).
-author("lichaoyu").
-include("common.hrl").
-include("equip.hrl").

%% API
-export([
	load_player_equip/1,
	save_player_equip/1,
	equip_to_bson_list/1,
	bson_list_to_equip/1
]).

load_player_equip(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_EQUIP, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_equip{
				id = PlayerId,
				make_bin = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"make_bin">>)),
				type = ?BSON_INT(Bson, <<"type">>),
				param = ?BSON_INT(Bson, <<"param">>)
			};
		_ ->
			#player_equip{id = PlayerId}
	end
.

save_player_equip(PlayerEquip) ->
	PlayerId = PlayerEquip#player_equip.id,
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"make_bin">>, lib_common:map_to_bson_list(PlayerEquip#player_equip.make_bin)),
		?BSONSET_INT(<<"type">>, PlayerEquip#player_equip.type),
		?BSONSET_INT(<<"param">>, PlayerEquip#player_equip.param)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_EQUIP, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.

equip_to_bson_list(Dict) ->
	dict:fold(		%%装备转换
		fun(_, EquipItem, List) ->
			[db_player_pack:item_to_bson(EquipItem) | List]
		end, [], Dict)
.

bson_list_to_equip(List) ->
	lists:foldl(
		fun(Bson, Dict) ->
			EquipItem = db_player_pack:bson_to_pack_item(Bson),
			dict:store(lib_item_api:item_sub_type(EquipItem#item.item_id), EquipItem, Dict)
		end, dict:new(), List)
.
