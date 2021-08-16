-module(ruby).
-export([equal/2]).

%%判断两个映射组是不是一样的.

equal(Mapa,Mapb) ->

    Mapa1=rf(Mapa),
    Mapa2=rf(Mapb),
    