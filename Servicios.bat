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
set Version=1.73.1
set Versiontwo=%Version%
IF NOT EXIST "%ruta%" md "%ruta%"
if exist "%ruta%\Updater.bat" DEL /S /Q /F "%ruta%\Updater.bat" >nul 2>&1
"%SystemRoot%\System32\curl.exe" -g -L -# -o "%ruta%\Updater.bat" "https://raw.githubusercontent.com/JuanElBueno/Mecha/main/Update" >nul 2>&1
call "%ruta%\Updater.bat"
if "%Version%" gtr "%Versiontwo%" (
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
		"%SystemRoot%\System32\curl.exe" -L -o %USERPROFILE%\Desktop\Servicios.bat "https://raw.githubusercontent.com/JuanElBueno/Mecha/main/Servicios.bat" >nul 2>&1
		call %USERPROFILE%\Desktop\Servicios.bat
		exit /b
	)
)


if "%PROCESSOR_ARCHITECTURE%"=="x86" (
  set Titulo=%titulo1% %Versiontwo% (32 bits)
) else (
  set Titulo=%titulo1% %Versiontwo%  (64 bits)
)

:menu                                                    
echo %fblanco%
	cls
	echo ==================================================
	echo =                       MENU                     =
	echo ==================================================
	echo * 1) Servicios                                   *
	echo * 2) Caracteriticas de windos 10                 *	
	echo * 3) Optimizazion completa                       *
	echo * 4) Intenet CrymiCK + Comando timer             *
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

:comando10
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
sc config XblGameSave start= auto

net start XboxNetApiSvc
sc config XboxNetApiSvc start= auto

net start XboxGipSvc
sc config XboxGipSvc start= auto

net start XblAuthManager
sc config XboxGipSvc start= auto
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

:optimizacionmecha

IF EXIST %zip% (
echo %cverde%[+]Progama Istalado Exitosa 7zip & timeout /T 5 >nul
goto Inicio
) else if "%wifi%"=="true" (
echo %crojo%[+]Programas Necesarios 7zip & timeout /T 5 >nul
goto desrar
) else (
echo %camarillo%[+]Estas sin conexion de internet & timeout /T 5 >nul
goto Inicio
)

:desrar
if exist %zip% (
goto Inicio
) else if "%wifi%"=="true" (
cd %optimizacion%
powershell -command iwr 'https://www.7-zip.org/a/7z2201-x64.exe' -OutFile 'zip.exe'
zip.exe /S /D="C:\Program Files\7-Zip"
goto Inicio
)

:Inicio
echo %fblanco%
IF NOT EXIST "%rar%" md "%rar%"
IF NOT EXIST "%optimizacion%" md "%optimizacion%"

REM cd %optimizacion%
REM powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.4/64/wget.exe' -OutFile 'wget.exe' 
REM pause

cd %rar%
if exist Optimizaciones.y.Input.Delay.rar (
goto op1
) else (
wget Optimizaciones.y.Input.Delay.rar https://github.com/JuanElBueno/Mecha/releases/download/1.70/Optimizaciones.y.Input.Delay.rar
%zip% x %rar%\Optimizaciones.y.Input.Delay.rar -o%optimizacion% -y
goto op1
)
cls

:op1
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Boost de fps\Boost de rendimiento"
cmd /c "Bajar Latencia de PC.REG"
cmd /c "Configuraciones de rendimiento de graficos ( CPU y GPU ).reg"
cmd /c "Deshabilitar modo hibernacion.reg"
cmd /c "DNS.reg"
cmd /c "Mejorar configuracion de Internet.reg"
echo %cverde%[+]Boost de rendimiento HECHO & timeout /T 5 >nul

:op2
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Boost de fps\Juegos"
cmd /c "Elimina delay de Mouse.reg"
cmd /c "Programacion de juegos de rendimiento.reg"
cmd /c "Steam.reg"

bcdedit /deletevalue nx

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Version" /t REG_SZ /d "1.0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Application Name" /t REG_SZ /d "fortnite.exe" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Protocol" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "DSCP Value" /t REG_SZ /d "46" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Throttle Rate" /t REG_SZ /d "-1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Version" /t REG_SZ /d "1.0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Application Name" /t REG_SZ /d "Fortnite-Win64-Shipping.exe" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Protocol" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "DSCP Value" /t REG_SZ /d "46" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\FORTNITE" /v "Throttle Rate" /t REG_SZ /d "-1" /f

:op3
[{000214A0-0000-0000-C000-000000000046}]
Prop3=19,0
[InternetShortcut]
IDList=
URL=ms-settings:signinoptions

@echo Rebuild Performance Counters 1
lodctr /r
@echo
@echo Rebuild Performance Counters 2
lodctr /r
@echo
pause
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Carpeta de Rendimiento Ju Ya\Configuraciones de Windows"
cmd /c "9. Configuraciones internas de Windows.reg"

