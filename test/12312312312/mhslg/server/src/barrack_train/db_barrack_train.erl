%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dec 2020 3:58 PM
%%%-------------------------------------------------------------------
-module(db_barrack_train).
-author("df").
-include("barrack_train.hrl").
-include("common.hrl").
-include("player.hrl").
%% API
-export([
	load_barrack_train/1,
	save_barrack_train/1
]).


load_barrack_train(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_BARRACK_TRAIN, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BarracksList = ?BSON_LIST(Bson, <<"barracks">>),
			BarrackDict =
				lists:foldl(fun(Bson1, Dict) ->
					Barrack_id = ?BSON_INT(Bson1, barrack_id),
					dict:store(Barrack_id, #barrack{
						barrack_id  = Barrack_id,
						soldier_type = ?BSON_INT(Bson1, soldier_type),
						is_train  = ?BSON_INT(Bson1, is_train),
						train_num = ?BSON_INT(Bson1, train_num),
						store_num = ?BSON_INT(Bson1, store_num)
					}, Dict)
				end, dict:new(), BarracksList),
			#barrack_train{
				id = PlayerId,
				auto_train_type = ?BSON_INT(Bson, auto_train_type),
				train_list = ?BSON_LIST(Bson, train_list),
				barracks = BarrackDict,
				accumulated_training_num = ?BSON_INT(Bson, accumulated_training_num)
			}
		;
		_ ->
			#barrack_train{
				id = PlayerId
			}

	end.

save_barrack_train(Player_barrack_train) when is_record(Player_barrack_train, barrack_train) ->
	PlayerId = Player_barrack_train#barrack_train.id,
	BarracksList =
		dict:fold(fun(_Barrack_id, Barrack, List) ->
			[#{
				?BSONSET_INT(<<"barrack_id">>, Barrack#barrack.barrack_id),
				?BSONSET_INT(<<"soldier_type">>, Barrack#barrack.soldier_type),
				?BSONSET_INT(<<"is_train">>, Barrack#barrack.is_train),
				?BSONSET_INT(<<"train_num">>, Barrack#barrack.train_num),
				?BSONSET_INT(<<"store_num">>,Barrack#barrack.store_num)
			} | List]
				  end, [], Player_barrack_train#barrack_train.barracks),

	Bson = #{
		?BSONSET_INT(<<"id">>,PlayerId),
		?BSONSET_INT(<<"auto_train_type">>,Player_barrack_train#barrack_train.auto_train_type),
		?BSONSET_LIST(<<"train_list">>,Player_barrack_train#barrack_train.train_list),
		?BSONSET_LIST(<<"barracks">>,BarracksList),
		?BSONSET_INT(<<"accumulated_training_num">>,Player_barrack_train#barrack_train.accumulated_training_num)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_BARRACK_TRAIN,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).


