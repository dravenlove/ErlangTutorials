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
	
	