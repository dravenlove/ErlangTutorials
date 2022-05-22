%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_tips.erl
%% Created on : 2019-06-11 17:48:00
%% Author: Jiuan
%% Last Modified: 2019-06-11 17:48:00
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_tips).
-include("common.hrl").
-include("ProtoClient_10105.hrl").
-export([
	tips/3
		]).

tips(TipsId, Args, PlayerId) ->
	Content = get_tips_content(TipsId),
	NewContent = util:format_chinese(Content, Args),
	Respond = #'Proto80105005'{tips = NewContent},
	lib_send:respond_to_client(PlayerId, Respond).

get_tips_content(TipsId) ->
	#{content := Content} = tb_tips:get(TipsId),
	Content.
