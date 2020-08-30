@echo off
setlocal EnableDelayedExpansion
call imports.cmd

::::::::::::::::::::::::::::::::::::::::
set cup_width=10
set cup_height=20
::::::::::::::::::::::::::::::::::::::::

%call_function% "cup_ctor %cup_width% %cup_height%" cup
%call_function% "fig_ctor %fig_born_x% 0 R R R" next_fig

:main_loop
    set cur_fig=%next_fig%
    %call_function% "fig_ctor R R R" next_fig
    set /a fig_x=(%cup_width%/2)-2
    set fig_y=0
    
    :fall_loop
        %call_function% "get_key zwasdq" key_pressed
        if "%key_pressed%"=="Q" exit /b 0
        echo "%key_pressed% key is pressed"

    goto :fall_loop

REM generate cup
REM loop:
    REM generate figure
    
    REM loop:
        REM get key
        REM move figure
        REM if bottom break
    REM remove full lines
