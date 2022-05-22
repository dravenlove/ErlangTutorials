%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十一月 2020 15:12
%%%-------------------------------------------------------------------
-author("Jiuan").

-record(head_icon,{
	head_id = 0,
	active_tick = 0
}).

-record(player_head_icon,{
	id = 0,
	head_dict = dict:new()
}).