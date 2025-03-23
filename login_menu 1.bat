@echo off
title Login Page
color 0D

REM Login credentials
echo --------------------------------------------------------------------------------
echo                     MADE BY PAULOS
echo --------------------------------------------------------------------------------

set "USERNAME=Root"
set "PASSWORD=Root"

REM Prompt for username and password
set /p "input_username=Username: "
setlocal disabledelayedexpansion
set /p "input_password=Password: "
setlocal enabledelayedexpansion

REM Verify credentials
if "%input_username%"=="%USERNAME%" (
    setlocal disabledelayedexpansion
    if "%input_password%"=="%PASSWORD%" (
        endlocal
        goto :menu
    ) else (
        endlocal
        echo Invalid username or password
        pause
        exit /b
    )
) else (
    echo Invalid username or password
    pause
    exit /b
)

:menu
echo --------------------------------------------------------------------------------
echo                     MADE BY PAULOS
echo --------------------------------------------------------------------------------
echo.
echo Welcome to the Tools Menu
echo [1] IP Logger
echo [2] Port Scanner
echo [3] Network Pinger
echo [4] DNS Lookup
echo [5] Exit
choice /c 12345 /m "Select an option: "
if errorlevel 5 exit /b
if errorlevel 4 goto :dns_lookup
if errorlevel 3 goto :network_pinger
if errorlevel 2 goto :port_scanner
if errorlevel 1 goto :ip_logger

:ip_logger
set /p "webhook_url=Enter the webhook URL: "
set "WEBHOOK_URL=%webhook_url%"
echo @echo off > ip_logger.bat
echo setlocal enabledelayedexpansion >> ip_logger.bat
echo. >> ip_logger.bat
echo REM Set your webhook URL here >> ip_logger.bat
echo set "WEBHOOK_URL=%WEBHOOK_URL%" >> ip_logger.bat
type ip_logger_base.bat >> ip_logger.bat
echo Your IP Logger script has been saved as ip_logger.bat
pause
goto :menu

:port_scanner
set /p "target_ip=Enter the target IP address: "
set /p "start_port=Enter the start port number: "
set /p "end_port=Enter the end port number: "
set /p "save_option=Do you want to save the info to your PC or send it to a webhook? (PC/Webhook): "

if /i "%save_option%"=="Webhook" (
    set /p "webhook_url=Enter the webhook URL: "
    echo Scanning ports %start_port% to %end_port% on %target_ip%...
    set "output="
    for /l %%p in (%start_port%,1,%end_port%) do (
        echo Checking port %%p...
        (echo open %target_ip% %%p) | telnet >> nul 2>&1 && (
            set "result=Open"
        ) || (
            set "result=Closed"
        )
        set "output=!output!Port %%p: !result!`n"
    )
    echo {
    echo     "username": "Port Scanner",
    echo     "embeds": [
    echo         {
    echo             "title": "Port Scan Results for %target_ip%",
    echo             "description": "!output!"
    echo         }
    echo     ]
    echo } > webhook_payload.json
    curl -H "Content-Type: application/json" -X POST -d @webhook_payload.json %webhook_url%
    del webhook_payload.json
    echo Port scan results have been sent to the webhook.
) else (
    echo Scanning ports %start_port% to %end_port% on %target_ip%...
    echo Port Scan Results for %target_ip% > port_scan_results.txt
    for /l %%p in (%start_port%,1,%end_port%) do (
        echo Checking port %%p...
        (echo open %target_ip% %%p) | telnet >> nul 2>&1 && (
            echo %%p: Open >> port_scan_results.txt
        ) || (
            echo %%p: Closed >> port_scan_results.txt
        )
    )
    echo Port scan results have been saved to port_scan_results.txt.
)

pause
goto :menu

:network_pinger
set /p "target_ip=Enter the target IP address or domain: "
set /p "ping_count=Enter the number of ping attempts: "
set /p "save_option=Do you want to save the info to your PC or send it to a webhook? (PC/Webhook): "

if /i "%save_option%"=="Webhook" (
    set /p "webhook_url=Enter the webhook URL: "
    echo Pinging %target_ip% with %ping_count% attempts...
    ping -n %ping_count% %target_ip% > ping_results.txt
    set /p output=<ping_results.txt
    echo {
    echo     "username": "Network Pinger",
    echo     "embeds": [
    echo         {
    echo             "title": "Ping Results for %target_ip%",
    echo             "description": "!output!"
    echo         }
    echo     ]
    echo } > webhook_payload.json
    curl -H "Content-Type: application/json" -X POST -d @webhook_payload.json %webhook_url%
    del webhook_payload.json
    del ping_results.txt
    echo Ping results have been sent to the webhook.
) else (
    echo Pinging %target_ip% with %ping_count% attempts...
    ping -n %ping_count% %target_ip% > ping_results.txt
    echo Ping results have been saved to ping_results.txt.
)

pause
goto :menu

:dns_lookup
set /p "domain_name=Enter the domain name to look up: "
set /p "save_option=Do you want to save the info to your PC or send it to a webhook? (PC/Webhook): "

if /i "%save_option%"=="Webhook" (
    set /p "webhook_url=Enter the webhook URL: "
    echo Looking up DNS records for %domain_name%...
    nslookup %domain_name% > dns_results.txt
    set /p output=<dns_results.txt
    echo {
    echo     "username": "DNS Lookup",
    echo     "embeds": [
    echo         {
    echo             "title": "DNS Lookup Results for %domain_name%",
    echo             "description": "!output!"
    echo         }
    echo     ]
    echo } > webhook_payload.json
    curl -H "Content-Type: application/json" -X POST -d @webhook_payload.json %webhook_url%
    del webhook_payload.json
    del dns_results.txt
    echo DNS lookup results have been sent to the webhook.
) else (
    echo Looking up DNS records for %domain_name%...
    nslookup %domain_name% > dns_results.txt
    echo DNS lookup results have been saved to dns_results.txt.
)

pause
goto :menu