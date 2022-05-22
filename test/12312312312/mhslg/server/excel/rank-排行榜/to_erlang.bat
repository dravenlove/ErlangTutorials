@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_rank -g rank-排行榜刷新规则.xlsx
	GOTO:EOF
	
:end
	
	