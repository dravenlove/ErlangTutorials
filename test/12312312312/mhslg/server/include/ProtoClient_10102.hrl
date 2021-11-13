%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10102').
-define('ProtoClient_10102', true).
-define('ProtoClient_10102_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10102001',{
    'type'	:: integer() | undefined, % = 1, 32 bits
    'hero_list'	:: [integer()] | undefined, % = 2, 32 bits
    'parameter1'	:: integer() | undefined, % = 3, 64 bits
    'parameter2'	:: integer() | undefined, % = 4, 64 bits
    'parameter3'	:: integer() | undefined, % = 5, 64 bits
    'parameter4'	:: integer() | undefined, % = 6, 32 bits
    'parameter_list'	:: [integer()] | undefined, % = 7, 32 bits
    'parameter_string'	:: iolist() | undefined % = 8
}).

-record('Proto10102006',{
    'combat_id'	:: integer() | undefined % = 1, 64 bits
}).

-record('Proto10102008',{
    'combat_id'	:: integer() | undefined % = 1, 64 bits
}).

-record('Proto10102009',{
    'combat_id'	:: integer() | undefined % = 1, 64 bits
}).

-record('Proto10102010',{
    'record_id'	:: integer() | undefined % = 1, 64 bits
}).

-record('Proto50102006',{
    'rank_list' = [] % = 1 [#'ProtoFightRank'{}]
}).

-record('Proto50102011',{
    'info' = [] % = 1 [#'ProtoRecordID'{}]
}).

-record('Proto80102002',{
    'combat_id'	:: integer() | undefined, % = 1, 64 bits
    'type'	:: integer() | undefined, % = 2, 32 bits
    'country'	:: integer() | undefined, % = 3, 32 bits
    'l_country'	:: integer() | undefined, % = 4, 32 bits
    'r_country'	:: integer() | undefined, % = 5, 32 bits
    'fight_process' = [], % = 6 [#'ProtoFightDetail'{}]
    'count_down'	:: integer() | undefined, % = 7, 32 bits
    'drop_map' = [] % = 8 [#'ProtoFightDrop'{}]
}).

-record('Proto80102003',{
    'combat_id'	:: integer() | undefined, % = 1, 64 bits
    'join_type'	:: integer() | undefined, % = 2, 32 bits
    'fight_hero' = undefined % = 3 #'ProtoFightHero'{}
}).

-record('Proto80102004',{
    'combat_id'	:: integer() | undefined, % = 1, 64 bits
    'quit_type'	:: integer() | undefined, % = 2, 32 bits
    'id'	:: integer() | undefined, % = 3, 64 bits
    'hero_id'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto80102005',{
    'l_highest' = undefined, % = 1 #'ProtoFightHighest'{}
    'r_highest' = undefined, % = 2 #'ProtoFightHighest'{}
    'self' = [] % = 3 [#'ProtoFightSelf'{}]
}).

-record('Proto80102007',{
    'win_type'	:: integer() | undefined, % = 1, 32 bits
    'result' = [], % = 2 [#'ProtoFightResult'{}]
    'reward' = [], % = 3 [#'ProtoItemObj'{}]
    'type'	:: integer() | undefined, % = 4, 32 bits
    'param1'	:: integer() | undefined, % = 5, 64 bits
    'param2'	:: integer() | undefined, % = 6, 64 bits
    'param3'	:: integer() | undefined, % = 7, 64 bits
    'param4'	:: integer() | undefined % = 8, 64 bits
}).

-endif.