@echo off
setlocal
call rand.cmd 1 5 shape
call rand.cmd 0 1 mirr
call rand.cmd 0 3 rotate

set fig=UNKNOWN
:: Shapes: width, height, points
if "%shape%"=="1" set fig=23101011
if "%shape%"=="2" set fig=32011110
if "%shape%"=="3" set fig=141111
if "%shape%"=="4" set fig=221111
if "%shape%"=="5" set fig=32111010

if %mirr%==1 %call_function% "mirror %fig%" fig
if %rotate% GTR 0 call rotate.cmd %fig% %rotate% fig

endlocal & set %1=%fig%
exit /b 0
