@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_vip -g vip-VIPµ»º∂≈‰÷√.xlsx
	GOTO:EOF
	
:end
	
	