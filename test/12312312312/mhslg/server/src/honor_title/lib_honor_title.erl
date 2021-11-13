%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 16:31
%%%-------------------------------------------------------------------
-module(lib_honor_title).
-include("ProtoClient_10129.hrl").
-include("common.hrl").
-include("hero.hrl").

%% API
-export([
    init_title/1,
    add_overdue/1,
    notify_overdue/0,

    honor_title_to_proto/2,
    calc_honor_title_prop/1,

    request_put_on/1,
    request_take_off/1
]).

get_overdue_ids() ->
    List = erlang:get(overdue_ids),
    case is_list(List) of true -> List; _ -> [] end.
add_overdue_id(PackItem) ->
    List = get_overdue_ids(),
    erlang:put(overdue_ids, [PackItem | List]).
reset_overdue_ids() ->
    erlang:put(overdue_ids, []).

add_overdue(PackItem) ->
    add_overdue_id(PackItem).

notify_overdue() ->
    try
        List = get_overdue_ids(),
        ?JUDGE_RETURN(erlang:length(List) > 0, 0),
        Notify = #'Proto80129003'{overdue_list = [lib_item_api:serialize_proto_item(Item) || Item <- List]},
        lib_send:respond_to_client(Notify),
        lists:foreach(fun(PackItem) ->
            take_off(PackItem)
                      end, List),
        reset_overdue_ids()
    catch
        _:_  -> ok
    end.

init_title(Item) ->
    try
        Conf = tb_item:get(Item#item.item_id),
        TitleId = maps:get(honor_title, Conf),
        TitleConf = tb_honor_title:get(TitleId),
        RandAmount = maps:get(rand_amount, TitleConf, 0),
        ?JUDGE_RETURN(RandAmount > 0, 0),
        List = fetch_rand_prop(RandAmount, maps:get(rand_prop, TitleConf, [])),
        Item#item{honor_title = #honor_title{rand_prop = List}}
    catch
        _:_  -> Item
    end.

fetch_rand_prop(Amount, RandList) ->
    fetch_rand_prop(Amount, RandList, []).
fetch_rand_prop(0, _RandList, List) ->
    List;
fetch_rand_prop(_Amount, [], List) ->
    List;
fetch_rand_prop(Amount, RandList, List) ->
    Value = fetch_one(RandList),
    fetch_rand_prop(Amount - 1, lists:delete(Value, RandList), [Value | List]).
fetch_one(RandList) ->
    try
        Total = lib_random:rand(get_total_weight(RandList)),
        lists:foldl(fun(Value, Acc) ->
            Conf = tb_honor_title_rand_prop:get(Value),
            NowTotal = Acc - maps:get(weight, Conf, 0),
            case NowTotal =< 0 of
                true -> throw(Value);
                _ -> NowTotal
            end
        end, Total, RandList)
    catch
        throw:RelValue  -> RelValue
    end.
get_total_weight(RandList) ->
    lists:foldl(fun(Value, Acc) ->
        Conf = tb_honor_title_rand_prop:get(Value),
        Acc + maps:get(weight, Conf, 0)
    end, 0, RandList).


honor_title_to_proto(ProtoHero, Hero) ->
    Title = Hero#hero.honor_title,
    ProtoHero#'ProtoHero'{
        honor_title = #'ProtoPairLong'{key = Title#hero_title.unique_id, value = Title#hero_title.item_id}
    }.

put_on(HeroId, Item) ->
    HonorTitle = Item#item.honor_title,
    lib_player_pack:update_item(?PACK_TYPE_TITLE, Item#item{honor_title = HonorTitle#honor_title{hero_id = HeroId}}),
    Hero = lib_hero_api:hero_info(HeroId),
    lib_hero_api:update_hero(Hero#hero{
        honor_title = #hero_title{
            unique_id = Item#item.unique_id,
            item_id = Item#item.item_id
        }
    }, ?HERO_UPDATE_TYPE_HONOR_TITLE),
    update_prop(HeroId).

take_off(Item) ->
    HonorTitle = Item#item.honor_title,
    lib_player_pack:update_item(?PACK_TYPE_TITLE, Item#item{honor_title = HonorTitle#honor_title{hero_id = 0}}),
    Hero = lib_hero_api:hero_info(HonorTitle#honor_title.hero_id),
    lib_hero_api:update_hero(Hero#hero{honor_title = #hero_title{}}, ?HERO_UPDATE_TYPE_HONOR_TITLE),
    update_prop(HonorTitle#honor_title.hero_id).

request_put_on(Msg) ->
    #'Proto10129001'{unique_id = UniqueId, hero_id = HeroId} = Msg,
    {Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, UniqueId),
    ?JUDGE_RETURN(Check =:= true, ?ERR_PACK_AMOUNT),
    ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_CLIENT_OPERATOR),
    ?JUDGE_RETURN(not lib_player_pack:is_overdue(PackItem), ?ERR_PACK_AMOUNT),
    ?JUDGE_RETURN(PackItem#item.honor_title#honor_title.hero_id =:= 0, ?ERROR_CLIENT_OPERATOR),
    Hero = lib_hero_api:hero_info(HeroId),
    Title = Hero#hero.honor_title,
    ?JUDGE_RETURN(Title#hero_title.item_id =:= 0 andalso Title#hero_title.unique_id =:= 0, ?ERROR_CLIENT_OPERATOR),
    put_on(HeroId, PackItem),
    lib_send:respond_to_client(?MSG_RETURN_HONOR_TITLE_PUT_ON).

request_take_off(Msg) ->
    #'Proto10129002'{hero_id = HeroId} = Msg,
    ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_CLIENT_OPERATOR),
    Hero = lib_hero_api:hero_info(HeroId),
    Title = Hero#hero.honor_title,
    ?JUDGE_RETURN(Title#hero_title.unique_id =/= 0 andalso Title#hero_title.item_id =/= 0, ?ERROR_CLIENT_OPERATOR),
    {Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, Title#hero_title.unique_id),
    ?JUDGE_RETURN(Check =:= true, ?ERROR_INVALID_PARAM),
    ?JUDGE_RETURN(PackItem#item.honor_title#honor_title.hero_id =:= HeroId, ?ERROR_INVALID_PARAM),
    take_off(PackItem),
    lib_send:respond_to_client(?MSG_RETURN_HONOR_TITLE_TAKE_OFF).

update_prop(HeroId) ->
    lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_HONOR_TITLE).

calc_honor_title_prop(Hero) ->
    try
        Title = Hero#hero.honor_title,
        {Check, PackItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_TITLE, Title#hero_title.unique_id),
        ?JUDGE_RETURN(Check =:= true, -1),
        honor_title_prop(Hero, PackItem)
    catch
        _:_  -> dict:new()
    end.
honor_title_prop(_Hero, Item) ->
    Conf = tb_honor_title:get(maps:get(honor_title, tb_item:get(Item#item.item_id))),
    PropDict = lib_fight_prop:cfg_prop_dict_from_conf(Conf),
    lists:foldl(fun(Id, Acc) ->
        PropConf = tb_honor_title_rand_prop:get(Id),
        PropName = lib_types:to_atom(maps:get(prop_name, PropConf)),
        PropValue = lib_types:to_atom(maps:get(prop_value, PropConf)),
        lib_fight_prop:add_prop(PropName, PropValue, Acc)
    end, PropDict, Item#item.honor_title#honor_title.rand_prop).