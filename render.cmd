set _cup=%1
set _next_fig=%2
echo hui
set _cup_width=%_cup:~0,2%
set _cup_height=%_cup:~2,2%
set _fig_width=%_cur_fig:~0,1%
set _fig_height=%_cur_fig:~1,1%

set brik=X
set "void= "
set _cup=%_cup:1=!brik!%
set _cup=%_cup:0=!void!%

cls

:: DEBUG
:: echo %_cup%
:: echo _cup_width=%_cup_width%
:: echo _cup_height=%_cup_height%

:: Render cup with figure
for /l %%i in (1,1,%_cup_height%) do (
    set /a "d=3 + %_cup_width%*(%%i-1)"
    call echo "%%_cup:~!d!,!_cup_width!%%"
)
echo.

:: Render next fig
:: TODO

:: Render score
:: TODO

:: Render help
echo Control: 
echo W - rotate
echo A - left
echo S - down
echo D - right
echo Q - exit

exit /b 0
