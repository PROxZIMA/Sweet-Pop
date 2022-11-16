@echo off

cd %TEMP%

set "VERSION=3.2.0"
set "FILENAME=Sweet-Pop-%VERSION%.tar.gz"
set "FOLDERPATH=Sweet-Pop-master"

if exist "%FOLDERPATH%"\* (
    rd /s /q %FOLDERPATH%
)

curl -LJo %FILENAME% https://github.com/PROxZIMA/Sweet-Pop/archive/refs/heads/master.tar.gz

tar -xvf %FILENAME%

del %FILENAME%

call "%FOLDERPATH%\programs\install.bat" %*

if exist "%FOLDERPATH%"\* (
    rd /s /q %FOLDERPATH%
)

exit \B
