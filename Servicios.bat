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
set ruta=C:\Juanelbuenocopiadelosarcivos
set rar=%ruta%\rar
set optimizacion=%ruta%\optimizacion
set zip="C:\Program Files\7-Zip\7z.exe"
set titulo1=Juan El Bueno
set modo=off

echo %camarillo% Comprobando conectividad ... %fblanco%
ping -n 1 juanelbueno.github.io 

if %ERRORLEVEL%==0 ( 
set wifi=true
goto CheckForUpdates
) else ( 
set wifi=false
goto sinconexioni
) 


:CheckForUpdates
set Version=1.71.5
set Versiontwo=%Version%
IF NOT EXIST "%ruta%" md "%ruta%"
if exist "%ruta%\Updater.bat" DEL /S /Q /F "%ruta%\Updater.bat" >nul 2>&1
"%SystemRoot%\System32\curl.exe" -g -L -# -o "%ruta%\Updater.bat" "https://raw.githubusercontent.com/JuanElBueno/Mecha/main/Update" >nul 2>&1
call "%ruta%\Updater.bat"
if "%Version%" gtr "%Versiontwo%" (
	cls
	echo.
	echo %camarillo% --------------------------------------------------------------
	echo                           Actualizacion Encontrada
	echo %camarillo% --------------------------------------------------------------
	echo.
	echo %camarillo%                         Mi version: %Versiontwo%
	echo.
	echo %camarillo%                         Nueva version: %Version%
	echo.
	echo.
	echo.
	echo %camarillo%     [Y] SI, Quiero Actualizacion
	echo %camarillo%     [N] No
	echo.
	"%SystemRoot%\System32\choice.exe" /c:YN /n /m "%DEL%                                >:"
	set "choice=!errorlevel!"
	if !choice! == 1 (
		"%SystemRoot%\System32\curl.exe" -L -o %USERPROFILE%\Desktop\Servicios.bat "https://raw.githubusercontent.com/JuanElBueno/Mecha/main/Servicios.bat" >nul 2>&1
		call %USERPROFILE%\Desktop\Servicios.bat
		exit /b
	)
)

:titulot
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
  set Titulo=%titulo1% %Versiontwo% %sinconexiona% (32 bits)
  title %Titulo%
) else (
  set Titulo=%titulo1% %Versiontwo% %sinconexiona% (64 bits)
  title %Titulo%
)

:menu                                                    
echo %fblanco%
	cls
	echo ==================================================
	echo =                       MENU                     =
	echo ==================================================
	echo * 1) Servicios                                   *
	echo * 2) Caracteriticas de windos 10                 *	
	echo * 3) Intenet CrymiCK + Comando timer             *
	echo ==================================================
		set /p var=Seleccione una opcion [1-4]: 
		if "%var%"=="1" goto menuser
		if "%var%"=="2" goto carat
		if "%var%"=="3" goto optimizacionmecha
		if "%var%"=="4" goto intenet
		if "%modo%"=="on" (
		) else (
		echo [+] No disponible modo %modo%...
		timeout /T 6 >nul
		goto error
		)
		
:error
cls
echo %camarillo%==================================================
echo.
echo %camarillo%*        OPCION SELECCIONADA NO VALIDA!          *
echo.
echo %camarillo%==================================================
timeout /T 5 >nul
goto menu

:menuser
	cls
	echo ==================================================
	echo =                       MENU                     =
	echo ==================================================
	echo * 1) Servicios OFF                                  *
	echo * 2) Servicios ON                                  *
	echo ==================================================
		set /p var=Seleccione una opcion [1-2]: 
		if "%var%"=="1" goto comandos1
		if "%var%"=="2" goto comandos10
		) else (
		echo [+] No disponible modo %modo%...
		timeout /T 6 >nul
		goto menu 
		)

:comandos1
set /p varst1=Si quieres activar Xbox Services y/n:

if "%varst1%"=="y" (
net start XblGameSave
sc config XblGameSave start= auto

net start XboxNetApiSvc
sc config XboxNetApiSvc start= auto

net start XboxGipSvc
sc config XboxGipSvc start= auto

net start XblAuthManager
sc config XboxGipSvc start= auto
goto stservicios
)

