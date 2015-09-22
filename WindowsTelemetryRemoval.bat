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

echo Uninstalling Description of the update for Windows Activation Technologies (KB971033)
wusa /uninstall /kb:971033 /quiet /norestart > NUL

echo Stopping and deleting Windows Diagnostic Tracking Service
sc stop Diagtrack > NUL
sc delete Diagtrack > NUL

echo Disabling data collecting and reporting tasks
schtasks /Change /TN "\Microsoft\Windows\Application Experience\AitAgent" /DISABLE > NUL
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE > NUL
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE > NUL

schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE > NUL

schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE > NUL
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE > NUL
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE > NUL

schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE > NUL

schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /DISABLE > NUL

echo Done.
echo.
echo Please go to Control Panel ^> Windows Update and hide the following updates:
echo KB2952664, KB2976978, KB2977759, KB2990214, KB3021917, KB3022345, KB3035583,
echo KB3044374, KB3068708, KB3075249, KB3080149 and KB971033
echo.

pause