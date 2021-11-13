%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 17:20
%%%-------------------------------------------------------------------
-module(pp_hero).
-author("13661").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_HERO_LIST, _, _Msg) ->
	lib_hero:request_hero_list();
handle(?MSG_CLIENT_ACTIVE_HERO, _, Msg) ->
	lib_hero:request_active_hero(Msg);
handle(?MSG_CLIENT_FETCH_HERO_INFO, _, Msg) ->
	lib_hero:request_fetch_hero_info(Msg);
handle(?MSG_CLIENT_AWAKEN_HERO, _, Msg) ->
	lib_hero:request_awaken_hero(Msg);
handle(?MSG_CLIENT_HERO_RESET, _, Msg) ->
	lib_hero:request_hero_reset(Msg);
handle(?MSG_CLIENT_HERO_LEVEL_UPGRADE, _, Msg) ->
	lib_hero_level:request_use_item(Msg);
handle(?MSG_CLIENT_HERO_RESET_LEVEL, _, Msg) ->
	lib_hero_level:request_level_reset(Msg);
handle(?MSG_CLIENT_HERO_STAR_UPGRADE, _, Msg) ->
	lib_hero_star:request_star_upgrade(Msg);
handle(?MSG_CLIENT_HERO_RESET_STAR, _, Msg) ->
	lib_hero_star:request_star_reset(Msg);
handle(?MSG_CLIENT_HERO_CORPS_STAGE_UPGRADE, _, Msg) ->
	lib_hero_corps:request_upgrade_stage(Msg);
handle(?MSG_CLIENT_HERO_CORPS_STAGE_RESET, _, Msg) ->
	lib_hero_corps:request_stage_reset(Msg);
handle(?MSG_CLIENT_HERO_SKILL_ACTIVE, _, Msg) ->
	lib_hero_skill_learning:request_active_skill(Msg);
handle(?MSG_CLIENT_HERO_SKILL_UPGRADE, _, Msg) ->
	lib_hero_skill_learning:request_skill_upgrade(Msg);
handle(?MSG_CLIENT_HERO_SKILL_RESET, _, Msg) ->
	lib_hero_skill_learning:request_skill_reset(Msg);
handle(?MSG_CLIENT_HERO_SKILL_LIKE_INFO, _, Msg) ->
	lib_hero_skill_like:request_hero_skill_like_info(Msg);
handle(?MSG_CLIENT_HERO_SKILL_LIKE, _, Msg) ->
	lib_hero_skill_like:request_hero_skill_like(Msg);

%% 英雄命运
handle(?MSG_CLIENT_HERO_DESTINY_INFO, _, Msg) ->
	lib_hero_destiny:request_hero_destiny_info(Msg);
handle(?MSG_CLIENT_ACTIVATE_HERO_DESTINY, _, Msg) ->
	lib_hero_destiny:activate_hero_destiny(Msg);

%% 英雄碎片分解
handle(?MSG_CLIENT_CHANGE_STATE, _, Msg)->
	lib_player_dissolve_hero_fragment:do_change_state(Msg)
;
handle(?MSG_CLIENT_DISSOLVE_HERO_FRAGMENT, _, Msg)->
	lib_player_dissolve_hero_fragment:do_dissolve_fragment(Msg)
;
handle(?MSG_CLIENT_DISSOLVE_HERO_INTERFACE, _, Msg)->
	lib_player_dissolve_hero_fragment:do_interface(Msg)
;

%% 英雄兵种研究
handle(?MSG_CLIENT_HERO_CROPS_INFO, _, Msg)->
	lib_hero_crops_study:get_hero_crops_info(Msg)
;
handle(?MSG_CLIENT_HERO_CROPS_STUDY, _, Msg)->
	lib_hero_crops_study:hero_crops_study(Msg)
;
handle(?MSG_CLIENT_HERO_CROPS_STUDY_REMEDY, _, Msg)->
	lib_hero_crops_study:hero_crops_study_remedy(Msg)
;

%% 英雄助战
handle(?MSG_CLIENT_HERO_ASSIST, _, Msg) ->
	lib_hero_assist:request_hero_assist(Msg)
;
handle(?MSG_CLIENT_CANCEL_HERO_ASSIST, _, Msg) ->
	lib_hero_assist:request_cancel_hero_assist(Msg)
;

%% 英雄阵法
handle(?MSG_CLIENT_HERO_FORMATION_USE, _, Msg) ->
	lib_hero_formation:request_hero_formation_use(Msg)
;
handle(?MSG_CLIENT_HERO_FORMATION_LEVEL, _, Msg) ->
	lib_hero_formation:request_hero_formation_level(Msg)
;
handle(?MSG_CLIENT_HERO_FORMATION_STAGE, _, Msg) ->
	lib_hero_formation:request_hero_formation_stage(Msg)
;
handle(?MSG_CLIENT_HERO_FORMATION_RESET, _, Msg) ->
	lib_hero_formation:request_hero_formation_reset(Msg)
;

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

