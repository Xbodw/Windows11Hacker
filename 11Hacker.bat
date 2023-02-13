@echo off
color F0
setlocal enableextensions disabledelayedexpansion
if exist cp.bat del /f /q cp.bat
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\Security"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\getadmin.vbs"
echo 正在以管理员身份启动!!!
cscript "%temp%\getadmin.vbs" >nul
exit /B
:gotAdmin
set aria2c="https://github.com/Xbodw/Rele/raw/main/aria2c.exe"
cd /d %~dp0
:up
title Windows11Hacker [检查更新]
if exist "Assets\aria2c.exe" (
 Assets\aria2c -c -s 16 "https://raw.githubusercontent.com/Xbodw/Windows11Hacker/main/Versions.xml"
 ) else (
powershell curl  -o "Versions.xml" "https://raw.githubusercontent.com/Xbodw/Windows11Hacker/main/Versions.xml"
)
set "ver=0.0"
    for /f "tokens=2 delims=<>" %%a in (
        'find /i "<Version>" ^< "Versions.xml"'
    ) do set "ver=%%a"
del /f /q Versions.xml
if "%ver%" GEQ "1.3" (
 echo 发现新版本，正在自动更新
 powershell curl -o "11Hacker-n.bat" "https://github.com/Xbodw/Windows11Hacker/raw/main/11Hacker.bat"
 echo @echo off > cp.bat
 echo copy /y "11Hacker-n.bat" "11Hacker.bat" >>cp.bat
 start "" "cmd.exe /c cp.bat" 
 exit /b
 pause
)
goto pd
:pd
title Windows11Hacker [下载组件]
if not exist "%cd%\Assets" mkdir Assets
if not exist "%cd%\Assets\aria2c.exe" (
 goto psi
)
if not exist "%cd%\Assets\7z.exe" (
 goto 7z1
)
if not exist "%cd%\Assets\bin" (
 goto pkg
)
goto Go
:psi
echo=
echo 正在下载Aria2c，第一次下载可能需要很久^(半小时^)
powershell curl  -o "%cd%\Assets\aria2c.exe"  "%aria2c%"
::bitsadmin /transfer 必要组件 /download /priority HIGH %aria2c% "%cd%\Assets\aria2c.exe"
goto pd
:7z1
if exist "%cd%\Assets\aria2c.exe" goto 7z
:pkg
if exist "%cd%\Assets\7z.exe" goto dn
:pkkg
goto pd
:dn
cls
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 正在下载Windows11Hacker必要的组件，下载之后将进行Windows修改
echo=
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/11HackerAssets.zip"
Assets\7z x -y -oAssets\ "Assets\11HackerAssets.zip"
del /f /q "Assets\11HackerAssets.zip"
goto pd
:7z
cls
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 正在下载Windows11Hacker必要的组件，下载之后将进行Windows修改
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/7z.exe"
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/7z.dll"
goto pd
:ps
"mshta.exe" vbscript:msgBox("未找到%SorF%",64,"Windows11Hacker")(window.close)
 goto Go
:pus
"mshta.exe" vbscript:msgBox("文件类型错误,在%SorF%",64,"Windows11Hacker")(window.close)
 goto Go
:Go
cls
title Windows11Hacker [正式模块]
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 请选择一个待修改Windows11ISO，名称不需要带引号
set /p SorF=输入ISO^>
if not exist "%SorF%" goto ps
if "%SorF:~-4%" NEQ ".iso" goto pus
echo=
echo 正在提取%SorF%内的文件
if not exist Cache mkdir Cache
@Assets\bin\7z x -y -oCache "%SorF%"|Findstr "Everything is Ok" >nul && echo off || goto ERR
cd Cache\sources
del /f /q "appraiserres.dll"
echo AppraiserDataVersion=0 > "appraiserres.txt"
rename "appraiserres.txt" "appraiserres.dll"
cd ..\..
if not exist Mt mkdir Mt
dism /Mount-Wim /WimFile:Cache\sources\boot.wim /MountDir:Mt /Index:2
cd Mt\sources
del /f /q "appraiserres.dll"
echo AppraiserDataVersion=0 > "appraiserres.txt"
rename "appraiserres.txt" "appraiserres.dll"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f
reg load HKLM\Hacker11bootwim "..\Windows\System32\config\system"
reg add "HKLM\Hacker11bootwim\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\Hacker11bootwim\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\Hacker11bootwim\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\Hacker11bootwim\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\Hacker11bootwim\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f
reg unload HKLM\Hacker11bootwim
cd..\..
dism /UnMount-Wim /MountDir:Mt /commit
rd /s /q Mt
cls
title Windows11Hacker [ISO制作]
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 正在制作ISO...
set iso="%cd%\11Hacker_%random%.iso"
Assets\bin\cdimage.exe -bootdata:2#p0,e,bCache\boot\Etfsboot.com#pEF,e,bCache\efi\microsoft\boot\Efisys.bin -u1 -udfver102 -l"Windows11_Media" "%cd%\Cache" "%iso%"|Findstr "Done." >nul && echo off || goto ERR
if exist Cache rd /s /q Cache
cls
title Windows11Hacker [完成]
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 制作了ISO,位置%iso%
pause
exit /b
:ERR
cls
title Windows11Hacker [正式模块]
if exist Cache rd /s /q Cache
echo Windows11Hacker
echo=
echo 重制版 1.3
echo=
echo 安装最新的11Hacker,了解新功能与改进!
echo=
echo 修改ISO失败
pause>nul
