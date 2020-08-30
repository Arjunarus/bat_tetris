set /A level=%level%+1
set function_%level%=%~1
set result_name_%level%=%2

set res_%level%=NONE

for /F %%i in ('cmd /v:on /c !function_%level%!') do set res_%level%=%%i
set !result_name_%level%!=!res_%level%!

:: Deinitialize variables
set function_%level%=
set result_name_%level%=
set res_%level%=
set /A level=%level%-1
exit /B 0
