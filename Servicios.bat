@echo off
@shift
Setlocal EnableDelayedExpansion
REM Colores
set cnegron=[30m
set crojo=[31m
set cverde=[32m
set camarillo=[33m
set cazul=[34m
set clila=[35m
set ccyan=[36m
set cblancop=[37m
 
set fnegro=[90m
set frojo=[91m
set fverde=[92m
set famarillo=[93m
set fazul=[94m
set flila=[95m
set fcyan=[96m
set fblanco=[97m

echo %camarillo% Comprobando conectividad ... %fblanco%
ping -n 1 8.8.8.8

if %ERRORLEVEL%==0 ( 
set wifi=true
goto CheckForUpdates
) else ( 
set wifi=false
goto sinconexioni
) 


:CheckForUpdates
set Version=1.0
set Versiontwo=%Version%
if exist "%ruta%\Updater.bat" DEL /S /Q /F "%ruta%\Updater.bat" >nul 2>&1
"%SystemRoot%\System32\curl.exe" -g -L -# -o "%ruta%\Updater.bat" "https://raw.githubusercontent.com/JuanElBueno/Mecha/main/Update" >nul 2>&1
call "%ruta%\Updater.bat"
if "%Versiontwo%" gtr "%Version%" (
	cls
	echo.
	echo %camarillo% --------------------------------------------------------------
	echo                           Update found
	echo %camarillo% --------------------------------------------------------------
	echo.
	echo %camarillo%                         Mi version: %Versiontwo%
	echo.
	echo %camarillo%                         Nueva version: %Version%
	echo.
	echo.
	echo.
	echo %camarillo%     [Y] Yes, Update
	echo %camarillo%     [N] No
	echo.
	"%SystemRoot%\System32\choice.exe" /c:YN /n /m "%DEL%                                >:"
	set "choice=!errorlevel!"
	if !choice! == 1 (
		"%SystemRoot%\System32\curl.exe" -L -o %USERPROFILE%\Desktop\Servicios.bat "" >nul 2>&1
		call %USERPROFILE%\Desktop\Servicios.bat
		exit /b
	)
)

:home
echo %camarillo% [+] Desavilitando servicios...
echo %fblanco%
net stop XblAuthManager
net stop MapsBroker
net stop Spooler
net stop diagsvc
net stop SCPolicySvc
net stop DiagTrack
sc config "XblAuthManager" start= disabled
sc config "MapsBroker" start= disabled
sc config "Spooler" start= disabled
sc config "DiagTrack" start= disabled

echo %fblanco%[+] Ha se a desavilitado servicios...

exit /b
:sinconexioni
echo %Yellow%
cls
echo =================================================
echo.
echo = %Red%No tienes internet vuelve intentalo mas tarde%Yellow% =
echo.
echo =================================================
timeout /T 5 >nul
goto home
