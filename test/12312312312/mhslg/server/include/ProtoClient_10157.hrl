%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10157').
-define('ProtoClient_10157', true).
-define('ProtoClient_10157_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10157001',{
    'trigger_type'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10157002',{
    'other'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10157003',{
    'award_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50157001',{
    'trigger_status'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50157002',{
    'welfare_event_list' = [] % = 1 [#'ProtoWelfareExchange'{}]
}).

-record('Proto50157003',{
    'other'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto80157004',{
    'type'	:: integer() | undefined, % = 1, 32 bits
    'residual_time'	:: integer() | undefined % = 2, 32 bits
}).

-endif.
