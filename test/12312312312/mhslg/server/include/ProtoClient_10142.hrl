%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10142').
-define('ProtoClient_10142', true).
-define('ProtoClient_10142_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10142003',{
    'grade'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50142001',{
    'award_info' = [], % = 1 [#'ProtoKeyValue'{}]
    'stage'	:: integer() | undefined, % = 2, 32 bits
    'meritorious'	:: integer() | undefined, % = 3, 32 bits
    'circulation_award'	:: integer() | undefined, % = 4, 32 bits
    'get_circulation_award'	:: integer() | undefined % = 5, 32 bits
}).

-record('Proto50142002',{
    'rank_info' = [] % = 1 [#'ProtoRank'{}]
}).

-record('Proto80142005',{
    'meritorious'	:: integer() | undefined % = 1, 32 bits
}).

-endif.
