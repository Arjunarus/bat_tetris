set fig=%1

set width=%fig:~0,1%
set height=%fig:~1,1%
set _m_fig=%width%%height%
for /l %%h in (1,1,%height%) do (
    for /l %%w in (%width%,-1,1) do (
        set /a "_x=%%w+1+%width%*(%%h-1)"
        call echo %%w %%h !_x!
        call set _m_fig=!_m_fig!%%fig:~!_x!,1%%
    )
)
echo %_m_fig%
