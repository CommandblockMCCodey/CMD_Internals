@echo off
setlocal enabledelayedexpansion

echo CommandblockMC Coding [Version 10.2.5]
echo (c) CommandblockMC Coding Corporation. All rights reserved.
echo.
:start
set /p userInput=CMD_Internals.

if "!userInput!" equ "Functions." (
    set /p userInput2=CMD_Internals.Functions.
    if "!userInput2!" equ "" (
        echo ERROR
        echo ERROR >> DATA.log
        pause
        goto start
    ) else if "!userInput2!" equ "RRUN" (
        set /p "setCommand=set_command: "
        set /p "setRuns=set_runs: "
        for /l %%i in (1, 1, !setRuns!) do (
            !setCommand!
        )
        pause
        goto start
    ) else if "!userInput2!" equ "SET_VAR" (
        set /p "varName=set_var: "
        echo current value:
        echo !%varName%!
        echo.
        set /p "%varName%=set_value: "
        pause
        goto start
    ) else if "!userInput2!" equ "CRASH" (
        echo Do you really want to continue?
        echo     [J/N]
        set /p "continueCrash=CMD_Internals.Functions.CRASH#"
        if /i "!continueCrash!" equ "N" (
            echo abort CRASH
            pause
            goto start
        ) else if /i "!continueCrash!" equ "J" (
            timeout 10
            shutdown /s /f /t 0
        )
    ) else if "!userInput2!" equ "HELP" (
        echo Functions:
        echo RRUN  SET_VAR  CRASH  HELP
        pause
        goto start
    ) else (
        echo Invalid input for Functions.
        pause
        goto start
    )
)

if "!userInput!" equ "Tools." (
    set /p userInput2=CMD_Internals.Tools.
    if "!userInput2!" equ "" (
        echo ERROR
        pause
        goto start
    ) else if "!userInput2!" equ "DIR" (
        dir /all
        for /f "delims=" %%a in ('dir /a') do (
            set "dirOutput=!dirOutput!%%a\n"
        )
        pause
        goto start
    ) else if "!userInput2!" equ "WHOIS" (
        set /p "domain=set_domain: "
        nslookup !domain!
        pause
        goto start
    ) else if "!userInput2!" equ "IPCONFIG" (
        ipconfig /all
        for /f "delims=" %%a in ('ipconfig') do (
            set "ipconfigOutput=!ipconfigOutput!%%a\n"
        )
        pause
        goto start
    ) else if "!userInput2!" equ "HELP" (
        echo Tools:
        echo DIR  IPCONFIG WHOIS  HELP
        pause
        goto start
    ) else (
        echo Invalid input for Tools.
        pause
        goto start
    )
)

if "!userInput!" equ "HELP" (
    echo CMD_Internals:
    echo Functions.
    echo Tools.
)

goto start
endlocal
