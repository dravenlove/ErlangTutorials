%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_test_command
%%% Created on : 2020/8/6 0006 17:18
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_test_command).
-author("glendy").
-include("common.hrl").
-include("chat.hrl").
-include("meritorious_award.hrl").
-include("hero.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("inner_city.hrl").
-include("country_warehouse.hrl").
-include("ProtoClient_10111.hrl").
-include("ProtoClient_10103.hrl").
-include("ProtoClient_10105.hrl").
-include("ProtoClient_10109.hrl").
-include("ProtoClient_10116.hrl").
-include("ProtoClient_10115.hrl").
-include("ProtoClient_10118.hrl").
-include("ProtoClient_10123.hrl").
-include("ProtoClient_10128.hrl").
-include("ProtoClient_10129.hrl").
-include("ProtoClient_10130.hrl").
-include("ProtoClient_10131.hrl").
-include("ProtoClient_10134.hrl").
-include("ProtoClient_10137.hrl").
-include("ProtoClient_10139.hrl").
-include("ProtoClient_10143.hrl").
-include("ProtoClient_10144.hrl").
-include("ProtoClient_10140.hrl").
-include("ProtoClient_10146.hrl").
-include("ProtoClient_10153.hrl").
-include("ProtoClient_10150.hrl").
-include("ProtoClient_10157.hrl").
-include("player.hrl").
-include("science.hrl").
-include("activity.hrl").

%% API
-export([
	handle/1,
	dynamic_compile_run/5,

	debug_string/1,
	debug_string/2
]).

handle(Msg) ->
	#'Proto10111999'{
		cmd_name = Cmd,
		param1 = Par1,
		param2 = Par2,
		param3 = Par3,
		param4 = Par4
	} = Msg,

	try
		CtrlList = [
			{"@run:", fun dynamic_compile_run/5}
		],

		lib_common:list_map(fun({Ctrl, Fun}) ->
			CtrlLen = string:len(Ctrl),
			?JUDGE_CONTINUE(string:substr(Cmd, 1, CtrlLen) =:= Ctrl),

			Arg = string:sub_string(Cmd, CtrlLen + 1),
			apply(Fun, [Arg, Par1, Par2, Par3, Par4]),

			?RETURN(ctrl)
        end, CtrlList),

		?INFO("test command: ~p ~p ~p ~p ~p, ~n", [Cmd, Par1, Par2, Par3, Par4]),
		handle(Cmd, Par1, Par2, Par3, Par4)
	catch
		throw:{error, ctrl} ->
			?INFO("test command ctrl: ~p ~p ~p ~p ~p, ~n", [Cmd, Par1, Par2, Par3, Par4]);
		throw:{error, ErrCode} ->
			?INFO("test command error: ~p ~p ~p ~p ~p ~p, ~n", [Cmd, Par1, Par2, Par3, Par4, ErrCode]),
			throw({error, ErrCode});
		_:Reason ->
			?ERROR("test command error: CmdName: ~p Pars: ~p ~p ~p ~p, ~n  Reason ~p, ~p", [Cmd, Par1, Par2, Par3, Par4, Reason, erlang:get_stacktrace()])
	end.

dynamic_compile_run(CodeStr, _Par1, _Par2, _Par3, _Par4) ->
	Src =
"-module(dynamic_compile_run_test).
-export([run/0]).
run() -> "++ CodeStr ++".
",
	try
		{Mod,Code} = dynamic_compile:from_string(Src),
		code:purge(Mod),
		code:load_binary(Mod, Mod, Code),
		Mod:run()
	catch
		Type: Reason -> ?DEBUG("dyncmic_run error: ~p ~p ~p", [Type, Reason, erlang:get_stacktrace()])
	end
.
handle("open_server_day", Type, _Par2, _Par3, _Par4) ->
	OpenDay = 
	case Type of
		0 -> config:get_open_days();
		1 -> config:get_open_days();
		2 -> lib_cluster_send:cluster_sync_apply(mod_cluster, fun config:get_open_days/0, []);
		3 -> lib_cluster_send:world_sync_apply(mod_cluster, fun config:get_open_days/0, [])
	end,

	debug_string(lib_types:to_list(OpenDay));

handle("chat", Par1, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10105001'{
		chat_type = Par1,
		content_type = ?CHAT_CONTENT_WORD,
		wcontent = "测试聊天发言"
	},
	lib_player_chat:request_send_chat(Msg);

