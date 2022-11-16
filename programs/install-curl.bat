@echo off

cd %TEMP%

set "VERSION=3.2.0"
set "FILENAME=Sweet-Pop-%VERSION%.tar.gz"
set "FOLDERPATH=Sweet-Pop-master"

if exist "%FOLDERPATH%"\* (
    rd /s /q %FOLDERPATH%
)

curl -LJo %FILENAME% https://github.com/PROxZIMA/Sweet-Pop/archive/refs/heads/master.tar.gz || (echo Failed to fetch Sweet_Pop^! theme && echo Exiting... && goto :eof)

tar -xvf %FILENAME% || echo.

del %FILENAME%

call "%FOLDERPATH%\programs\install.bat" %*

REM if exist "%FOLDERPATH%"\* (
REM     rd /s /q %FOLDERPATH%
REM )

REM exit \B
