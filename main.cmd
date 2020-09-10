@echo off
setlocal EnableDelayedExpansion
call imports.cmd

echo Initializing...

::::::::::::::::::::::::::::::::::::::::
set cup_width=10
set cup_height=10
::::::::::::::::::::::::::::::::::::::::

%call_function% "cup_ctor %cup_width% %cup_height%" put_cup
%call_function% "fig_ctor R R R" next_fig

:main_loop
    set cup=%put_cup%
    set cur_fig=%next_fig%
    %call_function% "fig_ctor R R R" next_fig
    set /a fig_x=(%cup_width%/2)-2
    set fig_y=0
    
    %call_function% "put_in_cup %cup% %cur_fig% %fig_x% %fig_y%" put_cup

    :fall_loop
        call render.cmd %put_cup% %next_fig%
        
        set rotated=%cur_fig%
        set /a dx=0, dy=0
        %call_function% "get_key swadq" key_pressed
        if "%key_pressed%"=="Q" exit /b 0
        if "%key_pressed%"=="W" %call_function% "rotate %cur_fig% 1" rotated
        if "%key_pressed%"=="A" set dx=-1
        if "%key_pressed%"=="S" set dy=1
        if "%key_pressed%"=="D" set dx=1
        
        set /a "new_fig_x=%fig_x% + (%dx%)"
        set /a "new_fig_y=%fig_y% + (%dy%)"
        
        %call_function% "put_in_cup %cup% %rotated% %new_fig_x% %new_fig_y%" new_put_cup
        
        set _new_put_cup=%new_put_cup:~4%

        :: Check collision
        if "%_new_put_cup:2=%" == "%_new_put_cup%" (
            set fig_x=%new_fig_x%
            set fig_y=%new_fig_y%
            set cur_fig=%rotated%
            set put_cup=%new_put_cup%
        ) else if %new_fig_y% NEQ %fig_y% goto :main_loop
                
    goto :fall_loop

REM generate cup
REM loop:
    REM generate figure
    
    REM loop:
        REM get key
        REM move figure
        REM if bottom break
    REM remove full lines
