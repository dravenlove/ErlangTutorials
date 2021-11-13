%%1.随机一个数字X，然后开始循环，用户输入一个整数，输入的整数大于X就提示大于，小于X就提示小了，最后相等了就跳出输出ok,退出进程。
-module(guessnumber).
-export([guess/1,start/1]).

start(Max)->
	X=random:uniform(Max),
guess(X).

guess(X) ->
	Guess=io:get_line("please input a num"),
	{Guessnumber,_}=string:to_integer(Guess),
	case Guessnumber=:=X of
		true->
			io:format("you are right"),
			ok;
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



	
	