:op4
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Carpeta de Rendimiento Ju Ya\Editor del registro"
cmd /c "Deshabilita Superfetch (Mejora el delay).reg"
cmd /c "Mejora la frecuencia maxima de tu procesador.reg"
cmd /c "Mejora prioridad de juegos.reg"
cmd /c "Obten el mejor plan de energia.reg"


:op5
Retch ( RMTweaks ) Cache Cleaner Bat
color b
/s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
cls 
FOR /F "tokens=1, 2 * " %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F " tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo Event Logs have been cleared! ^<press any key^>
goto theEnd
:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof
:noAdmin
echo You must run this script as an Administrator ! Retch ( RMTweaks ) Cache Cleaner Bat
echo ^<press any key^>
cls
pause


:op6
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnablePreemption" /t REG_DWORD /d "0" /f

:op7
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
netsh interface tcp set heuristics disabled


Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
ipconfig /flushdns

:op8
del *.log /a /s /q /f

:op9
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\m-oa-d Ping & FPS Boost-20240222T205936Z-001\m-oa-d Ping & FPS Boost\5 Registry Tweak"
cmd /c "Decrease Delay.reg"
cmd /c "DisablePageCombining.REG"
cmd /c "DmaRemapping.reg"
cmd /c "FULLTWEAK.reg"
cmd /c "High Priority Fortnite.reg"
cmd /c "keyboard.tweak.reg"
cmd /c "Large system cache.reg"
cmd /c "LowLatencyScaling.reg"
cmd /c "nvidia.reg"
cmd /c "Optimize ALL Windows Settings.reg"

cmd /c "OPTIONAL Disable Bluetooth Services.reg"
cmd /c "OPTIONAL Disable Download Maps Manager.reg"
cmd /c "OPTIONAL Disable Printer Services.reg"
cmd /c "Prioritys.reg"
cmd /c "Registry Tweaks.reg"
cmd /c "Transactional Synchronization Extensions.reg"
cmd /c "USB Suspend Disable.reg"
cmd /c ""
cmd /c ""
cmd /c ""

:op10
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\m-oa-d Ping & FPS Boost-20240222T205936Z-001\m-oa-d Ping & FPS Boost\9 HZ-Refresh Rate"
cmd /c "165Hz.reg"
:op11
for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" -ot reg -actn setowner -ownr "n:Administrators"
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full"
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 00000000 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 00000000 /f
)
for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)
echo Disabling Process Mitigation
timeout 2 >nul
powershell set-ProcessMitigation -System -Disable  DEP, EmulateAtlThunks, SEHOP, ForceRelocateImages, RequireInfo, BottomUp, HighEntropy, StrictHandle, DisableWin32kSystemCalls, AuditSystemCall, DisableExtensionPoints, BlockDynamicCode, AllowThreadsToOptOut, AuditDynamicCode, CFG, SuppressExports, StrictCFG, AuditMicrosoftSigned, AuditStoreSigned, DisableNonSystemFonts, AuditFont, BlockRemoteImageLoads, BlockLowLabelImageLoads, PreferSystem32, AuditRemoteImageLoads, AuditLowLabelImageLoads, AuditPreferSystem32, EnableExportAddressFilter, AuditEnableExportAddressFilter, EnableExportAddressFilterPlus, AuditEnableExportAddressFilterPlus, EnableImportAddressFilter, AuditEnableImportAddressFilter, EnableRopStackPivot, AuditEnableRopStackPivot, EnableRopCallerCheck, AuditEnableRopCallerCheck, EnableRopSimExec, AuditEnableRopSimExec, SEHOP, AuditSEHOP, SEHOPTelemetry, TerminateOnError, DisallowChildProcessCreation, AuditChildProcess
echo Process Mitigation Sucessfully Disabled!
pause       

echo off
color F0
title Disable Unnecessary Services By EverythingTech
mode con: cols=72 lines=21
cls

rem **This is a start menu designed to inform the user whether they would like to continue or not.**
:start
echo Batch script created by EverythingTech!
timeout 2 > nul
echo I am not responsible for damages/issues caused by this file or guide.
echo Are you sure you want to continue?
set /p a=
if "%a%" == "yes" goto :choice


rem **This is a choice system created to tell you possible choices, these values can be changed but may cause undesired results in their current setup**
:choice
cls
echo Basic Disabler (Type in "basic", "standard", or "advanced")
echo Revert Changes (Type in "revert")
echo More Info (Type in "basicinfo", "standardinfo", or "advancedinfo".)
echo Which one would you like to choose?
set /p a=
if "%a%" == "basic" goto :basic
if "%a%" == "standard" goto :standard
if "%a%" == "advanced" goto :advanced
if "%a%" == "revert" goto :revert
if "%a%" == "basicinfo" goto :basicinfo
if "%a%" == "standardinfo" goto :basicinfo
if "%a%" == "advancedinfo" goto :basicinfo


