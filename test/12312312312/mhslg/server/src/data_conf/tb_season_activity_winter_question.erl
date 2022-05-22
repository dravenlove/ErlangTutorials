%%--- coding:utf-8 ---
-module(tb_season_activity_winter_question).
-export([get/1,get_list/0]).
get(1)-> #{
    'question' => <<"充钱没有？"/utf8>>,
    'answer_right' => <<"充了"/utf8>>,
    'answer_wrong1' => <<"没有"/utf8>>,
    'answer_wrong2' => <<"没有"/utf8>>,
    'answer_wrong3' => <<"没有"/utf8>>
};
get(2)-> #{
    'question' => <<"充了多少？"/utf8>>,
    'answer_right' => <<"一个亿"/utf8>>,
    'answer_wrong1' => <<"五毛钱"/utf8>>,
    'answer_wrong2' => <<"一块钱"/utf8>>,
    'answer_wrong3' => <<"十块钱"/utf8>>
};
get(3)-> #{
    'question' => <<"下一步准备充多少？"/utf8>>,
    'answer_right' => <<"十个亿"/utf8>>,
    'answer_wrong1' => <<"十块钱"/utf8>>,
    'answer_wrong2' => <<"五十块"/utf8>>,
    'answer_wrong3' => <<"一百块"/utf8>>
};
get(4)-> #{
    'question' => <<"穷人配玩这个游戏吗？"/utf8>>,
    'answer_right' => <<"不配"/utf8>>,
    'answer_wrong1' => <<"配"/utf8>>,
    'answer_wrong2' => <<"配"/utf8>>,
    'answer_wrong3' => <<"配"/utf8>>
};
get(5)-> #{
    'question' => <<"不充钱就想玩游戏？"/utf8>>,
    'answer_right' => <<"开玩笑的"/utf8>>,
    'answer_wrong1' => <<"是的"/utf8>>,
    'answer_wrong2' => <<"是的"/utf8>>,
    'answer_wrong3' => <<"是的"/utf8>>
};
get(6)-> #{
    'question' => <<"你相信光吗？"/utf8>>,
    'answer_right' => <<"信"/utf8>>,
    'answer_wrong1' => <<"不信"/utf8>>,
    'answer_wrong2' => <<"不信"/utf8>>,
    'answer_wrong3' => <<"不信"/utf8>>
};
get(7)-> #{
    'question' => <<"非酋还有救吗？"/utf8>>,
    'answer_right' => <<"玄不救非，氪能改命"/utf8>>,
    'answer_wrong1' => <<"等死吧"/utf8>>,
    'answer_wrong2' => <<"没救了"/utf8>>,
    'answer_wrong3' => <<"再见"/utf8>>
};
get(8)-> #{
    'question' => <<"冬日问答？"/utf8>>,
    'answer_right' => <<"答"/utf8>>,
    'answer_wrong1' => <<"问"/utf8>>,
    'answer_wrong2' => <<"问"/utf8>>,
    'answer_wrong3' => <<"问"/utf8>>
};
get(9)-> #{
    'question' => <<"什么能是你变强？"/utf8>>,
    'answer_right' => <<"充钱"/utf8>>,
    'answer_wrong1' => <<"玄学"/utf8>>,
    'answer_wrong2' => <<"玄学"/utf8>>,
    'answer_wrong3' => <<"玄学"/utf8>>
};
get(10)-> #{
    'question' => <<"你觉得这个游戏怎么样？"/utf8>>,
    'answer_right' => <<"好玩"/utf8>>,
    'answer_wrong1' => <<"能玩"/utf8>>,
    'answer_wrong2' => <<"辣鸡游戏"/utf8>>,
    'answer_wrong3' => <<"没玩过"/utf8>>
};
get(11)-> #{
    'question' => <<"充钱没有？"/utf8>>,
    'answer_right' => <<"充了"/utf8>>,
    'answer_wrong1' => <<"没有"/utf8>>,
    'answer_wrong2' => <<"没有"/utf8>>,
    'answer_wrong3' => <<"没有"/utf8>>
};
get(12)-> #{
    'question' => <<"充了多少？"/utf8>>,
    'answer_right' => <<"一个亿"/utf8>>,
    'answer_wrong1' => <<"五毛钱"/utf8>>,
    'answer_wrong2' => <<"一块钱"/utf8>>,
    'answer_wrong3' => <<"十块钱"/utf8>>
};
get(13)-> #{
    'question' => <<"下一步准备充多少？"/utf8>>,
    'answer_right' => <<"十个亿"/utf8>>,
    'answer_wrong1' => <<"十块钱"/utf8>>,
    'answer_wrong2' => <<"五十块"/utf8>>,
    'answer_wrong3' => <<"一百块"/utf8>>
};
get(14)-> #{
    'question' => <<"穷人配玩这个游戏吗？"/utf8>>,
    'answer_right' => <<"不配"/utf8>>,
    'answer_wrong1' => <<"配"/utf8>>,
    'answer_wrong2' => <<"配"/utf8>>,
    'answer_wrong3' => <<"配"/utf8>>
};
get(15)-> #{
    'question' => <<"不充钱就想玩游戏？"/utf8>>,
    'answer_right' => <<"开玩笑的"/utf8>>,
    'answer_wrong1' => <<"是的"/utf8>>,
    'answer_wrong2' => <<"是的"/utf8>>,
    'answer_wrong3' => <<"是的"/utf8>>
};
get(16)-> #{
    'question' => <<"你相信光吗？"/utf8>>,
    'answer_right' => <<"信"/utf8>>,
    'answer_wrong1' => <<"不信"/utf8>>,
    'answer_wrong2' => <<"不信"/utf8>>,
    'answer_wrong3' => <<"不信"/utf8>>
};
get(17)-> #{
    'question' => <<"非酋还有救吗？"/utf8>>,
    'answer_right' => <<"玄不救非，氪能改命"/utf8>>,
    'answer_wrong1' => <<"等死吧"/utf8>>,
    'answer_wrong2' => <<"没救了"/utf8>>,
    'answer_wrong3' => <<"再见"/utf8>>
};
get(18)-> #{
    'question' => <<"冬日问答？"/utf8>>,
    'answer_right' => <<"答"/utf8>>,
    'answer_wrong1' => <<"问"/utf8>>,
    'answer_wrong2' => <<"问"/utf8>>,
    'answer_wrong3' => <<"问"/utf8>>
};
get(19)-> #{
    'question' => <<"什么能是你变强？"/utf8>>,
    'answer_right' => <<"充钱"/utf8>>,
    'answer_wrong1' => <<"玄学"/utf8>>,
    'answer_wrong2' => <<"玄学"/utf8>>,
    'answer_wrong3' => <<"玄学"/utf8>>
};
get(20)-> #{
    'question' => <<"你觉得这个游戏怎么样？"/utf8>>,
    'answer_right' => <<"好玩"/utf8>>,
    'answer_wrong1' => <<"能玩"/utf8>>,
    'answer_wrong2' => <<"辣鸡游戏"/utf8>>,
    'answer_wrong3' => <<"没玩过"/utf8>>
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].
