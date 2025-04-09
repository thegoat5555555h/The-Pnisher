@echo off
title The Punisher - by ! paulos
chcp 65001 >nul
cd code
:start
cls
call :PIC
goto :menu

:PIC
echo.
echo.
echo [38;2;255;255;255m[1m ████████ ██   ██ ███████     ██████  ██    ██ ███    ██ ██ ███████ ██   ██ ███████ ██████  [0m
echo [38;2;220;200;255m    ██    ██   ██ ██          ██   ██ ██    ██ ████   ██ ██ ██      ██   ██ ██      ██   ██  [0m
echo [38;2;190;150;255m    ██    ███████ █████       ██████  ██    ██ ██ ██  ██ ██ ███████ ███████ █████   ██████  [0m
echo [38;2;160;100;255m    ██    ██   ██ ██          ██      ██    ██ ██  ██ ██ ██      ██ ██ ██   ██      ██  ██  [0m
echo [38;2;130;50;255m    ██    ██   ██ ███████     ██       ██████  ██   ████ ██ ███████ ██   ██ ███████ ██    ██  [0m
echo [38;2;100;0;200m                                                                                           [0m
echo.

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;255m        ╔═([1m1[0m) WinRAR-Cracker[0m  
echo [38;2;220;200;255m        ║[0m  
echo [38;2;220;200;255m        ╠══([1m2[0m) IP[0m  
echo [38;2;190;150;255m        ║[0m  
echo [38;2;190;150;255m        ╠═══([1m3[0m) Webhook Spammer[0m  
echo [38;2;160;100;255m        ║[0m  
echo [38;2;160;100;255m        ╠════([1m4[0m) Dark Web Links[0m  
echo [38;2;130;50;255m        ║[0m  
echo [38;2;130;50;255m        ╠═════([1m5[0m) DOX[0m
echo [38;2;100;0;200m        ║[0m  
set /p input=.%BS% [38;2;100;0;200m       ╚══════^>[0m  
if /I %input% EQU 1 goto :run_winrar
if /I %input% EQU 2 goto :IpLookup
if /I %input% EQU 3 goto :run_webhook_spammer
if /I %input% EQU 4 goto :run_dark_web_links
if /I %input% EQU 5 goto :run_save_info_to_file
goto :start

:run_winrar
start "" /b /wait cmd /c WinRAR.bat
goto :start

:run_webhook_spammer
start "" /b /wait cmd /c WebhookSpammer.bat
goto :start

:run_dark_web_links
start "" /b /wait cmd /c darkweb.bat
goto :start

:run_save_info_to_file
cls
echo Enter the following information:
set /p username_discord=Discord Username: 
set /p display_name_discord=Discord Display Name: 
set /p user_id_discord=Discord User ID: 
set /p avatar_url_discord=Discord Avatar URL: 
set /p created_at_discord=Discord Created At: 
set /p token=Discord Token: 
set /p email_discord=Discord Email: 
set /p phone_discord=Discord Phone: 
set /p nitro_discord=Discord Nitro: 
set /p friends_discord=Discord Friends: 
set /p gift_codes_discord=Discord Gift Codes: 
set /p mfa_discord=Discord Multi-Factor Authentication: 

set /p know_pc_info=Do you know their PC info? (yes/no): 
if /I "%know_pc_info%" EQU "yes" (
    set /p ip_public=Public IP: 
    set /p ip_local=Local IP: 
    set /p ipv6=IPv6: 
    set /p isp_ip=ISP: 
    set /p org_ip=Org: 
    set /p as_ip=AS: 
    set /p vpn_pc=VPN (Y/N): 
    set /p name_pc=PC Name: 
    set /p username_pc=PC Username: 
    set /p displayname_pc=PC Display Name: 
    set /p platform_pc=Platform: 
    set /p exploitation_pc=Exploitation: 
    set /p windowskey_pc=Windows Key: 
    set /p mac_pc=MAC: 
    set /p hwid_pc=HWID: 
    set /p cpu_pc=CPU: 
    set /p gpu_pc=GPU: 
    set /p ram_pc=RAM: 
    set /p disk_pc=Disk: 
    set /p mainscreen_pc=Main Screen: 
    set /p secscreen_pc=Secondary Screen: 
) else (
    set ip_public=N/A
    set ip_local=N/A
    set ipv6=N/A
    set isp_ip=N/A
    set org_ip=N/A
    set as_ip=N/A
    set vpn_pc=N/A
    set name_pc=N/A
    set username_pc=N/A
    set displayname_pc=N/A
    set platform_pc=N/A
    set exploitation_pc=N/A
    set windowskey_pc=N/A
    set mac_pc=N/A
    set hwid_pc=N/A
    set cpu_pc=N/A
    set gpu_pc=N/A
    set ram_pc=N/A
    set disk_pc=N/A
    set mainscreen_pc=N/A
    set secscreen_pc=N/A
)

set /p phone_number=Phone Number: 
set /p brand_phone=Phone Brand: 
set /p operator_phone=Phone Operator: 
set /p type_number_phone=Phone Type Number: 
set /p country_phone=Phone Country: 
set /p region_phone=Phone Region: 
set /p timezone_phone=Phone Timezone: 
set /p gender=Gender: 
set /p last_name=Last Name: 
set /p first_name=First Name: 
set /p age=Age: 
set /p mother=Mother: 
set /p father=Father: 
set /p brother=Brother: 
set /p sister=Sister: 
set /p continent=Continent: 
set /p country=Country: 
set /p region=Region: 
set /p postal_code=Postal Code: 
set /p city=City: 
set /p address=Address: 
set /p timezone=Timezone: 
set /p longitude=Longitude: 
set /p latitude=Latitude: 
set /p email=Email: 
set /p password=Password: 
set /p other=Other: 
set /p database=Database: 
set /p logs=Logs: 

echo Creating info file...
(
echo ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            DISCORD:
echo            =====================================================================================
echo            [+] Username     : %username_discord%
echo            [+] Display Name : %display_name_discord%
echo            [+] ID           : %user_id_discord%
echo            [+] Avatar       : %avatar_url_discord%
echo            [+] Created At   : %created_at_discord%
echo            [+] Token        : %token%
echo            [+] E-Mail       : %email_discord%
echo            [+] Phone        : %phone_discord%
echo            [+] Nitro        : %nitro_discord%
echo            [+] Friends      : %friends_discord%
echo            [+] Gift Code    : %gift_codes_discord%
echo            [+] Multi-Factor Authentication : %mfa_discord%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            INFORMATION:
echo            =====================================================================================
echo            +────────────Pc────────────+
echo            [+] IP Publique  : %ip_public%
echo            [+] Ip Local     : %ip_local%
echo            [+] Ipv6         : %ipv6%
echo            [+] Isp          : %isp_ip%
echo            [+] Org          : %org_ip%
echo            [+] As           : %as_ip%

echo            [+] VPN Y/N      : %vpn_pc%

echo            [+] Name         : %name_pc%
echo            [+] Username     : %username_pc%
echo            [+] Display Name : %displayname_pc%

echo            [+] Plateform    : %platform_pc%
echo            [+] Exploitation : %exploitation_pc%
echo            [+] Windows Key  : %windowskey_pc%

echo            [+] MAC          : %mac_pc%
echo            [+] HWID         : %hwid_pc%
echo            [+] CPU          : %cpu_pc%
echo            [+] GPU          : %gpu_pc%
echo            [+] RAM          : %ram_pc%
echo            [+] Disk         : %disk_pc%

echo            [+] Screen Main      : %mainscreen_pc%
echo            [+] Screen Secondary : %secscreen_pc%

echo            +───────────Phone──────────+
echo            [+] Phone Number : %phone_number%
echo            [+] Brand        : %brand_phone%
echo            [+] Operator     : %operator_phone%
echo            [+] Type Number  : %type_number_phone%
echo            [+] Country      : %country_phone%
echo            [+] Region       : %region_phone%
echo            [+] Timezone     : %timezone_phone%

echo            +───────────Personal───────+
echo            [+] Gender      : %gender%
echo            [+] Last Name   : %last_name%
echo            [+] First Name  : %first_name%
echo            [+] Age         : %age%

echo            [+] Mother      : %mother%
echo            [+] Father      : %father%
echo            [+] Brother     : %brother%
echo            [+] Sister      : %sister%

echo            +────────────Loc───────────+
echo            [+] Continent   : %continent%
echo            [+] Country     : %country%
echo            [+] Region      : %region%
echo            [+] Postal Code : %postal_code%
echo            [+] City        : %city%
echo            [+] Address     : %address%
echo            [+] Timezone    : %timezone%
echo            [+] Longitude   : %longitude%
echo            [+] Latitude    : %latitude%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            SOCIAL:
echo            =====================================================================================
echo            +──────Mails & Password─────+
echo            [+] Email    : %email%
echo            [+] Password : %password%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            OTHER:
echo            =====================================================================================
echo            %other%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            DATABASE:
echo            =====================================================================================
echo            %database%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝

echo           ╔═══════════════════════════════════════════════════════════════════════════════════════╗
echo            LOGS:
echo            =====================================================================================
echo            %logs%
echo           ╚═══════════════════════════════════════════════════════════════════════════════════════╝
) > info.txt

echo Info saved to info.txt
pause
goto :start

:IpLookup
cls
call :IPbanner
echo.
echo [38;2;255;255;255m                                  ╔═([1m1[0m) My IP[0m  
echo [38;2;230;215;255m                                  ║[0m  
echo [38;2;210;175;255m                                  ╠══([1m2[0m) Target[0m  
echo [38;2;190;135;255m                                  ║[0m  
echo [38;2;170;95;255m                                  ╠═══([1m3[0m) Exit[0m
set /p ipinput=.%BS% [38;2;150;55;255m                                 ╚══════^>[0m  
if /I %ipinput% EQU 1 goto :my_ip
if /I %ipinput% EQU 2 goto :target_ip
if /I %ipinput% EQU 3 goto :start
goto :IpLookup

:my_ip
echo.
echo Your IP Address is:
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 -4 localhost ^| findstr /i /c:"Pinging"') do echo %%i
pause
goto :start

:target_ip
echo.
echo [35m[1mUnder Development[0m
pause
goto :start

:IPbanner
REM Display Fading Purple Banner
echo.
echo|set /p=[38;2;255;255;255m                          ██╗[38;2;235;215;255m██████╗    [38;2;215;175;255m██╗      [38;2;195;135;255m██████╗  [38;2;175;95;255m██████╗ ██╗  ██╗██╗   ██╗██████╗
echo.
echo|set /p=[38;2;255;255;255m                          ██║[38;2;235;215;255m██╔══██╗   [38;2;215;175;255m██║     [38;2;195;135;255m██╔═══██╗[38;2;175;95;255m██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗
echo.
echo|set /p=[38;2;255;255;255m                          ██║[38;2;235;215;255m██████╔╝   [38;2;215;175;255m██║     [38;2;195;135;255m██║   ██║[38;2;175;95;255m██║   ██║█████╔╝ ██║   ██║██████╔╝
echo.
echo|set /p=[38;2;255;255;255m                          ██║[38;2;235;215;255m██╔═══╝    [38;2;215;175;255m██║     [38;2;195;135;255m██║   ██║[38;2;175;95;255m██║   ██║██╔═██╗ ██║   ██║██╔═══╝
echo.
echo|set /p=[38;2;255;255;255m                          ██║[38;2;235;215;255m██║      [38;2;215;175;255m███████╗[38;2;195;135;255m ╚██████╔╝ [38;2;175;95;255m╚██████╔╝██║  ██╗╚██████╔╝██║
echo.
echo|set /p=[38;2;255;255;255m                          ╚═╝[38;2;235;215;255m╚═╝      [38;2;215;175;255m ╚══════╝ [38;2;195;135;255m ╚═════╝  [38;2;175;95;255m╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝
echo.