rem **This is placed in front to make sure if misspelled, it will redirect you instead of running the service disabler**
:misspell
cls
echo Misspell detected!
timeout 2 > nul
echo Redirecting back to choices.
timeout 2 > nul
goto :choice


rem **This is the basic service disabler entry**
:basic
cls 
sc stop DoSvc > nul
sc config DoSvc start= disabled > nul

sc stop diagsvc > nul
sc config diagsvc start= disabled > nul

sc stop DPS > nul 
sc config DPS start= disabled > nul

sc stop dmwappushservice > nul
sc config dmwappushservice start= disabled > nul

sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

sc stop lfsvc > nul
sc config lfsvc start= disabled > nul

sc stop CscService > nul
sc config CscService start= disabled > nul
 
sc stop SEMgrSvc > nul
sc config SEMgrSvc start= disabled > nul

sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

sc stop RemoteRegistry > nul
sc config RemoteRegistry start= disabled > nul

sc stop RetailDemo > nul
sc config RetailDemo start= disabled > nul

sc stop WalletService > nul
sc config WalletService start= disabled > nul

sc stop WSearch > nul
sc config WSearch start= disabled > nul

sc stop W32Time > nul
sc config W32Time start= disabled > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

rem **This is the standard service disabler entry**
:standard
cls
sc stop AJRouter > nul
sc config AJRouter start= disabled > nul

sc stop tzautoupdate > nul
sc config tzautoupdate start= disabled > nul

sc stop BITS > nul
sc config BITS start= disabled > nul

sc stop DiagTrack > nul
sc config DiagTrack start= disabled > nul
 
sc stop CDPSvc > nul
sc config CDPSvc start= disabled > nul

sc stop DusmSvc > nul
sc config DusmSvc start= disabled > nul

sc stop DoSvc > nul
sc config DoSvc start= disabled > nul

sc stop diagsvc > nul
sc config diagsvc start= disabled > nul

sc stop DPS > nul
sc config DPS start= disabled > nul

sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

sc stop WdiSystemHost > nul
sc config WdiSystemHost start= disabled > nul

sc stop dmwappushservice > nul
sc config dmwappushservice start= disabled > nul

sc stop DisplayEnhancementService > nul
sc config DisplayEnhancementService start= disabled > nul

sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

sc stop fhsvc > nul
sc config fhsvc start= disabled > nul

sc stop lfsvc > nul
sc config lfsvc start= disabled > nul

sc stop HomeGroupListener > nul
sc config HomeGroupListener start= disabled > nul

sc stop HomeGroupProvider > nul
sc config HomeGroupProvider start= disabled > nul

sc stop SmsRouter > nul
sc config SmsRouter start= disabled > nul

sc stop CscService > nul
sc config CscService start= disabled > nul

sc stop SEMgrSvc > nul
sc config SEMgrSvc start= disabled > nul

sc stop pla > nul
sc config pla start= disabled > nul

sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

sc stop WpcMonSvc > nul
sc config WpcMonSvc start= disabled > nul

sc stop RasAuto > nul
sc config RasAuto start= disabled > nul

sc stop RasMan > nul
sc config RasMan start= disabled > nul 

sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul
 
sc stop RpcLocator > nul
sc config RpcLocator start= disabled > nul

sc stop RemoteRegistry > nul
sc config RemoteRegistry start= disabled > nul
 
sc stop RetailDemo > nul
sc config RetailDemo start= disabled > nul

sc stop WalletService > nul
sc config WalletService start= disabled > nul

sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

sc stop WSearch > nul
sc config WSearch start= disabled > nul
 
sc stop W32Time > nul 
sc config W32Time start= disabled > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f > nul



rem **This is the advanced service disabler entry**
:advanced
cls
sc stop AJRouter > nul
sc config AJRouter start= disabled > nul

sc stop AppXSvc > nul
sc config AppXSvc start= disabled > nul

sc stop ALG > nul
sc config ALG start= disabled > nul

sc stop AppMgmt > nul
sc config AppMgmt start= disabled > nul

sc stop tzautoupdate > nul
sc config tzautoupdate start= disabled > nul

sc stop AssignedAccessManagerSvc > nul 
sc config AssignedAccessManagerSvc start= disabled > nul

sc stop BITS > nul
sc config BITS start= disabled > nul

sc stop BDESVC > nul
sc config BDESVC start= disabled > nul

sc stop wbengine > nul
sc config wbengine start= disabled > nul

sc stop BTAGService > nul
sc config BTAGService start= disabled > nul

sc stop bthserv > nul
sc config bthserv start= disabled > nul

sc stop BthHFSrv > nul
sc config BthHFSrv start= disabled > nul

sc stop PeerDistSvc > nul
sc config PeerDistSvc start= disabled > nul

sc stop CertPropSvc > nul 
sc config CertPropSvc start= disabled > nul

