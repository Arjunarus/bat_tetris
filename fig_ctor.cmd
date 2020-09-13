@echo off

set shape=%1
set mirr=%2
set rotate=%3

set _fig=UNKNOWN
:: Shapes: width, height, points
if "%shape%"=="1" set _fig=23101011
if "%shape%"=="2" set _fig=32011110
if "%shape%"=="3" set _fig=141111
if "%shape%"=="4" set _fig=221111
if "%shape%"=="5" set _fig=32111010

if %mirr%==1 %call_function% "mirror %_fig%" _fig
if %rotate% GTR 0 %call_function% "rotate %_fig% %rotate%" _fig

echo %_fig%
