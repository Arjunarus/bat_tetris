@echo off
setlocal EnableDelayedExpansion
call imports.cmd

echo Initializing...

::::::::::::::::::::::::::::::::::::::::
set cup_width=10
set cup_height=10
::::::::::::::::::::::::::::::::::::::::

%call_function% "cup_ctor %cup_width% %cup_height%" cup
%call_function% "fig_ctor R R R" next_fig

:main_loop
    set cur_fig=%next_fig%
    %call_function% "fig_ctor R R R" next_fig
    set /a fig_x=(%cup_width%/2)-2
    set fig_y=0

    :fall_loop
        %call_function% "put_in_cup %cup% %cur_fig% %fig_x% %fig_y%" put_cup
        call render.cmd %put_cup% %next_fig%
    
        set dx=0
        set dy=0
        set dr=0
        %call_function% "get_key swadq" key_pressed
        if "%key_pressed%"=="Q" exit /b 0
        if "%key_pressed%"=="W" set dr=1
        if "%key_pressed%"=="A" set dx=-1
        if "%key_pressed%"=="S" set dy=1
        if "%key_pressed%"=="D" set dx=1
        
        :: TODO:
        :: update fig coords
        :: new_cup = cup + figure
        :: collision if 2 in new_cup or border
        :: if not collision render
        :: elif dy != 0 cup=new_cup; break
        :: else dx=0
        
        %call_function% "rotate %cur_fig% %dr%" cur_fig
        set /a "fig_x=%fig_x% + (%dx%)"
        set /a fig_y=%fig_y% + %dy%
        
    goto :fall_loop

REM generate cup
REM loop:
    REM generate figure
    
    REM loop:
        REM get key
        REM move figure
        REM if bottom break
    REM remove full lines
