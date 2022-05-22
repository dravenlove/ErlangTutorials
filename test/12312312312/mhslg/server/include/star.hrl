%%-------------------------------------------------------------------
%% @author df
%% @copyright (C) 2021, <COMPANY>
%% @doc
%%
%% @end
%% Created : 10. 6月 2021 11:00
%%-------------------------------------------------------------------
-author("df").
-define(STAR_BROAD , 1023).	%% 广播Id


-record(player_star, {
	player_id = 0,
	buy_time = 0			%% 剩余购买次数
}).

-record(star_hero, {
	star_type_map = maps:new()
}).

-record(star_type, {
	type = 0,				%% 星座类型
	star_map = maps:new()	%% MAP inlay_type =》 #star{}
}).

-record(star, {
	inlay_type = 0,			%% 镶嵌位置id
	inlay = 0				%% 镶嵌道具
}).

-record(star_info, {
	level = 1,				%% 等级
	experience = 0,			%% 经验
	inlay_info = []			%% 镶嵌信息 [] =》 未镶嵌  [HeroId,type,inlay_type] => 表示镶嵌位置
}).

