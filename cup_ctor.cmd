setlocal EnableDelayedExpansion

set /a "width=(%1 + 2)%%100"
set /a "height=(%2 + 1)%%100"

set cup=%width%
if %cup% LSS 10 set cup=0%cup%
if %height% LSS 10 (set cup=%cup%0%height%) else (set cup=%cup%%height%)

set line=1
set floor=
for /L %%j in (1,1,%width%) do (
    set line=!line!0
    set floor=!floor!1
)
set line=%line:~0,-2%1

for /L %%i in (1,1,%height%) do (
    set cup=!cup!!line!
)
call set cup=%%cup:~0,-!width!%%!floor!

echo %cup%
