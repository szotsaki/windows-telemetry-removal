@echo off

echo Uninstalling Compatibility update for upgrading Windows 7 (KB2952664)
wusa /uninstall /kb:2952664 /quiet /norestart > NUL

echo Uninstalling Compatibility update for Windows 8.1 and Windows 8 (KB2976978)
wusa /uninstall /kb:2976978 /quiet /norestart > NUL

echo Uninstalling Compatibility update for Windows 7 RTM (KB2977759)
wusa /uninstall /kb:2977759 /quiet /norestart > NUL

echo Uninstalling Update that enables you to upgrade from Windows 7 to a later version of Windows (KB2990214)
wusa /uninstall /kb:2990214 /quiet /norestart > NUL

echo Uninstalling Update to Windows 7 SP1 for performance improvements (KB3021917)
wusa /uninstall /kb:3021917 /quiet /norestart > NUL

echo Uninstalling Update for customer experience and diagnostic telemetry (KB3022345)
wusa /uninstall /kb:3022345 /quiet /norestart > NUL

echo Uninstalling Update installs Get Windows 10 app in Windows 8.1 and Windows 7 SP1 (KB3035583)
wusa /uninstall /kb:3035583 /quiet /norestart > NUL

echo Uninstalling Update that enables you to upgrade from Windows 8.1 to a later version of Windows (KB3044374)
wusa /uninstall /kb:3044374 /quiet /norestart > NUL

echo Uninstalling Update for customer experience and diagnostic telemetry (KB3068708)
wusa /uninstall /kb:3068708 /quiet /norestart > NUL

echo Uninstalling Update that adds telemetry points to consent.exe in Windows 8.1 and Windows 7 (KB3075249)
wusa /uninstall /kb:3075249 /quiet /norestart > NUL

echo Uninstalling Update for customer experience and diagnostic telemetry (KB3080149)
wusa /uninstall /kb:3080149 /quiet /norestart > NUL

echo Windows Update Client for Windows 7 and Windows Server 2008 R2: December 2015 (KB3112343)
wusa /uninstall /kb:3112343 /quiet /norestart > NUL

echo Uninstalling Description of the update for Windows Activation Technologies (KB971033)
wusa /uninstall /kb:971033 /quiet /norestart > NUL

echo Stopping and deleting Windows Diagnostic Tracking Service
sc stop Diagtrack > NUL
sc delete Diagtrack > NUL

echo Disabling data collecting and reporting tasks
schtasks /Change /TN "\Microsoft\Windows\Application Experience\AitAgent" /DISABLE > NUL 2> NUL
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE > NUL 2> NUL
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE > NUL 2> NUL

schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE > NUL 2> NUL

schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE > NUL 2> NUL
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE > NUL 2> NUL
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE > NUL 2> NUL

schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE > NUL 2> NUL

schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /DISABLE > NUL 2> NUL

echo Disabling "Get Windows 10" application and automatic updates
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx /v DisableGwx /t REG_DWORD /d 00000001 /f
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade /v ReservationsAllowed  /t REG_DWORD /d 00000000 /f

rem It has effect only with 3065987 or 3065988 updates installed
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableOSUpgrade /t REG_DWORD /d 00000001 /f

echo Disabling Microsoft telemetry sites in hosts file
SET HOSTS="%SystemRoot%\system32\drivers\etc\hosts"
echo. >> %HOSTS%

