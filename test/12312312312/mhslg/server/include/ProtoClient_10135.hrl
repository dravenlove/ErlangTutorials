%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10135').
-define('ProtoClient_10135', true).
-define('ProtoClient_10135_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10135001',{
    'other'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10135002',{
    'science_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10135003',{
    'stage'	:: integer() | undefined, % = 1, 32 bits
    'index'	:: integer() | undefined, % = 2, 32 bits
    'science_id'	:: integer() | undefined, % = 3, 32 bits
    'type'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto10135004',{
    'science_id'	:: integer() | undefined, % = 1, 32 bits
    'type'	:: integer() | undefined, % = 2, 32 bits
    'item_id'	:: integer() | undefined, % = 3, 32 bits
    'amount'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto10135005',{
    'other'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10135006',{
    'science_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50135001',{
    'science_list' = [], % = 1 [#'ProtoScience'{}]
    'is_received'	:: boolean() | 0 | 1 | undefined % = 2
}).

-record('Proto50135002',{
    'science' = undefined % = 1 #'ProtoScience'{}
}).

-record('Proto50135003',{
    'stage'	:: integer() | undefined, % = 1, 32 bits
    'index'	:: integer() | undefined, % = 2, 32 bits
    'science_id'	:: integer() | undefined, % = 3, 32 bits
    'type'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto50135004',{
    'science_id'	:: integer() | undefined, % = 1, 32 bits
    'type'	:: integer() | undefined, % = 2, 32 bits
    'item_id'	:: integer() | undefined, % = 3, 32 bits
    'amount'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto50135005',{
    'other'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50135006',{
    'science_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto80135001',{
    'science_list' = [] % = 1 [#'ProtoScience'{}]
}).

-record('Proto80135002',{
    'is_received'	:: boolean() | 0 | 1 | undefined % = 1
}).

-endif.