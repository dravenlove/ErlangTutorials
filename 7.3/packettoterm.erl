%%(3) ��дһ����ת����packet_to_term(Packet) -> Term��ʹ����Ϊǰһ����������������

-module(packettoterm).
-export([packet_to_term/1]).

packet_to_term(Packet) ->
	Bin = binary_to_term(Packet),
	<<123:32,Bin>>.