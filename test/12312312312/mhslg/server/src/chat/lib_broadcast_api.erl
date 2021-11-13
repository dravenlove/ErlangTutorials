%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_broadcast_api.erl
%% Created on : 2019-06-06 15:32:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-06-06 15:32:00
%% Description: 广播公告功能接口
%% 示例：
%% Msg = lib_broadcast_api:create_broadcast(广播号),
%% Msg1 = lib_broadcast_api:push_broad_arg(Msg, 1),
%% Msg2 = lib_broadcast_api:push_broad_arg(Msg1, "test"),
%% lib_broadcast_api:send_all_broadcast(Msg2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_broadcast_api).
-include("common.hrl").
-include("hero.hrl").
-include("player.hrl").
-include("chat.hrl").
-include("map.hrl").
-include("hero_skill.hrl").
-include("ProtoClient_10105.hrl").
-export([
	create_broadcast/1,
	push_broad_arg/3,
	push_broad_args/2,
	send_all_broadcast/1,
	send_country_broadcast/2,
	send_governor_broadcast/2,
	send_cluster_broadcast/2,
	send_all_system/1,
	show_role_to_broad_role/1,
	player_base_to_broad_role/1
]).

-export([
	send_broadcast_by_channel/2,
	send_broadcast_by_channel/3,
	send_broadcast_by_channel/4,
	send_by_channel_list/3,
  	test_command/4
]).

create_broadcast(ShoutId) ->
	#'Proto80105004'{shout_id = ShoutId}.

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_PLAYER_ID, Value) when is_integer(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_PLAYER_ID
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_HERO_QUALITY, Value) when   is_integer(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_HERO_QUALITY
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_SKILL_ID, Value) when  is_integer(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_SKILL_ID
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_NUM, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_NUM
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_STAR_LEVEL, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_STAR_LEVEL
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_ROBOT_ID, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_ROBOT_ID
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_HERO_COLOR, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_HERO_COLOR
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_COUNTRY_ID, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_COUNTRY_ID
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_INNER_CITY, Value) when is_integer(Value)->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_INNER_CITY
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};


push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,_Type, Value) when is_float(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		dvalue = Value,
		type = _Type
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,_Type, Value) when is_binary(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		strvalue = lib_types:to_list(Value),
		type = _Type
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,_Type ,Value) when is_list(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		strvalue = Value,
		type = _Type
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(ShoutMsg, ?BROAD_TYPE_ROLE_INFO, Value) when is_record(Value, player_show) ->
	NewVal = #'ProtoBroadRole'{
		role_id = Value#player_show.id,
		role_name = Value#player_show.name
	},
	push_broad_arg(ShoutMsg, ?BROAD_TYPE_ROLE_INFO, NewVal);
push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_ROLE_INFO, Value) when is_record(Value, 'ProtoBroadRole') ->
	ProtoArg = #'ProtoBroadArg'{
		role_info = Value,
		type = ?BROAD_TYPE_ROLE_INFO
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_ITEM_INFO, Value) when is_record(Value, 'ProtoItem') ->
	ProtoArg = #'ProtoBroadArg'{
		item_info = Value,
		type = ?BROAD_TYPE_ITEM_INFO
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_HERO_BASE, Value) ->
	ProtoArg = #'ProtoBroadArg'{
		hero_info = Value,
		type = ?BROAD_TYPE_HERO_BASE
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};

push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_CHALLENGE, Value) when is_integer(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_CHALLENGE
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};
push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_HERO_SKILL, Value) when is_record(Value, skill) ->
	ProtoArg = #'ProtoBroadArg'{
		hero_skill = lib_hero_skill_learning:skill_to_proto(Value),
		type = ?BROAD_TYPE_HERO_SKILL
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};
push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_CITY_ID, Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_CITY_ID
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};
push_broad_arg(#'Proto80105004'{broad_args = BroadArgList} = ShoutMsg,?BROAD_TYPE_STAR, Value) when is_integer(Value) ->
	ProtoArg = #'ProtoBroadArg'{
		ivalue = Value,
		type = ?BROAD_TYPE_STAR
	},
	ShoutMsg#'Proto80105004'{broad_args = BroadArgList ++ [ProtoArg]};
