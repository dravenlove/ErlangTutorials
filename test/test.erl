-module(test).

-export([get_event_weight_result/2,for/3,lists_change/3,test/1,test1/0,list1_is_list2_son/2,test_1/1,test_2/2]).

-record('ProtoWelfareExchange',{
    'event_id'	:: integer() | undefined, % = 1, 32 bits
    'time'	:: integer() | undefined, % = 2, 32 bits
    'current_schedule'	:: integer() | undefined, % = 3, 32 bits
    'target_schedule'	:: integer() | undefined % = 4, 32 bits
}).

test1()->
 Event_all_lists=for(1,4,fun(X)->[lists:nth(X,[1,0,3,4])]++[lists:nth(X,[0,6,7,8])]++[lists:nth(X,[9,10,11,12])]++[lists:nth(X,[13,14,15,16])] end),
  lists:filter(fun(X)-> (lists:nth(2,X) =/=0) end,Event_all_lists).


test(List)->
  lists:foldr(fun(T,L)->
    [#'ProtoWelfareExchange'{
      event_id = lists:nth(1,T),							%事件类型
      time = lists:nth(2,T),				          %时间
      current_schedule = lists:nth(3,T),	    %当前值
      target_schedule = lists:nth(4,T)				%目标值
    }|L]
              end,[],List).

get_event_weight_result(List,All_weight) ->
  Size=trunc(lists:flatlength(List)/2),        %%获取事件数量
  Weight_list=lists:map(fun([_,W]) ->W end,List),  %%返回权重列表[30,30,30]
  Ran=rand:uniform(All_weight+1)-1,              %%获取0~All_weight的随机数
  New_list=for(1,Size,fun(X)-> lists:sum(lists:sublist(Weight_list,1,X)) end), %%获取范围列表[30,60,90]
  New_list1=case Size =:= 1 of                                                    %%获取范围列表[0,30,30,60,60,90]
              true ->
                [0]++New_list;
              false ->
                lists:flatten([[0, lists:nth(1,New_list)]]++for(2,Size,fun(X) ->[lists:nth((X-1),New_list),lists:nth((X),New_list)] end))
            end,
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%判断随机数在不在范围内
  lists:flatten(lists:filtermap(fun(X) -> case X of
                              [_,1]->
                                true;
                              [_,0]->
                                false
                            end end,
    for(1,Size,fun(X)->
    case Ran>=lists:nth((X*2-1),New_list1) andalso Ran<lists:nth((X*2),New_list1) of                   %%判断是不是在范围内
      true ->
        [X,1];
      false ->
        [X,0]
    end
             end))).%%返回[]或[1、2、3、4、5、6,1]

for(N,N,F)->
  [F(N)];
for(L,N,F)->
  [F(L)|for(L+1,N,F)].

lists_change(R,N,L)->case lists:split(N-1, L) of
{F, [_|T]} -> F ++ [R|T] end.

list1_is_list2_son(List1,List2)->
  PL=lists:map(fun(X)->case lists:member(X,List2) of
                         true->1;
                           false->0
                       end end,List1),
  case lists:member(0,PL) of
    true->false;
    false->true
  end.

test_1(List)->
	lists:foldl(fun(J,Acc2)-> case J of 
true->
Acc2+1;
false->
Acc2
end end,0,List).

test_2(A,B)->
	C=try A>=B of
		true->1;
		false->2
	catch
		error:X->{3,X};
		throw:X->{5,X}
	after
		4
end,
C.