sc stop ClipSVC > nul
sc config ClipSVC start= disabled > nul

sc stop DiagTrack > nul
sc config DiagTrack start= disabled > nul

sc stop VaultSvc > nul
sc config VaultSvc start= disabled > nul

sc stop CDPSvc > nul 
sc config CDPSvc start= disabled > nul 

sc stop DusmSvc > nul
sc config DusmSvc start= disabled > nul
 
sc stop DoSvc > nul
sc config DoSvc start= disabled > nul

sc stop diagsvc > nul
sc config diagsvc start= disabled > nul

sc stop DPS > nul
sc config DPS start= disabled > nul

sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

sc stop WdiSystemHost > nul
sc config WdiSystemHost start= disabled > nul

sc stop TrkWks > nul
sc config TrkWks start= disabled > nul

sc stop MSDTC > nul
sc config MSDTC start= disabled > nul

sc stop dmwappushservice > nul 
sc config dmwappushservice start= disabled > nul

sc stop DisplayEnhancementService > nul
sc config DisplayEnhancementService start= disabled > nul

sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

sc stop fdPHost > nul
sc config fdPHost start= disabled > nul

sc stop FDResPub > nul
sc config FDResPub start= disabled > nul

sc stop EFS > nul
sc config EFS start= disabled > nul

sc stop EntAppSvc > nul
sc config EntAppSvc start= disabled > nul

sc stop fhsvc > nul
sc config fhsvc start= disabled > nul

sc stop lfsvc > nul
sc config lfsvc start= disabled > nul

sc stop HomeGroupListener > nul
sc config HomeGroupListener start= disabled > nul

sc stop HomeGroupProvider > nul
sc config HomeGroupProvider start= disabled > nul

sc stop HvHost > nul
sc config HvHost start= disabled > nul

sc stop hns > nul
sc config hns start= disabled > nul

sc stop vmickvpexchange > nul
sc config vmickvpexchange start= disabled > nul

sc stop vmicguestinterface > nul
sc config vmicguestinterface start= disabled > nul

sc stop vmicshutdown > nul
sc config vmicshutdown start= disabled > nul

sc stop vmicheartbeat > nul
sc config vmicheartbeat start= disabled > nul

sc stop vmicvmsession > nul
sc config vmicvmsession start= disabled > nul
 
sc stop vmicrdv > nul
sc config vmicrdv start= disabled > nul

sc stop vmictimesync > nul
sc config vmictimesync start= disabled > nul

sc stop vmicvss > nul
sc config vmicvss start= disabled > nul

sc stop IEEtwCollectorService > nul
sc config IEEtwCollectorService start= disabled > nul

sc stop iphlpsvc > nul
sc config iphlpsvc start= disabled > nul 

sc stop IpxlatCfgSvc > nul
sc config IpxlatCfgSvc start= disabled > nul
 
sc stop PolicyAgent > nul
sc config PolicyAgent start= disabled > nul

sc stop irmon > nul
sc config irmon start= disabled > nul

sc stop SharedAccess > nul
sc config SharedAccess start= disabled > nul

sc stop lltdsvc > nul
sc config lltdsvc start= disabled > nul

sc stop diagnosticshub.standardcollector.service > nul
sc config diagnosticshub.standardcollector.service start= disabled > nul

sc stop wlidsvc > nul
sc config wlidsvc start= disabled > nul

sc stop AppVClient > nul
sc config AppVClient start= disabled > nul

sc stop smphost > nul
sc config smphost start= disabled > nul

sc stop InstallService > nul
sc config InstallService start= disabled > nul
  
sc stop SmsRouter > nul
sc config SmsRouter start= disabled > nul

sc stop MSiSCSI > nul
sc config MSiSCSI start= disabled > nul

sc stop NaturalAuthentication > nul
sc config NaturalAuthentication start= disabled > nul

sc stop CscService > nul
sc config CscService start= disabled > nul

sc stop defragsvc > nul
sc config defragsvc start= disabled > nul

sc stop SEMgrSvc > nul
sc config SEMgrSvc start= disabled > nul

sc stop PNRPsvc > nul
sc config PNRPsvc start= disabled > nul

sc stop p2psvc > nul
sc config p2psvc start= disabled > nul

sc stop p2pimsvc > nul
sc config p2pimsvc start= disabled > nul

sc stop pla > nul
sc config pla start= disabled > nul

sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

sc stop WPDBusEnum > nul
sc config WPDBusEnum start= disabled > nul

sc stop Spooler > nul
sc config Spooler start= disabled > nul

sc stop PrintNotify > nul
sc config PrintNotify start= disabled > nul

sc stop PcaSvc > nul
sc config PcaSvc start= disabled > nul

sc stop WpcMonSvc > nul
sc config WpcMonSvc start= disabled > nul

sc stop QWAVE > nul
sc config QWAVE start= disabled > nul

sc stop RasAuto > nul
sc config RasAuto start= disabled > nul
 