type %HOSTS% | findstr /I "131.107.255.255" > NUL || echo 127.0.0.1	131.107.255.255 >> %HOSTS%
type %HOSTS% | findstr /I "134.170.30.202" > NUL || echo 127.0.0.1	134.170.30.202 >> %HOSTS%
type %HOSTS% | findstr /I "137.116.81.24" > NUL || echo 127.0.0.1	137.116.81.24 >> %HOSTS%
type %HOSTS% | findstr /I "204.79.197.200" > NUL || echo 127.0.0.1	204.79.197.200 >> %HOSTS%
type %HOSTS% | findstr /I "23.218.212.69" > NUL || echo 127.0.0.1	23.218.212.69 >> %HOSTS%
type %HOSTS% | findstr /I "65.39.117.230" > NUL || echo 127.0.0.1	65.39.117.230 >> %HOSTS%
type %HOSTS% | findstr /I "65.55.108.23" > NUL || echo 127.0.0.1	65.55.108.23 >> %HOSTS%
type %HOSTS% | findstr /I "a-0001.a-msedge.net" > NUL || echo 127.0.0.1	a-0001.a-msedge.net >> %HOSTS%
type %HOSTS% | findstr /I "choice.microsoft.com" > NUL || echo 127.0.0.1	choice.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "choice.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	choice.microsoft.com.nsatc.net >> %HOSTS%
type %HOSTS% | findstr /I "compatexchange.cloudapp.net" > NUL || echo 127.0.0.1	compatexchange.cloudapp.net >> %HOSTS%
type %HOSTS% | findstr /I "corp.sts.microsoft.com" > NUL || echo 127.0.0.1	corp.sts.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "corpext.msitadfs.glbdns2.microsoft.com" > NUL || echo 127.0.0.1	corpext.msitadfs.glbdns2.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "cs1.wpc.v0cdn.net" > NUL || echo 127.0.0.1	cs1.wpc.v0cdn.net >> %HOSTS%
type %HOSTS% | findstr /I "df.telemetry.microsoft.com" > NUL || echo 127.0.0.1	df.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "diagnostics.support.microsoft.com" > NUL || echo 127.0.0.1	diagnostics.support.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "dns.msftncsi.com" > NUL || echo 127.0.0.1	dns.msftncsi.com >> %HOSTS%
type %HOSTS% | findstr /I "fe2.update.microsoft.com.akadns.net" > NUL || echo 127.0.0.1	fe2.update.microsoft.com.akadns.net >> %HOSTS%
type %HOSTS% | findstr /I "feedback.microsoft-hohm.com" > NUL || echo 127.0.0.1	feedback.microsoft-hohm.com >> %HOSTS%
type %HOSTS% | findstr /I "feedback.search.microsoft.com" > NUL || echo 127.0.0.1	feedback.search.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "feedback.windows.com" > NUL || echo 127.0.0.1	feedback.windows.com >> %HOSTS%
type %HOSTS% | findstr /I "i1.services.social.microsoft.com" > NUL || echo 127.0.0.1	i1.services.social.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "i1.services.social.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	i1.services.social.microsoft.com.nsatc.net >> %HOSTS%
type %HOSTS% | findstr /I "oca.telemetry.microsoft.com" > NUL || echo 127.0.0.1	oca.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "oca.telemetry.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	oca.telemetry.microsoft.com.nsatc.net >> %HOSTS%
type %HOSTS% | findstr /I "pre.footprintpredict.com" > NUL || echo 127.0.0.1	pre.footprintpredict.com >> %HOSTS%
type %HOSTS% | findstr /I "redir.metaservices.microsoft.com" > NUL || echo 127.0.0.1	redir.metaservices.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "reports.wes.df.telemetry.microsoft.com" > NUL || echo 127.0.0.1	reports.wes.df.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "services.wes.df.telemetry.microsoft.com" > NUL || echo 127.0.0.1	services.wes.df.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "settings-sandbox.data.microsoft.com" > NUL || echo 127.0.0.1	settings-sandbox.data.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "sls.update.microsoft.com.akadns.net" > NUL || echo 127.0.0.1	sls.update.microsoft.com.akadns.net >> %HOSTS%
type %HOSTS% | findstr /I "sqm.df.telemetry.microsoft.com" > NUL || echo 127.0.0.1	sqm.df.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "sqm.telemetry.microsoft.com" > NUL || echo 127.0.0.1	sqm.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "sqm.telemetry.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	sqm.telemetry.microsoft.com.nsatc.net >> %HOSTS%
type %HOSTS% | findstr /I "statsfe1.ws.microsoft.com" > NUL || echo 127.0.0.1	statsfe1.ws.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "statsfe2.update.microsoft.com.akadns.net" > NUL || echo 127.0.0.1	statsfe2.update.microsoft.com.akadns.net >> %HOSTS%
type %HOSTS% | findstr /I "statsfe2.ws.microsoft.com" > NUL || echo 127.0.0.1	statsfe2.ws.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "survey.watson.microsoft.com" > NUL || echo 127.0.0.1	survey.watson.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "telecommand.telemetry.microsoft.com" > NUL || echo 127.0.0.1	telecommand.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "telecommand.telemetry.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	telecommand.telemetry.microsoft.com.nsatc.net >> %HOSTS%
type %HOSTS% | findstr /I "telemetry.appex.bing.net" > NUL || echo 127.0.0.1	telemetry.appex.bing.net >> %HOSTS%
type %HOSTS% | findstr /I "telemetry.appex.bing.net:443" > NUL || echo 127.0.0.1	telemetry.appex.bing.net:443 >> %HOSTS%
type %HOSTS% | findstr /I "telemetry.urs.microsoft.com" > NUL || echo 127.0.0.1	telemetry.urs.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "vortex-sandbox.data.microsoft.com" > NUL || echo 127.0.0.1	vortex-sandbox.data.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "vortex-win.data.microsoft.com" > NUL || echo 127.0.0.1	vortex-win.data.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "vortex.data.microsoft.com" > NUL || echo 127.0.0.1	vortex.data.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "watson.live.com" > NUL || echo 127.0.0.1	watson.live.com >> %HOSTS%
type %HOSTS% | findstr /I "watson.ppe.telemetry.microsoft.com" > NUL || echo 127.0.0.1	watson.ppe.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "watson.telemetry.microsoft.com" > NUL || echo 127.0.0.1	watson.telemetry.microsoft.com >> %HOSTS%
type %HOSTS% | findstr /I "watson.telemetry.microsoft.com.nsatc.net" > NUL || echo 127.0.0.1	watson.telemetry.microsoft.com.nsatc.net >> %HOSTS%

echo Done.
echo.
echo Please go to Control Panel ^> Windows Update and hide the following updates:
echo KB2952664, KB2976978, KB2977759, KB2990214, KB3021917, KB3022345, KB3035583,
echo KB3044374, KB3068708, KB3075249, KB3080149, KB3112343 and KB971033
echo.

pause