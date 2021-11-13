%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 5月 2021 16:00
%%%-------------------------------------------------------------------
-module(db_season).
-author("13661").

-include("base.hrl").
-include("mongodb.hrl").
-include("season.hrl").

%% API
-export([
    loop_bson_list_to_map/1,
    load_mmo_season/0,
    save_mmo_season/2,
    load_back_season_loop/1,
    load_back_season_loop_map/1
]).

bson_to_season(Bson) ->
    #season_info{
        season = ?BSON_INT(Bson, season),
        start_tick = ?BSON_INT(Bson, start_tick),
        duration_days = ?BSON_INT(Bson, duration_days),
        update_tick = ?BSON_INT(Bson, update_tick)
    }
.

season_to_bson(SeasonInfo) when is_record(SeasonInfo, season_info) ->
    #{
        ?BSONSET_INT(id, SeasonInfo#season_info.id),
        ?BSONSET_INT(season, SeasonInfo#season_info.season),
        ?BSONSET_INT(start_tick, SeasonInfo#season_info.start_tick),
        ?BSONSET_INT(duration_days, SeasonInfo#season_info.duration_days),
        ?BSONSET_INT(update_tick, SeasonInfo#season_info.update_tick)
    }
.

bson_to_loop(Bson) ->
    #season_loop{
        season = ?BSON_INT(Bson, season),
        duration_days = ?BSON_INT(Bson, duration_days),
        update_tick = ?BSON_INT(Bson, update_tick)
    }
.

loop_bson_list_to_map(LoopBsonList) ->
    lists:foldl(fun(Bson, Map) -> 
        Loop = bson_to_loop(Bson),
        maps:put(Loop#season_loop.season, Loop, Map)
    end, maps:new(), LoopBsonList)
.

load_mmo_season() ->
    case mongo_poolboy:find_one(?MMO_POOL, ?DB_SEASON, #{?BSONSET_INT(id, ?SEASON_TYPE_CUR)}) of
        Res = #{} ->
            bson_to_season(Res);
        _ -> 
            #season_info{
                season = 0,
                start_tick = config:open_tick(),
                duration_days = ?DEFAULT_ZERO_SEASON_DAY,
                update_tick = lib_timer:unixtime()
            }
    end
.

save_mmo_season(SeasonInfo, IsSync) when is_record(SeasonInfo, season_info) ->
    case IsSync of
        true -> mongo_poolboy:update(?MMO_POOL, ?DB_SEASON, #{?BSONSET_INT(id, SeasonInfo#season_info.id)}, season_to_bson(SeasonInfo));
        false -> mongo_poolboy:async_update(?MMO_POOL, ?DB_SEASON, #{?BSONSET_INT(id, SeasonInfo#season_info.id)}, season_to_bson(SeasonInfo))
    end
.

load_back_season_loop(CurSeason) ->
    case mongo_poolboy:find_one(?BACK_POOL, ?DBBACK_SEASON, #{?BSONSET_INT(season, CurSeason)}) of
        Res = #{} ->
            bson_to_loop(Res);
        _ ->
            ?DEFAULT_OTHER_SEASON_LOOP(CurSeason, lib_timer:unixtime())
    end
.

load_back_season_loop_map(CurSeason) ->
    QueryBson = #{
        ?BSONSET_BSON(season, #{
            ?BSONSET_INT(<<"$gte">>, CurSeason)
        })
    },
    case mongo_poolboy:find(?BACK_POOL, ?DBBACK_SEASON, QueryBson) of
        [_ | _] = BsonList ->
            lists:foldl(fun(Bson, Map) -> 
                Loop = bson_to_loop(Bson),
                maps:put(Loop#season_loop.season, Loop, Map)
            end, maps:new(), BsonList);
        _ -> 
            maps:new()
    end
.