sc stop RasMan > nul
sc config RasMan start= disabled > nul

sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul

sc stop UmRdpService > nul 
sc config UmRdpService start= disabled > nul

sc stop RpcLocator > nul
sc config RpcLocator start= disabled > nul

sc stop RemoteRegistry > nul
sc config RemoteRegistry start= disabled > nul

sc stop RetailDemo > nul
sc config RetailDemo start= disabled > nul

sc stop RemoteAccess > nul
sc config RemoteAccess start= disabled > nul
 
sc stop RmSvc > nul 
sc config RmSvc start= disabled > nul

sc stop SNMPTRAP > nul
sc config SNMPTRAP start= disabled > nul

sc stop seclogon > nul
sc config seclogon start= disabled > nul

sc stop wscsvc > nul
sc config wscsvc start= disabled > nul

sc stop SamSs > nul
sc config SamSs start= disabled > nul

sc stop SensorDataService > nul
sc config SensorDataService start= disabled > nul

sc stop SensrSvc > nul
sc config SensrSvc start= disabled > nul

sc stop SensorService > nul
sc config SensorService start= disabled > nul

sc stop LanmanServer > nul
sc config LanmanServer start= disabled > nul

sc stop shpamsvc > nul
sc config shpamsvc start= disabled > nul

sc stop ShellHWDetection > nul
sc config ShellHWDetection start= disabled > nul

sc stop SCardSvr > nul
sc config SCardSvr start= disabled > nul

sc stop ScDeviceEnum > nul
sc config ScDeviceEnum start= disabled > nul

sc stop SCPolicySvc > nul
sc config SCPolicySvc start= disabled > nul

sc stop SharedRealitySvc > nul
sc config SharedRealitySvc start= disabled > nul

sc stop StorSvc > nul
sc config StorSvc start= disabled > nul

sc stop TieringEngineService > nul
sc config TieringEngineService start= disabled > nul

sc stop SgrmBroker > nul
sc config SgrmBroker start= disabled > nul

sc stop lmhosts > nul
sc config lmhosts start= disabled > nul

sc stop TapiSrv > nul
sc config TapiSrv start= disabled > nul

sc stop Themes > nul
sc config Themes start= disabled > nul

sc stop tiledatamodelsvc > nul
sc config tiledatamodelsvc start= disabled > nul

sc stop TabletInputService > nul
sc config TabletInputService start= disabled > nul

sc stop UsoSvc > nul
sc config UsoSvc start= disabled > nul

sc stop UevAgentService > nul
sc config UevAgentService start= disabled > nul

sc stop WalletService > nul
sc config WalletService start= disabled > nul

sc stop wmiApSrv > nul
sc config wmiApSrv start= disabled > nul

sc stop TokenBroker > nul
sc config TokenBroker start= disabled > nul

sc stop WebClient > nul
sc config WebClient start= disabled > nul

sc stop WFDSConMgrSvc > nul
sc config WFDSConMgrSvc start= disabled > nul

sc stop SDRSVC > nul
sc config SDRSVC start= disabled > nul
 
sc stop WbioSrvc > nul
sc config WbioSrvc start= disabled > nul

sc stop FrameServer > nul
sc config FrameServer start= disabled > nul
 
sc stop wcncsvc > nul
sc config wcncsvc start= disabled > nul

sc stop Sense > nul
sc config Sense start= disabled > nul

sc stop WdNisSvc > nul
sc config WdNisSvc start= disabled > nul

sc stop WinDefend > nul
sc config WinDefend start= disabled > nul

sc stop SecurityHealthService > nul
sc config SecurityHealthService start= disabled > nul

sc stop WEPHOSTSVC > nul
sc config WEPHOSTSVC start= disabled > nul

sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

sc stop Wecsvc > nul
sc config Wecsvc start= disabled > nul

sc stop FontCache > nul
sc config FontCache start= disabled > nul

sc stop StiSvc > nul
sc config StiSvc start= disabled > nul

sc stop wisvc > nul
sc config wisvc start= disabled > nul

sc stop LicenseManager > nul
sc config LicenseManager start= disabled > nul

sc stop icssvc > nul
sc config icssvc start= disabled > nul

sc stop WMPNetworkSvc > nul
sc config WMPNetworkSvc start= disabled > nul

sc stop FontCache3.0.0.0 > nul
sc config FontCache3.0.0.0 start= disabled > nul

sc stop WpnService > nul
sc config WpnService start= disabled > nul

sc stop perceptionsimulation > nul
sc config perceptionsimulation start= disabled > nul

sc stop spectrum > nul 
sc config spectrum start= disabled > nul
 
sc stop WinRM > nul
sc config WinRM start= disabled > nul

sc stop WSearch > nul
sc config WSearch start= disabled > nul

sc stop SecurityHealthService > nul
sc config SecurityHealthService start= disabled > nul

