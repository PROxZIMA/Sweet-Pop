@echo off

call :RequestAdminElevation "%~dpfs0" %* || goto:eof

goto :init

:header
    echo %__NAME% v%__VERSION%
    echo This is a sample batch file to install
    echo Sweet_Pop! theme via Command Line Interface
    echo.
    goto :eof

:usage
    echo USAGE:
    echo   %__NAME% [ options ... ]"
    echo   where options include:
    echo.
    echo.  /b, -b ^<binary_folder^>  (Set custom Firefox binary folder path)
    echo.  /f, -f ^<firefox_folder^> (Set custom Firefox folder path)
    echo.  /p, -p ^<profile_name^>   (Set custom profile name)
    echo.  /e, -e                  (Default Enabled. Install fx-autoconfig - Runs as admin to copy mozilla.cfg and local-settings.js to Application Binary folder)
    echo.  /v, -v, --version       (Show script version)
    echo.  /?, -h                  (Show help message)
    goto :eof

:version
    if "%~1"=="full" call :header & goto :eof
    echo %__VERSION%
    goto :eof

:init
    set "__NAME=%~nx0"
    set "__VERSION=4.0.0"

    for %%a in ("%~dp0.") do set "THEMEDIRECTORY=%%~dpa"

    set "APPLICATIONFOLDER=C:\Program Files\Mozilla Firefox"
    set "FIREFOXFOLDER=%APPDATA%\Mozilla\Firefox"
    set "PROFILENAME="
    set "FXACEXTRAS=yes"
    set "CHROMEFOLDER=chrome"

:parse
    if "%~1"=="" goto :main

    if /i "%~1"=="/?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="-h"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="--help"     call :header & call :usage "%~2" & goto :end

    if /i "%~1"=="/v"         call :version      & goto :end
    if /i "%~1"=="-v"         call :version      & goto :end
    if /i "%~1"=="--version"  call :version full & goto :end

    if /i "%~1"=="/b"         set "APPLICATIONFOLDER=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="-b"         set "APPLICATIONFOLDER=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="/f"         set "FIREFOXFOLDER=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="-f"         set "FIREFOXFOLDER=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="/p"         set "PROFILENAME=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="-p"         set "PROFILENAME=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="/e"         set "FXACEXTRAS="  & shift & goto :parse
    if /i "%~1"=="-e"         set "FXACEXTRAS="  & shift & goto :parse

    shift
    goto :parse

:main
    setlocal enableDelayedExpansion

    REM Check if Firefox profiles.ini is installed or not
    set "PROFILES_FILE=%FIREFOXFOLDER%\profiles.ini"
    if not exist "%PROFILES_FILE%" (
        echo Failed to locate profiles.ini in %FIREFOXFOLDER%
        echo Exiting...
        goto :end
    )
    echo.
    echo Profiles file found...

    for /f "delims=" %%i in ('findstr /rc:"Default=.*" %PROFILES_FILE%') do (
       set "i=%%i"
       set "i=!i:/=\!"
       set "PROFILENAMEDEF=!i:~8!"
       goto :continue
    )
    :continue

    REM Define default Profile folder path else use -p option
    if defined PROFILENAME      set "PROFILEFOLDER=%FIREFOXFOLDER%\%PROFILENAME%"
    if not defined PROFILENAME  set "PROFILEFOLDER=%FIREFOXFOLDER%\%PROFILENAMEDEF%"

    REM Enter Firefox profile folder if it exists
    if not exist "%PROFILEFOLDER%"\* (
        echo Failed to locate Profile folder at %PROFILEFOLDER%
        echo Exiting...
        goto :end
    )

    cd %PROFILEFOLDER%

    REM Copy theme repository inside chrome folder
    echo.
    echo Installing Sweet_Pop^^! in %cd%

    if exist "%CHROMEFOLDER%"\* (
        echo Moving existing %CHROMEFOLDER% to %CHROMEFOLDER%_bak
        move %CHROMEFOLDER% %CHROMEFOLDER%_bak || (echo Rename or move the backup && goto :end)
    )

    mkdir %CHROMEFOLDER%
    cd %CHROMEFOLDER%

    robocopy %THEMEDIRECTORY% %cd% /COPY:DATS /E

    echo.
    echo Setting configuration user.js file...

    if exist ..\user.js (
        echo Moving existing user.js to user.js.bak
        move ..\user.js ..\user.js.bak || (echo Rename or move the user.js file && goto :end)
    )
    mklink ..\user.js "%cd%\programs\user.js"

    REM If FXACEXTRAS extras enabled, install necessary files
    if not defined FXACEXTRAS (
        goto :done
    )

    echo.
    echo Enabling userChrome.js manager (fx-autoconfig)...
    del "utils\boot.jsm"
    curl -sL "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/profile/chrome/utils/boot.jsm" > "utils\boot.jsm" || (echo Failed to fetch fx-autoconfig && echo Exiting... && goto :end)

    echo Enabling Navbar Toolbar Button Slider...
    del "script\navbarToolbarButtonSlider.uc.js"
    curl -sL "https://raw.githubusercontent.com/aminomancer/uc.css.js/master/JS/navbarToolbarButtonSlider.uc.js" > "script\navbarToolbarButtonSlider.uc.js" || (echo Failed to fetch Navbar Toolbar Button Slider && echo Exiting... && goto :end)

    echo.
    echo Copying mozilla.cfg and local-settings.js to %APPLICATIONFOLDER%
    copy .\programs\mozilla.cfg "%APPLICATIONFOLDER%"
    copy .\programs\local-settings.js "%APPLICATIONFOLDER%\defaults\pref\"

    goto :done

