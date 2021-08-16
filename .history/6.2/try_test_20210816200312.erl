%%(2) 重写try_test.erl里的代码，让它生成两条错误消息：一条文明的消息给用户，另一条详细的消息给开发者。

-module(try_test).
-export([catcher/1,demo1/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT',a};
generate_exception(5) -> error(a).

demo1() ->
	[catcher(I) || I <- [1,2,3,4,5]].

catcher(N) ->
	try generate_exception(N) of
		val -> {N,normal,val}
	
    catch
    

	throw:X ->{N,caught,thrown,X};
	error:X ->{N,caught,exited,X};
	exit:X ->{N,caught,error,X}
end.
	
	