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
set optimizacion=%ruta%\optimizacion
set zip="%ProgramFiles%\WinRAR\WinRAR.exe"
set microsoft=%optimizacion%\Microsoft-Visual-C++
set descargavisuals=%optimizacion%\Microsoft-Visual-C++.rar
set descargareg=%optimizacion%\reg.rar
set reg=%optimizacion%\reg
set titulo1=Juan El Bueno
set modo=off

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
set Version=1.79.2.9.1
set Versiontwo=%Version%
IF NOT EXIST "%ruta%" md "%ruta%"
IF NOT EXIST "%optimizacion%" md "%optimizacion%"
IF NOT EXIST "%reg%" md "%reg%"
IF NOT EXIST "%microsoft%" md "%microsoft%"
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
if defined PROCESSOR_ARCHITEW6432 (
    rem Sistema operativo de 64 bits (aunque este proceso sea de 32 bits)
    set Titulo=%titulo1% %Versiontwo% %sinconexiona% (64 bits)
) else (
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
        rem Proceso de 64 bits
        set Titulo=%titulo1% %Versiontwo% %sinconexiona% (64 bits)

        rem Sistema operativo de 32 bits
        set Titulo=%titulo1% %Versiontwo% %sinconexiona% (32 bits)
    )
)
title %Titulo%


