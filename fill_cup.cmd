:: Strange bug, need echo off to fix
@echo off

set cup=%1
set fig=%2
set fig_x=%3
set fig_y=%4

set cup_width=%cup:~0,2%
set cup_height=%cup:~2,2%
set fig_width=%fig:~0,1%
set fig_height=%fig:~1,1%

for /l %%i in (1,1,%fig_height%) do (
    set /a "before=4 + %cup_width% * (%fig_y% + %%i - 1) + %fig_x%"
    set /a "figline=2 + %fig_width% * (%%i - 1)"
    set /a "after=%cup_width% * (%cup_height% - %fig_y% - %%i) + %cup_width% - %fig_x% - %fig_width%"
    call :slice !cup! 0 !before! str_before
    call :slice %fig% !figline! %fig_width% str_figline
    call :slice !cup! -!after! !after! str_after
    set cup=!str_before!!str_figline!!str_after!
)

echo %cup%

exit /b 0

:slice
set str=%1
set a=%2
set b=%3
set %4=!str:~%a%,%b%!
exit /b 0
