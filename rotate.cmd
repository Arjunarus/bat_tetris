setlocal EnableDelayedExpansion
set fig=%1
set /a rotate=%2 %% 4
set r_fig=%fig%

for /l %%i in (1,1,%rotate%) do (
    set width=!fig:~0,1!
    set height=!fig:~1,1!
    set r_fig=!height!!width!
    
    for /l %%w in (1,1,!width!) do (
        for /l %%h in (!height!,-1,1) do (
            set /a "_x=%%w+1+!width!*(%%h-1)"
            call :get_i !fig! !_x! _c
            set r_fig=!r_fig!!_c!
        )
    )
    set fig=!r_fig!
)

endlocal & set %3=%fig%
exit /b 0

:get_i
set string=%1
set index=%2

call set %3=%%string:~%index%,1%%
exit /b 0
