%% (2).编写一个 term_to_packet(Term) -> Packet 的函数，通过调用 term_to_binary(Term) 来生成并返回一个二进制型，它内含长度为 4 个字节的包头 N，后跟 N 个字节的数据

-module(termtopacket).
-export([term_to_packet/1]).

%% erlang 元素转换成包体
term_to_packet(Term) ->
    %% 先让整个元素变成二进制类型
    Bin = term_to_binary(Term),
    % 提取出前 4 Byte，作为后面info的大小
    % 注意，一定要位数匹配，否则会报错。

    %% Head就是包头的二进制内容
    <<Head:32/bits, _/bits>> = Bin,
    %% 提取包头
    <<Size:32>> = Head,
    %% 这里的Info就是包头后的数据体二进制内容
    <<Head:32/bits, Info:Size/bits>> = Bin,
    Info.
