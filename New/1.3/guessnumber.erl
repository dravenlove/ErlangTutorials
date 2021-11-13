%%3.为List内的所有元素创建N个结构体record List [struct0, struct1,struct2,,,,structN],结构体内容有input_number(用户输入的number 整数型)，input_index(该number的序号首次输入为0，最后一次输入为N-1 整数型)，intput_time(输入该number的时刻值为Unix时间戳 整数形) 。
%%对N Struct List进行排序，排序规则：以input_number升序排列，输出排序后N Struct List全部成员的字段名与字段值。

-module(guessnumber).
-export([guess/1,start/1,for/3,get_time/0,struct/0]).
-record(list,
	{input_number,input_index,intput_time}).

start(Max)->X=random:uniform(Max),
ets:new(guess,[named_table,public,ordered_set]),
ets:new(guess_time,[named_table,public,ordered_set]),
guess(X).

guess(X) ->
	Guess=io:get_line("please input a num"),
	{Guessnumber,_}=string:to_integer(Guess),
    case ets:last(guess) of
        '$end_of_table' ->
            ets:insert(guess,{0,Guessnumber}),
			ets:insert(guess_time,{0,get_time()});
        Key ->
            ets:insert(guess,{ets:last(guess)+1,Guessnumber}),
			ets:insert(guess_time,{ets:last(guess)+1,get_time()})
        end,
    case Guessnumber=:=X of
		true->
            List1=ets:tab2list(guess),
            List=lists:flatmap(fun({_,X}) ->[X] end,List1),
			io:format("you are right"),
			List;
		false->
			case Guessnumber>X of
				true ->
					io:format("you guess bigger"),
					guess(X);
				false ->
					io:format("you are smaller"),
					guess(X)
			end
	end.

struct() ->
	List_guess1=ets:tab2list(guess),
	List_guess=lists:flatmap(fun({_,X}) ->[X] end,List_guess1),
	List_time1=ets:tab2list(guess_time),
	List_time=lists:flatmap(fun({_,X}) ->[X] end,List_time1),


	Length=erlang:length(List_guess),
	Newlist=for(1,Length,fun(X)->
		{lists:nth(X,List_guess),X-1,lists:nth(X,List_time)} end),
		%%不会创建多个记录record
		X0=#list{input_number=lists:nth(1,List_guess),input_index=0,intput_time=lists:nth(1,List_time)},
	%%排序
	Newlist2=lists:keysort(1,Newlist).
	


for(N,N,F)->
	[F(N)];
for(L,N,F)->
	[F(L)|for(L+1,N,F)].

get_time()->
{H,M,S}=os:timestamp(),

Time=list_to_integer(erlang:integer_to_list(H)++erlang:integer_to_list(M)++erlang:integer_to_list(S)).