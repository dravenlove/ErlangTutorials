@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_const -g const-������.xlsx const_server-�����ר�ó�����.xlsx
	GOTO:EOF
	
:end
	
	