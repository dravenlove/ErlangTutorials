%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10151').
-define('ProtoClient_10151', true).
-define('ProtoClient_10151_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10151002',{
    'time'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10151003',{
    'item_list'	:: [integer()] | undefined % = 1, 32 bits
}).

-record('Proto10151005',{
    'hero_id'	:: integer() | undefined, % = 1, 32 bits
    'type'	:: integer() | undefined, % = 2, 32 bits
    'inlay_type'	:: integer() | undefined, % = 3, 32 bits
    'item_id'	:: integer() | undefined % = 4, 32 bits
}).

-record('Proto10151006',{
    'hero_id'	:: integer() | undefined, % = 1, 32 bits
    'item_id'	:: integer() | undefined, % = 2, 32 bits
    'ues_item'	:: integer() | undefined % = 3, 32 bits
}).

-record('Proto50151001',{
    'buy_time'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50151002',{
    'buy_time'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50151004',{
    'level_info' = [] % = 1 [#'ProtoKeyValue'{}]
}).

-endif.