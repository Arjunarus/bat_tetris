set _cup=%1
set _fig_x=%2
set _fig_y=%3
set _cur_fig=%4
set _next_fig=%5

cls
set _cup_width=%_cup:~0,2%
set _cup_height=%_cup:~2,2%

for /l %%i in (1,1,%_cup_height%) do (
    set line=
    for /l %%j in (1,1,%_cup_width%) do (
        set /a "_x=%%j+3+%cup_width%*(%%i-1)"
        call set line=!line!%%_cup:~!_x!,1%%
        set line=!line:0=_!
    )
    echo !line!
)
