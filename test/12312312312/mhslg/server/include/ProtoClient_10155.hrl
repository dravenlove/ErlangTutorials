%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10155').
-define('ProtoClient_10155', true).
-define('ProtoClient_10155_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10155002',{
    'hero_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10155003',{
    'hero_id'	:: integer() | undefined, % = 1, 32 bits
    'pos_list' = [] % = 2 [#'ProtoPos'{}]
}).

-record('Proto10155004',{
    'hero_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50155001',{
    'troop_list' = [] % = 1 [#'ProtoTroop'{}]
}).

-record('Proto50155101',{
    'troop_fight_list' = [] % = 1 [#'ProtoTroopFight'{}]
}).

-record('Proto80155001',{
    'troop_list' = [], % = 1 [#'ProtoTroop'{}]
    'flag'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto80155101',{
    'troop_fight' = undefined % = 1 #'ProtoTroopFight'{}
}).

-endif.
