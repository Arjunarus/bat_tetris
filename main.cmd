@echo off
setlocal EnableDelayedExpansion
call imports.cmd

echo Initializing...

::::::: Constants ::::::::::::::::::::::
set CUP_WIDTH=10
set CUP_HEIGHT=10
set /a MAX_DX=CUP_WIDTH/3
::::::::::::::::::::::::::::::::::::::::

%call_function% "cup_ctor %CUP_WIDTH% %CUP_HEIGHT%" put_cup
call fig_ctor.cmd next_fig
set score=0

:main_loop
    set cup=%put_cup%
    set cur_fig=%next_fig%
    call fig_ctor next_fig
    
    set /a fig_x=(%CUP_WIDTH%/2)-2
    set fig_y=0
    call put_in_cup.cmd %cup% %cur_fig% %fig_x% %fig_y% put_cup
    set mdx=0

    :fall_loop
        call render.cmd %put_cup% %next_fig% %score%
        
        set /a dx=0, dy=0
        set rotated=%cur_fig%
        %call_function% "get_key swadq" key_pressed
        if "%key_pressed%"=="A" set dx=-1
        if "%key_pressed%"=="S" set dy=1
        if "%key_pressed%"=="D" set dx=1
        if "%key_pressed%"=="W" call rotate.cmd %cur_fig% 1 rotated
        if "%key_pressed%"=="Q" exit /b 0
        
        set abs_dx=%dx:~-1%
        set /a mdx=%mdx%*%abs_dx%+%abs_dx%
        if %mdx% GTR %MAX_DX% set /a mdx=0, dx=0, dy=1
        
        set /a "new_fig_x=%fig_x% + (%dx%)"
        set /a "new_fig_y=%fig_y% + (%dy%)"
        
        call put_in_cup.cmd %cup% %rotated% %new_fig_x% %new_fig_y% new_put_cup
        
        set _new_put_cup=%new_put_cup:~4%

        :: Check collision
        if "%_new_put_cup:2=%" == "%_new_put_cup%" (
            set fig_x=%new_fig_x%
            set fig_y=%new_fig_y%
            set cur_fig=%rotated%
            set put_cup=%new_put_cup%
        ) else if %dy% GTR 0 goto :break
                
    goto :fall_loop

    :break
    if %fig_y% EQU 0 goto :gameover
    
    call remove_full_lines.cmd %put_cup% put_cup lines
    if %lines% GTR 0 set /a "score+=(2*lines-1)*100"
    
goto :main_loop

:gameover
echo ============================
echo          GAME OVER
echo ============================

exit /b 0
