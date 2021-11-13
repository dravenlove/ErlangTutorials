%%(3) 编写一个反转函数packet_to_term(Packet) -> Term，使它成为前一个函数的逆向函数。

-module(packettoterm).
-export([packet_to_term/1]).

packet_to_term(Packet) ->
	Bin = binary_to_term(Packet),
	<<123:32,Bin>>.