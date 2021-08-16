-module(rollback).
-export([rollback_binary1/1,for/3]).

rollback_binary1(A)->
	B=binary:bin_to_list(A),
	C=lists:reverse(B),
	erlang:list_to_binary(C).



for(N,N,F)->[F(N)];

for(I,N,F)->[F(I)|for(I+1,N,F)].
