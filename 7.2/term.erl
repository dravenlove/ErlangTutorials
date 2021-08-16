%% (2).编写一个 term_to_packet(Term) -> Packet 的函数，通过调用 term_to_binary(Term) 来生成并返回一个二进制型，它内含长度为 4 个字节的包头 N，后跟 N 个字节的数据

-module(termtopacket).
-export([term_to_packet/1]).

term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    % 提取出前 4 Byte，作为后面info的大小
    % 注意，一定要位数匹配，否则会报错。
    <<Head:32/bits, _/bits>> = Bin,
    <<Size:32>> = Head,
    <<Head:32/bits, Info:Size/bits>> = Bin,
    Info.

% 也可以这样写
term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    <<Head:32, Info/bitstring>> = Bin,
    Info.

% 编写一个 term_to_packet(Term) -> Packet 的函数，
% 通过调用 term_to_binary(Term) 来生成并返回一个二进制型，
% 它内含长度为 4 个字节的包头 N，后跟 N 个字节的数据

-module(termtopacket).
-export([term_to_packet/1]).

term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    Length = bit_size(Bin),
    Size = <<Length:1/unit:32>>,
    <<Size/binary, Bin/binary>>.