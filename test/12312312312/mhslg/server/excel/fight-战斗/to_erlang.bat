@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_prop -g prop-’Ω∂∑ Ù–‘.xlsx
	GOTO:EOF
	
:end
	
	