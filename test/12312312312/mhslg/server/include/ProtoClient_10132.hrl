%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-ifndef('ProtoClient_10132').
-define('ProtoClient_10132', true).
-define('ProtoClient_10132_gb_version', "1.0.0").
-include("ProtoPublic.hrl").

-record('Proto10132001',{
    'nobility_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto10132002',{
    'id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto50132001',{
    'privilege'	:: [integer()] | undefined, % = 1, 32 bits
    'condition'	:: [integer()] | undefined, % = 2, 32 bits
    'schedule'	:: integer() | undefined % = 3, 32 bits
}).

-record('Proto50132003',{
    'nobility_id'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto80132001',{
    'notice'	:: integer() | undefined % = 1, 32 bits
}).

-record('Proto80132002',{
    'privilege_id_list'	:: [integer()] | undefined % = 1, 32 bits
}).

-endif.
