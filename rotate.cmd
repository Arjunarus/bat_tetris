set fig=%1
set /a rotate=%2 %% 4
set _r_fig=%fig%

for /l %%i in (1,1,%rotate%) do (
    set width=!fig:~0,1!
    set height=!fig:~1,1!
    set _r_fig=!height!!width!
    
    for /l %%w in (1,1,!width!) do (
        for /l %%h in (!height!,-1,1) do (
            set /a "_x=%%w+1+!width!*(%%h-1)"
            %call_function% "get_i !fig! !_x!" _c
            set _r_fig=!_r_fig!!_c!
        )
    )
    set fig=!_r_fig!
)

echo %fig%
