@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_const -g const-常量表.xlsx const_server-服务端专用常量表.xlsx
	GOTO:EOF
	
:end
	
	