:menu                                                    
echo %fblanco%
	cls
	echo ==================================================
	echo =                       MENU                     =
	echo ==================================================
	echo * 1) Servicios                                   *
	echo * 2) Caracteriticas de windos 10                 *	
	echo * 3) Reparar Archivos corruptos Windows          *	
	echo * 4) Archivos optimizacion Mecha                 *	
	echo * 5) Intenet CrymiCK + Comando timer             *
	echo ==================================================
		set /p var=Seleccione una opcion [1-4]: 
		if "%var%"=="1" goto menuser
		if "%var%"=="2" goto carat
		if "%var%"=="3" goto reparararchivoscorruptos
		if "%var%"=="4" goto mechaop
		if "%var%"=="5" goto intenet
		if "%modo%"=="on" (
		) else (
		echo [+] No disponible modo Administracion de que a hecho la aplicacion %Titulo1%...
		timeout /T 6 >nul
		goto menu 
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


:mechaop

echo %camarillo% [+] Poniendo todos los Archivos optimizacion & timeout /T 5 >nul
echo %fblanco%

wmic service where name='SysMain'  call ChangeStartmode Disabled
sc stop "SysMain"
wmic service where name='wisvc'  call ChangeStartmode Disabled
sc stop "wisvc"
wmic service where name='icssvc'  call ChangeStartmode Disabled
sc stop "icssvc"
wmic service where name='Fax'  call ChangeStartmode Disabled
sc stop "Fax"
wmic service where name='SessionEnv'  call ChangeStartmode Disabled
sc stop "SessionEnv"
wmic service where name='TermService'  call ChangeStartmode Disabled
sc stop "TermService"
wmic service where name='bthserv'  call ChangeStartmode Disabled
sc stop "bthserv"
wmic service where name='TabletInputService'  call ChangeStartmode Disabled
sc stop "TabletInputService"
wmic service where name='DiagTrack'  call ChangeStartmode Disabled
sc stop "DiagTrack"
wmic service where name='DPS'  call ChangeStartmode Disabled
sc stop "DPS"
wmic service where name='DoSvc'  call ChangeStartmode Disabled
sc stop "DoSvc"
wmic service where name='WpnService'  call ChangeStartmode Disabled
sc stop "WpnService"

echo Disable Dynamic Tick
echo Disable High Precision Event Timer (HPET)
echo Disable Synthetic Timers
@echo
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes

%homedrive%
cd %USERPROFILE%
cd..
set profiles=%cd%

for /f "tokens=* delims= " %%u in ('dir /b/ad') do (

cls
title Deletando %%u COOKIES. . .
if exist "%profiles%%%u\cookies" echo Deletando....
if exist "%profiles%%%u\cookies" cd "%profiles%%%u\cookies"
if exist "%profiles%%%u\cookies" del . /F /S /Q /A: R /A: H /A: A

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%%%u\Local Settings\Temp" echo Deletando....
if exist "%profiles%%%u\Local Settings\Temp" cd "%profiles%%%u\Local Settings\Temp"
if exist "%profiles%%%u\Local Settings\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\Local Settings\Temp" rmdir /s /q "%profiles%%%u\Local Settings\Temp"

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%%%u\AppData\Local\Temp" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Temp" cd "%profiles%%%u\AppData\Local\Temp"
if exist "%profiles%%%u\AppData\Local\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Temp" rmdir /s /q "%profiles%%%u\AppData\Local\Temp"
cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" echo Deletando....
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" cd "%profiles%%%u\Local Settings\Temporary Internet Files"
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" rmdir /s /q "%profiles%%%u\Local Settings\Temporary Internet Files"

cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"

cls
title Deletando %%u WER Files. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"
cls
title Deletando %Systemroot%\Temp
if exist "%Systemroot%\Temp" echo Deletando....
if exist "%Systemroot%\Temp" cd "%Systemroot%\Temp"
if exist "%Systemroot%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%Systemroot%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Deletando %SYSTEMDRIVE%\Temp
if exist "%SYSTEMDRIVE%\Temp" echo Deletando....
if exist "%SYSTEMDRIVE%\Temp" cd "%SYSTEMDRIVE%\Temp"
if exist "%SYSTEMDRIVE%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%SYSTEMDRIVE%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Deletando %%u FIREFOX TEMP. . .
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" cd "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles"
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" rmdir /s /q "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" cd "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"
cls
title Deletando %%u EDGE TEMP. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCache"

cls
title Deletando %%u EDGE COOKIES. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\INetCookies"

cls
title Deletando %%u RDP TEMP. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" cd "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"
if exist "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"
cls
title Deletando %%u OPERA TEMP. . .
if exist "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Cache" cd "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Cache"
if exist "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Caches" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\Opera Software\Opera Next\Cache"


cls
title Deletando %%u VIVALDI TEMP. . .
if exist "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache" cd "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache"
if exist "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\Vivaldi\User Data\Default\Cache"

cls
title Deletando %%u VIVALDI TEMP. . .
if exist "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" cd "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache"
if exist "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache"


title Arquivos Deletados. . .
)

RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y

del *.log /a /s /q /f

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

cd/
del *.log /a /s /q /f

RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp

@echo Rebuild Performance Counters 1
lodctr /r
@echo
@echo Rebuild Performance Counters 2
lodctr /r
@echo

bcdedit -set disabledynamictick yes
bcdedit -set useplatformtick yes

net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

DEL /S /Q "%TMP%\*.*"
DEL /S /Q "%TEMP%\*.*"
DEL /S /Q "%WINDIR%\Temp\*.*"
DEL /S /Q "%USERPROFILE%\Local Settings\Temp\*.*"
DEL /S /Q "%LOCALAPPDATA%\Temp\*.*"

del *.log /a /s /q /f

PowerShell "Disable-MMAgent -MemoryCompression"
PowerShell Clear-RecycleBin -Confirm:$false

PowerShell "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}"

powershell set-ProcessMitigation -System -Disable  DEP, EmulateAtlThunks, SEHOP, ForceRelocateImages, RequireInfo, BottomUp, HighEntropy, StrictHandle, DisableWin32kSystemCalls, AuditSystemCall, DisableExtensionPoints, BlockDynamicCode, AllowThreadsToOptOut, AuditDynamicCode, CFG, SuppressExports, StrictCFG, AuditMicrosoftSigned, AuditStoreSigned, DisableNonSystemFonts, AuditFont, BlockRemoteImageLoads, BlockLowLabelImageLoads, PreferSystem32, AuditRemoteImageLoads, AuditLowLabelImageLoads, AuditPreferSystem32, EnableExportAddressFilter, AuditEnableExportAddressFilter, EnableExportAddressFilterPlus, AuditEnableExportAddressFilterPlus, EnableImportAddressFilter, AuditEnableImportAddressFilter, EnableRopStackPivot, AuditEnableRopStackPivot, EnableRopCallerCheck, AuditEnableRopCallerCheck, EnableRopSimExec, AuditEnableRopSimExec, SEHOP, AuditSEHOP, SEHOPTelemetry, TerminateOnError, DisallowChildProcessCreation, AuditChildProcess
echo Process Mitigation Sucessfully Disabled!

::mejorar el ping
ഊ敀档⁯景൦挊汯牯愠਍਍敀档⁯剆䕅丠呅佗䭒吠䕗䭁൓ഊ刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥呜灣灩卜牥楶散牐癯摩牥•瘯∠汃獡≳⼠⁴䕒彇坄剏⁄搯∠∸⼠൦刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥呜灣灩卜牥楶散牐癯摩牥•瘯∠湄偳楲牯瑩≹⼠⁴䕒彇坄剏⁄搯∠∶⼠൦刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥呜灣灩卜牥楶散牐癯摩牥•瘯∠潈瑳偳楲牯瑩≹⼠⁴䕒彇坄剏⁄搯∠∵⼠൦刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥呜灣灩卜牥楶散牐癯摩牥•瘯∠潌慣偬楲牯瑩≹⼠⁴䕒彇坄剏⁄搯∠∴⼠൦刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥呜灣灩卜牥楶散牐癯摩牥•瘯∠敎扴側楲牯瑩≹⼠⁴䕒彇坄剏⁄搯∠∷⼠൦刊来攮數愠摤∠䭈䵌卜䙏坔剁居楍牣獯景屴卍免停牡浡瑥牥≳⼠⁶吢偃潎敄慬≹⼠⁴䕒彇坄剏⁄搯∠∱⼠൦刊来攮數愠摤∠䭈䵌卜卙䕔屍畃牲湥䍴湯牴汯敓屴敓癲捩獥乜瑥呂•瘯∠瑓牡≴⼠⁴䕒彇坄剏⁄搯∠∴⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶䰢捯污倠牯≴⼠⁴䕒彇婓⼠⁤⨢•是਍敒⹧硥⁥摡⁤䠢䕋彙佌䅃彌䅍䡃义居潓瑦䅗䕒停汯捩敩屳楍牣獯景屴楗摮睯屳潑屓潆瑲楮整•瘯∠牐瑯捯汯•琯删䝅卟⁚搯∠䑕≐⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶刢浥瑯⁥偉•琯删䝅卟⁚搯∠∪⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶刢浥瑯⁥偉倠敲楦⁸敌杮桴•琯删䝅卟⁚搯∠∪⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶刢浥瑯⁥潐瑲•琯删䝅卟⁚搯∠∪⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶琢牨瑯汴⁥慒整•琯删䝅卟⁚搯∠ㄭ•是਍敒⹧硥⁥摡⁤䠢䕋彙佌䅃彌䅍䡃义居潓瑦䅗䕒停汯捩敩屳楍牣獯景屴楗摮睯屳潑屓潆瑲楮整•瘯∠敶獲潩≮⼠⁴䕒彇婓⼠⁤ㄢ〮•是਍敒⹧硥⁥摡⁤䠢䕋彙佌䅃彌䅍䡃义居潓瑦䅗䕒停汯捩敩屳楍牣獯景屴楗摮睯屳潑屓潆瑲楮整•瘯∠灁汰捩瑡潩⁮慎敭•琯删䝅卟⁚搯∠潦瑲楮整汣敩瑮眭湩㐶猭楨灰湩⹧硥≥⼠⁦਍敒⹧硥⁥摡⁤䠢䕋彙佌䅃彌䅍䡃义居潓瑦䅗䕒停汯捩敩屳楍牣獯景屴楗摮睯屳潑屓潆瑲楮整•瘯∠卄偃瘠污敵•琯删䝅卟⁚搯∠㘴•是਍敒⹧硥⁥摡⁤䠢䕋彙佌䅃彌䅍䡃义居潓瑦䅗䕒停汯捩敩屳楍牣獯景屴楗摮睯屳潑屓潆瑲楮整•瘯∠潌慣⁬偉•琯删䝅卟⁚搯∠∪⼠൦刊来攮數愠摤∠䭈奅䱟䍏䱁䵟䍁䥈䕎卜景坴剁居潐楬楣獥䵜捩潲潳瑦坜湩潤獷兜卯䙜牯湴瑩≥⼠⁶䰢捯污䤠⁐牐晥硩䰠湥瑧≨⼠⁴䕒彇婓⼠⁤⨢•是਍਍倠畡敳☠䔠楸൴⤊਍汣൳ഊ瀊畡敳਍

ipconfig /flushdns

powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

cd %reg%
if not exist %zip% (
    echo No tienes WinRAR instalado. Por favor instálalo y vuelve a intentarlo.
    pause
    exit
)

IF EXIST %descargareg% (
echo %cverde%[+] Descargado archivo correctamente & timeout /T 5 >nul
goto descagarreg
) else if "%wifi%"=="true" (
echo %crojo%[+] Programas Necesarios reg.rar & timeout /T 5 >nul
goto descagarreg
) else (
echo %camarillo%[+] Estas sin conexion de internet & timeout /T 5 >nul
goto sinconexioni
)

:descagarreg
if exist %descargareg% (
	echo %fblanco%
    goto instalacionreg
) else if "%wifi%"=="true"  (
	echo %fblanco%
    cd %optimizacion%
    powershell -Command "iwr 'https://github.com/JuanElBueno/Mecha/raw/refs/heads/main/reg.rar' -OutFile '%descargareg%'"
    %zip% x -o+ %descargareg% %reg%
    echo Extraendo archivo correctamente
    goto instalacionreg
)

:instalacionreg
:: Aplicar configuraciones de registro excepto "OPTIONAL Disable Bluetooth Services.reg"
cd %reg%
for %%f in (*.reg) do (
    if /I NOT "%%f"=="OPTIONAL Disable Bluetooth Services.reg" (
        echo Aplicando: %%f
        regedit /s "%%f"
    )
)

cd %reg%
set /p bluetooth=Si quieres activar bluetooth y/n:

if "%bluetooth%"=="y" (
	echo %fblanco%
	regedit /s "OPTIONAL Disable Bluetooth Services.reg"
	goto seguimiento
)

if "%bluetooth%"=="n" (
	echo %fblanco%
	goto seguimiento
)

:seguimiento
for /f %%a in ('wmic cpu get L2CacheSize ^| findstr /r "[0-9][0-9]"') do (
    set /a l2c=%%a
    set /a sum1=%%a
) 
for /f %%a in ('wmic cpu get L3CacheSize ^| findstr /r "[0-9][0-9]"') do (
    set /a l3c=%%a
    set /a sum2=%%a
) 

taskkill /F /FI "IMAGENAME eq SystemSettings.exe"
@echo
net stop wuauserv
net stop UsoSvc
@echo
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
gpupdate /force
@echo
echo Deleting Windows Update Files
rd s q "C:\Windows\SoftwareDistribution"
md "C:\Windows\SoftwareDistribution"
@echo
net start wuauserv
net start UsoSvc
echo Windows Updates Are Successfully Disabled!

net stop wuauserv
net stop UsoSvc
net stop bits
net stop dosvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

reg add "hklm\system\controlset001\control\session manager\memory management" /v "secondleveldatacache" /t reg_dword /d "%sum1%" /f
reg add "hklm\system\controlset001\control\session manager\memory management" /v "thirdleveldatacache" /t reg_dword /d "%sum2%" /f
reg add "hklm\system\controlset001\control\session manager\memory management" /v "pagingfiles" /t reg_multi_sz /d "c:\pagefile.sys 0 0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "contigfileallocsize" /t reg_dword /d "1536" /f
reg add "hklm\system\controlset001\control\filesystem" /v "disabledeletenotification" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "dontverifyrandomdrivers" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "filenamecache" /t reg_dword /d "1024" /f
reg add "hklm\system\controlset001\control\filesystem" /v "longpathsenabled" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsallowextendedcharacter8dot3rename" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsbugcheckoncorrupt" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisable8dot3namecreation" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisablecompression" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisableencryption" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsencryptpagingfile" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsmemoryusage" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsmftzonereservation" /t reg_dword /d "4" /f
reg add "hklm\system\controlset001\control\filesystem" /v "pathcache" /t reg_dword /d "128" /f
reg add "hklm\system\controlset001\control\filesystem" /v "refsdisablelastaccessupdate" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "udfssoftwaredefectmanagement" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "win31filesystem" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "contigfileallocsize" /t reg_dword /d "1536" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "disabledeletenotification" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "dontverifyrandomdrivers" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "filenamecache" /t reg_dword /d "1024" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "longpathsenabled" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsallowextendedcharacter8dot3rename" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsbugcheckoncorrupt" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisable8dot3namecreation" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisablecompression" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisableencryption" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsencryptpagingfile" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsmemoryusage" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsmftzonereservation" /t reg_dword /d "3" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "pathcache" /t reg_dword /d "128" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "refsdisablelastaccessupdate" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "udfssoftwaredefectmanagement" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "win31filesystem" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\executive" /v "additionalcriticalworkerthreads" /t reg_dword /d "00000016" /f
reg add "hklm\system\currentcontrolset\control\session manager\executive" /v "additionaldelayedworkerthreads" /t reg_dword /d "00000016" /f
reg add "hklm\system\currentcontrolset\control\session manager\i/o system" /v "countoperations" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "clearpagefileatshutdown" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "featuresettingsoverride" reg_dword /d "00000003" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "featuresettingsoverridemask" reg_dword /d "00000003" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "iopagelocklimit" /t reg_dword /d "08000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "largesystemcache" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "systempages" /t reg_dword /d "4294967295" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "disablepagingexecutive" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "iopagelocklimit" /t reg_dword /d "16710656" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "largesystemcache" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enableboottrace" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enableprefetcher" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enablesuperfetch" /t reg_dword /d "0" /f
for /f "tokens=2 delims==" %%a in ('wmic os get TotalVisibleMemorySize /format:value') do set mem=%%a
set /a ram=%mem% + 1024000
reg add "hklm\system\currentcontrolset\control" /v "svchostsplitthresholdinkb" /t reg_dword /d "%ram%" /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
netsh interface tcp set heuristics disabled

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f

%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
msg * Memoria limpa

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

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f

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

@echo Link's Optimization Pack
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /d "1" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /d "1" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /d "0" /t REG_DWORD /f
)


