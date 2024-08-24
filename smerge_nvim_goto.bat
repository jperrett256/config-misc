@echo off
setlocal

:: script for helping sublime merge interface with Neovim

:: NOTE expects "${file} ${line} ${col}" args
set "file=%1"
set "line=%2"
set "col=%3"

:: NOTE was designed to support ${file}:${line}:${col}, which
:: I thought was the default, but actually isn't as it turns out
REM for /F "delims=: tokens=1,2,3" %%i in (%*) do (
REM   set "file=%%i"
REM   set "line=%%j"
REM   set "col=%%k"
REM )

:: change filename backslashes to forward slashes (so Neovim
:: doesn't mistake them for the start of escape sequences)
set "file=%file:\=/%"

:: DEBUG
REM echo %file%, %line%, %col%
REM call nvim --server %NVIM_SERVER_ADDRESS% --remote-send "<cmd>lua print('%file%, ' .. '%line%, ' .. '%col%')<CR>"

call nvim --server %NVIM_SERVER_ADDRESS% --remote-send "<cmd>lua GotoFile('%file%', %line%, %col%)<CR>"

