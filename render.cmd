setlocal
set cup=%1
set next_fig=%2
set score=%3

set cup_width=%cup:~0,2%
set cup_height=%cup:~2,2%
set fig_width=%next_fig:~0,1%
set fig_height=%next_fig:~1,1%

set brik=X
set "void= "
set cup=%cup:1=!brik!%
set cup=%cup:0=!void!%
set next_fig=%next_fig:1=!brik!%
set next_fig=%next_fig:0=!void!%

cls

:: DEBUG
:: echo %cup%
:: echo cup_width=%cup_width%
:: echo cup_height=%cup_height%

:: Render cup
set /a width=cup_width-2
for /l %%i in (2,1,%cup_height%) do (
    set /a "d=5 + %cup_width%*(%%i-2)"
    call :slice "%cup%" !d! %width% line
    echo ^|!line!^|
)
call get_line.cmd - %cup_width% floor
echo %floor%

:: Render next fig
echo.
echo NEXT
echo.
for /l %%i in (1,1,%fig_height%) do (
    set /a "d=2 + %fig_width%*(%%i-1)"
    call echo  %%next_fig:~!d!,!fig_width!%%
)

:: Render score
echo.
echo SCORE: %score%

:: Render help
echo.
echo Control
echo -----------------------------------------------------------
echo ^| W - rotate ^| A - left ^| S - down ^| D - right ^| Q - exit ^|
echo -----------------------------------------------------------
endlocal
exit /b 0

:slice
set str=%~1
set a=%2
set b=%3
set "%4=!str:~%a%,%b%!"
exit /b 0
