%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dec 2020 3:06 PM
%%%-------------------------------------------------------------------
-author("df").


-record(barrack,{
	barrack_id = 0,					%% 兵营id
	soldier_type = 0,				%% 兵种类型
	is_train = 0,					%% 是否在训练
	train_num = 0,					%% 训练数量
	store_num = 0					%% 存放的士兵数量
}).


-record(barrack_train,{
	id = 0,
	auto_train_type = 0,			%% 自动训练状态 0 关闭 1 开启
	train_list = [],				%% 训练中的兵营列表
	barracks = dict:new(),			%% 兵营信息
	accumulated_training_num = 0	%% 累计训练数量
}).
