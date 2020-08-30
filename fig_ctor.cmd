@echo off
setlocal EnableDelayedExpansion
call imports.cmd

set shape=%1
set mirr=%2
set rotate=%3

if "%shape%" == "R" call :get_random_shape shape
if "%mirr%" == "R" %call_function% "rand 0 1" mirr
if "%rotate%" == "R" %call_function% "rand 0 3" rotate

set _fig=UNKNOWN
if shape==L (
:: 10
:: 10
:: 11
    set _fig=23101011
)
if shape==S (
:: 011
:: 110
    set _fig=32011110
)
if shape==I (
:: 1
:: 1
:: 1
:: 1
    set _fig=141111
)
if shape==O (
:: 11
:: 11
    set _fig=221111
)
if shape==T (
:: 111
:: 010
    set _fig=32111010
)

if %mirr%==1 %call_function% "mirror %_fig%" _fig
if %rotate% GTR 0 %call_function% "rotate %_fig% %rotate%" _fig

echo %_fig%

exit /B 0

:get_random_shape 
::$1 - output
set shapes=LSIOT
%call_function% "rand 1 5" num
call set %1=%%shapes:~%num%,1%%
exit /B 0