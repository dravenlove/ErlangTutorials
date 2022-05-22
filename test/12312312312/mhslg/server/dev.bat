@echo off

rem ---------------------------------------------------------
rem 控制脚本
rem @author kqqsysu@gmail.com
rem ---------------------------------------------------------

rem 代码目录
cd /d %~dp0
set input=%1
set DIR_SRC=%~dp0
set ERLC=erlc
set ERL=erl
set WERL=werl
set ESCRIPT=escript

set PROCESSES=8
set MAKE_OPTS="{d,glendy},{d,'NO_HAVE_STACKTRACE_SYNTAX',true},{d,'DEBUG_BUILD',true}"

set NODE=1
set NODE_NAME=dev@127.0.0.1
set SINGLE_NODE_NAME=dev@127.0.0.1
set CLUSTER_NODE_NAME=cluster@127.0.0.1
set WORLD_NODE_NAME=world@127.0.0.1
set COOKIE=QPlcYxcBeeXewnci
set GAME_CONF_FILE=./config/game_server

if "%input%" == "" goto fun_wait_input
goto fun_run

:fun_wait_input
    set input=
    echo.
    echo ==============================
    echo make: 编译服务端源码
    echo mf: 编译指定文件
	echo start: 启动运行
	echo start_cluster: 启动跨服
	echo start_world: 启动世界服
	echo stop: 停止运行
	echo stop_cluster: 停止跨服
	echo stop_world: 停止世界服
	echo u: 更新代码
	echo clean: 清除beam文件
	echo proto: 生成proto
	echo config: 更新.config
	echo debug: 调试进程
    echo quit: 结束运行
    echo ------------------------------
    set /p input=请输入指令:
    echo ------------------------------
    goto fun_run

:wait_input
    rem 区分是否带有命令行参数
    if [%1]==[] goto fun_wait_input
    goto end

:fun_run
    if [%input%]==[make] goto fun_make
    if [%input%]==[mf] goto fun_make_protogen
    if [%input%]==[start] goto fun_start_start
	if [%input%]==[start_cluster] goto fun_start_cluster
	if [%input%]==[start_world] goto fun_start_world
    if [%input%]==[stop] goto fun_stop
	if [%input%]==[stop_cluster] goto fun_stop_cluster
	if [%input%]==[stop_world] goto fun_stop_world
	if [%input%]==[u] goto fun_update
	if [%input%]==[clean] goto fun_clean
	if [%input%]==[proto] goto fun_proto
	if [%input%]==[config] goto fun_config
	if [%input%]==[debug] goto fun_debug
    if [%input%]==[quit] goto end
    goto wait_input


:fun_make
    rem 编译命令
	cd %DIR_SRC%
	md ebin
	
	rem copy config\game_server.config ebin
	copy config\server.app ebin
	copy ebin2\*.beam ebin
	copy base\*.beam ebin
	copy jsx\*.beam ebin
	copy src\data_conf\mapCityTrrigerDic.json ebin
	copy src\data_conf\world_map.json ebin
	copy src\data_conf\demo_map.json ebin
	copy src\data_conf\tile\*.txt ebin
	set h=%time:~0,2%
	set h=%h: =0%
	set nowTime="%date:~0,4%%date:~5,2%%date:~8,2%-%h%%time:~3,2%%time:~6,2%"
	rem %ERLC% -o src/gpb/gpb_parse.erl src/gpb/gpb_parse.yrl
	rem %ERLC% -o src/gpb/gpb_scan.erl src/gpb/gpb_scan.xrl
	%ERL% -noinput -eval "case make:files([\"src/tool/mmake.erl\"],[debug_info, {outdir, \"ebin\"},{i, \"include\"},{time,\"%nowTime%\"}]) of error -> halt(1); _ -> halt(0) end"
	rem %ERL% -noinput -eval "case make:files([\"src/gpb/gpb_codegen.erl\"],[debug_info, {outdir, \"ebin\"},{i, \"include\"},{time,\"%nowTime%\"}]) of error -> halt(1); _ -> halt(0) end"
	%ERL% -pa ./ebin -noinput -eval "case mmake:all(%PROCESSES%,[%MAKE_OPTS%,debug_info,{outdir, \"ebin\"},{i, \"include\"},{time,\"%nowTime%\"}]) of up_to_date -> halt(0); error -> halt(1) end."
	goto wait_input

