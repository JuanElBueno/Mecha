@echo off
echo Importing SanGraphic's PowerPlan for Better Performance & Input Delay
echo.
echo.
@echo off
cls
echo Enabling SanGraphic's PowerPlan for Better Performance
echo.
copy "%~dp0\data\SanGraphicPOWERPLAN.pow" "C:\"
powercfg -import "C:\SanGraphicPOWERPLAN.pow" f42fe57c-e762-287e-984a-4e9613d9e9d3
@echo
del /f "C:\SanGraphicPOWERPLAN.pow"
@echo
powercfg -SETACTIVE "f42fe57c-e762-287e-984a-4e9613d9e9d3"
Echo.
Echo. [101;41mPowerPlan Have Been Applied!.[0m
echo.
pause
exit
