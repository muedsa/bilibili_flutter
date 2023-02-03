@echo off

set workdir=%~dp0%
set in_path=%workdir%/lib/data/model/bilibili/danmaku/
set out_path=%workdir%/lib/data/model/bilibili/danmaku/
echo in_path: %in_path%
echo out_path: %out_path%

protoc -I=%in_path% --dart_out=%out_path% danmaku.proto