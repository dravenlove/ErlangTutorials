% (2).��дһ�� term_to_packet(Term) -> Packet �ĺ�����
% ͨ������ term_to_binary(Term) �����ɲ�����һ���������ͣ�
% ���ں�����Ϊ 4 ���ֽڵİ�ͷ N����� N ���ֽڵ�����

-module(termtopacket).
-export([term_to_packet/1]).

term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    % ��ȡ��ǰ 4 Byte����Ϊ����info�Ĵ�С
    % ע�⣬һ��Ҫλ��ƥ�䣬����ᱨ��
    <<Head:32/bits, _/bits>> = Bin,
    <<Size:32>> = Head,
    <<Head:32/bits, Info:Size/bits>> = Bin,
    Info.

% Ҳ��������д
term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    <<Head:32, Info/bitstring>> = Bin,
    Info.

% ��дһ�� term_to_packet(Term) -> Packet �ĺ�����
% ͨ������ term_to_binary(Term) �����ɲ�����һ���������ͣ�
% ���ں�����Ϊ 4 ���ֽڵİ�ͷ N����� N ���ֽڵ�����

-module(termtopacket).
-export([term_to_packet/1]).

term_to_packet(Term) ->
    Bin = term_to_binary(Term),
    Length = bit_size(Bin),
    Size = <<Length:1/unit:32>>,
    <<Size/binary, Bin/binary>>.