%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_combat_queue).
-author("Jiuan").

-include("common.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").

%% API
-export([
	load_combat_queue/1,
	save_combat_queue/2,

	bson_list_to_fighters/1,
	fighters_to_bson_list/1
]).

load_combat_queue(Index) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_COMBAT_QUEUE, #{?BSONSET_INT(<<"index">>, Index)}) of
		Bson = #{} ->
			#combat_queue{
				queue_dict = bson_list_to_queue_dict(?BSON_LIST(Bson, queue_dict))
			};
		_ ->
			#combat_queue{}
	end.

bson_list_to_queue_dict(BsonList) ->
	lists:foldl(fun(Bson, Dict) ->
		CombatQueueId = ?BSON_INT(Bson, combat_id),
		Type = ?BSON_INT(Bson, type),
		dict:store(CombatQueueId, #combat_queue_detail{
			combat_id = CombatQueueId,
			type = Type,
			is_stop = true,
			interval_type = ?BSON_INT(Bson, interval_type),
			fight_type = ?BSON_INT(Bson, fight_type),
			combat_state = ?BSON_INT(Bson, combat_state),
			handle_tick = ?BSON_INT(Bson, handle_tick),
			interval = ?BSON_INT(Bson, interval),
			combat_times = ?BSON_INT(Bson, combat_times),
			combat_rank = bson_list_to_combat_rank(?BSON_LIST(Bson, combat_rank)),
			l_last_role = ?BSON_INT(Bson, l_last_role),
			l_win_times = ?BSON_INT(Bson, l_win_times),
			l_highest = bson_to_highest(?BSON_BSON(Bson, l_highest)),
			l_player_dict = bson_list_to_player_dict(?BSON_LIST(Bson, l_player_dict)),
			l_fighters = bson_list_to_fighters(?BSON_LIST(Bson, l_fighters)),
			l_country = ?BSON_INT(Bson, l_country),
			l_buff_list = ?BSON_LIST(Bson, l_buff_list),
			r_last_role = ?BSON_INT(Bson, r_last_role),
			r_win_times = ?BSON_INT(Bson, r_win_times),
			r_highest = bson_to_highest(?BSON_BSON(Bson, r_highest)),
			r_player_dict = bson_list_to_player_dict(?BSON_LIST(Bson, r_player_dict)),
			r_fighters = bson_list_to_fighters(?BSON_LIST(Bson, r_fighters)),
			r_country = ?BSON_INT(Bson, r_country),
			r_buff_list = ?BSON_LIST(Bson, r_buff_list),
			drums_limit = ?BSON_INT(Bson, drums_limit),
			drums = ?BSON_INT(Bson, drums),
			msg_bin = ?BSON_BIN(Bson, msg_bin),
			combat_node = undefined,            %% TODO
			params = bson_to_params(Type, ?BSON_BSON(Bson, params)),
			country = ?BSON_INT(Bson, country),
			watching_players = bson_list_to_watching_players(?BSON_LIST(Bson, watching_players)),
			save_record = ?BSON_BOOL(Bson, save_record),
			have_drop = ?BSON_BOOL(Bson, have_drop),
			drop_id = ?BSON_INT(Bson, drop_id),
			drop_map = bson_list_to_drop_map(?BSON_LIST(Bson, drop_map)),
			drop_assist_map = bson_list_to_drop_map(?BSON_LIST(Bson, drop_assist_map))
		}, Dict)
	end, dict:new(), BsonList).

bson_list_to_combat_rank(BsonList) ->
	lists:foldl(fun(Bson, List) ->
		[#rank_detail{
			id = ?BSON_INT(Bson, id),
			country = ?BSON_INT(Bson, country),
			name = ?BSON_STRING(Bson, name),
			kills = ?BSON_INT(Bson, kills)
		} | List]
	end, [], BsonList).

bson_to_highest(Bson) ->
	#combat_highest{
		max_dominate = bson_to_highest_detail(?BSON_BSON(Bson, max_dominate)),
		max_force = bson_to_highest_detail(?BSON_BSON(Bson, max_force)),
		max_office = bson_to_highest_detail(?BSON_BSON(Bson, max_office))
	}.

