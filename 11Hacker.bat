@echo off
color F0
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\Security"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\getadmin.vbs"
echo �����Թ���Ա�������!!!
cscript "%temp%\getadmin.vbs" >nul
exit /B
:gotAdmin
set aria2c="https://github.com/Xbodw/Rele/raw/main/aria2c.exe"
title Windows11Hacker [�������]
cd /d %~dp0
:pd
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
echo ��������Aria2c����һ�����ؿ�����Ҫ�ܾ�^(��Сʱ^)
powershell curl  -o "%cd%\Assets\aria2c.exe"  "%aria2c%"
::bitsadmin /transfer ��Ҫ��� /download /priority HIGH %aria2c% "%cd%\Assets\aria2c.exe"
pause
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
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo ��������Windows11Hacker��Ҫ�����������֮�󽫽���Windows�޸�
echo=
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/11HackerAssets.zip"
Assets\7z x -y -oAssets\ "Assets\11HackerAssets.zip"
pause
del /f /q "Assets\11HackerAssets.zip"
goto pd
:7z
cls
echo Windows11Hacker
echo=
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo ��������Windows11Hacker��Ҫ�����������֮�󽫽���Windows�޸�
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/7z.exe"
Assets\aria2c -c -s 16 -d "%cd%\Assets" "https://github.com/Xbodw/Rele/raw/main/7z.dll"
goto pd
:ps
"mshta.exe" vbscript:msgBox("δ�ҵ�%SorF%",64,"Windows11Hacker")(window.close)
 goto Go
:pus
"mshta.exe" vbscript:msgBox("�ļ����ʹ���,��%SorF%",64,"Windows11Hacker")(window.close)
 goto Go
:Go
cls
title Windows11Hacker [��ʽģ��]
echo Windows11Hacker
echo=
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo ��ѡ��һ�����޸�Windows11ISO�����Ʋ���Ҫ������
set /p SorF=����ISO^>
if not exist "%SorF%" goto ps
if "%SorF:~-4%" NEQ ".iso" goto pus
echo=
echo ������ȡ%SorF%�ڵ��ļ�
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
title Windows11Hacker [ISO����]
echo Windows11Hacker
echo=
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo ��������ISO...
set iso="%cd%\11Hacker_%random%.iso"
Assets\bin\cdimage.exe -bootdata:2#p0,e,bCache\boot\Etfsboot.com#pEF,e,bCache\efi\microsoft\boot\Efisys.bin -u1 -udfver102 -l"Windows11_Media" "%cd%\Cache" "%iso%"|Findstr "Done." >nul && echo off || goto ERR
if exist Cache rd /s /q Cache
cls
title Windows11Hacker [���]
echo Windows11Hacker
echo=
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo ������ISO,λ��%iso%
pause
exit /b
:ERR
cls
title Windows11Hacker [��ʽģ��]
if exist Cache rd /s /q Cache
echo Windows11Hacker
echo=
echo ���ư� 1.2
echo=
echo ��װ���µ�11Hacker,�˽��¹�����Ľ�!
echo=
echo �޸�ISOʧ��
pause>nul