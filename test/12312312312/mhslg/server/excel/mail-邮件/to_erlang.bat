@echo off

cd /d %~dp0

for /f "delims=" %%a in (../xmltoconfig.ini) do %%~a
call:convert
goto end

:convert
	%OperPath% -o %DesPath%\tb_mail -g mail-ÓÊ¼şÄÚÈİ.xlsx
	GOTO:EOF
	
:end
	
	