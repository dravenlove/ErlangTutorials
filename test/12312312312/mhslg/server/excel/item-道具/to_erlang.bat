@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_item -g item-����.xlsx
	%OperPath% -o %DesPath%\tb_package -g package-������.xlsx
	GOTO:EOF
	
:end
	
	