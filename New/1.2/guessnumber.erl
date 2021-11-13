%%2.假设用户猜测了N次通关了游戏，将过程中用户输入的N个数字储存至List [i0,i1,i2,,,,i(N-1)]。
-module(guessnumber).
-export([guess/1,start/1]).

start(Max)->X=random:uniform(Max),
ets:new(guess,[named_table,public,ordered_set]),
guess(X).

guess(X) ->
	Guess=io:get_line("please input a num"),
	{Guessnumber,_}=string:to_integer(Guess),
    case ets:last(guess) of
        '$end_of_table' ->
            ets:insert(guess,{0,Guessnumber});
        Key ->
            ets:insert(guess,{ets:last(guess)+1,Guessnumber})
        end,
    case Guessnumber=:=X of
		true->
            List1=ets:tab2list(guess),
            List=lists:flatmap(fun({_,X}) ->[X] end,List1),
			io:format("you are right"),
			List;
		false->
			case Guessnumber>X of
				true ->
					io:format("you guess bigger"),
					guess(X);
				false ->
					io:format("you are smaller"),
					guess(X)
			end
	end.




	
	