setlocal
set char=%~1
set size=%2
set res=%3

set line=
for /L %%j in (1,1,%size%) do (
    set line=!line!%char%
)

endlocal & set %res%=%line%
