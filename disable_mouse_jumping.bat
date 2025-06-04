@echo off
setlocal enabledelayedexpansion
echo Disabling mouse cursor jumping between computers...
echo.

REM Disable the Windows 11 Ease cursor movement between displays feature
echo Updating registry settings...
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorDeadzoneJumpingSetting /t REG_DWORD /d 0 /f

REM Stop common mouse sharing applications
echo Stopping mouse sharing applications...
set "apps=synergy barrier sharemouse InputLeap MouseWithoutBorders multiplicity inputdirector"

for %%a in (%apps%) do (
    taskkill /f /im "%%a.exe" 2>nul
    taskkill /f /im "%%a*" 2>nul
    echo Attempted to stop %%a processes
)

REM Stop related services
echo Stopping related services...
set "services=synergy barrier sharemouse InputLeap MouseWithoutBorders"

for %%s in (%services%) do (
    sc stop "%%s" 2>nul
    echo Attempted to stop %%s service
)

REM Block common ports used by mouse sharing applications
echo Setting up firewall rules...
netsh advfirewall firewall add rule name="Block Synergy" dir=in action=block protocol=TCP localport=24800 >nul 2>&1
netsh advfirewall firewall add rule name="Block Synergy" dir=out action=block protocol=TCP localport=24800 >nul 2>&1
netsh advfirewall firewall add rule name="Block ShareMouse" dir=in action=block protocol=TCP localport=30564 >nul 2>&1
netsh advfirewall firewall add rule name="Block ShareMouse" dir=out action=block protocol=TCP localport=30564 >nul 2>&1

echo.
echo SUCCESS: Mouse jumping between computers has been DISABLED
echo The following actions were taken:
echo  - Disabled Windows 11 cursor movement between displays
echo  - Stopped common mouse sharing applications
echo  - Stopped related services
echo  - Added firewall rules to block common ports
echo.
echo NOTE: You may need to restart your computer for all changes to take effect.
echo.
echo Press any key to exit...
pause >nul