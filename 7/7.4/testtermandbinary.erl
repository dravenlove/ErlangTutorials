%% 根据4.1.3节的样式编写测试,测一下之前的两个函数是否能转换成数据报,以及解码能复原原来的数据类型

-module(testtermandbinary).
-export([test/1
        ,test1/1]).


%% 测试term是否能正常转换成packet
test(Term) ->
    Packet = term_to_packet(Term),
    packet_to_term(Packet) =:= Term.

%% 测试packet是否能正常转换成term
test1(Packet) ->
    Term = packet_to_term(Packet),
    Packet =:= term_to_packet(Term).

%% erlang 元素转换成包体
term_to_packet(Term) ->
    %% 先让整个元素变成二进制类型
    Bin = term_to_binary(Term),
    %% 获得整个二进制包含的字节数
    AllSize = byte_size(Bin),
    %% 获取头部字节数
    %% <<Size>> 这里Size由二进制型的前四位解包的,用于指明二进制型下一个片段大小
    TopSize = <<AllSize:1/unit:32>>,
    %% 或
    %% TopSize = <<AllSize:4/unit:8>>,
    <<TopSize/binary, Bin/binary>>.

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