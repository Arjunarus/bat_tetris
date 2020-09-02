@echo off
setlocal EnableDelayedExpansion
call imports.cmd

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
        %call_function% "get_key swadq" key_pressed
        if "%key_pressed%"=="Q" exit /b 0
        if "%key_pressed%"=="W" %call_function% "rotate %cur_fig% 1" cur_fig
        if "%key_pressed%"=="A" set /a fig_x=%fig_x% - 1
        if "%key_pressed%"=="S" set /a fig_y=%fig_y% + 1
        if "%key_pressed%"=="D" set /a fig_x=%fig_x% + 1
        
        call render.cmd %cup% %fig_x% %fig_y% %cur_fig% %next_fig%
    goto :fall_loop

REM generate cup
REM loop:
    REM generate figure
    
    REM loop:
        REM get key
        REM move figure
        REM if bottom break
    REM remove full lines
