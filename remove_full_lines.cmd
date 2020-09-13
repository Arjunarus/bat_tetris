setlocal
set cup=%1
set cup_res=%2
set lines_res=%3

set _cwidth=%cup:~0,2%
set /a _cheight=%cup:~2,2%
set _onlycup=%cup:~4%
set /a size=_cwidth * _cheight

set lines=0
for /l %%i in (2,1,%_cheight%) do (
    set /a "line_start=_cwidth * (%%i-2)"
    call :slice %_onlycup% !line_start! !_cwidth! line
    if "!line!"=="!line:0=!" (
        call :slice !_onlycup! 0 !line_start! before
        set line=
        for /L %%j in (3,1,%_cwidth%) do set line=!line!0
        set line=1!line!1
        set /a line_end=line_start + _cwidth
        call :slice !_onlycup! !line_end! !size! after
        set _onlycup=!line!!before!!after!
        set /a lines+=1
    )
)

endlocal & set %cup_res%=%_cwidth%%_cheight%%_onlycup% & set %lines_res%=%lines%

exit /b 0

:slice
set str=%1
set a=%2
set b=%3
set %4=!str:~%a%,%b%!
exit /b 0
