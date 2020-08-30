@set keys=%1
@choice /c %keys% /n /t 1 /d %keys:~0,1%
@exit /B 0
