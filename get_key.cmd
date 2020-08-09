@set mode=on
@echo > NUL
@if not %errorlevel%==0 set mode=off
@echo off

choice /C zwasdq /n /t 1 /d z
exit /B 0

@echo %mode%
