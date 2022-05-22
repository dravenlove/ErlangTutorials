-define(IP_VERSION, 4).
-define(IP_MIN_HDR_LEN, 5).

%% ipv4数据报头部格式
%% 版本4位,首部长度4位,区分服务8位 报文总长 16位 指的是首部和数据之和的长度 
%% 标识16位这个是一个计数器计数值,每产生一个数据报计数器就+1,并赋值给标识字符
%% 标志3位,目前只有两位有意义,最低位为表示后面还有分片的数据报,为0则表示这是最后一个数据片,中间位为1代表不能分片,为0代表允许分片
%% 片位移,13位支出较长的分组在分片后,该片在原分组的相对位置
%% 生存时间TTL 8位,代表数据报在网络中的寿命,功能是"跳数限制"
%% 协议 8位 指出该数据报携带的数据是哪种协议
%% 首部检验和 16位,只要数据每经过一个设备,设备重新计算首部检验和,如果首部未发生变化检验和结果为0,保留数据报,只检验数据报的头部
%% 源地址 32位,报文发送方的ipv4地址
%% 目的地址 32位,报文接收方的ipv4地址
%% 选项字段(0~40字节)用来支持排错、测量以及安全措施，必要的时候插入值为0
%% 数据部分，用来填充报文

DgramSize = byte_size(Ipv4),
case Ipv4 of
    <<?IP_VERSION:4, HLen:4, SrvcType:8, TotLen:16,
    ID:16, Flags:3, FragOff:13, TTL:8, Proto:8, 
    HdrChkSum:16, SrcIP:32, DestIP:32, RestDgram/binary>> 
    when HLen >= 5, 4 * HLen =< DgramSize ->
        OptsLen = 4 * (HLen - ?IP_MIN_HDR_LEN),
        <<Opts:OptsLen/binary, Data/binary>> = RestDgram,