:fun_make_protogen
    rem 编译命令
	cd %DIR_SRC%
	md scripts/protoc-gpb/ebin
	md ebin
	set h=%time:~0,2%
    set h=%h: =0%
    set nowTime="%date:~0,4%%date:~5,2%%date:~8,2%-%h%%time:~3,2%%time:~6,2%"
    echo %nowTime%
	%ERL% -noinput -eval "case make:files([\"src/protobuffer/gb_compile.erl\"],[debug_info, {outdir, \"ebin\"},{i, \"include\"},{time,\"%nowTime%\"}]) of error -> halt(1); _ -> halt(0) end"
	copy ebin\gb_compile.beam scripts\protoc-gpb\ebin
	goto wait_input

:fun_start_start
	set EBIN="./ebin"
	set NODE_NAME=%SINGLE_NODE_NAME%
	copy config\game_server_single.config config\game_server.config
	goto fun_do_start

:fun_start_cluster
	set EBIN="./ebin"
	set NODE_NAME=%CLUSTER_NODE_NAME%
	copy config\game_server_cluster.config config\game_server.config
	goto fun_do_start

:fun_start_world
	set EBIN="./ebin"
	set NODE_NAME=%WORLD_NODE_NAME%
	copy config\game_server_world.config config\game_server.config
	goto fun_do_start

:fun_do_start
    rem 启动主节点
	cd %DIR_SRC%
	set h=%time:~0,2%
	set h=%h: =0%
	set strtime=%date:~0,4%%date:~5,2%%date:~8,2%%h%%time:~3,2%%time:~6,2%

	set SMP=auto
	set ERL_PROCESSES=102400
	set SASL_LOG=./logs/game_log_%strtime%.sasl
	del /f /s /q logs\*
	del /f /s /q log\*.log

	start %WERL% +P %ERL_PROCESSES% -smp %SMP% -pa %EBIN% -name %NODE_NAME% -setcookie %COOKIE% -hidden -kernel inet_dist_listen_min 41000 inet_dist_listen_max 42000 -kernel net_ticktime 600  -sasl sasl_error_logger {file,\"%SASL_LOG%\"} -config %GAME_CONF_FILE% -s main start

    goto wait_input

:fun_stop
	set NODE_NAME=%SINGLE_NODE_NAME%
	goto fun_do_stop

:fun_stop_cluster
	set NODE_NAME=%CLUSTER_NODE_NAME%
	goto fun_do_stop

:fun_stop_cluster
	set NODE_NAME=%WORLD_NODE_NAME%
	goto fun_do_stop

:fun_do_stop
	start %WERL% -pa %EBIN% -name stop_%NODE_NAME% -setcookie %COOKIE% -eval "catch rpc:call('%NODE_NAME%',main,stop,[]),init:stop()."
	goto wait_input

:fun_update
	start %WERL% -pa %EBIN% -name stop_%NODE_NAME% -setcookie %COOKIE% -eval "catch rpc:call('%NODE_NAME%',u,u,[]),catch rpc:call('%NODE_NAME%',lib_fight_rule,update_fight_rule,[]),catch rpc:call('%NODE_NAME%',lib_config_api,update_config,[]),init:stop()."
	goto wait_input
	
:fun_clean
	cd %DIR_SRC%
	del /f /s /q *.dump
	del /f /s /q ebin\*.beam
	goto wait_input

:fun_proto
	cd %DIR_SRC%
	call scripts\gen_proto.bat
	cd %DIR_SRC%
	goto wait_input
	
:fun_config
	cd %DIR_SRC%
	start %WERL% -pa %EBIN% -name stop_%NODE_NAME% -setcookie %COOKIE% -eval "catch rpc:call('%NODE_NAME%',config_to_beam,config_to_beam,[]),init:stop()."
	goto wait_input
	
:fun_debug
	cd %DIR_SRC%
	start %WERL% +P %ERL_PROCESSES% -smp %SMP% -pa %EBIN% -name %NODE_NAME% -setcookie %COOKIE% -hidden -kernel net_ticktime 600  -sasl sasl_error_logger {file,\"%SASL_LOG%\"} -config %GAME_CONF_FILE% -eval "im()."
	goto wait_input
