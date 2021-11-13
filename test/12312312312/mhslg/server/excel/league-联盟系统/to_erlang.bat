@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_league_const -g league_const-联盟常量.xlsx
	%OperPath% -o %DesPath%\tb_league_level -g league_level-联盟等级.xlsx
	%OperPath% -o %DesPath%\tb_league_right -g league_right-联盟职位权限.xlsx
	%OperPath% -o %DesPath%\tb_league_log -g league_log-联盟日志.xlsx
	GOTO:EOF
	
:end
	
	