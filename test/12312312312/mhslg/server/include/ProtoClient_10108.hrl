%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10108').
-define('ProtoClient_10108', true).
-define('ProtoClient_10108_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10108002',{
    'act_index'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10108004',{
    'act_index'	:: integer() | undefined, % = 1, 32 bits
    'id'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto50108003',{
    'recharge_money'	:: float() | integer() | infinity | '-infinity' | nan | undefined, % = 1
    'gear_list' = [] % = 2 [#'ProtoBackActReward'{}]
}).

-record('Proto80108001',{
    'backact_list' = [] % = 1 [#'ProtoBackAct'{}]
}).

-endif.
