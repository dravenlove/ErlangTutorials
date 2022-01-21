%%(3) 编写一个反转函数packet_to_term(Packet) -> Term，使它成为前一个函数的逆向函数。

-module(packettoterm).
-export([packet_to_term/1]).

packet_to_term(Packet) ->
	% % 先解包,获得包体头部大小
	% <<Head:4/bits, _/bits>> = Packet,
	% io:format("~p~n",[Head]),
	% %% 将包头大小转换成二进制的包头(用于表达包体内的数据大小)
	% <<Size:4/unit:8, _/bits>> = Packet,
	% io:format("~p~n",[Size]),
	% <<Size:4/unit:8, Info:Size/unit:8>> = Packet,
	% io:format("~p~n",[Info]),
	% binary_to_term(Info).
	{_HeadBinary, TailBinary} = split_binary(Packet,4),
	binary_to_term(TailBinary).