push_broad_arg(ShoutMsg,_Type, Value) ->
	?ERROR("broad arg type: ~p ~p ~n", [Value, ShoutMsg]),
	error.

push_broad_args(ShoutMsg, []) when is_record(ShoutMsg, 'Proto80105004') ->
	ShoutMsg
;
push_broad_args(ShoutMsg, [H | T]) when is_record(ShoutMsg, 'Proto80105004')->
	{Type,Val} = H,
	push_broad_args(push_broad_arg(ShoutMsg,Type ,Val), T)
.

%% 全服广播
send_all_broadcast(ShoutMsg) ->
	History = lib_chat:proto_to_five_broadcast(ShoutMsg,?CHANNEL_WORLD),
	New_shotMsg = proto_to_broadcast(ShoutMsg,?CHANNEL_WORLD),
	mod_channel:push_channel_msg(?CHANNEL_WORLD, 0, lib_msg:pack_to_bin(New_shotMsg),History).

%% 系统广播
send_all_system(ShoutMsg) ->
	History = lib_chat:proto_to_five_broadcast(ShoutMsg,?CHANNEL_SYSTEM),
	New_shotMsg = proto_to_broadcast(ShoutMsg,?CHANNEL_SYSTEM),
	mod_channel:push_channel_msg(?CHANNEL_SYSTEM, 0, lib_msg:pack_to_bin(New_shotMsg),History).

%% 国家广播
send_country_broadcast(CountryId, ShoutMsg) ->
	History = lib_chat:proto_to_five_broadcast(ShoutMsg,?CHANNEL_COUNTRY),
	New_shotMsg = proto_to_broadcast(ShoutMsg,?CHANNEL_COUNTRY),
	mod_channel:push_channel_msg(?CHANNEL_COUNTRY, CountryId, lib_msg:pack_to_bin(New_shotMsg),History).

%% 栋梁广播
send_governor_broadcast(LeagueId, ShoutMsg) ->
	History = lib_chat:proto_to_five_broadcast(ShoutMsg,?CHANNEL_GOVERNOR),
	New_shotMsg = proto_to_broadcast(ShoutMsg,?CHANNEL_GOVERNOR),
	mod_channel:push_channel_msg(?CHANNEL_COUNTRY, LeagueId, lib_msg:pack_to_bin(New_shotMsg),History).

%% 跨服广播
%% ServerFlag用于计算需要在哪个分组广播的服务器标识
send_cluster_broadcast(_ShoutMsg, _ServerFlag) ->
	% New_shotMsg = proto_to_broadcast(ShoutMsg,?CHANNEL_CLUSTER),
	% lib_cluster_chat_base:send_cluster_broadcast(New_shotMsg, ServerFlag).

	pass
	%%TODO
.

%% #'ProtoShowRole'转换为#'ProtoBroadRole'
show_role_to_broad_role(ProtoShowRole) ->
	#'ProtoBroadRole'{
		role_id = ProtoShowRole#'ProtoShowRole'.id,
		role_name = ProtoShowRole#'ProtoShowRole'.name
	}.
	
player_base_to_broad_role(PlayerBase) when is_record(PlayerBase, player_base) ->
	#'ProtoBroadRole'{
		role_id = PlayerBase#player_base.id,
		role_name = PlayerBase#player_base.name
	}.


