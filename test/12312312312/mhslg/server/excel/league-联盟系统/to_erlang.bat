@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_league_const -g league_const-���˳���.xlsx
	%OperPath% -o %DesPath%\tb_league_level -g league_level-���˵ȼ�.xlsx
	%OperPath% -o %DesPath%\tb_league_right -g league_right-����ְλȨ��.xlsx
	%OperPath% -o %DesPath%\tb_league_log -g league_log-������־.xlsx
	GOTO:EOF
	
:end
	
	