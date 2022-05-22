@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_item -g item-道具.xlsx
	%OperPath% -o %DesPath%\tb_package -g package-背包表.xlsx
	GOTO:EOF
	
:end
	
	