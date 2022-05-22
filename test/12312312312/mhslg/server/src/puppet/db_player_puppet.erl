%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. 3月 2021 10:11
%%%-------------------------------------------------------------------
-module(db_player_puppet).
-author("xuyonghui").
-include("common.hrl").
-include("puppet.hrl").

%% API
-export([
	load_player_puppet/1,
	save_player_puppet/1
]).

bson_to_puppet(Bson) ->
	#puppet{
		city_id = ?BSON_INT(Bson, <<"city_id">>),
		clear_id = ?BSON_STRING(Bson, <<"clear_id">>),
		robot_id = ?BSON_INT(Bson, <<"robot_id">>),
		hero_base = lib_hero_api:bson_to_hero_base(?BSON_BSON(Bson, <<"hero_base">>)),
		hero_id = ?BSON_INT(Bson, <<"hero_id">>),
		reward_id = ?BSON_INT(Bson, <<"reward_id">>),
		is_lock = ?BSON_INT(Bson, <<"is_lock">>)
	}
.

puppet_to_bson(Puppet) when is_record(Puppet,puppet) ->
	#{
		?BSONSET_INT(<<"city_id">>, Puppet#puppet.city_id),
		?BSONSET_STRING(<<"clear_id">>, Puppet#puppet.clear_id),
		?BSONSET_INT(<<"robot_id">>, Puppet#puppet.robot_id),
		?BSONSET_BSON(<<"hero_base">>, lib_hero_api:hero_base_to_bson(Puppet#puppet.hero_base)),
		?BSONSET_INT(<<"hero_id">>, Puppet#puppet.hero_id),
		?BSONSET_INT(<<"reward_id">>, Puppet#puppet.reward_id),
		?BSONSET_INT(<<"is_lock">>, Puppet#puppet.is_lock)
	}
.

load_player_puppet(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_PUPPET, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonPuppetList = ?BSON_LIST(Bson, puppet),
			{PuppetDict,HeroIdSet} = lists:foldl(
				fun(BsonPuppet,{Dict,Set}) ->
					Puppet = bson_to_puppet(BsonPuppet),
					{dict:store(Puppet#puppet.city_id, Puppet, Dict),sets:add_element(Puppet#puppet.hero_id,Set)}
				end, {dict:new(),sets:new()}, BsonPuppetList),

			#player_puppet{
				id = PlayerId,
				today_use_times = ?BSON_INT(Bson, today_use_times),
				today_buy_times = ?BSON_INT(Bson, today_buy_times),
				today_use_fresh_times = ?BSON_INT(Bson, today_use_fresh_times),
				refresh_time_tick = ?BSON_INT(Bson, refresh_time_tick),
				puppet = PuppetDict,
				hero_id_set = HeroIdSet
			};
		_ ->
			#player_puppet{
				id = PlayerId
			}
	end
.

save_player_puppet(PlayerPuppet) ->
	PlayerId = PlayerPuppet#player_puppet.id,
	BsonPuppetList = dict:fold(
		fun(_CityId, Puppet, List) ->
			[puppet_to_bson(Puppet) | List]
		end, [], PlayerPuppet#player_puppet.puppet),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(puppet, BsonPuppetList),
		?BSONSET_INT(today_use_times, PlayerPuppet#player_puppet.today_use_times),
		?BSONSET_INT(today_buy_times, PlayerPuppet#player_puppet.today_buy_times),
		?BSONSET_INT(today_use_fresh_times, PlayerPuppet#player_puppet.today_use_fresh_times),
		?BSONSET_INT(refresh_time_tick, PlayerPuppet#player_puppet.refresh_time_tick)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PUPPET,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.