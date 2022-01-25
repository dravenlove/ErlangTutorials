-module(ruby).
-export([equal/2
        ,maps_num/2
        ,maps_value/2]).

%%判断两个映射组是不是一样的.

equal(Mapa,Mapb) ->
    Mapa1=maps:to_list(Mapa),
    Mapa2=maps:to_list(Mapb),
    Mapa1 =:= Mapa2.

%% 优化了一下

%% 判断两个映射组键值数是否一样
maps_num(Mapa,Mapb) ->
    maps:size(Mapa) =:= maps:size(Mapb).

%% 检查映射组中是否有给定的value
maps_value(Value, Map) ->
    lists:member(Value, maps:values(Map)).