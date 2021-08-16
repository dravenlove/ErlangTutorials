-module(ruby).
-export([equal/2]).

%%判断两个映射组是不是一样的.

equal(Mapa,Mapb) ->

    Mapa1=maps:to_list(Mapa),
    Mapa2=maps:to_list(Mapb),
    case Mapa1 =:= Mapa2 of
        true -> true;
        false -> false
        end.