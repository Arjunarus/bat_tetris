set function=%1
set result_name=%2

set res=NONE
for /F %%i in ('cmd /c %function%') do set res=%%i
set %result_name%=%res%

exit /B 0
