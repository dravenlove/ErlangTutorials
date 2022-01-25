%% (2).编写一个 term_to_packet(Term) -> Packet 的函数，通过调用 term_to_binary(Term) 来生成并返回一个二进制型，它内含长度为 4 个字节的包头 N，后跟 N 个字节的数据

-module(termtopacket).
-export([term_to_packet/1]).

%% erlang 元素转换成包体
term_to_packet(Term) ->
    %% 先让整个元素变成二进制类型
    Bin = term_to_binary(Term),
    io:format("~p~n",[Bin]),
    %% 获得整个二进制包含的字节数
    AllSize = byte_size(Bin),
    io:format("~p~n",[AllSize]),
    %% 获取头部字节数
    %% <<Size>> 这里Size由二进制型的前四位解包的,用于指明二进制型下一个片段大小
    TopSize = <<AllSize:1/unit:32>>,
    %% 或
    %% TopSize = <<AllSize:4/unit:8>>,
    <<TopSize/binary, Bin/binary>>.