FOR /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "EnhancedPowerManagementEnabled" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "AllowIdleIrpInD3" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendOn" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "DeviceSelectiveSuspended" /T REG_DWORD /d 0 >NUL 2>&1
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendEnabled" /T REG_DWORD /d 0 >NUL 2>&1
        REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "IdleInWorkingState" /T REG_DWORD /d 0 >NUL 2>&1
	ECHO Disabling USB idling for %%a
)

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f

:: 3. Visual C++
IF EXIST %descargavisuals% (
echo %cverde%[+] Descargado archivo correctamente & timeout /T 5 >nul
goto descagarvisual
) else if "%wifi%"=="true" (
echo %crojo%[+] Programas Necesarios Microsoft-Visual-C++.zip & timeout /T 5 >nul
goto descagarvisual
) else (
echo %camarillo%[+] Estas sin conexion de internet & timeout /T 5 >nul
goto sinconexioni
)

:descagarvisual
if exist %descargavisuals% (
goto instalacionvisual
) else if "%wifi%"=="true" (
md "%microsoft%"
cd %optimizacion%
powershell -Command "iwr 'https://github.com/JuanElBueno/Mecha/releases/download/1.70/Microsoft-Visual-C++.rar' -OutFile 'Microsoft-Visual-C++.rar'"
%zip% x -o+ %descargavisuals% %microsoft%
echo Extraendo archivo correctamente
goto instalacionvisual
)