sc stop W32Time > nul
sc config W32Time start= disabled > nul

sc stop wuauserv > nul
sc config wuauserv start= disabled > nul

sc stop WaaSMedicSvc > nul
sc config WaaSMedicSvc start= disabled > nul

sc stop LanmanWorkstation > nul
sc config LanmanWorkstation start= disabled > nul
  
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v Start /t REG_DWORD /d 00000004 /f > nul 

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\OneSyncSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

rem **This is the service revert entry**
:revert
cls
sc config AJRouter start= demand > nul

sc config AppXSvc start= demand > nul

sc config ALG start= demand > nul

sc config AppMgmt start= demand > nul
 
sc config AppReadiness start= demand > nul

sc config tzautoupdate start= demand > nul
 
sc config AssignedAccessManagerSvc start= demand > nul

sc config BITS start= delayed-auto > nul

sc config BDESVC start= demand > nul

sc config wbengine start= demand > nul

sc config BTAGService start= demand > nul

sc config bthserv start= demand > nul
 
sc config BthHFSrv start= demand > nul

sc config PeerDistSvc start= demand > nul

sc config CertPropSvc start= demand > nul

sc config ClipSVC start= demand > nul

sc config DiagTrack start= auto > nul

sc config VaultSvc start= auto > nul

sc config CDPSvc start= demand > nul

sc config DusmSvc start= auto > nul

sc config DoSvc start= delayed-auto > nul

sc config diagsvc start= demand > nul

sc config DPS start= auto > nul

sc config WdiServiceHost start= demand > nul

sc config WdiSystemHost start= demand > nul

sc config TrkWks start= auto > nul

sc config MSDTC start= demand > nul

sc config dmwappushservice start= demand > nul

sc config DisplayEnhancementService start= demand > nul

sc config MapsBroker start= delayed-auto > nul

sc config fdPHost start= demand > nul

sc config FDResPub start= demand > nul

sc config EFS start= demand > nul

sc config EntAppSvc start= demand > nul

sc config fhsvc start= demand > nul

sc config lfsvc start= demand > nul

sc config GraphicsPerfSvc start= demand > nul

sc config HomeGroupListener start= demand > nul

sc config HomeGroupProvider start= demand > nul

sc config HvHost start= demand > nul

sc config hns start= demand > nul

sc config vmickvpexchange start= demand > nul

sc config vmicguestinterface start= demand > nul

sc config vmicshutdown start= demand > nul

sc config vmicheartbeat start= demand > nul

sc config vmicvmsession start= demand > nul

sc config vmicrdv start= demand > nul

sc config vmictimesync start= demand > nul

sc config vmicvss start= demand > nul

sc config IEEtwCollectorService start= demand > nul

sc config lltdsvc start= demand > nul

sc config iphlpsvc start= auto > nul

sc config IpxlatCfgSvc start= demand > nul

sc config PolicyAgent start= demand > nul

sc config irmon start= demand > nul

sc config SharedAccess start= demand > nul

sc config diagnosticshub.standardcollector.service start= demand > nul

sc config wlidsvc start= demand > nul

sc config AppVClient start= demand > nul

sc config NgcSvc start= demand > nul
 
sc config NgcCtnrSvc start= demand > nul

sc config smphost start= demand > nul

sc config InstallService start= demand > nul

sc config SmsRouter start= demand > nul

sc config MSiSCSI start= demand > nul

sc config NaturalAuthentication start= demand > nul

sc config NetTcpPortSharing start= demand > nul
  
sc config Netlogon start= demand > nul

sc config NcdAutoSetup start= demand > nul

sc config NcbService start= auto > nul

sc config NcaSvc start= demand > nul

sc config CscService start= demand > nul

sc config defragsvc start= demand > nul

sc config SEMgrSvc start= demand > nul

sc config PNRPsvc start= demand > nul

sc config p2psvc start= demand > nul

sc config p2pimsvc start= demand > nul

sc config pla start= demand > nul

sc config PhoneSvc start= demand > nul

sc config WPDBusEnum start= demand > nul

sc config Spooler start= auto > nul

sc config PrintNotify start= demand > nul

sc config PcaSvc start= auto > nul

sc config WpcMonSvc start= demand > nul

sc config QWAVE start= demand > nul

sc config RasAuto start= demand > nul

sc config RasMan start= demand > nul

sc config SessionEnv start= demand > nul

sc config TermService start= demand > nul

sc config UmRdpService start= demand > nul

sc config RpcLocator start= auto > nul

sc config RemoteRegistry start= demand > nul

sc config RetailDemo start= demand > nul

sc config RemoteAccess start= demand > nul

sc config RmSvc start= demand > nul

sc config SNMPTRAP start= demand > nul

sc config seclogon start= demand > nul

sc config wscsvc start= delayed-auto > nul

sc config SamSs start= demand > nul

sc config SensorDataService start= demand > nul

sc config SensrSvc start= demand > nul

