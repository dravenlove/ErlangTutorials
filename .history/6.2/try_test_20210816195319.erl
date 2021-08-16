%%(2) 重写try_test.erl里的代码，让它生成两条错误消息：一条文明的消息给用户，另一条详细的消息给开发者。

-module(myfile).
-export([read/1]).

read(File) ->
	try file:read_file(File) of
	{ok,Bin}->Bin;
	{error,Why}->throw(Why)
    catch
    

	throw:X ->{error,X};
	error:X ->{error,X};
	exit:X ->{error,X}
end.
	
	