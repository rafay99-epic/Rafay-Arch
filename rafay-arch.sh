#!/bin/bash
clear

function welcome_message()
{
echo -ne "

 █████╗ ██████╗  ██████╗██╗  ██╗    ██████╗  █████╗ ███████╗ █████╗ ██╗   ██╗
██╔══██╗██╔══██╗██╔════╝██║  ██║    ██╔══██╗██╔══██╗██╔════╝██╔══██╗╚██╗ ██╔╝
███████║██████╔╝██║     ███████║    ██████╔╝███████║█████╗  ███████║ ╚████╔╝ 
██╔══██║██╔══██╗██║     ██╔══██║    ██╔══██╗██╔══██║██╔══╝  ██╔══██║  ╚██╔╝  
██║  ██║██║  ██║╚██████╗██║  ██║    ██║  ██║██║  ██║██║     ██║  ██║   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝   ╚═╝   
                                                                            
" 
}

function install()
{
    echo  -ne "
------------------------------------------------------------------------
    --- This script will install Arch Linux on your computer ---
------------------------------------------------------------------------
"


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
}

# warning and Term Conditions
if  ( whiptail --title "Rafay Arch" --yesno --scrolltext  "  ---  Warning this script will only install Arch Linux ---

--- The following things will not be conducted by the script ---

1. Partiation of the Disk
2. Encryption of the Disk 
3. Installing of the Linux kernel

--- The Following things will be conducted by the script ---

1. Installing of the base system
2. Installing Desktop Environment 
    2.1: KDE Plasma
    2.2: GNOME
3. User Account will be created
4. Detecting & Installing Processors Driver
    4.1: AMD Processors
    4.2: Intel Processors
5. Detecting & Installing Graphics Driver
    5.1 AMD GPU
    5.2 NVIDIA GPU
    5.3 Intel GPU
6. Installing Bases Packages
7. Installing Systemd Bootloader
8. Installing Network Manager
9. Installing Bluetooth Manager
10. Installing Printer Manager
11. Installing Audio Manager
12. Installing Display Manager
13. Installing and Setting up Firewall
14. Installing and Setting up Sudoers
15. Installing and Setting up Snapd & Flatpak
16. Installing and Setting up Yay or paru 
17. Seting Up Time Zone & Local

-- Do you Agree with these terms??  --

-- To Begin Installation Press Yes or No to Exit Script ---
"   40 80 )  
then
    welcome_message
    install
else
    echo -ne "
    ---------------------------------------------------------------------------
    |                    Have a Nice Day!! Bye...                             |     
    ---------------------------------------------------------------------------  "
    exit 0
fi;








