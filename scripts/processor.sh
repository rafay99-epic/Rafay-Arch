echo -ne "

███╗   ███╗██╗ ██████╗██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ███████╗
████╗ ████║██║██╔════╝██╔══██╗██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝
██╔████╔██║██║██║     ██████╔╝██║   ██║██║     ██║   ██║██║  ██║█████╗  
██║╚██╔╝██║██║██║     ██╔══██╗██║   ██║██║     ██║   ██║██║  ██║██╔══╝  
██║ ╚═╝ ██║██║╚██████╗██║  ██║╚██████╔╝╚██████╗╚██████╔╝██████╔╝███████╗
╚═╝     ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
"

echo -ne "
-------------------------------------------------------------------------
                    Installing Microcode
-------------------------------------------------------------------------
"
# determine processor type and install microcode
proc_type=$(lscpu)
if grep -E "GenuineIntel" <<< ${proc_type}; then
    echo "Installing Intel microcode"
    pacman -S --noconfirm --needed intel-ucode
    proc_ucode=intel-ucode.img
elif grep -E "AuthenticAMD" <<< ${proc_type}; then
    echo "Installing AMD microcode"
    pacman -S --noconfirm --needed amd-ucode
    proc_ucode=amd-ucode.img
fi


printf "\e[1;32mDone! \e[0m"