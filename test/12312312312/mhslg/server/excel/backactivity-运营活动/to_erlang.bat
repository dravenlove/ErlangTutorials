@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o erl\tb_cumulate_recharge -g cumulate_recharge-¿€ª˝≥‰÷µ≈‰÷√.xlsx
	GOTO:EOF
	
:end
	
	