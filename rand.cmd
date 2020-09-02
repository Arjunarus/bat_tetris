set /a from=%1
set /a to=%2
set /a "_rand=%random%*(%to%-%from%)/32768+%from%"
echo %_rand%
