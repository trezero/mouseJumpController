# Mouse Jump Controller

## Overview
Mouse Jump Controller is a Windows utility that allows you to control whether your mouse cursor can jump between computers. It's particularly useful for environments where multiple computers are used side-by-side with mouse sharing software (like Synergy, Barrier, ShareMouse, etc.), and you need to temporarily disable this functionality.

## Features
- **Disable Mouse Jumping**: Prevents your mouse from moving to other computers by:
  - Disabling Windows 11's built-in cursor movement between displays
  - Stopping common mouse sharing applications
  - Stopping related services
  - Adding firewall rules to block common ports used by mouse sharing apps

- **Enable Mouse Jumping**: Restores the ability for your mouse to move between computers by:
  - Enabling Windows 11's cursor movement between displays
  - Removing firewall rules that block mouse sharing applications
  - Providing guidance on restarting mouse sharing applications

- **Check Mouse Apps**: Identifies running mouse sharing applications and services on your system

## Requirements
- Windows 10/11 operating system
- Administrator privileges (for modifying registry settings, stopping services, and configuring firewall rules)

## Installation
No installation is required. Simply download the scripts to a folder on your computer.

## Usage

### Disable Mouse Jumping
1. Right-click on `disable_mouse_jumping.bat`
2. Select "Run as administrator"
3. The script will disable mouse jumping functionality and display the actions taken
4. Press any key to exit when complete

### Enable Mouse Jumping
1. Right-click on `enable_mouse_jumping.bat`
2. Select "Run as administrator"
3. The script will enable mouse jumping functionality and display the actions taken
4. You will need to manually restart any mouse sharing applications you wish to use
5. Press any key to exit when complete

### Check Mouse Applications
1. Right-click on `check_mouse_apps.bat`
2. Select "Run as administrator"
3. The script will display information about running mouse sharing applications, services, and installation locations
4. Press any key to exit when complete

## How It Works

### disable_mouse_jumping.bat
This script performs the following actions:
1. Disables Windows 11's cursor movement between displays by modifying the registry key `HKEY_CURRENT_USER\Control Panel\Cursors\CursorDeadzoneJumpingSetting`
2. Stops common mouse sharing applications (Synergy, Barrier, ShareMouse, etc.)
3. Stops related services
4. Adds firewall rules to block common ports used by mouse sharing applications (24800 for Synergy, 30564 for ShareMouse)

### enable_mouse_jumping.bat
This script performs the following actions:
1. Enables Windows 11's cursor movement between displays by modifying the registry key `HKEY_CURRENT_USER\Control Panel\Cursors\CursorDeadzoneJumpingSetting`
2. Removes firewall rules that block mouse sharing applications

### check_mouse_apps.bat
This script checks for:
1. Running processes related to mouse sharing applications
2. Active services related to mouse sharing
3. Common installation locations for mouse sharing applications
4. Network connections on ports commonly used by mouse sharing applications

## Supported Mouse Sharing Applications
- Synergy
- Barrier
- ShareMouse
- Mouse without Borders
- Multiplicity
- Input Director
- Input Leap

## Troubleshooting

### Mouse still jumps between computers after disabling
- Ensure you ran the script as administrator
- Restart your computer to ensure all changes take effect
- Check if there are any mouse sharing applications still running using the `check_mouse_apps.bat` script
- Manually disable any additional mouse sharing applications not covered by the script

### Cannot enable mouse jumping
- Ensure you ran the script as administrator
- Manually start your preferred mouse sharing application after running the enable script
- Check your mouse sharing application's configuration

## Security Considerations
These scripts modify registry settings, stop processes and services, and configure firewall rules. Always run them with administrator privileges and ensure you understand the changes they make to your system.

## License
This software is provided as-is with no warranties. Use at your own risk.

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments
- This utility was created to address the common need to temporarily disable mouse sharing functionality in multi-computer environments.
