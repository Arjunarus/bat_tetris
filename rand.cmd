set /a from=%1
set /a to=%2
set /a "%3=%random%*(%to%-%from%)/32768+%from%"