bson_to_highest_detail(Bson) ->
	#highest_detail{
		id = ?BSON_INT(Bson, id),
		head_id = ?BSON_INT(Bson, head_id),
		hero_id = ?BSON_INT(Bson, hero_id),
		name = ?BSON_STRING(Bson, name),
		value = ?BSON_INT(Bson, value)
	}.

bson_list_to_player_dict(BsonList) ->
	lists:foldl(fun(Bson, Dict) ->
		Id = ?BSON_INT(Bson, id),
		dict:store(Id, #combat_player{
			id = Id,
			name = ?BSON_STRING(Bson, name),
			heros = ?BSON_LIST(Bson, heros),
			head_id = ?BSON_INT(Bson, head_id),
			country = ?BSON_INT(Bson, country),
			kills = ?BSON_INT(Bson, kills),
			loss = ?BSON_INT(Bson, loss),
			office = ?BSON_INT(Bson, office)
		}, Dict)
	end, dict:new(), BsonList).

bson_list_to_fighters(BsonList) ->
	lists:foldl(fun(Bson, List) ->
		[#combat_hero{
			index = ?BSON_INT(Bson, index),
			is_robot = ?BSON_BOOL(Bson, is_robot),
			robot_base_id = ?BSON_INT(Bson, robot_base_id),
			id = ?BSON_INT(Bson, id),
			name = ?BSON_STRING(Bson, name),
			head_id = ?BSON_INT(Bson, head_id),
			hero_id = ?BSON_INT(Bson, hero_id),
			prop_base = bson_to_prop_base(?BSON_BSON(Bson, prop_base)),
			awaken = ?BSON_INT(Bson, awaken),
			win_times = ?BSON_INT(Bson, win_times),
			hero_level = ?BSON_INT(Bson, hero_level),
			country = ?BSON_INT(Bson, country),
			office = ?BSON_INT(Bson, office),
			hero_star = ?BSON_INT(Bson, hero_star),
			hero_force = ?BSON_INT(Bson, hero_force),
			hero_title = ?BSON_INT(Bson, hero_title),
			formation = ?BSON_INT(Bson, formation),
			former = bson_to_army(?BSON_BSON(Bson, former)),
			latter = bson_to_army(?BSON_BSON(Bson, latter)),
			prop_dict = lib_fight_prop:bson_to_prop_dict(?BSON_BSON(Bson, prop_dict)),
			skill_list = ?BSON_LIST(Bson, skill_list),
			honor_title = db_player_hero:bson_to_honor_title(?BSON_BSON(Bson, honor_title)),
			equip_dict = db_equip:bson_list_to_equip(?BSON_LIST(Bson, equip_dict))
		} | List]
	end, [], BsonList).

bson_to_prop_base(Bson) ->
	#prop_base{
		sex = ?BSON_INT(Bson, sex),
		type = ?BSON_INT(Bson, type),
		quality = ?BSON_INT(Bson, quality),
		color = ?BSON_INT(Bson, color),
		front_corps = ?BSON_INT(Bson, front_corps),
		back_corps = ?BSON_INT(Bson, back_corps)
	}.

bson_to_army(Bson) ->
	#combat_army{
		type = ?BSON_INT(Bson, type),
		level = ?BSON_INT(Bson, level),
		stage = ?BSON_INT(Bson, stage),
		attack = ?BSON_INT(Bson, attack),
		defence = ?BSON_INT(Bson, defence),
		speed = ?BSON_INT(Bson, speed),
		troops = ?BSON_INT(Bson, troops),
		cur_troops = ?BSON_INT(Bson, cur_troops)
	}.

bson_list_to_watching_players(BsonList) ->
	lists:foldl(fun(Bson, List) ->
		[#watching_player{
			id = ?BSON_INT(Bson, id),
			sid = ?BSON_INT(Bson, sid),
			country = ?BSON_INT(Bson, country)
		} | List]
	end, [], BsonList).

bson_to_params(Type, Bson) ->
	case Type of
		_ ->
			binary_to_term(?BSON_BIN(Bson, detail))
	end.

