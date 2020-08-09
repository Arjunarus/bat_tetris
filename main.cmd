@echo off
setlocal EnableDelayedExpansion
call imports.cmd

:loop
    %call_function% get_key.cmd key_pressed
    if "%key_pressed%"=="Q" exit /b 0
    echo "%key_pressed% key is pressed"

goto :loop