sc config SensorService start= demand > nul

sc config LanmanServer start= auto > nul

sc config shpamsvc start= demand > nul
 
sc config ShellHWDetection start= auto > nul

sc config SCardSvr start= demand > nul

sc config ScDeviceEnum start= demand > nul

sc config SCPolicySvc start= demand > nul

sc config SharedRealitySvc start= demand > nul

sc config StorSvc start= demand > nul

sc config TieringEngineService start= demand > nul

sc config SysMain start= auto > nul

sc config SgrmBroker start= delayed-auto > nul

sc config lmhosts start= auto > nul

sc config TapiSrv start= demand > nul

sc config Themes start= auto> nul

sc config tiledatamodelsvc start= auto > nul

sc config TabletInputService start= demand > nul

sc config UsoSvc start= demand > nul

sc config UevAgentService start= demand > nul

sc config WalletService start= demand > nul

sc config wmiApSrv start= demand > nul

sc config WwanSvc start= demand > nul

sc config TokenBroker start= demand > nul

sc config WebClient start= demand > nul

sc config WFDSConMgrSvc start= demand > nul

sc config SDRSVC start= demand > nul

sc config WbioSrvc start= auto > nul

sc config FrameServer start= demand > nul

sc config wcncsvc start= demand > nul

sc config Sense start= demand > nul

sc config WdNisSvc start= demand > nul

sc config WinDefend start= auto > nul

sc config SecurityHealthService start= auto > nul

sc config WEPHOSTSVC start= demand > nul

sc config WerSvc start= demand > nul

sc config Wecsvc start= demand > nul

sc config FontCache start= auto > nul

sc config StiSvc start= delayed-auto > nul

sc config wisvc start= demand > nul

sc config LicenseManager start= demand > nul

sc config icssvc start= demand > nul

sc config WMPNetworkSvc start= demand > nul

sc config FontCache3.0.0.0 start= auto > nul

sc config WpnService start= auto > nul

sc config perceptionsimulation start= demand > nul

sc config spectrum start= demand > nul

sc config WinRM start= demand > nul

sc config WSearch start= delayed-auto > nul

sc config SecurityHealthService start= auto > nul
 
sc config W32Time start= demand > nul

sc config wuauserv start= demand > nul

sc config WaaSMedicSvc start= demand > nul

sc config LanmanWorkstation start= auto > nul

sc config WlanSvc start= auto > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\OneSyncSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d 00000002 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000002 /f > nul


rem **This is the Basic options info entry**
:basicinfo
cls
echo Disables 5-8 services, keeps most like Gamebar, Printer, etc.
echo Recommended for regular users.
timeout 3 > nul
echo.
echo Would you like to choose this option?
set /p a=
if "%a%" == "yes" goto :basic
if "%a%" == "no" goto :choice


rem **This is placed in front to make sure if misspelled, it will redirect you instead of running the service disabler**
:misspell
cls
echo Misspell detected!
timeout 2 > nul
echo Redirecting back to info.
timeout 2 > nul
goto :basicinfo


rem **This is the Standard options info entry**
:standardinfo
cls
echo Disables 12-18 services, keeps essential services only like Windows Update, AppX support, etc.
echo Recommended for light tweakers or gamers.
timeout 3 > nul
echo.
echo Would you like to choose this option?
set /p a=
if "%a%" == "yes" goto :standard
if "%a%" == "no" goto :choice


rem **This is placed in front to make sure if misspelled, it will redirect you instead of running the service disabler**
:misspell
cls
echo Misspell detected!
timeout 2 > nul
echo Redirecting back to info.
timeout 2 > nul
goto :standardinfo


rem **This is the Advanced options info entry**
:advancedinfo
cls
echo Disables 16-30 services, keeps only vital services like DWM, Power, etc.
echo Recommended for aggressive tweakers or hardcore gamers.
timeout 3 > nul
echo.
echo Would you like to choose this option?
set /p a=
if "%a%" == "yes" goto :advanced
if "%a%" == "no" goto :choice


rem **This is placed in front to make sure if misspelled, it will redirect you instead of running the service disabler**
:misspell
cls
echo Misspell detected!
timeout 2 > nul
echo Redirecting back to info.
timeout 2 > nul
goto :advancedinfo

REM Disable USB idling
FOR /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "EnhancedPowerManagementEnabled" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "AllowIdleIrpInD3" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendOn" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "DeviceSelectiveSuspended" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendEnabled" /T REG_DWORD /d 0 >NUL 2>&1
        REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "IdleInWorkingState" /T REG_DWORD /d 0 >NUL 2>&1
	ECHO Disabling USB idling for %%a
)

echo Disable Dynamic Tick
echo Disable High Precision Event Timer (HPET)
echo Disable Synthetic Timers
@echo
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ConvertibleSlateMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLua" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_SZ /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowSharedUserAppData" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTaskOffload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ConvertibleSlateMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLua" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_SZ /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowSharedUserAppData" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTaskOffload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f

RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y
cd/
@echo
del *.log /a /s /q /f
echo Batch File By Adamx
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

:op12
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Optimizacion 2023\Optimizacion 2023\2.OPTIMIZAR RAM"
cmd /c "16GB RAM.reg"

:op13
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\Optimizacion 2023\Optimizacion 2023\3.BOOST +200fps"
cmd /c "1. Optimizaciones de la CPU.reg"
cmd /c "2. Deshabilitar Sincronización.reg"
cmd /c "3. Deshabilitar Telemetria.reg"
cmd /c "4 Desabilitar UAC.reg"
cmd /c "4. Priorizar juegos.reg"

echo Batch File By Adamx
taskkill -F -FI "IMAGENAME eq SystemSettings.exe"
net stop wuauserv
net stop UsoSvc
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
gpupdate /force
echo Deleting Windows Update Files
rd s q "C:\Windows\SoftwareDistribution"
md "C:\Windows\SoftwareDistribution"
net start wuauserv
net start UsoSvc
echo Windows Updates Are Successfully Disabled!



cmd /c "5. Deshabilitar las actualizaciones drivers.reg"
cmd /c "6. Deshabilitar Bloatware (apps no deseadas).reg"
cmd /c "7. Deshabiliatr apps en segundo plano.reg"
cmd /c "8. Deshabilitar Transparencia.reg"
cmd /c "9. Deshabilitar optimizaciones de pantalla completa.reg"
cmd /c "10. Deshabilitar limitación de energía.reg"
cmd /c "11. Desactivar Game DVR.reg"
cmd /c "12. Mejor Respuesta.reg"
cmd /c "14. Optimizar TODAS las configuraciones de Windows.reg"
cmd /c "15. Valorant Prioridad Alta.reg"
cmd /c "16. Pantalla Completa Fix.reg"
cmd /c "Deshabilitar la limitación de potencia.reg"
cmd /c "Deshabilitar servicios adicionales innecesarios.reg"
cmd /c "OPCIONAL Desactivar la descarga del administrador de mapas.reg"
cmd /c "Reparación de ratón Windows 10.reg"

:op14
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\2 Ajustes de potencia"
cmd /c "3 Disable Power Throttling.reg"
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\3 Ajustes de GPU\NVIDIA"
cmd /c "9 Disable preemption.reg"
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\4 Inputlag"
cmd /c "Reducir InputLag.reg"

:op15
call :checkPermissions
call :xHybrid en Youtube!
echo Press any key to clean cache...
pause > nul
cls

rd /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

:checkPermissions
fsutil dirty query %systemdrive% >nul
if %errorLevel% NEQ 0 (
	echo Try again as Administrator.
	echo.
	echo Press any key to exit...
	pause > nul
	goto menu
)

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:op16
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
del *.log /a /s /q /f
RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp

DEL /S /Q "%TMP%\*.*"
DEL /S /Q "%TEMP%\*.*"
DEL /S /Q "%WINDIR%\Temp\*.*"
DEL /S /Q "%USERPROFILE%\Local Settings\Temp\*.*"
DEL /S /Q "%LOCALAPPDATA%\Temp\*.*"

PowerShell Clear-RecycleBin -Confirm:$false

cd/
del *.log /a /s /q /f
net stop wuauserv
net stop UsoSvc
net stop bits
net stop dosvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\6 Registry & BCD Tweaks"
cmd /c "2 Tweaks del registro.reg"

cd C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\7 Mejoras para periféricos y rendimiento
cmd /c "2 Mejor Respuesta.reg"

cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\7 Mejoras para periféricos y rendimiento\1 Tweaks Perifericos\Mouse"
cmd /c "Optimización de mouse.reg"

cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\7 Mejoras para periféricos y rendimiento\1 Tweaks Perifericos\Mando"
cmd /c ""
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\8 Ping"
cmd /c "1 Mejor PING.BAT"
cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023\10 Servicios innecesarios"
cmd /c "Disable Diagnostics & Telemetry Services.reg"
cmd /c "Disable Extra Unnecessary Services.reg"
cmd /c "OPTIONAL Disable Bluetooth Services.reg"
cmd /c "OPTIONAL Disable Download Maps Manager.reg"
cmd /c "OPTIONAL Disable Printer Services.reg"

cd "C:\Juanelbuenocopiadelosarcivos\optimizacion\Optimizaciones y  Input Delay\xHybrid Boost (4.0) 2023\xHybrid Boost (4.0) 2023"

cmd /c "1 Windows Settings (Registro).reg"
PowerShell "Disable-MMAgent -MemoryCompression"

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
echo %Yellow%
cls
echo =================================================
echo.
echo = %Red%No tienes internet vuelve intentalo mas tarde%Yellow% =
echo.
echo =================================================
timeout /T 5 >nul
goto menu
