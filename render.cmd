set _cup=%1
set _fig_x=%2
set _fig_y=%3
set _cur_fig=%4
set _next_fig=%5

set _cup_width=%_cup:~0,2%
set _cup_height=%_cup:~2,2%
set _fig_width=%_cur_fig:~0,1%
set _fig_height=%_cur_fig:~1,1%

for /l %%i in (1,1,%_fig_height%) do (
    set /a "before=4 + %_cup_width% * (%_fig_y% + %%i - 1) + %_fig_x%"
    set /a "figline=2 + %_fig_width% * (%%i - 1)"
    set /a "after=%_cup_width% * (%_cup_height% - %_fig_y% - %%i) + %_cup_width% - %_fig_x% - %_fig_width%"
    call :slice !_cup! 0 !before! str_before
    call :slice %_cur_fig% !figline! %_fig_width% str_figline
    call :slice !_cup! -!after! !after! str_after
    set _cup=!str_before!!str_figline!!str_after!
)

:: DEBUG
:: echo %_cup%
:: echo %_fig_x%, %_fig_y%
:: echo _cup_width=%_cup_width%
:: echo _cup_height=%_cup_height%
:: echo _fig_width=%_fig_width%
:: echo _fig_height=%_fig_height%

set brik=X
set "void= "
set _cup=%_cup:1=!brik!%
set _cup=%_cup:0=!void!%

cls
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

:slice
set str=%1
set a=%2
set b=%3
set %4=!str:~%a%,%b%!
exit /b 0
