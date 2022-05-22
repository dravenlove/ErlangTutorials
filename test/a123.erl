-module(a123).

-export([start/1]).

%%[[],[],[],[]]
start(Num)->
		Lists=for(1,Num,fun(X)->X end),
		lists:foldl(fun(YY,Acc)->
			case (lists:flatlength(Acc) div Num)=<1 of
				true->
					Acc++[deal(YY,Num)];
				false->
					DDD=lists:reverse(Acc),
					Acc++[for(1,Num,fun(PP)->lists:nth(PP,lists:nth(1,DDD))+ lists:nth(PP,lists:nth(2,DDD)) end)]
			end end,[],Lists).


		
for(I,I,F) -> [F(I)];
for(I,J,F) -> [F(I)|for(I+1,J,F)].

for1(I,I,F) -> [F(I)];
for1(I,J,F) -> [F(I)|for1(I-1,J,F)].

deal(D,N)->
	case D of
		1->for(1,N,fun(Z)-> Z end);
		2->for1(2*N-1,N,fun(C)->C
			end)
end.