%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 11:33 AM
%%%-------------------------------------------------------------------
-module(db_holy_spirit_hall).
-author("df").
-include("common.hrl").
-include("holy_spirit_hall.hrl").

%% API
-export([
	load_holy_spirit_hall/1,
	save_holy_spirit_hall/1
]).


load_holy_spirit_hall(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_HOLY_SPIRIT_HALL, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			HallList = ?BSON_LIST(Bson, <<"hall">>),
			HallDict =
				lists:foldl(fun(Bson1, Dict1) ->
					BattlesList = ?BSON_LIST(Bson1, <<"battles">>),
					BattleDict =
						lists:foldl(fun(Bson2, Dict2) ->
							Place = ?BSON_INT(Bson2, <<"place">>),
							dict:store(Place, #battle{
								place  = Place,
								hero_id = ?BSON_INT(Bson2, <<"hero_id">>),
								grade = ?BSON_INT(Bson2, <<"grade">>)
							}, Dict2)
									end, dict:new(), BattlesList),

					HallId = ?BSON_INT(Bson1, <<"id">>),
					dict:store(HallId, #hall{
						id  = HallId,
						level = ?BSON_INT(Bson1, <<"level">>),
						hall_skill_id = ?BSON_INT(Bson1, <<"hall_skill_id">>),
						battles  = BattleDict
					}, Dict1)
							end, dict:new(), HallList),


			#holy_spirit_hall{
				id = PlayerId,
				hall = HallDict
			}
		;
		_ ->
			#holy_spirit_hall{
				id = PlayerId
			}

	end.

save_holy_spirit_hall(Holy_spirit_hall) when is_record(Holy_spirit_hall, holy_spirit_hall) ->
	PlayerId = Holy_spirit_hall#holy_spirit_hall.id,

	HallList =
		dict:fold(fun(_HallId, Hall, List) ->
			BattleList =
				dict:fold(fun(_Place, Battle, List1) ->
					[#{
						?BSONSET_INT(<<"place">>, Battle#battle.place),
						?BSONSET_INT(<<"hero_id">>, Battle#battle.hero_id),
						?BSONSET_INT(<<"grade">>, Battle#battle.grade)
					} | List1]
						  end, [], Hall#hall.battles),
			[#{
				?BSONSET_INT(<<"id">>, Hall#hall.id),
				?BSONSET_INT(<<"level">>, Hall#hall.level),
				?BSONSET_INT(<<"hall_skill_id">>, Hall#hall.hall_skill_id),
				?BSONSET_LIST(<<"battles">>, BattleList)
			} | List]
				  end, [], Holy_spirit_hall#holy_spirit_hall.hall),

	Bson = #{
		?BSONSET_INT(<<"id">>,PlayerId),
		?BSONSET_LIST(<<"hall">>,HallList)

	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HOLY_SPIRIT_HALL,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).



