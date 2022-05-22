-module(test1).

-export([start/1]).

start(Num)->
  Lists=for(1,Num,fun(X)->X end),
  lists:foldl(fun(Y,Acc)->
    case Y =< 2 of
      true->Acc++[Y];
      false->
        DDD=lists:reverse(Acc),
        Acc++ [lists:nth(1,DDD)+lists:nth(2,DDD)]
    end
               end,[],Lists).


for(I,I,F) -> [F(I)];
for(I,J,F) -> [F(I)|for(I+1,J,F)].

%%for1(I,I,F) -> [F(I)];
%%for1(I,J,F) -> [F(I)|for1(I-1,J,F)].