-module(mp3_sync).

-export([
        find_sync/2
        ]).


%% 假设找到了MPEG头的起始位置,剩下部分的可以分为多个片段每个片段都有头帧
%% MPEG的帧头共32bit = 4个字节 

%% 同步字,11位.MPEG音频版本号id 2位.
%% layer的索引 2位, 保护位 1位.
%% MPEG比特率 4位,MPEG帧的采样率 2位.
%% 填充位 1位.
%% 私有位 1位.
%% 声道模式位 2位.
%% 模式扩展位 2位.


%% 这个函数的目的就是找帧头,方法是遍历bin里面的二进制,如果Bin的第N个字节是某个头帧的开头,就会返回{ok, Length, Info}
find_sync(Bin, N) ->
    case is_header(N, Bin) ->
        {ok, Len1, _} ->
            case is_header(N + Len1, Bin) of ->
                {ok, Len2, _} ->
                    case is_header(N + Len1 + Len2, Bin) of ->
                        {ok, _, _} ->
                            {ok, N};
                        error ->
                            find_sync(Bin, N + 1)
                    end;
                error ->
                    find_sync(Bin, N + 1)
                end;
            error ->
                find_sync(Bin, N + 1)
    end.

is_header(N, Bin) ->
    unpack_header(get_word(N, Bin)).

%% 在指定的索引位置拆分二进制列表  并获得帧头位置(前四个字节)的变量,返回这个变量
get_word(N, Bin) ->
    {_, <<C:4/binary, _/binary>>} = split_binary(Bin, N),
    C.

%% 解包头,尝试寻找MPEG的帧头,因为他的帧头对应格式如上
unpack_header(X) ->
    try decode_header(X) 
    catch 
        _ : _ -> error
    end.

%% 包头格式,因为B是两位所以可能有四个情况分别返回对应值,全部变量都一样
decode_header(<<2#11111111111:11, B:2, C:2, _D:1, E:4, F:2, G:1, Bits:9>>) ->
    Vsn = case B of
            0 -> {2, 5};
            1 -> exit(badVsn);
            2 -> 2;
            3 -> 1
           end,
    Layer = case C of
            0 -> exit(badLayer);
            1 -> 3;
            2 -> 2;
            3 -> 1;
            end,
    %% 比特率公式
    BitRate = bitrate(Vsn, Layer, E) * 1000,
    %% 采样率公式
    SampleRate = samplerate(Vsn, F),
    %% 填充位
    Padding = G,
    %% 帧长度
    FrameLength = framelength(Layer, BitRate, SampleRate, Padding),
    if
        FrameLength < 21 ->
            exit(frameSize);
        true ->
            {ok, FrameLength, {Layer, BitRate, SampleRate, Bits}}
    end;
decode_header(_) ->
    exit(badHeader).
    



