:s
cls
@echo off
setlocal enabledelayedexpansion
set m=O
set cp=1
set n=0
rem // Loop for filling the square variables //
:b
set /a n=%n%+1
set a%n%=Û
set /a i=%n% %% 3
if %i%==0 echo ÛÛÛ
if %n%==9 goto c
goto b
:c
echo It's P%cp%'s choice:
rem // prompts user for choice between 1-9 //
choice /c 123456789
set p=%errorlevel%
rem // put x/o in square if empty //
if !a%p%!==Û (set a%p%=%m%) else goto c
cls
rem // print out the square variables //
echo %a1%%a2%%a3%
echo %a4%%a5%%a6%
echo %a7%%a8%%a9%

rem // call the checking function for each possible win combination //
call :l 1, 2, 3
call :l 4, 5, 6
call :l 7, 8, 9
call :l 1, 4, 7
call :l 2, 5, 8
call :l 3, 6, 9
call :l 1, 5, 9
call :l 7, 5, 3

rem // switch the current player around, X becomes O //
if %cp%==1 set cp=2& set m=X& goto c
if %cp%==2 set cp=1& set m=O
goto c

:w
rem // win section //
echo P%cp% wins.
pause
goto s

:l
if !a%~1!==%m% if !a%~2!==%m% if !a%~3!==%m% goto w
goto :eof
