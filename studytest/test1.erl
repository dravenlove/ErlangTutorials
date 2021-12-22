-module(test1).
-compile(export_all).


%%start(Num)->
%%  Lists=for(1,Num,fun(X)->X end),
%%  lists:foldl(fun(Y,Acc)->
%%    case Y =< 2 of
%%      true->Acc++[Y];
%%      false->
%%        DDD=lists:reverse(Acc),
%%        Acc++ [lists:nth(1,DDD)+lists:nth(2,DDD)]
%%    end
%%               end,[],Lists).

test(RealmLevel) ->
for1(1,RealmLevel, fun(X) -> {X, for1(1, 10, fun(Y) -> {Y, 0} end)} end).

for(I,I) -> [I];
for(I,J) -> [I]++for(I+1,J).



for2(100,K) ->
  K;
for2(I,K) ->
  for2(I+1,K++[I]).



for1(I,I,F) -> [F(I)];
for1(I,J,F) -> [F(I)|for1(I+1,J,F)].


tt(X)->
  Result = ff(X),
  io:format("~p~n", [Result]),
  erlang:process_info(self()).

tt1(Y)->
  Result = ff1(Y,[]),
  io:format("~p~n", [Result]),
  erlang:process_info(self()).

ff(1)->
  [1];
ff(N)->

  [N] ++ ff(N-1).

ff1(1,Y)->
  Y;
ff1(X,Y)->
  ff1(X-1,Y++[X]).

%%start1(Ids) ->
%%  for(2,lists:flatlength(Ids), fun(X)->Pos_level= lists:keystore(lists:nth(X,Ids), 1, [], {lists:nth(X,Ids), 0}),
%%    lists:keystore(lists:nth(X-1,Ids), 1, [], {lists:nth(X-1,Ids), Pos_level}) end).