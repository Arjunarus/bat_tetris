set /a width=%1%%100
set /a height=%2%%100

set _cup=%width%
if %_cup% LSS 10 set _cup=0%_cup%
if %height% LSS 10 (set _cup=%_cup%0%height%) else (set _cup=%_cup%%height%)

for /L %%i in (1,1,%height%) do (
    for /L %%j in (1,1,%width%) do (
        set _cup=!_cup!0
    )
)
echo %_cup%