%%直接发送接口
%%Args_id 广播id
%%Msg 是 #'Proto80105004'{shout_id = ShoutId} ；
%%Channel_list是需要发送的广播类型列表（国家，栋梁频道等）
%%Country_list 是需求发送的指定国家id列表（只有国家和栋梁会用到）
%%Broad_args_list是传输的参数列表结构为[{Type(类型),Val(参数)}]
%%Msg是已经赋值给广播id的广播结构体
send_broadcast_by_channel(Args_id,Channel_list) when is_integer(Args_id)->
	Msg = create_broadcast(Args_id),
	send_broadcast_by_channel(Msg,Channel_list)
;
send_broadcast_by_channel(Msg,Channel_list) when is_list(Channel_list)->
	send_broadcast_by_channel(Msg,Channel_list,[]);
send_broadcast_by_channel(Msg,Channel_list) when is_integer(Channel_list)->
	send_broadcast_by_channel(Msg,[Channel_list],[]).

send_broadcast_by_channel(Args_id,Channel_list,Country_list) when is_integer(Args_id) ->
	Msg = create_broadcast(Args_id),
	send_broadcast_by_channel(Msg,Channel_list,Country_list)
;
send_broadcast_by_channel(Msg,Channel_list,Country_list) when is_list(Channel_list) ->
	send_broadcast_by_channel(Msg,Channel_list,Country_list,[]);
send_broadcast_by_channel(Msg,Channel_list,Country_list) when is_integer(Channel_list) ->
	send_broadcast_by_channel(Msg,[Channel_list],Country_list,[]).


send_broadcast_by_channel(Args_id,Channel_list,Country_list,Broad_Args_list) when is_integer(Args_id) ->
	Msg = create_broadcast(Args_id),
	send_broadcast_by_channel(Msg,Channel_list,Country_list,Broad_Args_list)
;
send_broadcast_by_channel(Msg,Channel_list,Country_list,[]) when is_integer(Channel_list)->
	send_by_channel_list(Msg,[Channel_list],Country_list);
send_broadcast_by_channel(Msg,Channel_list,Country_list,[]) when is_list(Channel_list)->
	send_by_channel_list(Msg,Channel_list,Country_list);
send_broadcast_by_channel(Msg,Channel_list,Country_list,Broad_Args_list) when is_list(Channel_list)->
	[H|T] = Broad_Args_list,
	{Type,Val} = H,
	Msg_new = push_broad_arg(Msg,Type,Val),
	send_broadcast_by_channel(Msg_new,Channel_list,Country_list,T).


send_by_channel_list(_Msg,[],_Country_list) ->
	true;
send_by_channel_list(Msg,Channel_list,Country_list) ->
	[H|T] = Channel_list,
	New_country_list = case Country_list == [] andalso Country_list == [0] of
											 true -> lib_map_api:player_country();
											 false -> Country_list
										 end,
	case H of
		?CHANNEL_WORLD -> send_all_broadcast(Msg);
		?CHANNEL_COUNTRY -> lists:foldl(fun(CountryId,_Val) ->
			send_country_broadcast(CountryId,Msg)
		end,0,New_country_list);
		?CHANNEL_SYSTEM -> send_all_system(Msg);
		?CHANNEL_GOVERNOR ->
			lists:foldl(fun(CountryId,_Val) ->
				send_governor_broadcast(CountryId,Msg)
									end,0,New_country_list);
		?CHANNEL_CLUSTER -> send_cluster_broadcast(Msg,config:server_flag());
		_ -> send_all_broadcast(Msg)
	end,
	send_by_channel_list(Msg,T,Country_list)
.

proto_to_broadcast(ShoutMsg,Type) ->
	#'Proto80105002'{
		chat_type = Type,
		content_type = 2,
		send_tick = lib_timer:unixtime(),
		shout_id = ShoutMsg#'Proto80105004'.shout_id,
		broad_args = ShoutMsg#'Proto80105004'.broad_args
	}
.


%%Channel 需要列表包含数字
test_command(Msg_id,Channel,CountryList,Broad_Args_list) ->
  Msg = create_broadcast(Msg_id),
  send_broadcast_by_channel(Msg,Channel,CountryList,Broad_Args_list)
.