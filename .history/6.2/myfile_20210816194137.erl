%%(1) file:read_file(File)会返回{ok, Bin}或者{error, Why}，其中File是文件名，Bin则包含了文件的内容。请编写一个myfile:read(File)函数，当文件可读取时返回Bin，否则抛出一个异常错误。

-module(myfile).
-export([read/1]).

read(File) ->
	try file:read_file(File) of
	{ok,Bin}->Bin;
	{error,Why}->throw(Why);
    

	throw:X ->{error,X};
	error:X ->{error,X};
	exit:X ->{error,X}
end.
	
	