:instalacionvisual
if not exist %microsoft% (
    md "%microsoft%"
    %zip% x -o+ %descargavisuals% %microsoft%
)

cd %microsoft%
echo.
echo Microsoft Visual C++ All-In-One Runtimes 
echo.
echo Installing runtime packages...

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

echo Microsoft Visual C++ 2005...
start /wait vcredist2005_x86.exe /q

echo Microsoft Visual C++ 2008...
start /wait vcredist2008_x86.exe /qb

echo Microsoft Visual C++ 2010...
start /wait vcredist2010_x86.exe /passive /norestart

echo Microsoft Visual C++ 2012...
start /wait vcredist2012_x86.exe /passive /norestart

echo Microsoft Visual C++ 2013...
start /wait vcredist2013_x86.exe /passive /norestart

echo Microsoft Visual C++ 2015, 2017 ^& 2019...
start /wait vcredist2015_2017_2019_2022_x86.exe /passive /norestart

:X64

echo Microsoft Visual C++ 2005...
start /wait vcredist2005_x86.exe /q
start /wait vcredist2005_x64.exe /q

echo Microsoft Visual C++ 2008...
start /wait vcredist2008_x86.exe /qb
start /wait vcredist2008_x64.exe /qb

echo Microsoft Visual C++ 2010...
start /wait vcredist2010_x86.exe /passive /norestart
start /wait vcredist2010_x64.exe /passive /norestart