if "%varst1%"=="n" (
net stop XblGameSave
sc config XblGameSave start= disabled

net stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

net stop XboxGipSvc
sc config XboxGipSvc start= disabled

net stop XblAuthManager
sc config XboxGipSvc start= disabled
goto stservicios
)

:stservicios
echo %camarillo% [+] Desavilitando servicios...
echo %fblanco%
timeout /T 5 >nul

net stop RasAuto

net stop RasMan

net stop SEMgrSvc

net stop stisvc

net stop AarSvc_4fc44

net stop lmhosts

net stop iphlpsvc

net stop PeerDistSvc

net stop Spooler

net stop SessionEnv

net stop WpcMonSvc

net stop DialogBlockingService

net stop RemoteAccess

net stop LanmanWorkstation

net stop PrintNotify

net stop Fax

net stop MsKeyboardFilter

net stop GraphicsPerfSvc

net stop ssh-agent

net stop Wecsvc

net stop RemoteRegistry

net stop PcaSvc

net stop FontCache

net stop bthserv

net stop SensorDataService

net stop dmwappushservice

net stop ScDeviceEnum

net stop lfsvc

net stop TabletInputService

net stop SensorService

net stop SensrSvc

net stop NetTcpPortSharing

net stop wisvc

net stop WerSvc

net stop PhoneSvc

net stop TermService

net stop shpamsvc

net stop SysMain

net stop SCardSvr

net stop TapiSrv

net stop Themes

net stop RpcLocator

net stop FontCache3.0.0.0

net stop WSearch

net stop SCPolicySvc

net stop autotimesvc

net stop MixedRealityOpenXRSvc

sc config RasAuto start= disabled

sc config RasMan start= disabled

sc config SEMgrSvc start= disabled

sc config stisvc start= disabled

sc config AarSvc_4fc44 start= disabled

sc config lmhosts start= disabled

sc config iphlpsvc start= disabled

sc config PeerDistSvc start= disabled

sc config Spooler start= disabled

sc config SessionEnv start= disabled

sc config WpcMonSvc start= disabled

sc config DialogBlockingService start= disabled

sc config RemoteAccess start= disabled

sc config LanmanWorkstation start= disabled

sc config PrintNotify start= disabled

sc config Fax start= disabled

sc config MsKeyboardFilter start= disabled

sc config GraphicsPerfSvc start= disabled

sc config Wecsvc start= disabled

sc config RemoteRegistry start= disabled

sc config PcaSvc start= disabled

sc config FontCache start= disabled

sc config bthserv start= disabled

sc config SensorDataService start= disabled

sc config dmwappushservice start= disabled

sc config ScDeviceEnum start= disabled

sc config lfsvc start= disabled

sc config TabletInputService start= disabled

sc config SensorService start= disabled

sc config SensrSvc start= disabled

sc config NetTcpPortSharing start= disabled

sc config wisvc start= disabled

sc config WerSvc start= disabled

sc config PhoneSvc start= disabled

sc config TermService start= disabled

sc config shpamsvc start= disabled

sc config SysMain start= disabled

sc config SCardSvr start= disabled

sc config TapiSrv start= disabled

sc config Themes start= disabled

sc config RpcLocator start= disabled

sc config FontCache3.0.0.0 start= disabled

sc config WSearch start= disabled

sc config SCPolicySvc start= disabled

sc config autotimesvc start= disabled

sc config MixedRealityOpenXRSvc start= disabled

echo %fverde%[+] Ha se a desavilitado servicios...
timeout /T 10 >nul

goto menu

:comandos10
set /p varst1=Si quieres activar Xbox Services y/n:

if "%varst1%"=="y" (
net start XblGameSave
sc config XblGameSave start= auto

net start XboxNetApiSvc
sc config XboxNetApiSvc start= auto

net start XboxGipSvc
sc config XboxGipSvc start= auto

net start XblAuthManager
sc config XboxGipSvc start= auto
goto stservicios2
)

if "%varst1%"=="n" (
net start XblGameSave
sc config XblGameSave start= disabled

net start XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

net start XboxGipSvc
sc config XboxGipSvc start= disabled

net start XblAuthManager
sc config XboxGipSvc start= disabled
goto stservicios2
)

:stservicios2
net start RasAuto