:done
    echo.
    echo Done!
    echo Note: Restart twice to apply changes

:end
    call :cleanup
    pause
    exit /B

:cleanup
    REM The cleanup function is only really necessary if you
    REM are _not_ using SETLOCAL.
    set "__NAME="
    set "__VERSION="

    set "THEMEDIRECTORY="
    set "APPLICATIONFOLDER="
    set "FIREFOXFOLDER="
    set "PROFILENAME="
    set "FXACEXTRAS="
    set "CHROMEFOLDER="

    goto :eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:RequestAdminElevation FilePath %* || goto:eof
::
:: By:   Cyberponk,     v1.5 - 10/06/2016 - Changed the admin rights test method from cacls to fltmc
::          v1.4 - 17/05/2016 - Added instructions for arguments with ! char
::          v1.3 - 01/08/2015 - Fixed not returning to original folder after elevation successful
::          v1.2 - 30/07/2015 - Added error message when running from mapped drive
::          v1.1 - 01/06/2015
::
:: Func: opens an admin elevation prompt. If elevated, runs everything after the function call, with elevated rights.
:: Returns: -1 if elevation was requested
::           0 if elevation was successful
::           1 if an error occured
::
:: USAGE:
:: If function is copied to a batch file:
::     call :RequestAdminElevation "%~dpf0" %* || goto:eof
::
:: If called as an external library (from a separate batch file):
::     set "_DeleteOnExit=0" on Options
::     (call :RequestAdminElevation "%~dpf0" %* || goto:eof) && CD /D %CD%
::
:: If called from inside another CALL, you must set "_ThisFile=%~dpf0" at the beginning of the file
::     call :RequestAdminElevation "%_ThisFile%" %* || goto:eof
::
:: If you need to use the ! char in the arguments, the calling must be done like this, and afterwards you must use %args% to get the correct arguments:
::      set "args=%* "
::      call :RequestAdminElevation .....   use one of the above but replace the %* with %args:!={a)%
::      set "args=%args:{a)=!%"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEDELAYEDEXPANSION & set "_FilePath=%~1"
  if NOT EXIST "!_FilePath!" (echo/Read RequestAdminElevation usage information)
  :: UAC.ShellExecute only works with 8.3 filename, so use %~s1
  set "_FN=_%~ns1" & echo/%TEMP%| findstr /C:"(" >nul && (echo/ERROR: %%TEMP%% path can not contain parenthesis &pause &endlocal &fc;: 2>nul & goto:eof)
  :: Remove parenthesis from the temp filename
  set _FN=%_FN:(=%
  set _vbspath="%temp:~%\%_FN:)=%.vbs" & set "_batpath=%temp:~%\%_FN:)=%.bat"

  :: Test if we gave admin rights
  fltmc >nul 2>&1 || goto :_getElevation

  :: Elevation successful
  (if exist %_vbspath% ( del %_vbspath% )) & (if exist %_batpath% ( del %_batpath% ))
  :: Set ERRORLEVEL 0, set original folder and exit
  endlocal & CD /D "%~dp1" & ver >nul & goto:eof

  :_getElevation
  echo/Requesting elevation...
  :: Try to create %_vbspath% file. If failed, exit with ERRORLEVEL 1
  echo/Set UAC = CreateObject^("Shell.Application"^) > %_vbspath% || (echo/&echo/Unable to create %_vbspath% & endlocal &md; 2>nul &goto:eof)
  echo/UAC.ShellExecute "%_batpath%", "", "", "runas", 1 >> %_vbspath% & echo/wscript.Quit(1)>> %_vbspath%
  :: Try to create %_batpath% file. If failed, exit with ERRORLEVEL 1
  echo/@%* > "%_batpath%" || (echo/&echo/Unable to create %_batpath% & endlocal &md; 2>nul &goto:eof)
  echo/@if %%errorlevel%%==9009 (echo/^&echo/Admin user could not read the batch file. If running from a mapped drive or UNC path, check if Admin user can read it.)^&echo/^& @if %%errorlevel%% NEQ 0 pause >> "%_batpath%"

  :: Run %_vbspath%, that calls %_batpath%, that calls the original file
  %_vbspath% && (echo/&echo/Failed to run VBscript %_vbspath% &endlocal &md; 2>nul & goto:eof)

  :: Vbscript has been run, exit with ERRORLEVEL -1
  echo/&echo/Elevation was requested on a new CMD window &endlocal &fc;: 2>nul & goto:eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
