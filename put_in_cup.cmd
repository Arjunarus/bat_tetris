:: Strange bug, need echo off to fix
@echo off
setlocal
set cup=%1
set fig=%2
set fig_x=%3
set fig_y=%4
set res=%5

set cup_width=%cup:~0,2%
set cup_height=%cup:~2,2%
set fig_width=%fig:~0,1%
set fig_height=%fig:~1,1%

for /l %%i in (1,1,%fig_height%) do (
    set /a "before=4 + %cup_width% * (%fig_y% + %%i - 1) + %fig_x%"
    set /a "figline=2 + %fig_width% * (%%i - 1)"
    set /a "after=%cup_width% * (%cup_height% - %fig_y% - %%i) + %cup_width% - %fig_x% - %fig_width%"
    call :slice !cup! 0 !before! str_before
    call :slice !cup! !before! %fig_width% str_cup_figline
    call :slice %fig% !figline! %fig_width% str_figline
    call :slice !cup! -!after! !after! str_after
    
    set "str_cup_figline=!str_cup_figline!0"
    set "str_figline=!str_figline!0"
    set str_union=
    set char=
    for /l %%j in (0,1,%fig_width%) do (
        set str_union=!str_union!!char!
        set /a char=!str_figline:~%%j,1! + !str_cup_figline:~%%j,1!
    )
    
    set cup=!str_before!!str_union!!str_after!
)

endlocal & set %5=%cup%

exit /b 0

:slice
set str=%1
set a=%2
set b=%3
set %4=!str:~%a%,%b%!
exit /b 0

:union
setlocal
set str1=%1
set str2=%2
set res_name=%3

set res=
set i=0
set c=%str:~!i!,1%
for /l %%j in (1,1,%fig_width%) do (
    set /a char=!str_figline:~%%j,1! + !str_cup_figline:~%%j,1!
    set str_union=!str_union!!char!
)

endlocal & set %res_name%=%res%
exit /b 0