%%(1) 复习这一章里关于Mod:module_info()的部分。输入命令dict:module_info()。这个模块返回了多少个函数？

%%[{module,dict},
% {exports,[{is_empty,1},
%%           {append_list,3},
%%           {update,3},
%%           {update,4},
%%           {update_counter,3},
%%           {map,2},
%%           {filter,2},
%%           {merge,3},
%%           {module_info,0},
%%           {module_info,1},
%%           {fetch,2},
%%           {fetch_keys,1},
%%           {from_list,1},
%%           {is_key,2},
%%           {find,2},
%%           {append,3},
%%           {new,0},
%%           {fold,3},
%%           {store,3},
%%           {erase,2},
%%           {size,1},
%%           {to_list,1}]},

%%导入了22个函数.


%%1> tupletolist:module_info().
%%[{module,tupletolist},
%% {exports,[{my_tuple_to_list,1},
%%           {for,3},
%%           {module_info,0},
%%           {module_info,1}]},
%% {attributes,[{vsn,[153586761141797895100559174085487431813]}]},
%% {compile,[{options,[]},
%%           {version,"7.0.4"},
%%           {source,"c:/Users/Administrator/Desktop/work/4.2/tupletolist.erl"}]},
%% {md5,<<115,139,187,246,201,219,238,89,156,174,206,247,
%%        54,133,16,133>>}]