bson_list_to_drop_map(BsonList) ->
	lists:foldl(fun(Bson, Maps) ->
		InfoList = ?BSON_LIST(Bson, info_map),
		PlayerId = ?BSON_INT(Bson, role_id),
		InfoMap =
		lists:foldl(fun(Bson1, Maps1) ->
			ConfId = ?BSON_INT(Bson1, conf_id),
			Amount = ?BSON_INT(Bson1, amount),
			maps:put(ConfId, Amount, Maps1)
		end, maps:new(), InfoList),
		maps:put(PlayerId, InfoMap, Maps)
	end, maps:new(), BsonList).


save_combat_queue(Index, CombatQueue) ->
	BsonList = queue_dict_bson_list_to(CombatQueue#combat_queue.queue_dict),
	Bson = #{
		?BSONSET_INT(index, Index),
		?BSONSET_LIST(queue_dict, BsonList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_COMBAT_QUEUE, #{?BSONSET_INT(<<"index">>, Index)}, #{<<"$set">> => Bson}).

queue_dict_bson_list_to(CombatQueueDict) ->
	dict:fold(fun(CombatQueueId, CombatDetail, List) ->
		[#{
			?BSONSET_INT(<<"combat_id">>, CombatQueueId),
			?BSONSET_INT(<<"type">>, CombatDetail#combat_queue_detail.type),
			?BSONSET_INT(<<"interval_type">>, CombatDetail#combat_queue_detail.interval_type),
			?BSONSET_INT(<<"fight_type">>, CombatDetail#combat_queue_detail.fight_type),
			?BSONSET_INT(<<"combat_state">>, CombatDetail#combat_queue_detail.combat_state),
			?BSONSET_INT(<<"handle_tick">>, CombatDetail#combat_queue_detail.handle_tick),
			?BSONSET_INT(<<"interval">>, CombatDetail#combat_queue_detail.interval),
			?BSONSET_INT(<<"combat_times">>, CombatDetail#combat_queue_detail.combat_times),
			?BSONSET_LIST(<<"combat_rank">>, combat_rank_to_bson_list(CombatDetail#combat_queue_detail.combat_rank)),
			?BSONSET_INT(<<"l_last_role">>, CombatDetail#combat_queue_detail.l_last_role),
			?BSONSET_INT(<<"l_win_times">>, CombatDetail#combat_queue_detail.l_win_times),
			?BSONSET_BSON(<<"l_highest">>, highest_to_bson(CombatDetail#combat_queue_detail.l_highest)),
			?BSONSET_LIST(<<"l_player_dict">>, player_dict_to_bson_list(CombatDetail#combat_queue_detail.l_player_dict)),
			?BSONSET_LIST(<<"l_fighters">>, fighters_to_bson_list(CombatDetail#combat_queue_detail.l_fighters)),
			?BSONSET_INT(<<"l_country">>, CombatDetail#combat_queue_detail.l_country),
			?BSONSET_LIST(<<"l_buff_list">>, CombatDetail#combat_queue_detail.l_buff_list),
			?BSONSET_INT(<<"r_last_role">>, CombatDetail#combat_queue_detail.r_last_role),
			?BSONSET_INT(<<"r_win_times">>, CombatDetail#combat_queue_detail.r_win_times),
			?BSONSET_BSON(<<"r_highest">>, highest_to_bson(CombatDetail#combat_queue_detail.r_highest)),
			?BSONSET_LIST(<<"r_player_dict">>, player_dict_to_bson_list(CombatDetail#combat_queue_detail.r_player_dict)),
			?BSONSET_LIST(<<"r_fighters">>, fighters_to_bson_list(CombatDetail#combat_queue_detail.r_fighters)),
			?BSONSET_INT(<<"r_country">>, CombatDetail#combat_queue_detail.r_country),
			?BSONSET_LIST(<<"r_buff_list">>, CombatDetail#combat_queue_detail.r_buff_list),
			?BSONSET_INT(<<"drums_limit">>, CombatDetail#combat_queue_detail.drums_limit),
			?BSONSET_INT(<<"drums">>, CombatDetail#combat_queue_detail.drums),
			?BSONSET_BIN(<<"msg_bin">>, CombatDetail#combat_queue_detail.msg_bin),
			?BSONSET_STRING(<<"combat_node">>, CombatDetail#combat_queue_detail.combat_node),%%TODO
			?BSONSET_BSON(<<"params">>, params_to_bson(CombatDetail#combat_queue_detail.type, CombatDetail#combat_queue_detail.params)),
			?BSONSET_INT(<<"country">>, CombatDetail#combat_queue_detail.country),
			?BSONSET_LIST(<<"watching_players">>, watching_players_to_bson_list(CombatDetail#combat_queue_detail.watching_players)),
			?BSONSET_BOOL(<<"save_record">>, CombatDetail#combat_queue_detail.save_record),
			?BSONSET_BOOL(<<"have_drop">>, CombatDetail#combat_queue_detail.have_drop),
			?BSONSET_INT(<<"drop_id">>, CombatDetail#combat_queue_detail.drop_id),
			?BSONSET_LIST(<<"drop_map">>, drop_map_to_bson_list(CombatDetail#combat_queue_detail.drop_map)),
			?BSONSET_LIST(<<"drop_assist_map">>, drop_map_to_bson_list(CombatDetail#combat_queue_detail.drop_assist_map))
		} | List]
	end, [], CombatQueueDict).

combat_rank_to_bson_list(CombatRank) ->
	lists:foldl(fun(Rank, List) ->
		[#{
			?BSONSET_INT(<<"id">>, Rank#rank_detail.id),
			?BSONSET_INT(<<"country">>, Rank#rank_detail.country),
			?BSONSET_STRING(<<"name">>, Rank#rank_detail.name),
			?BSONSET_INT(<<"kills">>, Rank#rank_detail.kills)
		} | List]
	end, [], CombatRank).

highest_to_bson(Highest) ->
	#{
		?BSONSET_BSON(<<"max_office">>, highest_detail_to_bson(Highest#combat_highest.max_office)),
		?BSONSET_BSON(<<"max_force">>, highest_detail_to_bson(Highest#combat_highest.max_force)),
		?BSONSET_BSON(<<"max_dominate">>, highest_detail_to_bson(Highest#combat_highest.max_dominate))
	}.

highest_detail_to_bson(HighestDetail) ->
	#{
		?BSONSET_INT(<<"id">>, HighestDetail#highest_detail.id),
		?BSONSET_INT(<<"head_id">>, HighestDetail#highest_detail.head_id),
		?BSONSET_INT(<<"hero_id">>, HighestDetail#highest_detail.hero_id),
		?BSONSET_STRING(<<"name">>, HighestDetail#highest_detail.name),
		?BSONSET_INT(<<"value">>, HighestDetail#highest_detail.value)
	}.

player_dict_to_bson_list(PlayerDict) ->
	dict:fold(fun(Id, Player, List) ->
		[#{
			?BSONSET_INT(<<"id">>, Id),
			?BSONSET_INT(<<"country">>, Player#combat_player.country),
			?BSONSET_STRING(<<"name">>, Player#combat_player.name),
			?BSONSET_LIST(<<"heros">>, Player#combat_player.heros),
			?BSONSET_INT(<<"head_id">>, Player#combat_player.head_id),
			?BSONSET_INT(<<"kills">>, Player#combat_player.kills),
			?BSONSET_INT(<<"loss">>, Player#combat_player.loss),
			?BSONSET_INT(<<"office">>, Player#combat_player.office)
		} | List]
	end, [], PlayerDict).

fighters_to_bson_list(Fighters) ->
	lists:foldl(fun(Fighter, List) ->
		[#{
			?BSONSET_INT(<<"index">>, Fighter#combat_hero.index),
			?BSONSET_BOOL(<<"is_robot">>, Fighter#combat_hero.is_robot),
			?BSONSET_INT(<<"robot_base_id">>, Fighter#combat_hero.robot_base_id),
			?BSONSET_INT(<<"id">>, Fighter#combat_hero.id),
			?BSONSET_STRING(<<"name">>, Fighter#combat_hero.name),
			?BSONSET_INT(<<"head_id">>, Fighter#combat_hero.head_id),
			?BSONSET_INT(<<"hero_id">>, Fighter#combat_hero.hero_id),
			?BSONSET_BSON(<<"prop_base">>, prop_base_to_bson(Fighter#combat_hero.prop_base)),
			?BSONSET_INT(<<"awaken">>, Fighter#combat_hero.awaken),
			?BSONSET_INT(<<"win_times">>, Fighter#combat_hero.win_times),
			?BSONSET_INT(<<"hero_level">>, Fighter#combat_hero.hero_level),
			?BSONSET_INT(<<"country">>, Fighter#combat_hero.country),
			?BSONSET_INT(<<"office">>, Fighter#combat_hero.office),
			?BSONSET_INT(<<"hero_star">>, Fighter#combat_hero.hero_star),
			?BSONSET_INT(<<"hero_force">>, Fighter#combat_hero.hero_force),
			?BSONSET_INT(<<"hero_title">>, Fighter#combat_hero.hero_title),
			?BSONSET_INT(<<"formation">>, Fighter#combat_hero.formation),
			?BSONSET_BSON(<<"former">>, army_to_bson(Fighter#combat_hero.former)),
			?BSONSET_BSON(<<"latter">>, army_to_bson(Fighter#combat_hero.latter)),
			?BSONSET_BSON(<<"prop_dict">>, lib_fight_prop:prop_dict_to_bson(Fighter#combat_hero.prop_dict)),
			?BSONSET_LIST(<<"skill_list">>, Fighter#combat_hero.skill_list),
			?BSONSET_BSON(<<"honor_title">>, db_player_hero:honor_title_to_bson(Fighter#combat_hero.honor_title)),
			?BSONSET_LIST(<<"equip_dict">>, db_equip:equip_to_bson_list(Fighter#combat_hero.equip_dict))
		} | List]
	end, [], Fighters).

prop_base_to_bson(PropBase) ->
	#{
		?BSONSET_INT(<<"sex">>, PropBase#prop_base.sex),
		?BSONSET_INT(<<"type">>, PropBase#prop_base.type),
		?BSONSET_INT(<<"quality">>, PropBase#prop_base.quality),
		?BSONSET_INT(<<"color">>, PropBase#prop_base.color),
		?BSONSET_INT(<<"front_corps">>, PropBase#prop_base.front_corps),
		?BSONSET_INT(<<"back_corps">>, PropBase#prop_base.back_corps)
	}.

army_to_bson(Army) ->
	#{
		?BSONSET_INT(<<"type">>, Army#combat_army.type),
		?BSONSET_INT(<<"level">>, Army#combat_army.level),
		?BSONSET_INT(<<"stage">>, Army#combat_army.stage),
		?BSONSET_INT(<<"attack">>, Army#combat_army.attack),
		?BSONSET_INT(<<"defence">>, Army#combat_army.defence),
		?BSONSET_INT(<<"speed">>, Army#combat_army.speed),
		?BSONSET_INT(<<"troops">>, Army#combat_army.troops),
		?BSONSET_INT(<<"cur_troops">>, Army#combat_army.cur_troops)
	}.

watching_players_to_bson_list(WatchingPlayers) ->
	lists:foldl(fun(Player, List) ->
		[#{
			?BSONSET_INT(<<"id">>, Player#watching_player.id),
			?BSONSET_INT(<<"sid">>, Player#watching_player.sid),
			?BSONSET_INT(<<"country">>,Player#watching_player.country)
		} | List]
	end, [], WatchingPlayers).

params_to_bson(Type, Params) ->
	case Type of
		_ ->
			#{
				?BSONSET_BIN(<<"detail">>, term_to_binary(Params))
			}
	end.

drop_map_to_bson_list(DropMap) ->
	maps:fold(fun(PlayerId, InfoMap, List) ->
		InfoList =
		maps:fold(fun(ConfId, Amount, List1) ->
			[#{
				?BSONSET_INT(<<"conf_id">>, ConfId),
				?BSONSET_INT(<<"amount">>, Amount)
			} | List1]
		end, [], InfoMap),
		[#{
			?BSONSET_INT(<<"role_id">>, PlayerId),
			?BSONSET_INT(<<"info_map">>, InfoList)
		} | List]
	end, [], DropMap).