echo Microsoft Visual C++ 2012...
start /wait vcredist2012_x86.exe /passive /norestart
start /wait vcredist2012_x64.exe /passive /norestart

echo Microsoft Visual C++ 2013...
start /wait vcredist2013_x86.exe /passive /norestart
start /wait vcredist2013_x64.exe /passive /norestart

echo Microsoft Visual C++ 2015, 2017 ^& 2019...
start /wait vcredist2015_2017_2019_2022_x86.exe /passive /norestart
start /wait vcredist2015_2017_2019_2022_x64.exe /passive /norestart

echo %fblanco%

:: Descarga el archivo usando PowerShell
:: powershell -Command "iwr 'https://github.com/abbodi1406/vcredist/releases/download/v0.85.0/VisualCppRedist_AIO_x86_x64.exe' -OutFile 'VisualCppRedist_AIO_x86_x64.exe'"

:: Verifica si la descarga fue exitosa
::if exist %optimizacion%\VisualCppRedist_AIO_x86_x64.exe (
::    echo Archivo descargado con éxito.

    :: Ejecuta el instalador con el argumento /Y y espera a que termine
::    VisualCppRedist_AIO_x86_x64.exe /Y

    :: Verifica si el instalador se ejecutó correctamente
::    if %errorlevel% equ 0 (
::        echo Instalación completada correctamente.
::    ) else (
::        echo Ocurrió un error durante la instalación. Código de error: %errorlevel%
::    )
::) else (
::    echo No se pudo descargar el archivo.
::	goto sinconexioni2
::)


