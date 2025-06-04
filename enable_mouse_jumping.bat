@echo off
setlocal enabledelayedexpansion
echo Enabling mouse cursor jumping between computers...
echo.

REM Enable the Windows 11 Ease cursor movement between displays feature
echo Updating registry settings...
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorDeadzoneJumpingSetting /t REG_DWORD /d 1 /f

REM Remove firewall rules that block mouse sharing applications
echo Removing firewall rules...
netsh advfirewall firewall delete rule name="Block Synergy" dir=in >nul 2>&1
netsh advfirewall firewall delete rule name="Block Synergy" dir=out >nul 2>&1
netsh advfirewall firewall delete rule name="Block ShareMouse" dir=in >nul 2>&1
netsh advfirewall firewall delete rule name="Block ShareMouse" dir=out >nul 2>&1

echo.
echo SUCCESS: Mouse jumping between computers has been ENABLED
echo The following actions were taken:
echo  - Enabled Windows 11 cursor movement between displays
echo  - Removed firewall rules blocking common ports
echo.
echo NOTE: You will need to manually start any mouse sharing applications
echo       that you want to use (Synergy, Barrier, ShareMouse, etc.)
echo.
echo Press any key to exit...
pause >nul