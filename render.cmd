set _cup=%1
set _next_fig=%2

set _cup_width=%_cup:~0,2%
set _cup_height=%_cup:~2,2%
set _fig_width=%_next_fig:~0,1%
set _fig_height=%_next_fig:~1,1%

set brik=X
set "void= "
set _cup=%_cup:1=!brik!%
set _cup=%_cup:0=!void!%
set _next_fig=%_next_fig:1=!brik!%
set _next_fig=%_next_fig:0=!void!%

cls

:: DEBUG
:: echo %_cup%
:: echo _cup_width=%_cup_width%
:: echo _cup_height=%_cup_height%

:: Render cup with figure
for /l %%i in (1,1,%_cup_height%) do (
    set /a "d=4 + %_cup_width%*(%%i-1)"
    call echo %%_cup:~!d!,!_cup_width!%%
)

:: Render next fig
echo.
echo NEXT:
echo.
for /l %%i in (1,1,%_fig_height%) do (
    set /a "d=2 + %_fig_width%*(%%i-1)"
    call echo  %%_next_fig:~!d!,!_fig_width!%%
)

:: Render score
:: TODO

:: Render help
echo.
echo Control: 
echo -----------------------------------------------------------
echo ^| W - rotate ^| A - left ^| S - down ^| D - right ^| Q - exit ^|
echo -----------------------------------------------------------

exit /b 0