echo %cverde% [+] Puesto regedit Archivos optimizacion....
echo %fblanco%
title %Titulo%
timeout /T 5 >nul
set /p powerres=Quieres reniciar el ordenador y/n=
goto menu 

:sinconexioni2
set sinconexiona=No tienes internet
echo %Yellow%
cls
echo =================================================
echo.
echo = %Red%No tienes internet vuelve intentalo mas tarde%Yellow% =
echo.
echo =================================================
timeout /T 5 >nul
goto seguimiento


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
@echo off
set /p varst1=¿Quieres activar los servicios de Xbox? (y/n): 

if /i "%varst1%"=="y" (
    echo Activando servicios de Xbox...
    net start XblGameSave
    sc config XblGameSave start= auto

    net start XboxNetApiSvc
    sc config XboxNetApiSvc start= auto

    net start XboxGipSvc
    sc config XboxGipSvc start= auto

    net start XblAuthManager
    sc config XblAuthManager start= auto

    echo Servicios activados correctamente.
    goto stservicios
) else (
    echo Desactivando servicios de Xbox...
    net stop XblGameSave
    sc config XblGameSave start= disabled

    net stop XboxNetApiSvc
    sc config XboxNetApiSvc start= disabled

    net stop XboxGipSvc
    sc config XboxGipSvc start= disabled

    net stop XblAuthManager
    sc config XblAuthManager start= disabled

    echo Servicios desactivados correctamente.
    goto stservicios
)

:stservicios
set /p bluetoothV2=Si quieres activar bluetooth y/n:

if "%bluetoothV2%"=="y" (
	echo %fblanco%

	sc config bthserv start= disabled
    net stop bthserv

    sc config BTAGService start= disabled
    net stop BTAGService

    sc config BthAvctpSvc start= disabled
    net stop BthAvctpSvc

    sc config BthA2dpSvc start= disabled
    net stop BthA2dpSvc 

    echo Servicios activados correctamente.
    goto ststarss

) else (
	echo %fblanco%
    sc config bthserv start= auto
    net start bthserv

    sc config BTAGService start= auto
    net stop BTAGService

    sc config BthAvctpSvc start= auto
    net stop BthAvctpSvc

    sc config BthA2dpSvc start= auto
    net stop BthA2dpSvc 
    echo Servicios desactivados correctamente.
    goto ststarss
)


:ststarss
echo %camarillo% [+] Desavilitando servicios...
echo %fblanco%
timeout /T 5 >nula

net stop UmRdpService

net stop edgeupdate

net stop edgeupdatem

net stop WdiSystemHost

net stop WdiServiceHost

net stop DiagTrack

