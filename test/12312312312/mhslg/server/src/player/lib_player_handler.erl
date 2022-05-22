%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_handler
%%% Created on : 2020/8/4 0004 11:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_handler).
-author("glendy").
-include("common.hrl").

%% API
-export([
	get_handlers/0,
	get_merge_handlers/0,
	get_handler/1
]).

get_handlers() ->
	[
		lib_player:player_base_handler(),
		lib_player:player_base_other_handler(),
		lib_player_pack:player_pack_handler(),
		lib_money_api:player_money_handler(),
		lib_player_mail:player_mail_handler(),
		lib_player_copy:player_copy_handler(),
		lib_player_league:player_league_handler(),
		lib_player_backactivity:player_backactivity_handler(),
		lib_player_rank:player_rank_handler(),
		lib_player_vip:player_vip_handler(),
		lib_player_ban:player_ban_handler(),
		lib_player_chapter:player_chapter_handler(),
		lib_hero:player_hero_handler(),
		lib_player_activity:player_activity_handler(),
		lib_function_open:player_function_open_handler(),
		lib_head_icon:player_head_icon_handler(),
		online_gift:player_online_gift_handler(),
		lib_troops:player_troops_handler(),
		lib_inner_city:player_inner_city_handler(),
		lib_pub_recruit:player_pub_recruit_handler(),
		lib_barrack_train:player_barrack_train_handler(),
		lib_player_country:player_country_handler(),
		lib_logistics_center:player_logistics_center_handler(),
		lib_player_dissolve_hero_fragment:player_dissolve_handler(),
		lib_player_nobility:player_nobility_handler(),
		lib_player_equip:player_equip_handler(),
		lib_holy_spirit_hall:player_holy_spirit_hall_handler(),
		lib_player_chat_limit:player_chat_handler(),
		lib_player_map_clearing:player_map_clearing_handler(),
		lib_player_bounty_mission:player_bounty_mission_handler(),
		lib_player_city_industry:player_city_industry_handler(),
		lib_player_hero_busy:player_hero_busy_handler(),
		lib_player_dungeoned:player_dungeoned_handler(),
		lib_player_science:player_science_handler(),
		lib_player_arena:player_arena_handler(),
		lib_player_city_building:player_city_building_handler(),
		lib_player_city_visiting:player_city_visiting_handler(),
		lib_player_shop:player_shop_handler(),
		lib_player_puppet:player_puppet_handler(),
		lib_player_country_task:player_country_task_handler(),
		lib_hero_crops_study:player_hero_crops_study_handler(),
		lib_player_task_new:player_task_handler(),
		lib_star_stop:player_star_handler(),
		lib_player_alien_invasion:player_alien_invasion_handler(),
		lib_player_season_activity:player_season_activity_handler(),
		welfare_exchange:player_welfare_exchange_handler()
	].

get_merge_handlers() ->
	PlayerHandlerList = [ #player_handler{table_name = ?DBPLAYER_FRIEND, table_player_field = <<"id">>} | get_handlers()],
	PlayerHandlerList.

get_handler(Ets) ->
	lists:keyfind(Ets, #player_handler.ets, get_handlers()).

