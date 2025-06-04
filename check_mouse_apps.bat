{
  `content`: `@echo off
echo Checking for mouse/keyboard sharing applications...
echo.

echo === RUNNING PROCESSES ===
echo Checking for Synergy...
tasklist | findstr /i synergy
echo Checking for Barrier...
tasklist | findstr /i barrier
echo Checking for ShareMouse...
tasklist | findstr /i sharemouse
echo Checking for Mouse without Borders...
tasklist | findstr /i mousewithoutborders
echo Checking for Multiplicity...
tasklist | findstr /i multiplicity
echo Checking for Input Director...
tasklist | findstr /i inputdirector
echo Checking for Input Leap...
tasklist | findstr /i inputleap
echo Checking for any mouse-related processes...
tasklist | findstr /i mouse

echo.
echo === SERVICES ===
echo Checking for related services...
sc query state= all | findstr /i \"synergy barrier mouse share multiplicity input\"

echo.
echo === CHECKING COMMON INSTALL LOCATIONS ===
if exist \"C:\\Program Files\\Synergy\" echo Found: Synergy in Program Files
if exist \"C:\\Program Files (x86)\\Synergy\" echo Found: Synergy in Program Files (x86)
if exist \"C:\\Program Files\\ShareMouse\" echo Found: ShareMouse in Program Files
if exist \"C:\\Program Files (x86)\\ShareMouse\" echo Found: ShareMouse in Program Files (x86)
if exist \"C:\\Program Files\\Barrier\" echo Found: Barrier in Program Files
if exist \"C:\\Program Files (x86)\\Barrier\" echo Found: Barrier in Program Files (x86)

echo.
echo === NETWORK CONNECTIONS ===
echo Checking for common ports used by mouse sharing apps...
netstat -an | findstr \":24800\"
netstat -an | findstr \":30564\"

echo.
echo Script completed. Press any key to exit...
pause >nul
`,
  `path`: `check_mouse_apps_fixed.bat`
}