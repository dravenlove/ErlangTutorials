%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10156').
-define('ProtoClient_10156', true).
-define('ProtoClient_10156_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10156001',{
    'uid' = undefined, % = 1 #'ProtoActivityUID'{}
    'type'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto10156002',{
    'uid' = undefined, % = 1 #'ProtoActivityUID'{}
    'type'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto10156003',{
    'uid' = undefined, % = 1 #'ProtoActivityUID'{}
    'type'	:: integer() | undefined, % = 2, 32 bits
    'id'	:: integer() | undefined % = 3, 32 bits
}).

-record('Proto10156004',{
    'uid' = undefined % = 1 #'ProtoActivityUID'{}
}).

-record('Proto10156006',{
    'uid' = undefined % = 1 #'ProtoActivityUID'{}
}).

-record('Proto50156001',{
    'info' = [], % = 1 [#'ProtoOpenServerRank'{}]
    'player_info' = undefined, % = 2 #'ProtoOpenServerRank'{}
    'type'	:: integer() | undefined % = 3, 32 bits
}).

-record('Proto50156002',{
    'info' = [], % = 1 [#'ProtoOpenServerTask'{}]
    'type'	:: integer() | undefined % = 2, 32 bits
}).

-record('Proto50156003',{
    'uid' = undefined, % = 1 #'ProtoActivityUID'{}
    'type'	:: integer() | undefined, % = 2, 32 bits
    'id'	:: integer() | undefined % = 3, 32 bits
}).

-record('Proto50156004',{
    'uid' = undefined % = 1 #'ProtoActivityUID'{}
}).

-record('Proto50156006',{
    'info_list' = [], % = 1 [#'ProtoOpenServerRank'{}]
    'acc' = undefined, % = 2 #'ProtoActivity'{}
    'have_award_list'	:: [integer()] | undefined, % = 3, 32 bits
    'have_box'	:: integer() | undefined % = 4, 32 bits
}).

-endif.
