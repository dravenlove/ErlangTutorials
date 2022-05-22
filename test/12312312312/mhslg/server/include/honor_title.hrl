%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 15:12
%%%-------------------------------------------------------------------
-author("Jiuan").

-record(honor_title,{
	hero_id = 0,	%% 佩戴英雄id
	rand_prop = []	%% 随机属性id列表
}).

-record(hero_title,{
	unique_id = 0,	%% 唯一id
	item_id = 0
}).