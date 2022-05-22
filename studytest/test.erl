-module(test).

-export([start/1,test/1]).

-include("test.hrl").

start(Num)->
    Lists=for(1,Num,fun(X)->X end),
    lists:filter(fun(Y)->
                  case Y =:= 1 of
                    true->true;
                    false->
                     judge(Y) =:= [1,Y]
                  end
                  end,Lists).

judge(Num1)->
    Lists=for(1,Num1,fun(X)->X end),
    lists:filter(fun(Y)->  Num1 rem Y =:= 0 end,Lists).

for(I,I,F) -> [F(I)];
for(I,J,F) -> [F(I)|for(I+1,J,F)].

test(X) ->
    A=#test {
        id = 0
        ,id1 = 1
        ,id2 = 2
        ,id3 = [#test1{ i1 = 11 ,i2 =12 ,i3=13 }]},
    A#test.id3,
    lists:keyfind(X, #test1.i2, A#test.id3),
    #test1.i1.

%%for1(I,I,F) -> [F(I)];
%%for1(I,J,F) -> [F(I)|for1(I-1,J,F)].

