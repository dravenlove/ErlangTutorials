-module(123).

-export([for/3]).

	for(N,N,F)->
  [F(N)];
for(L,N,F)->
  [F(L)|for(L+1,N,F)].