net start RasMan

net start SEMgrSvc

net start stisvc

net start AarSvc_4fc44

net start lmhosts

net start iphlpsvc

net start PeerDistSvc

net start Spooler

net start SessionEnv

net start WpcMonSvc

net start DialogBlockingService

net start RemoteAccess

net start LanmanWorkstation

net start PrintNotify

net start Fax

net start MsKeyboardFilter

net start GraphicsPerfSvc

net start ssh-agent

net start Wecsvc

net start RemoteRegistry

net start PcaSvc

net start FontCache

net start bthserv

net start SensorDataService

net start dmwappushservice

net start ScDeviceEnum

net start lfsvc

net start TabletInputService

net start SensorService

net start SensrSvc

net start NetTcpPortSharing

net start wisvc

net start WerSvc

net start PhoneSvc

net start TermService

net start shpamsvc

net start SysMain

net start SCardSvr

net start TapiSrv

net start Themes

net start RpcLocator

net start FontCache3.0.0.0

net start WSearch

net start SCPolicySvc

net start autotimesvc

net start MixedRealityOpenXRSvc

sc config RasAuto start= auto

sc config RasMan start= auto

sc config SEMgrSvc start= auto

sc config stisvc start= auto

sc config AarSvc_4fc44 start= auto

sc config lmhosts start= auto

sc config iphlpsvc start= auto

sc config PeerDistSvc start= auto

sc config Spooler start= auto

sc config SessionEnv start= auto

sc config WpcMonSvc start= auto

sc config DialogBlockingService start= auto

sc config RemoteAccess start= auto

sc config LanmanWorkstation start= auto

sc config PrintNotify start= auto

sc config Fax start= auto

sc config MsKeyboardFilter start= auto

sc config GraphicsPerfSvc start= auto

sc config ssh-agent start= auto

sc config Wecsvc start= auto

sc config RemoteRegistry start= auto

sc config PcaSvc start= auto

sc config FontCache start= auto

sc config bthserv start= auto

sc config SensorDataService start= auto

sc config dmwappushservice start= auto

sc config ScDeviceEnum start= auto

sc config lfsvc start= auto

sc config TabletInputService start= auto

sc config SensorService start= auto

sc config SensrSvc start= auto

sc config NetTcpPortSharing start= auto

sc config wisvc start= auto

sc config WerSvc start= auto

sc config PhoneSvc start= auto

sc config TermService start= auto

sc config shpamsvc start= auto

sc config SysMain start= auto

sc config SCardSvr start= auto

sc config TapiSrv start= auto

sc config Themes start= auto

sc config RpcLocator start= auto

sc config FontCache3.0.0.0 start= auto

sc config WSearch start= auto

sc config SCPolicySvc start= auto

sc config autotimesvc start= auto


echo %fverde%[+] Ha se a activado servicios...
timeout /T 10 >nul
goto menu

:carat
powershell.exe Disable-WindowsOptionalFeature -FeatureName "Internet-Explorer-Optional-amd64" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "Printing-Foundation-InternetPrinting-Client" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "Printing-Foundation-Features" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "WorkFolders-Client" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "MSRDC-Infrastructure" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "SearchEngine-Client-Package" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "Printing-XPSServices-Features" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "Printing-PrintToPDFServices-Features" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "SmbDirect" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "WindowsMediaPlayer" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "MediaPlayback" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "WCF-TCP-PortSharing45" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "WCF-Services45" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "DirectPlay" -Online -NoRestart

powershell.exe Disable-WindowsOptionalFeature -FeatureName "LegacyComponents" -Online -NoRestart

echo %camarillo% [+] Desavilitando Caracteriticas de Windows...
echo %camarillo% [+] Tienes que reiniciar para que funcione
pause
goto menu

:intenet
bcdedit /set useplatformtick yes
ipconfig /flushdns
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh winsock reset
Echo %cverde% The services has been disabled. %fblanco%
timeout /T 5 >nul
goto menu

:sinconexioni
set sinconexiona=No tienes internet
echo %Yellow%
cls
echo =================================================
echo.
echo = %Red%No tienes internet vuelve intentalo mas tarde%Yellow% =
echo.
echo =================================================
timeout /T 5 >nul
goto menu
