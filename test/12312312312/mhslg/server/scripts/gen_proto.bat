@echo off

cd /d %~dp0
set DIR=../proto

rem escript.exe protoc-gpb/bin/protoc-erl -o-erl ../src/proto -o-hrl ../include -I %DIR% ProtoPublic.proto

for /R %DIR% %%f in (*.proto) do (
 	escript.exe protoc-gpb/bin/protoc-erl -o-erl ../src/proto -o-hrl ../include -I %DIR% %%f
)
