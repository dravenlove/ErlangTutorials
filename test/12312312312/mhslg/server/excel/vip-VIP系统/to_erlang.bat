@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_vip -g vip-VIP�ȼ�����.xlsx
	GOTO:EOF
	
:end
	
	