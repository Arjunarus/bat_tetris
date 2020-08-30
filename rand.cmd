set /a from=%1 + 1
set /a to=%2 + 1
set /a _rand=(%random%*%to%/32768)+%from%-1
echo %_rand%
