%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: log.hrl
%% Created on : 2019-05-06 14:49:18
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-06 14:51:18
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('LOG_HRL').
-define('LOG_HRL', true).

-define(PRINT(Format, Args), io:format(Format, Args)).
-define(PRINT(Format), io:format(Format)).

-define(DEBUG(Format, Args), mod_logger:debug_msg(?MODULE,?LINE,Format, Args)).
-define(INFO(Format, Args), mod_logger:info_msg(?MODULE,?LINE,Format, Args)).
-define(WARNING(Format, Args), mod_logger:warning_msg(?MODULE,?LINE,Format, Args)).
-define(ERROR(Format, Args), mod_logger:error_msg(?MODULE,?LINE,Format, Args)).
-define(CRITICAL_MSG(Format, Args), mod_logger:critical_msg(?MODULE,?LINE,Format, Args)).

-define(DEBUG(Format), mod_logger:debug_msg(?MODULE,?LINE,Format, [])).
-define(INFO(Format), mod_logger:info_msg(?MODULE,?LINE,Format, [])).
-define(WARNING(Format), mod_logger:warning_msg(?MODULE,?LINE,Format, [])).
-define(ERROR(Format), mod_logger:error_msg(?MODULE,?LINE,Format, [])).
-define(CRITICAL_MSG(Format), mod_logger:critical_msg(?MODULE,?LINE,Format, [])).

-ifdef(LIVE).
    -define(_U(S),unicode:characters_to_list(iolist_to_binary(S))).
-else.
    -define(_U(S),S).
-endif.

-define(LOG_NO_LEVEL, 0).
-define(LOG_CRIT_LEVEL, 1).
-define(LOG_ERROR_LEVEL, 2).
-define(LOG_WARN_LEVEL, 3).
-define(LOG_INFO_LEVEL, 4).     %% 不输出debug日志
-define(LOG_DEBUG_LEVEL, 5).    %%　输出debug日志
-define(LOG_TEST_LEVEL, 6).     %% 日志输出到终端
-define(LOG_LEVELS,[ {0, no_log, "No log"}
    ,{1, critical, "Critical"}
    ,{2, error, "Error"}
    ,{3, warning, "Warning"}
    ,{4, info, "Info"}
    ,{5, debug, "Debug"}
    ,{6, test, "Test"}
]).

-endif.

