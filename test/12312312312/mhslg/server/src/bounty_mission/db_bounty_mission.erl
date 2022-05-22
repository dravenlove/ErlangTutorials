%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Jan 2021 8:30 PM
%%%-------------------------------------------------------------------
-module(db_bounty_mission).
-author("lichaoyu").
-include("common.hrl").
-include("bounty_mission.hrl").

%% API
-export([
	load_player_bounty_mission/1,
	save_player_bounty_mission/1
]).

load_player_bounty_mission(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_BOUNTY_MISSION, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BountyList = [bson_to_bounty_mission(X) || X <- ?BSON_LIST(Bson, <<"bounty_list">>)],
			BountyDict = lists:foldl(
				fun(BountyMission, Dict) ->
					dict:store(BountyMission#bounty_mission.city_id, BountyMission, Dict)
				end, dict:new(), BountyList),
			#player_bounty{
				id = PlayerId,
				bounty_mission = BountyDict
			};
		_ ->
			#player_bounty{id = PlayerId}
	end
.
bson_to_bounty_mission(Bson) ->
	#bounty_mission{
		city_id = ?BSON_INT(Bson, <<"city_id">>),
		task_id = ?BSON_INT(Bson, <<"task_id">>),
		state = ?BSON_INT(Bson, <<"state">>)
	}
.

save_player_bounty_mission(PlayerBountyMission) ->
	#player_bounty{
		id = PlayerId,
		bounty_mission = BountyDict
	} = PlayerBountyMission,
	BountyList = dict:fold(
		fun(_, BountyMission, List) ->
			[bounty_mission_to_bson(BountyMission) | List]
		end, [], BountyDict),
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"bounty_list">>, BountyList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BOUNTY_MISSION, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.
bounty_mission_to_bson(BountyMission) ->
	#{
		?BSONSET_INT(<<"city_id">>, BountyMission#bounty_mission.city_id),
		?BSONSET_INT(<<"task_id">>, BountyMission#bounty_mission.task_id),
		?BSONSET_INT(<<"state">>, BountyMission#bounty_mission.state)
	}
.