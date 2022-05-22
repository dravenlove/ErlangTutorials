%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10139').
-define('ProtoClient_10139', true).
-define('ProtoClient_10139_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10139001',{
    'type'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139002',{
    'task_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139003',{
    'main_type'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139004',{
    'main_type'	:: integer() | undefined, % = 1, 64 bits
    'task_id'	:: integer() | undefined % = 2, 64 bits
}).

-record('Proto10139006',{
    'task_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139007',{
    'task_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139008',{
    'type'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139009',{
    'task_id'	:: integer() | undefined, % = 1, 32 bits
    'amount'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto10139010',{
    'is_free'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10139011',{
    'task_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50139001',{
    'task_list' = [], % = 1 [#'ProtoTaskInfo'{}]
    'type'	:: integer() | undefined, % = 2, 32 bits
    'government' = undefined % = 3 #'ProtoGovernmentDetail'{}
}).

-record('Proto50139003',{
    'task' = undefined, % = 1 #'ProtoCountryTask'{}
    'main_type'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto50139004',{
    'task' = undefined % = 1 #'ProtoCountryTask'{}
}).

-record('Proto80139001',{
    'task' = undefined, % = 1 #'ProtoTaskInfo'{}
    'cmd'	:: integer() | undefined % = 2, 32 bits
}).

-endif.
