%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_login
%%% Created on : 2020/8/3 0003 17:37
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_login).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("unpack.hrl").
-include("vip.hrl").
-include("ProtoClient_10100.hrl").
-include("ProtoClient_10101.hrl").

-define(AUTH_MSG, auth_msg).

%% API
-export([handle/3]).

handle(?MSG_CLIENT_AUTH_SESSION, #unpack_state{is_validate = false, sock_pid = Sid, client_ip = ClientIp} = State, Msg) ->
	#'Proto10100001'{account = Account, tick = Tick, session = Session, server_flag = ServerFlag} = Msg,
	validate_auth_session(Account, Tick, Session),
	validate_ban_login(Sid, Account, ClientIp),
	do_fetch_role_list(Sid, Account, ServerFlag),
	put(?AUTH_MSG, Msg),
	{ok, state, State#unpack_state{is_validate = true, account = Account}};

handle(?MSG_CLIENT_RAND_NAME, #unpack_state{is_validate = true, is_login = false, sock_pid = Sid}, Msg) ->
	#'Proto10100002'{sex = Sex} = Msg,
	RandName = lib_common:random_name(Sex),
	Respond = #'Proto50100002'{name = RandName},
	lib_send:respond_to_client_by_sid(Sid, Respond);

handle(?MSG_CLIENT_SELECT_ROLE, #unpack_state{is_validate = true, is_login = false, sock_pid = Sid} = State, Msg) ->
	#'Proto10100003'{role_id = PlayerId} = Msg,
	validate_select_role(PlayerId),
	ProtoAuth = erlang:get(?AUTH_MSG),
	Account = ProtoAuth#'Proto10100001'.account,
	[RoleBson] = db_login:fetch_role_list(Account),
	case ?BSON_INT(RoleBson, <<"country">>) of
		0 ->
			PlayerBase = db_player_base:bson_to_player_base(RoleBson),
			Res = res(PlayerBase),
			lib_send:respond_to_client_by_sid(Sid, Res);
		_ ->
			NewState = do_select_role_login(PlayerId, State),
			lib_send:respond_to_client_by_sid(Sid, ?MSG_RETURN_SELECT_ROLE),
			{ok, state, NewState}
	end
;

handle(?MSG_CLIENT_CREATE_ROLE, #unpack_state{is_validate = true, is_login = false, sock_pid = Sid} = State, Msg) ->
	ProtoAuth = erlang:get(?AUTH_MSG),
	Account = ProtoAuth#'Proto10100001'.account,
	RoleList = db_login:fetch_role_list(Account),
	case RoleList of
		[] ->
			{{PlayerId, Name}, Res} = do_create_role(Msg),
			lib_send:respond_to_client_by_sid(Sid, Res),
			?JUDGE_RETURN(PlayerId > 0, ?ERROR_ROLE_NAME_EXISTS),
			Respond = #'Proto50100004'{
				role_id = PlayerId,
				role_name = Name
			},
			lib_send:respond_to_client_by_sid(Sid, Respond);
		[RoleBson] ->
			?JUDGE_RETURN(?BSON_INT(RoleBson, <<"country">>) =:= 0, ?ERROR_CLIENT_OPERATOR),
			validate_create_role(Msg),
			{PlayerId, _Name} = do_create_role(RoleBson, Msg),
			handle(?MSG_CLIENT_SELECT_ROLE, State, #'Proto10100003'{role_id = PlayerId})
	end
;

handle(?MSG_CLIENT_HEARTBEAT, #unpack_state{sock_pid = Sid}, _Msg) ->
	lib_send:respond_to_client_by_sid(Sid, #'Proto50100008'{tick = lib_timer:unixtime()});

handle(?MSG_CLIENT_RECONNECT_ROLE, #unpack_state{is_validate = false, is_login = false, sock_pid = Sid} = State, Msg) ->
	#'Proto10100007'{role_id = PlayerId, session = Session} = Msg,
	NewState = do_reconnect_login(State, PlayerId, Session),
	lib_send:respond_to_client_by_sid(Sid, ?MSG_RETURN_RECONNECT_ROLE),
	{ok, state, NewState};

handle(?MSG_CLIENT_COUNTRY_ROLE, #unpack_state{sock_pid = Sid}, _Msg) ->
	Info =
		lists:foldl(fun(Id, Acc) ->
			Num = lib_counter:get_country_role(Id),
			[#'ProtoPairLong'{key = Id, value = Num} | Acc]
					end, [], tb_role_country:get_list()),
	Respond = #'Proto50100006'{
		info = Info
	},
	lib_send:respond_to_client_by_sid(Sid, Respond);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

validate_auth_session(Account, Tick, Session) ->
	?JUDGE_RETURN(erlang:length(Account) =< ?MAX_ACCOUNT_LENGTH, ?ERROR_ACCOUNT_LENGTH),

	#{value:=TimeoutSec} = tb_const:get(session_timeout),
	SessionTick = lib_types:to_integer(Tick) + TimeoutSec,
	NowTick = lib_timer:unixtime(),
	?JUDGE_RETURN(NowTick =< SessionTick, ?ERROR_SESSION_TIMEOUT),
	GenMd5 = lib_common:md5(Account ++ Tick ++ config:md5_key()),
	?INFO("gate check: ~ts ~p ~n ~p ~p ", [Account, Tick, Session, GenMd5]),
	?JUDGE_RETURN(Session =:= GenMd5, ?ERROR_SESSION_ILLEGAL),
	ok.
do_fetch_role_list(Sid, Account, _ServerFlag) ->
	GateRoleList = db_login:fetch_role_list(Account),
	ProtoGateRoleList = [#'ProtoGateRole'{
		role_id = ?BSON_INT(RoleBson, <<"id">>),
		name = ?BSON_STRING(RoleBson, <<"name">>),
		level = ?BSON_INT(RoleBson, <<"level">>),
		country = ?BSON_INT(RoleBson, <<"country">>)
	} || RoleBson <- GateRoleList],
	Respond = #'Proto50100001'{
		role_list = ProtoGateRoleList
	},
	lib_send:respond_to_client_by_sid(Sid, Respond).

validate_create_role(Msg) ->
	#'Proto10100004'{name = Name, country = Country, sex = Sex} = Msg,
	?JUDGE_RETURN(erlang:length(Name) =< ?MAX_NAME_LENGTH, ?ERROR_NAME_LENGTH),
	?JUDGE_RETURN(lists:member(Country, tb_role_country:get_list()), ?ERROR_COUNTRY_LIMIT),
	?JUDGE_RETURN(lists:member(Sex, tb_role_sex:get_list()), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"name">>, Name)}) =< 0, ?ERROR_ROLE_NAME_EXISTS),
	CurNum = lib_counter:get_country_role(Country),
	MaxNum = maps:get(max_role, tb_role_country:get(Country)),
	?JUDGE_RETURN(CurNum < MaxNum, ?ERROR_CLIENT_OPERATOR),
	ok.

auth_msg_to_player_base(ProtoAuth, PlayerBase, PlayerBaseOther) ->
	NewPlayerBase = PlayerBase#player_base{
		session = ProtoAuth#'Proto10100001'.session,
		server_flag = ProtoAuth#'Proto10100001'.server_flag,
		server_name = ProtoAuth#'Proto10100001'.server_name,
		server_prev = lib_player:get_server_prev_by_name(ProtoAuth#'Proto10100001'.server_name),
		agent = ProtoAuth#'Proto10100001'.agent,
		agent_code = config:agent_code(ProtoAuth#'Proto10100001'.agent),
		market = ProtoAuth#'Proto10100001'.market,
		area = ProtoAuth#'Proto10100001'.area
	},
	NewPlayerBaseOther = PlayerBaseOther#player_base_other{
		net_type = ProtoAuth#'Proto10100001'.net_type,
		sys_version = ProtoAuth#'Proto10100001'.sys_version,
		sys_model = ProtoAuth#'Proto10100001'.sys_model,
		mac = ProtoAuth#'Proto10100001'.mac,
		client_type = ProtoAuth#'Proto10100001'.client_type,
		sdk_sid = ProtoAuth#'Proto10100001'.sdk_sid,
		msg_tocken =  ProtoAuth#'Proto10100001'.msg_tocken
	},
	{NewPlayerBase, NewPlayerBaseOther}.

do_create_role(Msg) ->
	CreateTick = lib_timer:unixtime(),
	ProtoAuth = erlang:get(?AUTH_MSG),
	PlayerId = lib_counter:get_player_id(),
	PlayerBase0 = #player_base{
		id = PlayerId,
		account = ProtoAuth#'Proto10100001'.account,
		name = Msg#'Proto10100004'.name ++ integer_to_list(PlayerId),
		create_tick = CreateTick
	},
	PlayerBaseOther0 = #player_base_other{
		id = PlayerBase0#player_base.id,
		create_tick = CreateTick,
		create_server_flag = ProtoAuth#'Proto10100001'.server_flag,
		create_server_name = ProtoAuth#'Proto10100001'.server_name,
		create_agent = ProtoAuth#'Proto10100001'.agent,
		create_agent_code = config:agent_code(ProtoAuth#'Proto10100001'.agent),
		create_market = ProtoAuth#'Proto10100001'.market,
		create_net_type = ProtoAuth#'Proto10100001'.net_type,
		create_sys_version = ProtoAuth#'Proto10100001'.sys_version,
		create_sys_model = ProtoAuth#'Proto10100001'.sys_model,
		create_mac = ProtoAuth#'Proto10100001'.mac,
		create_client_type = ProtoAuth#'Proto10100001'.client_type
	},
	{PlayerBase, PlayerBaseOther} = auth_msg_to_player_base(ProtoAuth, PlayerBase0, PlayerBaseOther0),
	BaseBson = db_player_base:player_base_to_bson(PlayerBase),
	Bson = db_player_base:player_base_other_to_bson(BaseBson, PlayerBaseOther),
	mongo_poolboy:transaction(?MMO_POOL,
		fun(MMOPid, [TId, TBson]) ->
			?JUDGE_RETURN(mod_mongodb:count(MMOPid, ?DBROLE, #{?BSONSET_STRING(<<"name">>, PlayerBase#player_base.name)}) =< 0, ?ERROR_ROLE_NAME_EXISTS),
			mod_mongodb:update(MMOPid, ?DBROLE, #{?BSONSET_INT(<<"id">>, TId)}, #{<<"$set">> => TBson})
		end, [PlayerId, Bson]),
	mongo_poolboy:async_update(?BACK_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson}),
	{{PlayerId, PlayerBase#player_base.name}, res(PlayerBase)}
.
res(PlayerBase) ->
	CreateTick = PlayerBase#player_base.create_tick,
	#'Proto80101001'{
		show = lib_player:serialize_show_role(PlayerBase, #player_vip{}),
		open_days = config:get_open_days(lib_timer:unixtime()),
		create_days = lib_timer:get_diff_days(CreateTick),
		create_tick = CreateTick
	}
.

do_create_role(RoleBson, Msg) ->
	ProtoAuth = erlang:get(?AUTH_MSG),
	PlayerBase1 = db_player_base:bson_to_player_base(RoleBson),
	PlayerBaseOther0 = db_player_base:bson_to_player_base_other(RoleBson),
	PlayerBase0 = PlayerBase1#player_base{
		name = Msg#'Proto10100004'.name,
		level = 1,
		country = Msg#'Proto10100004'.country,
		sex = Msg#'Proto10100004'.sex,
		is_new = true,
		is_weak_country = is_weak_country(Msg#'Proto10100004'.country),
		annual_reset_tick = lib_season_and_days_api:next_annual_start_tick(),
		season_reset_tick = lib_season_and_days_api:next_season_start_tick()
	},
	PlayerId = PlayerBase0#player_base.id,
	{PlayerBase, PlayerBaseOther} = auth_msg_to_player_base(ProtoAuth, PlayerBase0, PlayerBaseOther0),
	BaseBson = db_player_base:player_base_to_bson(PlayerBase),
	Bson = db_player_base:player_base_other_to_bson(BaseBson, PlayerBaseOther),
	mongo_poolboy:transaction(?MMO_POOL,
		fun(MMOPid, [TId, TBson]) ->
			?JUDGE_RETURN(mod_mongodb:count(MMOPid, ?DBROLE, #{?BSONSET_STRING(<<"name">>, PlayerBase#player_base.name)}) =< 0, ?ERROR_ROLE_NAME_EXISTS),
			mod_mongodb:update(MMOPid, ?DBROLE, #{?BSONSET_INT(<<"id">>, TId)}, #{<<"$set">> => TBson})
		end, [PlayerId, Bson]),
	mongo_poolboy:async_update(?BACK_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson}),
	lib_serial_api:serial_level(PlayerBase),
	lib_counter:add_country_role(Msg#'Proto10100004'.country),
	{PlayerId, PlayerBase#player_base.name}.

validate_select_role(PlayerId) ->
	ProtoAuth = erlang:get(?AUTH_MSG),
	Account = ProtoAuth#'Proto10100001'.account,
	?JUDGE_RETURN(mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_INT(<<"id">>, PlayerId), ?BSONSET_STRING(<<"account">>, Account)}) > 0, ?ERROR_ROLE_NOT_EXISTS),
	ok.

do_select_role_login(PlayerId, State) ->
	PlayerBase0 = lib_game_cache:get_player_cache(?ETS_PLAYER_BASE, PlayerId),
	PlayerBaseOther0 = lib_game_cache:get_player_cache(?ETS_PLAYER_BASE_OTHER, PlayerId),
	ProtoAuth = erlang:get(?AUTH_MSG),
	{PlayerBase, PlayerBaseOther} = auth_msg_to_player_base(ProtoAuth, PlayerBase0#player_base{sid = State#unpack_state.sock_pid}, PlayerBaseOther0#player_base_other{ip = State#unpack_state.client_ip}),
	PlayerPid = lib_player:get_pid(PlayerId),
	case erlang:is_pid(PlayerPid) andalso erlang:is_process_alive(PlayerPid) of
		true -> mod_server:call(PlayerPid, reconnect), mod_server:sync_stop(PlayerPid), throw({error, ?ERROR_ALREADY_LOGIN});
		_ -> skip
	end,
	PlayerRegName = lib_player:get_process_name(PlayerId),
	{ok, NewPlayerPid} = server_sup:start_child(PlayerRegName, mod_player, start_link, [PlayerBase, PlayerBaseOther]),
	?INFO("start player: ~p", [NewPlayerPid]),
	State#unpack_state{
		player_id = PlayerId,
		player_pid = NewPlayerPid,
		is_login = true
	}.

do_reconnect_login(State, PlayerId, Session) ->
	PlayerBase0 = lib_game_cache:get_player_cache(?ETS_PLAYER_BASE, PlayerId),
	PlayerBaseOther0 = lib_game_cache:get_player_cache(?ETS_PLAYER_BASE_OTHER, PlayerId),
	?JUDGE_RETURN(PlayerBase0#player_base.session =:= Session, ?ERROR_SESSION_ILLEGAL),
	validate_ban_login(State#unpack_state.sock_pid, PlayerBase0#player_base.account, State#unpack_state.client_ip),
	PlayerBase = PlayerBase0#player_base{
		sid = State#unpack_state.sock_pid
	},
	PlayerBaseOther = PlayerBaseOther0#player_base_other{
		ip = State#unpack_state.client_ip
	},
	PlayerPid = lib_player:get_pid(PlayerId),
	case erlang:is_pid(PlayerPid) andalso erlang:is_process_alive(PlayerPid) of
		true -> mod_server:sync_stop(PlayerPid);
		_ -> skip
	end,
	PlayerRegName = lib_player:get_process_name(PlayerId),
	{ok, NewPlayerPid} = server_sup:start_child(PlayerRegName, mod_player, start_link, [PlayerBase, PlayerBaseOther]),
	?INFO("reconnect start player: ~p", [NewPlayerPid]),
	State#unpack_state{
		player_id = PlayerId,
		player_pid = NewPlayerPid,
		is_validate = true,
		is_login = true
	}.

validate_ban_login(Sid, Account, ClientIp) ->
	case db_player_ban:is_ban_login(Account, ClientIp) of
		true ->
			lib_send:respond_to_client_by_sid(Sid, ?MSG_RETURN_AUTH_SESSION, ?ERROR_BAN_LOGIN),
			mod_server:cast(Sid, kick_off),
			throw({error, ?ERROR_BAN_LOGIN});
		_ -> skip
	end,
	ok.

is_weak_country(Country) ->
	{_,WeakCountry} =
		lists:foldl(fun(Id, {Acc0, Acc1}) ->
			Cur = lib_counter:get_country_role(Id),
			case Cur < Acc0 orelse Acc0 =:= 0 of
				true ->
					{Cur, Id};
				_ ->
					{Acc0, Acc1}
			end
		end, {0, 0}, tb_role_country:get_list()),
	Country =:= WeakCountry.
