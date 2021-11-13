-module(a123).

-export([get_os_time/0,for/3,lists_change/3,test/1]).

test(_)->
true.

get_os_time() ->
  {H,M,_}=os:timestamp(),
  list_to_integer(erlang:integer_to_list(H)++erlang:integer_to_list(M)).

for(N,N,F)->
  [F(N)];
for(L,N,F)->
  [F(L)|for(L+1,N,F)].

lists_change(R,N,L)->case lists:split(N-1, L) of
{F, [_|T]} -> F ++ [R|T] end.%%R修改值,N修改位置,L列表