handle("suit_test", Par1, _Par2, _Par3, _Par4) ->
	lib_suit:request_info(#'Proto10150101'{uid = Par1});

handle("package", Par1, _Par2, _Par3, _Par4) ->
	lib_player_pack:request_pack_info(#'Proto10103001'{type = Par1});
handle("get", Par1, Par2, _Par3, _Par4) ->
	PackItemList = [lib_item_api:pack_item(Par1, Par2)],
	lib_player_pack:auto_insert(PackItemList, #serial_obj{insert_serial_type = ?ADD_TEST}, true, ?PACK_TIPS1);
handle("del", Par1, Par2, Par3, Par4) ->
	?DEBUG("test command: ~ts ~p ~p ~p ~p", ["del", Par1, Par2, Par3, Par4]),
	PackItemList0 = [#item{item_id = Par1, amount = Par2}],
	PackItemList =
		if
			Par3 > 0 andalso Par4 > 0 -> [#item{item_id = Par3, amount = Par4} | PackItemList0];
			true -> PackItemList0
		end,
	lib_player_pack:auto_remove(PackItemList, #serial_obj{remove_serial_type = ?USE_TEST}, true);
handle("change", Par1, Par2, _Par3, _Par4) ->
	?DEBUG("test command: ~ts ~p ~p", ["change", Par1, Par2]),
	Amount = lib_player_pack:count_by_id(Par1),
	case Amount > 0 of
		true ->
			PackItemList = [#item{item_id = Par1, amount = Amount}],
			lib_player_pack:auto_remove(PackItemList, #serial_obj{remove_serial_type = ?USE_TEST}, true);
		_ -> skip
	end,
	PackItemList0 = [#item{item_id = Par1, amount = Par2}],
	lib_player_pack:auto_insert(PackItemList0, #serial_obj{insert_serial_type = ?ADD_TEST}, true, ?PACK_TIPS1);
handle("item", Par1, Par2, _Par3, _Par4) ->
	if
		Par1 =:= 1 ->
			Amount = lib_player_pack:count_by_id(Par2),
			?DEBUG("item amount: ~p ~p", [Par2, Amount]);
		true -> skip
	end;
handle("use_item", Par1, Par2, _Par3, _Par4) ->
	?INFO("~p ~p", [Par1, Par2]),
	lib_use_item:request_use_pack_item(#'Proto10103003'{pack_type = Par1, unique_id = Par2, amount = 1, use_argv = 1});
handle("clean_pack", Par1, _Par2, _Par3, _Par4) ->
	lib_player_pack:clean_package(Par1, #serial_obj{remove_serial_type =  0});

handle("league", Par1, Par2, Par3, Par4) ->
	lib_player_league:test_league_command(Par1, Par2, Par3, Par4);

handle("friend", Par1, Par2, Par3, Par4) ->
	lib_player_friend:test_friend_command(Par1, Par2, Par3, Par4);

handle("rank", Par1, Par2, Par3, Par4) ->
	lib_player_rank:test_rank_command(Par1, Par2, Par3, Par4);

handle("recharge", Par1, _Par2, _Par3, _Par4) ->
	lib_player_recharge:test_recharge_command(Par1);

handle("vip", Par1, Par2, Par3, Par4) ->
	lib_player_vip:test_vip_command(Par1, Par2, Par3, Par4);

handle("backact", Par1, Par2, Par3, Par4) ->
	lib_player_backactivity:test_backact_command(Par1, Par2, Par3, Par4);

handle("mail", Par1, Par2, Par3, Par4) ->
	lib_player_mail:test_mail_command(Par1, Par2, Par3, Par4);

handle("json", _Par1, _Par2, _Par3, _Par4) ->
	{_, A} = file:open("./Map1001.json", [raw, binary]),
	?INFO("~p~n", [A]),
	{_, B} = file:read(A, 1024*1024),
	C = jsx:decode(B),
	?INFO("~p~n", [C]);

handle("block_view", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_block:request_block_view({'Proto10154001', [6010101, 6010102]})
;
handle("troop_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_troop:request_troop_info(1)
;
handle("create_troop", Par1, _Par2, _Par3, _Par4) ->
	lib_player_troop:request_create_troop({'Proto10155002', Par1})
;
handle("troop_march", Par1, Par2, Par3, _Par4) ->
	lib_player_troop:request_troop_march({'Proto10155003', Par1, [{'ProtoPos', Par2, Par3 - 2 * Par3}]})
;

handle("cluster", Par1, _Par2, _Par3, _Par4) ->
	if
		Par1 =:= 1 ->
			lib_cluster_node:async_game_node_to_cluster(config:cluster_node());
		true -> skip
	end;

handle("http", Par1, Par2, Par3, Par4) ->
	lib_http_api:test_http(Par1, Par2, Par3, Par4);
handle("http1", _Par1, _Par2, _Par3, _Par4) ->
	lib_player:http_role_info();

handle("debug_string", _Par1, _Par2, _Par3, _Par4) ->
	?INFO("debug_string"),
	debug_string("test debug_string");

handle("hero_prop", HeroId, _Par2, _Par3, _Par4) ->
	PropDict = lib_hero_api:hero_prop(HeroId),
	PropMap = lib_common:dict_to_map(PropDict),
	DebugString = maps:fold(fun(PropName, PropVal, Str) ->
		Format = "~ts ~n ~ts : ~p",
		case PropVal /= 0 of
			false -> Str;
			true ->
				io_lib:format(Format, [Str, atom_to_list(PropName), PropVal])
		end
	end, io_lib:format("hero [~p (~ts)] prop : ~n", [HeroId, lib_hero_api:hero_name(HeroId)]), PropMap),
	Force = lib_hero_api:hero_force(HeroId),
	ForceStr = io_lib:format("~ts ~n force : ~p ~n", [DebugString, Force]),
	SkillList = lib_hero_api:hero_skill_list(HeroId),
	debug_string(io_lib:format("~ts ~n hero [~p (~ts)] skill : ~p ~n", [ForceStr, HeroId, lib_hero_api:hero_name(HeroId), SkillList]))
;
handle("hero_skill", HeroId, _Par2, _Par3, _Par4) ->
	SkillList = lib_hero_skill_learning:valid_skill_id_list(HeroId),
	debug_string(io_lib:format("hero ~p skill: ~w", [HeroId, SkillList]))
;
handle("hero_force", HeroId, _Par2, _Par3, _Par4) ->
	Hero = lib_hero_api:hero_info(HeroId),
	ConfPropDict = lib_hero_prop:calc_hero_prop(Hero),
	PropBase = lib_fight_prop:hero_to_prop_base(Hero),
	PropDict0 = lib_fight_prop:parsing_cfg_prop_dict(PropBase, ConfPropDict),

	PropDict = lib_fight_prop:skill_prop(PropBase, PropDict0),
	{A, B, C} = lib_fight_prop:calc_prop_force1(PropBase, PropDict),
	{D, E, F, G} = lib_fight_prop:calc_skill_force1(PropBase, PropDict),
	Force3 = lib_fight_prop:get_prop(power, PropDict),
	debug_string(io_lib:format("hero [~p (~ts)] :
	面板属性基础战力 ~p ~n
	实际属性基础战力 ~p ~n
	属性战力 ~p ~n
	面板属性系数 ~p ~n
	实际属性系数 ~p ~n
	总属性系数 ~p ~n
	技能战力 ~p ~n
	其他战力 ~p ~n
	skill_powerbase_coefficient ~p ~n
	equipment_powerbase_coefficient ~p ~n
	star_powerbase_coefficient ~p ~n
	aide_powerbase_coefficient ~p ~n
	formation_powerbase_coefficient ~p ~n
	beast_powerbase_coefficient ~p ~n
	soul_powerbase_coefficient ~p ~n
	skill_powerbase ~p ~n
	总战力 ~p ~n
	 ", [HeroId, lib_hero_api:hero_name(HeroId), A, B, C, D, E, F, G, Force3,
		lib_fight_prop:get_prop(skill_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(equipment_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(star_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(aide_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(formation_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(beast_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(soul_powerbase_coefficient, PropDict),
		lib_fight_prop:get_prop(skill_powerbase, PropDict),
		C + G + Force3]))
;
%%handle("hero_special_effect_info", HeroId, _Par2, _Par3, _Par4) ->
%%	#{is_genius := IsGenius} = tb_hero:get(HeroId),
%%	DebugString =
%%		case IsGenius of
%%			0 -> io_lib:format("该英雄没有天赋", []);
%%			_ ->
%%				#hero{awaken = Awaken} = Hero = lib_hero_api:hero_info(HeroId),
%%				GeniusIdList = lib_hero_genius:genius_id_list(HeroId, Awaken),
%%				Format = "~ts ~n ~ts : ~p",
%%				lists:foldr(
%%					fun(GeniusId, Str) ->
%%						Conf = tb_hero_genius:get(GeniusId),
%%						Effect = maps:get(special_effect, Conf, 0),
%%						case Effect of
%%							0 -> Str;
%%							_ ->
%%								N = lib_hero_genius:is_activation(Hero, Effect),
%%								io_lib:format(Format, [Str, maps:get(des, tb_special_effect:get(Effect)), N])
%%						end
%%					end, io_lib:format("hero [~p (~ts)] special effect : ~n", [HeroId, lib_hero_api:hero_name(HeroId)]) ,GeniusIdList)
%%		end,
%%	debug_string(io_lib:format("0-未激活，X-已激活，且翻X倍 ~n ~ts", [DebugString]))
%%;
handle("hero_assist_prop", HeroId, _Par2, _Par3, _Par4) ->
	Hero = lib_hero_api:hero_info(HeroId),
	PropDict = lib_hero_assist:calc_assist_prop(Hero),
	DebugString = dict:fold(
		fun(PropName, PropVal, Str) ->
			Format = "~ts ~n ~ts : ~p",
			case PropVal /= 0 of
				false -> Str;
				true ->
					io_lib:format(Format, [Str, atom_to_list(PropName), PropVal])
			end
		end, io_lib:format("hero [~p (~ts)] assist_prop : ~n", [HeroId, lib_hero_api:hero_name(HeroId)]), PropDict),
	debug_string(io_lib:format("助战属性 ~n ~ts", [DebugString]))
;
handle("hero_real_prop", HeroId, _Par2, _Par3, _Par4) ->
	Hero = lib_hero_api:hero_info(HeroId),
	PropBase = lib_fight_prop:hero_to_prop_base(Hero),
	PropDict = lib_hero_api:hero_prop(HeroId),
	PropMap = lib_common:dict_to_map(lib_fight_prop:statistics_prop_dict(PropBase, PropDict)),
	DebugString = maps:fold(fun(PropName, PropVal, Str) ->
		Format = "~ts ~n ~ts : ~p",
		case PropVal /= 0 of
			false -> Str;
			true ->
				io_lib:format(Format, [Str, atom_to_list(PropName), PropVal])
		end
	end, io_lib:format("hero [~p (~ts)] real_prop : ~n", [HeroId, lib_hero_api:hero_name(HeroId)]), PropMap),
	Force = lib_hero_api:hero_force(HeroId),
	ForceStr = io_lib:format("~ts ~n force : ~p ~n", [DebugString, Force]),
	SkillList = lib_hero_api:hero_skill_list(HeroId),
	debug_string(io_lib:format("~ts ~n hero [~p (~ts)] skill : ~p ~n", [ForceStr, HeroId, lib_hero_api:hero_name(HeroId), SkillList]))
;
handle("hero_single_prop", HeroId, Index, _Par3, _Par4) ->
	PropDict = lib_hero_prop:fetch_hero_prop(HeroId, Index),
	PropMap = lib_common:dict_to_map(PropDict),
	DebugString = maps:fold(fun(PropName, PropVal, Str) ->
		Format = "~ts ~n ~ts : ~p",
		case PropVal /= 0 of
			false -> Str;
			true ->
				io_lib:format(Format, [Str, atom_to_list(PropName), PropVal])
		end
	end, io_lib:format("hero [~p (~ts)] single_prop(~p) : ~n", [HeroId, lib_hero_api:hero_name(HeroId), Index]), PropMap),
%%	Force = lib_hero_api:hero_force(HeroId),
%%	ForceStr = io_lib:format("~ts ~n force : ~p ~n", [DebugString, Force]),
%%	SkillList = lib_hero_api:hero_skill_list(HeroId),
%%	debug_string(io_lib:format("~ts ~n hero [~p (~ts)] skill : ~p ~n", [ForceStr, HeroId, lib_hero_api:hero_name(HeroId), SkillList]))
	debug_string(DebugString)
;

handle("get_country", Par1, _Par2, _Par3, _Par4) ->
	Num = lib_counter:get_country_role(Par1),
	?INFO("get_country : ~p~n", [Num]);
handle("add_country", Par1, _Par2, _Par3, _Par4) ->
	Num = lib_counter:add_country_role(Par1),
	?INFO("add_country : ~p~n", [Num]);

handle("active_hero", HeroId, _Par2, _Par3, _Par4) ->
	lib_hero_api:active_hero(HeroId, ?HERO_ACTIVE_TYPE_COMMAND);
handle("request_active_hero", HeroId, _Par2, _Par3, _Par4) ->
	lib_hero:request_active_hero(#'Proto10116002'{hero_id = HeroId})
;

handle("get_troops", _HeroId, _Par2, _Par3, _Par4) ->
	lib_troops:test();

handle("get_not_troops", _HeroId, _Par2, _Par3, _Par4) ->
	lib_player_troops:request_not_create_hero_list();

handle("create_troops", HeroId, _Par2, _Par3, _Par4) ->
	lib_player_troops:request_troops_create({'Proto10121003', HeroId});

handle("delete_troops", HeroId, _Par2, _Par3, _Par4) ->
	lib_player_troops:request_troops_dissolve({'Proto10121004', HeroId, []});

handle("test_online", Par1, _Par2, _Par3, _Par4) ->
	online_:request_online_gift_receive( #'Proto10115002'{gift_id = Par1});

handle("test_online1", _Par1, _Par2, _Par3, _Par4) ->
	online_gift:online_gift_recharge_compensate();




handle("sync_call_fight", Par1, Par2, _Par3, _Par4) ->
	A = lib_timer:unixtime_ms(),
	Data = lib_combat_queue_test:sync_call_fight(Par1, Par2),
	Data1 = Data#combat_callback.callback_data,
	?INFO("~p~n", [Data1#callback_data0.msg]),
	?INFO("~p~n", [Data1#callback_data0.result_msg]),
	lib_send:respond_to_client(Data1#callback_data0.msg),
	lib_send:respond_to_client(Data1#callback_data0.result_msg),
	?INFO("fight time ~p~n", [lib_timer:unixtime_ms() - A]);
handle("async_call_fight", Par1, Par2, _Par3, _Par4) ->
	lib_combat_queue_test:async_call_fight(Par1, Par2);
handle("async_cast_fight", Par1, Par2, Par3, _Par4) ->
	lib_combat_queue_test:async_cast_fight(Par1, Par2, Par3);

handle("challenge_BroadCase", _Par1, _Par2, _Par3, _Par4) ->
	lib_challenge_api:challenge_BroadCase(lib_player:player_show(), 101,1017 );

handle("fight_test_skill", _Par1, _Par2, _Par3, _Par4) ->
	Data = lib_combat_queue_test:fight_test_skill(),
	Data1 = Data#combat_callback.callback_data,
	?INFO("~p~n", [Data1#callback_data0.msg]),
	?INFO("~p~n", [Data1#callback_data0.result_msg]),
	lib_send:respond_to_client(Data1#callback_data0.msg),
	lib_send:respond_to_client(Data1#callback_data0.result_msg);

handle("fight_test_skill1", _Par1, _Par2, _Par3, _Par4) ->
	Data = lib_combat_queue_test:fight_test_skill1(),
	Data1 = Data#combat_callback.callback_data,
	?INFO("~p~n", [Data1#callback_data0.msg]),
%%	?INFO("~p~n", [Data1#callback_data0.result_msg]),
	lib_send:respond_to_client(Data1#callback_data0.msg),
	lib_send:respond_to_client(Data1#callback_data0.result_msg);

handle("test_active_science", ScienceId, Level, _Par3, _Par4) ->
	lib_player_science:test_active_science(ScienceId,Level);

handle("test_fight2", _HeroId, _RobotId, _Par3, _Par4) ->
	Data = lib_combat_queue_test:test_fight(),
	Data1 = Data#combat_callback.callback_data,
	?INFO("~p~n", [Data1#callback_data0.msg]),
	?INFO("~p~n", [Data1#callback_data0.result_msg]),
	lib_send:respond_to_client(Data1#callback_data0.msg),
	lib_send:respond_to_client(Data1#callback_data0.result_msg);

handle("send_rank_award_to_mail", Tick, _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_meritorious_rank:get_pid(),fun lib_meritorious_award_rank:send_rank_award_to_mail/1,[Tick]);

handle("nobility", Id, _Par2, _Par3, _Par4) ->
	lib_player_nobility:test(Id);
handle("get_no", _HeroId, _Par2, _Par3, _Par4) ->
	lib_player_bounty_mission:test();
handle("get_all_map", _HeroId, _Par2, _Par3, _Par4) ->
	lib_player_map:request_all_map();
handle("get_con", _Country, _Fighting, _Par3, _Par4) ->
	?DEBUG("~p", [lib_player_city_building:request_city_building_info({'Proto10133001', 6001001})]);

handle("hero_up_level", HeroId, ItemId, _Par3, _Par4) ->
	lib_hero_level:request_use_item(#'Proto10116011'{hero_id = HeroId, item_id = ItemId});
handle("hero_reset_level", HeroId, _Par2, _Par3, _Par4) ->
	lib_hero_level:request_level_reset(#'Proto10116012'{hero_id = HeroId});
handle("hero_up_star", HeroId, _Par2, _Par3, _Par4) ->
	lib_hero_star:request_star_upgrade(#'Proto10116021'{hero_id = HeroId});
handle("hero_reset_star", HeroId, _Par2, _Par3, _Par4) ->
	lib_hero_star:request_star_reset(#'Proto10116022'{hero_id = HeroId});
handle("corps_up_stage", HeroId, Type, UseCommon, _Par4) ->
	lib_hero_corps:request_upgrade_stage(#'Proto10116031'{hero_id = HeroId, type = Type, use_common = UseCommon});
handle("corps_reset_stage", HeroId, Type, _Par3, _Par4) ->
	lib_hero_corps:request_stage_reset(#'Proto10116032'{hero_id = HeroId, type = Type});
handle("hero_reset", HeroId, _Type, _Par3, _Par4) ->
	lib_hero:request_hero_reset(#'Proto10116005'{hero_id = HeroId});

handle("robot_test", Robot, _, _Par3, _Par4) ->
	lib_robot_api:robot_player_show(Robot);

handle("main_task",  Param1, _Param2, _Param3, _Param4) ->
	lib_player_task_api:test_main_task(Param1);

handle("task_submit", Param1, Param2, _Param3, _Param4) ->
	lib_player_task_api:request_player_submit_task(#'Proto10118002'{task_id = Param1, task_type = Param2});

handle("language", _Param1, _Param2, _Param3, _Param4) ->
	?INFO("翻译：~ts",[language:auto(?LANGUAGE_CN, "3542")]),
	?INFO("翻译：~ts",[language:auto(?LANGUAGE_FT, "3542")]);

handle("test_mail", _Param1, _Param2, _Param3, _Param4) ->
	Arg0 = #mail_arg{
		type = ?MAIL_ARG_TYPE_ROLE_BASE,
		data = lib_player:player_show()
	},
	Arg = #mail_arg{
		type = ?MAIL_ARG_TYPE_ITEM_OBJ,
		data = #item_obj{
			item_id = 102012013,
			amount = 10
		}
	},
	Arg1 = #mail_arg{
		type = ?MAIL_ARG_TYPE_STRING,
		data = "测试"
	},
	lib_mail_api:fast_send_mail(lib_player:player_id(), 1001, [Arg0, Arg], [Arg1],
		[], ?ADD_DUNGEONED_RANK_REWARD);

handle("show_prop", HeroId, _Par2, _Par3, _Par4) ->
	case lib_hero_api:is_have_hero(HeroId) of
		true ->
			{Str0, HeroBase, PropDict0} =
			{io_lib:format("英雄 ：~ts~n", [lib_hero_api:hero_name(HeroId)]), lib_hero_api:hero_base_info(HeroId), lib_hero_api:hero_prop(HeroId)},
			PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
			lib_fight_prop:calc_force(PropBase, PropDict0),
			PropDict = lib_fight_prop:statistics_prop_dict(PropBase, PropDict0),
			Str = lib_fight_prop:debug_output_prop(PropDict, HeroBase#hero_base.force),
			debug_string(io_lib:format("~ts~n~ts", [Str0, Str]));
		_ ->
			debug_string(io_lib:format("~p 是怪物 ",[HeroId]))
	end;

handle("show_function_prop", HeroId, _Par2, _Par3, _Par4) ->
	Str0 = io_lib:format("英雄 ：~ts~n", [lib_hero_api:hero_name(HeroId)]),
	PropDict = lib_hero_api:hero_prop(HeroId),
	Str = lib_fight_prop:debug_output_function_prop(PropDict),
	debug_string(io_lib:format("~ts~n~ts", [Str0, Str]));

handle("show_panel_prop", HeroId, _Par2, _Par3, _Par4) ->
	case lib_hero_api:is_have_hero(HeroId) of
		true ->
			{Str0, HeroBase, PropDict0} =
			{io_lib:format("英雄 ：~p~n", [HeroId]), lib_hero_api:hero_base_info(HeroId), lib_hero_api:hero_prop(HeroId)},
			PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
			PropDict = lib_fight_prop:statistics_prop_dict(PropBase, PropDict0),
			Str = lib_fight_prop:debug_output_panel_prop(PropDict, HeroBase#hero_base.force),
			debug_string(io_lib:format("~ts~n~ts", [Str0, Str]));
		_ ->
			debug_string(io_lib:format("~p 是怪物 ",[HeroId]))
	end;

handle("show_monster", MonsterId, _Par2, _Par3, _Par4) ->
	Monster = lib_robot_api:get_monster(MonsterId,0),
	?INFO("Monster ~p" ,[Monster]),
	Front = case Monster#hero_base.former_type of 1 -> "步兵";2 -> "骑兵" end,
	Latter = case Monster#hero_base.latter_type of 3 -> "弓兵";4 -> "法师" end,
	Monster_name = lib_robot_api:monster_name(MonsterId,Monster#hero_base.robot_base_id),
	Str0 = io_lib:format("怪物ID ：~p~n,base_id ：~p~n 名字: ~p~n", [MonsterId,Monster#hero_base.robot_base_id,Monster_name]),
	Str1 = io_lib:format("前军兵种类型：~ts  前军等级：~p  前军等阶：~p ~n", [Front,Monster#hero_base.front_level,Monster#hero_base.front_stage]),
	Str2 = io_lib:format("后军兵种类型：~ts  后军等级：~p  后军等阶：~p ~n", [Latter,Monster#hero_base.back_level,Monster#hero_base.back_stage]),
	Str3 = io_lib:format("技能列表 ：~p~n", [Monster#hero_base.skill_list]),
	PropDict0 = Monster#hero_base.prop_dict,
	PropBase = lib_fight_prop:hero_base_to_prop_base(Monster),
	PropDict = lib_fight_prop:statistics_prop_dict(PropBase, PropDict0),
	Str = lib_fight_prop:debug_output_prop(PropDict, Monster#hero_base.force),
	debug_string(io_lib:format("~ts~n~ts~n~ts~n~ts~n~ts", [Str0, Str1, Str2, Str3, Str]));



handle("building_upgrade",  BuildingId, Lv, _Param3, _Param4) ->
	lib_inner_city_api:building_upgrade(BuildingId,Lv)
;

handle("alien_invasion", _Par1, _Par2, _Par3, _Par4) ->
	Tick = lib_timer:unixtime(),
	lib_player_alien_invasion:fresh_monster(2, Tick)
;
handle("barrack_soldier_num", Soldier_type, _Par2, _Par3, _Par4) ->
	lib_barrack_train_api:inquire_soldier_num(Soldier_type);

handle("barrack_soldier_add", Soldier_type, Num, _Par3, _Par4) ->
	lib_barrack_train_api:gm_barrack_train(Soldier_type,Num);


handle("player_show", PlayerId, _Par2, _Par3, _Par4) ->
	lib_player_other:request_player_other(#'Proto10111002'{player_id = PlayerId});
handle("player_hero_base", Par1, Par2, _Par3, _Par4) ->
	lib_player_other:request_player_hero_base({'Proto10111004', Par1, Par2});

handle("add_study_time", Type, _Par2, _Par3, _Par4) ->
	lib_hero_crops_study_api:add_study_time(Type);


handle("equip", _Par1, _Par2, _Par3, _Par4) ->
	?DEBUG("~p", [lib_equip_api:make_bin()]);
handle("guse", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_map_clearing:test();
handle("gnotuse", Par1, _Par2, _Par3, _Par4) ->
	?DEBUG("~p", [lib_hero:request_awaken_hero({'Proto10116004', Par1})]);
handle("ets", _Par1, _Par2, _Par3, _Par4) ->
	?DEBUG("~p", [ets:last(ets_player_nobility)]);
handle("hero_assist", Par1, Par2, Par3, _Par4) ->
	lib_hero_assist:request_hero_assist({'Proto10116081', Par1, Par2, Par3});
handle("get_equip_by_heroId", Par1, _Par2, _Par3, _Par4) ->
	?DEBUG("~p", [lib_player_pack:insert_equip(?PACK_TYPE_EQUIP, #item{item_id = Par1, amount = 1}, ?INSERT_SERIAL(?ADD_EQUIP_MAKE, Par1), true)]);
handle("hero_assist_info", Par1, _Par2, _Par3, _Par4) ->
	?DEBUG("~p", [(lib_hero_api:hero_info(Par1))#hero.assist]);
handle("equip_break", Par1, Par2, _Par3, _Par4) ->
	lib_player_equip:equip_break(Par1, Par2);
handle("equip_make", Par1, Par2, _Par3, _Par4) ->
	lib_player_equip:request_equip_make({'Proto10126016', Par1, Par2});
handle("equip_break_get", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_equip:equip_break_get();
handle("map1", Par1, _Par2, _Par3, _Par4) ->
	lib_troops_api:async_test(Par1);
handle("map2", Par1, _Par2, _Par3, _Par4) ->
	lib_troops_api:sync_test(Par1);
handle("city_detail", Par1, _Par2, _Par3, _Par4) ->
	lib_player_map:request_city_detail({'Proto10114011', Par1});

handle("function_open_list", _Par1, _Par2, _Par3, _Par4) ->
	OpenFunctionList = lib_function_open:open_function_list(),
	Str = io_lib:format("已开启功能列表: ~w", [OpenFunctionList]),
	debug_string(Str)
;

handle("title_put_on", Par1, Par2, _Par3, _Par4) ->
	lib_honor_title:request_put_on(#'Proto10129001'{unique_id = Par1, hero_id = Par2});

handle("title_take_off", Par1, _Par2, _Par3, _Par4) ->
	lib_honor_title:request_take_off(#'Proto10129002'{hero_id = Par1});

handle("logistics", _Par1, _Par2, _Par3, _Par4) ->
	lib_logistics_center:request_logistics_center_info();

handle("logistics_buy", Par1, Par2, _Par3, _Par4) ->
	lib_logistics_center:request_buy_resource(#'Proto10130002'{type = Par1 , use_type = Par2});

handle("sort_country_rank", CountryId, RankType, _Par3, _Par4) ->
	mod_server:async_apply(mod_country_rank:get_pid(CountryId, RankType), fun mod_country_rank:test_sort_rank/0, [])
;

handle("save_country_rank", CountryId, RankType, _Par3, _Par4) ->
	mod_server:async_apply(mod_country_rank:get_pid(CountryId, RankType), fun mod_country_rank:test_save_rank/0, [])
;

handle("sort_rank0", CountryId, RankType, _Par3, _Par4) ->
	mod_server:async_apply(mod_rank0:get_pid(CountryId, RankType), fun mod_rank0:test_sort_rank/0, [])
;

handle("save_rank0", CountryId, RankType, _Par3, _Par4) ->
	mod_server:async_apply(mod_rank0:get_pid(CountryId, RankType), fun mod_rank0:test_save_rank/0, [])
;

handle("rank0_list", CountryId, RankType, _Par3, _Par4) ->
	lib_player_rank0:request_rank_list(#'Proto10109002'{country = CountryId, rank_type = RankType})
;

handle("rank_award_mail", Type, _Par2, _Par3, _Par4) ->
	UidList = mod_activity_monitor:find_activity_uid_list(?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK),
	lists:foreach(fun(Uid) -> mod_server:async_apply(lib_player_open_server_rank:pid(Uid),fun lib_open_server_rank:rank_award_mail/1 ,[Type]) end,UidList)
;

handle("country_warehouse", _Par1, _Par2, _Par3, _Par4) ->
	lib_country_warehouse:get_country_warehouse_info()
;

handle("get_red_packet", Num, _Par2, _Par3, _Par4) ->
	lib_country_warehouse:get_country_dividends(#'Proto10128101'{num = Num})
;

handle("grant_year_award", _Par1, _Par2, _Par3, _Par4) ->
	lib_country_warehouse_api:async_apply(fun lib_country_warehouse:grant_year_award/0,[])

;


handle("add_recharge_dividends", Par1, _Par2, _Par3, _Par4) ->
	lib_country_warehouse:add_recharge_dividends_to_country(Par1)
;




handle("block", Num, _Par2, _Par3, _Par4) ->
	lib_player_chat_block:request_block_one_player(#'Proto10105009'{player_id = Num,state = 0})
;



handle("update_stage", Stage, _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_challenge:get_pid(),fun lib_challenge_api:update_activity_stage/1 ,[Stage])
;

handle("get_open_info", _Stage, _Par2, _Par3, _Par4) ->
	A = lib_challenge_api:get_open_info(),
	?INFO("~p ",[A])
;


handle("holy_spirit_hall", _Par1, _Par2, _Par3, _Par4) ->
	lib_holy_spirit_hall:request_holy_spirit_hall_info()
;

handle("request_hero_info", HallId, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10131002'{type = HallId},
	lib_holy_spirit_hall:request_hero_info(Msg)
;

handle("request_update_batter_hero", HallId, Place, HeroId, _Par4) ->
	Msg = #'Proto10131003'{id = HallId,type = Place,hero_id = HeroId},
	lib_holy_spirit_hall:request_update_batter_hero(Msg)
;

handle("request_unlock_place", HallId, Place, _Par3, _Par4) ->
	Msg = #'Proto10131004'{id = HallId,type = Place},
	lib_holy_spirit_hall:request_unlock_place(Msg)
;

handle("request_upgrade", HallId, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10131005'{id = HallId} ,
	lib_holy_spirit_hall:request_upgrade(Msg)
;

handle("request_one_key_battle", HallId, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10131006'{id = HallId}  ,
	lib_holy_spirit_hall:request_one_key_battle(Msg)
;

handle("request_ban_player_id", Par1, Par2, _Par3, _Par4) ->
	Msg = #'Proto10105015'{player_id = Par1,state = Par2}  ,
	lib_player_chat_block:request_ban_player_id(Msg)
;


handle("fight_record", Num, _Par2, _Par3, _Par4) ->
	lib_player_fight:fight_record(Num)
;

handle("building_upgrade_lord_mansion",  Lv, _Par2, _Param3, _Param4) ->
	Building = lib_inner_city_api:building_info(?BUILDING_LORD_MANSION),
	NewBuilding = Building#building{building_lv = Lv},
	lib_inner_city_api:update_building_info(NewBuilding)
;

handle("dissolve_interface", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_dissolve_hero_fragment:do_interface(#'Proto10116002'{});
handle("dissolve_change_state", Par1, Par2, _Par3, _Par4) ->
	lib_player_dissolve_hero_fragment:do_change_state(#'Proto10116050'{item_id_state = #'ProtoPairLong'{key = Par1,value = Par2}});
handle("dissolve_hero_fragment", Par1, Par2, _Par3, _Par4) ->
	lib_player_dissolve_hero_fragment:do_dissolve_fragment(#'Proto10116051'{item_id_state = #'ProtoPairLong'{key = Par1,value = Par2}});

handle("country_get_king", _Par1, _Par2, _Par3, _Par4) ->
	lib_map_api:async(fun lib_country:test_get_king/1, [lib_player:player_id()]);

handle("lib_player_chat", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_chat:request_history();

handle("dungeoned_reset_use_times", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_dungeoned:reset_use_times();

handle("dungeoned_test", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_dungeoned:test();

handle("lib_broadcast", Par1, Par2, Par3, Par4) ->
	lib_broadcast_api:test_command(Par1,[Par2],[Par3],[Par4])
;


handle("add_player_meritorious", Meritorious , _Par2, _Par3, _Par4) ->
	lib_meritorious_award_rank:test_get_meritorious(Meritorious)
;

handle("player_unreceived", _ , _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_meritorious_rank:get_pid(),fun lib_meritorious_award_rank:player_unreceived/0)
;

handle("rank_mail", Type , _Par2, _Par3, _Par4) ->
	case Type of
		1 ->mod_server:async_apply(mod_meritorious_rank:get_pid(),fun lib_meritorious_award_rank:rank_mail/1,[day_award]);
		2 ->mod_server:async_apply(mod_meritorious_rank:get_pid(),fun lib_meritorious_award_rank:rank_mail/1,[year_award])
	end

;

handle("get_meritorious_rank_gather", _Meritorious , _Par2, _Par3, _Par4) ->
	A = mod_server:sync_apply(mod_meritorious_rank:get_pid(),fun lib_meritorious_award_rank:get_meritorious_rank_gather/0),
	?DEBUG("A ~p",[A#meritorious_rank_gather.rank_map])
;

handle("city_building_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_city_building:test();
handle("city_industry_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_city_industry:test();
handle("city_visiting_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_city_visiting:test();


handle("get_marssuit_info", Par1, Par2, Par3, _Par4) ->
	lib_suit:request_info({'Proto10150105', #'ProtoActivityUID'{id = Par1, server_type = Par2, system_type = Par3}});

handle("get_recharge_info", Par1, Par2, Par3, _Par4) ->
	lib_player_cumulative_recharge:request_info({'Proto10150101', #'ProtoActivityUID'{id = Par1, server_type = Par2, system_type = Par3}});
handle("city_visiting_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_city_visiting:test();

handle("dungeoned", _Par1, _Par2, _Par3, _Par4) ->
	?INFO("get_drop_id_list() ~p",[lib_dungeoned:get_drop_id_list()]),
	DropId = lib_dungeoned:get_drop_id(lib_player:player_id(), #combat_queue_detail{}),
	?INFO("~p~n", [DropId]);

handle("save_arena", _Par1, _Par2, _Par3, _Par4) ->
	mod_arena:async_apply(fun mod_arena:save_monitor/0, []);

handle("arena_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_arena:request_info();
handle("arena_challenge", Type, Index, TagId, TagRank) ->
	lib_player_arena:request_challenge(#'Proto10137002'{type = Type, index = Index, tag_id = TagId, tag_rank = TagRank, hero_list = [201]});
handle("arena_refresh", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_arena:request_refresh();
handle("arena_rank_list", Page, _Par2, _Par3, _Par4) ->
	lib_player_arena:request_rank_list(#'Proto10137006'{page = Page});
handle("arena_rank_reward", _Par1, _Par2, _Par3, _Par4) ->
	mod_arena:async_apply(fun lib_arena:send_rank_reward/0, []);
handle("test_annual", _Par1, _Par2, _Par3, _Par4) ->
	Tick1 = lib_season_and_days_api:cur_annual_start_tick(),
	Tick2 = lib_season_and_days_api:next_annual_start_tick(),
	Tick3 = lib_season_and_days_api:cur_season_start_tick(),
	Tick4 = lib_season_and_days_api:next_season_start_tick(),
	?INFO("~ncur annual : ~p~nnext annual : ~p~ncur season : ~p~nnext season : ~p~n", [Tick1, Tick2, Tick3, Tick4]);
handle("alien_main_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_alien:request_main_info();
handle("alien_join_team", Par1, Par2, _Par3, _Par4) ->
	lib_player_alien:request_join_team(#'Proto10143002'{floor = Par1, hero_id = Par2});
handle("alien_exit_team", Par1, Par2, _Par3, _Par4) ->
	lib_player_alien:request_exit_team(#'Proto10143003'{floor = Par1, hero_id = Par2});
handle("alien_draw_reward", Par1, _Par2, _Par3, _Par4) ->
	lib_player_alien:request_draw_reward(#'Proto10143004'{index = Par1});
handle("alien_watch_fight", Par1, _Par2, _Par3, _Par4) ->
	lib_player_alien:request_watch_fight(#'Proto10143005'{floor = Par1});
handle("alien_convene", Par1, _Par2, _Par3, _Par4) ->
	lib_player_alien:request_convene(#'Proto10143009'{floor = Par1});
handle("alien_buff", Par1, _Par2, _Par3, _Par4) ->
	lib_alien:rand_buff(Par1);

handle("activity_start", _Par1, _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_honour_top:get_pid(), fun lib_honour_top_flow:activity_start/0);

handle("next_timer", _Par1, _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_honour_top:get_pid(), fun lib_honour_top_flow:next_timer/0);

handle("get_honour_top_info", Stage, Group, Type, _Par4) ->
	lib_honour_top:async_apply(fun lib_honour_top:get_honour_top_info/5,[Stage,Group,Type]);

handle("bet_award_mail", _Par1, _Par2, _Par3, _Par4) ->
	mod_server:async_apply(mod_honour_top:get_pid(),fun lib_honour_top_flow:bet_award_mail/0)
;

handle("create_genesis_church", _Par1, _Par2, _Par3, _Par4) ->
	lib_map_api:async(fun lib_genesis_church:create_small/0, []);
handle("clean_genesis_church", _Par1, _Par2, _Par3, _Par4) ->
	lib_map_api:async(fun lib_genesis_church:clean/0, []);
handle("country_task_info", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_country_task:request_country_task_info();
handle("country_task_get", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_country_task:test();
handle("country_war_task_start", _Par1, _Par2, _Par3, _Par4) ->
	lib_map_api:async(fun lib_country_war_task:test/0, []);
handle("country_war_task_next", _Par1, _Par2, _Par3, _Par4) ->
	lib_map_api:async(fun lib_country_war_task:test1/0, []);
handle("country_combat", _Par1, _Par2, _Par3, _Par4) ->
	lib_country_war_task:request_info();
handle("find_road", Par1, Par2, _Par3, _Par4) ->
	lib_map:test(Par1, Par2);
handle("watch_country_war", Par1, _Par2, _Par3, _Par4) ->
	lib_combat_queue_api:join_watching(Par1, lib_player:get_player_base());

handle("shop_info", ShopId, _Par2, _Par3, _Par4) ->
	lib_player_shop:request_info(#'Proto10144001'{shop_id = ShopId});
handle("shop_buy", ShopId, Index, GridId, GoodsId) ->
	lib_player_shop:request_buy(#'Proto10144002'{
		shop_id = ShopId,
		index = Index,
		grid_id = GridId,
		goods_id = GoodsId
	});
handle("shop_refresh", ShopId, _Par2, _Par3, _Par4) ->
	lib_player_shop:request_refresh(#'Proto10144003'{shop_id = ShopId});
handle("request_dragon_palace_info", _Par1, _Par2, _Par3, _Par4) ->
	Gather = lib_dragon_palace_adventure:get_dragon_palace_adventure(),
	?DEBUG("Gather   ~p",[Gather]);

handle("send_hero_expeditions", Type, Hero, _Par3, _Par4) ->
	Msg = #'Proto10140003'{type = Type,hero_list = [Hero]},
	lib_dragon_palace_adventure:send_hero_expeditions(Msg);

handle("request_astrology", Type, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10140007'{type = Type},
	lib_dragon_palace_adventure:request_astrology(Msg);

handle("puppet_info", CityId, _Par2, _Par3, _Par4) ->
	lib_player_puppet:request_puppet_info(CityId);
handle("puppet_refresh", CityId, IsFree, _Par3, _Par4) ->
	Msg = #'Proto10146002'{
		city_id = CityId,
		is_free = IsFree
	},
	lib_player_puppet:request_puppet_refresh(Msg);
handle("puppet_c", CityId, HeroId, _Par3, _Par4) ->
	Msg = #'Proto10146004'{
		city_id = CityId,
		hero_id = HeroId
	},
	lib_player_puppet:request_puppet_challenge(Msg);
handle("puppet_r", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_puppet:refresh_all_puppet();
handle("puppet_buy", CityId, _Par2, _Par3, _Par4) ->
	Msg = #'Proto10146005'{
		city_id = CityId
	},
	lib_player_puppet:request_puppet_challenge_buy(Msg);
handle("puppet_lock", CityId, Type, _Par3, _Par4) ->
	Msg = #'Proto10146003'{
		city_id = CityId,
		type = Type
	},
	lib_player_puppet:request_puppet_lock(Msg);

handle("task_reset_everyday", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_task_new:reset_everyday()
;

handle("request_test_fight_record", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_fight:request_test_fight_record()
;

handle("delete_test_fight_record", _Par1, _Par2, _Par3, _Par4) ->
	lib_player_fight:delete_test_fight_record()
;

handle("buy_num_limit", Par1, _Par2, _Par3, _Par4) ->
	EquipDict = lib_equip_api:all_equip(),
	Fun =	%% 查找消耗里面有没有需要的道具
		fun
			F (ItemId, Par, Acc) ->
				case tb_equip_break:get(ItemId) of
					false -> Acc;
					Conf ->
						Consume = maps:get(consume, Conf, []),
						NewAcc = lists:foldl(
							fun([Id, Num], Acc0) ->
								case Id of
									Par -> Num + Acc0;
									_ -> Acc0
								end
							end, Acc, Consume),
						F(ItemId + 1, Par, NewAcc)
				end
		end,
	NumLimit = dict:fold(
		fun(_, EquipItem, Acc) ->
			Fun(EquipItem#item.item_id * 10 + EquipItem#item.equip_info#equip_info.break_through, Par1, Acc)
		end, 0, EquipDict),
	?DEBUG("~p", [NumLimit])
;

handle("core_equip_level", Par1, _Par2, _Par3, _Par4) ->
	lib_player_equip:request_equip_core_level({'Proto10126017', Par1})
;
handle("equip_resolve", Par1, _Par2, _Par3, _Par4) ->
	lib_player_equip:request_equip_resolve({'Proto10126018', [Par1]})
;

handle("add_year_construction_values", Construction_value, _Par2, _Par3, _Par4) ->
	lib_country_warehouse_api:add_year_construction_values(Construction_value)
;

handle("gov_times", Par1, _Par2, _Par3, _Par4) ->
	case Par1 of
		?TASK_TYPE_GOVERNMENT_TASK ->
			Detail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
			lib_player_government_task:update_government(
				#government_detail{total_time = Detail#government_detail.total_time}),
			debug_string(io_lib:format("完成了~p个政务", [lib_player_government_task:total_time()])),
			debug_string(io_lib:format("政务完成了~p个", [total_time])),
			debug_string(io_lib:format("政务~p个", [Detail#government_detail.total_time]))
	end
;
handle("task_reset", Par1, _Par2, _Par3, _Par4) ->
	case Par1 of
		?TASK_TYPE_CHAPTER_TASK ->
			lib_player_task_new:delete_all_task_info(Par1),
			lib_player_chapter_task:update_chapter_detail(#chapter_detail{});
		?TASK_TYPE_DAILY_TASK ->
			lib_player_daily_task:reset_everyday();
		?TASK_TYPE_ACHIEVEMENT_TASK ->
			lib_player_task_new:delete_all_task_info(Par1),
			lib_player_achievement_task:update_achievement_detail(#achievement_detail{});
		?TASK_TYPE_GOVERNMENT_TASK ->
			Detail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK),
			lib_player_government_task:update_government(
				#government_detail{next_refresh_tick = Detail#government_detail.next_refresh_tick})
	end
;
handle("season", Type, _Par2, _Par3, _Par4) ->
	CurTick = lib_timer:unixtime(),
	case Type >= 0 andalso Type =< 3 of
		false -> skip;
		true ->
			SeasonInfo = lib_season:season_info(Type),
			{Season, Day} = lib_season_api:season_info(SeasonInfo, CurTick),
			debug_string(io_lib:format("第~p赛季第~p天", [Season, Day]))
	end
;
handle("open_server_date", Type, _Par2, _Par3, _Par4) ->
	OpenTick = 
	case Type of
		0 -> config:open_tick();
		1 -> config:open_tick();
		2 -> lib_cluster_send:cluster_sync_apply(mod_cluster, fun config:open_tick/0, []);
		3 -> lib_cluster_send:world_sync_apply(mod_cluster, fun config:open_tick/0, [])
	end,
	{{Year, Mon, Day}, {Hour, Min, Sec}} = lib_timer:to_localtime(OpenTick),
	debug_string(io_lib:format("~p-~p-~p ~p:~p:~p", [Year, Mon, Day, Hour, Min, Sec]))
;

handle("show_itemtype",ItemId, _Par2, _Par3, _Par4) ->
	Mt = maps:get(main_type, tb_item:get(ItemId)),
	St = maps:get(sub_type, tb_item:get(ItemId)),
	?DEBUG("~p", [Mt]),
	?DEBUG("~p", [St])
;
handle("show_suit",_Par1, _Par2, _Par3, _Par4) ->
	IdList = tb_godofwar_suit:get_list(),
	GradeList = [tb_godofwar_suit:get(Id) || Id <- IdList],
%%	ProtoGradeList = [grade_to_proto(grade_info(UID, Index)) || {Index, _GradeConf} <- GradeList],
	?DEBUG("~p", [GradeList])
;
handle("show_accdata",UID, _Par2, _Par3, _Par4) ->
	Data = lib_player_activity:get_activity_data(UID),
	?DEBUG("~p", [Data])
;
handle("get_actdetail",UID, _Par2, _Par3, _Par4) ->
%%	UID = lib_activity_api:uid(Msg),
	Activity = lib_player_activity:fetch_activity_info(UID),
%%	DetailMap = lib_player_activity:get_detail_map(lib_activity_api:tid(UID)),
%%	Data = maps:get(ActId, DetailMap),
	?DEBUG("~p", [Activity])
;



handle("show_stagereward", StageId, _Par2, _Par3, _Par4) ->
	StageConf = tb_stage:get(StageId),
	StageReward = maps:get(pass_reward, StageConf, []),
	Add = lib_player_science_api:get_effect_value(?EFFECT_CHAPTER_REWARD_ADD),
	PassReward =
		lists:foldl(fun([ItemId,Num],L) ->
			case maps:get(main_type, tb_item:get(ItemId)) == 102 andalso maps:get(sub_type, tb_item:get(ItemId)) == 19 of
				true ->
					[[ItemId,trunc(Num * (1 + Add))]|L];
				false ->
					[[ItemId,Num]|L]
			end
		end,[],StageReward),
	?DEBUG("~p", [PassReward]),
	?DEBUG("~p", [Add])
;

handle("gift_code", Par1, _Par2, _Par3, _Par4) ->
	{_, A} = file:open("./gift_code.json", [raw, binary]),
	{_, B} = file:read(A, 1024 * 1024),
	{_, [_,{_,Code}|_]} = lists:nth(Par1, jsx:decode(B)),
	?INFO("~p~n", [Code]),
	lib_gift_code:request_gift_code(#'Proto10153001'{code = Code})
;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handle("test_exchange1", Par1, _Par2, _Par3, _Par4) ->
	welfare_exchange:request_welfare_exchange_trigger( #'Proto10157001'{trigger_type = Par1});

handle("test_exchange2", _Par1, _Par2, _Par3, _Par4) ->
	welfare_exchange:request_welfare_exchange_lists();

handle("test_exchange3", Par1, _Par2, _Par3, _Par4) ->
	welfare_exchange:request_welfare_exchange_task_finish(#'Proto10157003'{award_id= Par1});




%%%%%%%%%%%%%%%%%%%%%%%%%%

handle(Cmd, Par1, Par2, Par3, Par4) ->
	Num = string:chr(Cmd,$*),
	Symbol = string:sub_string(Cmd, Num+1),
	KeySymbol = string:left(Cmd, Num-1),
	handle1(KeySymbol, Symbol,Par2, Par3, Par4),
	?WARNING("no test command: ~ts ~p ~p ~p ~p", [Cmd, Par1, Par2, Par3, Par4]).

handle1("holiday", Holiday, _Par2, _Par3, _Par4) ->
	try
		NowTick = lib_timer:unixtime(),
		NowDate = lib_timer:to_localtime(NowTick),
		HolidayTick = lib_season_and_days_api:holiday_tick(Holiday, NowTick),
		{{Y,M,D},{_,_,_}} = HolidayDate = lib_timer:to_localtime(HolidayTick),
		{Day, {Hour, Minute, Sec}} = calendar:time_difference(NowDate, HolidayDate),
		Holiday_Name = lib_season_and_days_api:get_name_from_tb(Holiday),
		debug_string(io_lib:format("节日[~ts]为~p年~p月~p日 还有~p天~p时~p分~p秒", [Holiday_Name,Y,M,D,Day, Hour, Minute, Sec]))
	catch
		_:_  -> debug_string(io_lib:format("输入有误",[]))
	end
;




handle1(Cmd, Par1, Par2, Par3, Par4) ->
	?WARNING("no test command: ~ts ~p ~p ~p ~p", [Cmd, Par1, Par2, Par3, Par4])
.




debug_string(Str) ->
	lib_send:respond_to_client(#'Proto80111999'{str = Str}).
debug_string(Str, PlayerId) ->
	lib_send:respond_to_client_by_pid(lib_player:get_pid(PlayerId), #'Proto80111999'{str = Str}).