net stop ShellHWDetection

net stop WinRM

net stop tzautoupdate

net stop ALG

net stop LanmanServer

net stop VacSvc

net stop diagnosticshub.standardcollector.service

:: antiguos
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

sc config UmRdpService start= disabled

sc config edgeupdate start= disabled

sc config edgeupdatem start= disabled

sc config WdiSystemHost start= disabled

sc config WdiServiceHost start= disabled

sc config DiagTrack start= disabled

sc config ShellHWDetection start= disabled

sc config WinRM start= disabled

sc config tzautoupdate start= disabled

sc config ALG start= disabled

sc config LanmanServer start= disabled

sc config VacSvc start= disabled

sc config diagnosticshub.standardcollector.service start= disabled

:: antiguos
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
set /p varst1=¿Quieres activar los servicios de Xbox? (y/n): 

if /i "%varst1%"=="y" (
    echo Activando servicios de Xbox...
    net start XblGameSave
    sc config XblGameSave start= auto

    net start XboxNetApiSvc
    sc config XboxNetApiSvc start= auto

    net start XboxGipSvc
    sc config XboxGipSvc start= auto

    net start XblAuthManager
    sc config XblAuthManager start= auto

    echo Servicios activados correctamente.
    goto stservicios2
) else (
    echo Desactivando servicios de Xbox...
    net stop XblGameSave
    sc config XblGameSave start= disabled

    net stop XboxNetApiSvc
    sc config XboxNetApiSvc start= disabled

    net stop XboxGipSvc
    sc config XboxGipSvc start= disabled

    net stop XblAuthManager
    sc config XblAuthManager start= disabled
    goto stservicios2
)

:stservicios2

set /p bluetoothV2=Si quieres activar bluetooth y/n:

if "%bluetoothV2%"=="y" (
	echo %fblanco%

	sc config bthserv start= disabled
    net stop bthserv

    sc config BTAGService start= disabled
    net stop BTAGService

    sc config BthAvctpSvc start= disabled
    net stop BthAvctpSvc

    sc config BthA2dpSvc start= disabled
    net stop BthA2dpSvc 

    echo Servicios activados correctamente.
    goto ststarss

) else (
	echo %fblanco%
    sc config bthserv start= auto
    net start bthserv

    sc config BTAGService start= auto
    net stop BTAGService

    sc config BthAvctpSvc start= auto
    net stop BthAvctpSvc

    sc config BthA2dpSvc start= auto
    net stop BthA2dpSvc 
    echo Servicios desactivados correctamente.
    goto ststarss
)

:ststarss2
net start UmRdpService

net start edgeupdstart

net start edgeupdatem

net start WdiSystemHost

net start WdiServiceHost

net start DiagTrack

net start ShellHWDetection

net start WinRM

net start tzautoupdate

net start ALG

net start LanmanServer

net start VacSvc

net start diagnosticshub.standardcollector.service

:: antiguos
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

sc config UmRdpService start= auto

sc config edgeupdate start= auto

sc config edgeupdatem start= auto

sc config WdiSystemHost start= auto

sc config WdiServiceHost start= auto

sc config DiagTrack start= auto

sc config ShellHWDetection start= auto

sc config WinRM start= auto

sc config tzautoupdate start= auto

sc config ALG start= auto

sc config LanmanServer start= auto

sc config VacSvc start= auto

sc config diagnosticshub.standardcollector.service start= auto

::antiguo

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
set /p powerres=Quieres reniciar el ordenador y/n=
pause
goto menu


:reparararchivoscorruptos
DISM /Online /Cleanup-Image /CheckHealth
timeout /T 2 >nul
DISM /Online /Cleanup-Image /ScanHealth
timeout /T 2 >nul
DISM /Online /Cleanup-Image /RestoreHealth
timeout /T 2 >nul
chkdsk C: /F /R
timeout /T 2 >nul
DISM /Online /Cleanup-Image /RestoreHealth /Source:C:/RepairSource/Windows /LimitAccess
echo %fverde% Corregido Reparar Archivos corruptos Windows %fblanco%
set /p powerres=Quieres reniciar el ordenador y/n=

if "%powerres%"=="y" ( 
shutdown /r /t 10
)

if "%powerres%"=="y" (
echo [+] Salendo... & timeout /T 2 >nul 
goto menu
)

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
