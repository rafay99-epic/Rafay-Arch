echo -ne "

██████╗  █████╗ ███████╗███████╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
██████╔╝███████║███████╗█████╗      ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
██╔══██╗██╔══██║╚════██║██╔══╝      ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
██████╔╝██║  ██║███████║███████╗    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
"
echo -ne "
-------------------------------------------------------------------------
                --- Enabling Multilib Repository ---
-------------------------------------------------------------------------"

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo -ne "
-------------------------------------------------------------------------
                --- Enabling Parallel Downloads ---
-------------------------------------------------------------------------"
#Add parallel downloading
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

pacman -Sy --noconfirm --needed

echo -ne "
-------------------------------------------------------------------------
                --- Setting Local Address ---
-------------------------------------------------------------------------"

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

echo -ne "
-------------------------------------------------------------------------
                --- Downloading Base Packages ---
-------------------------------------------------------------------------"

application_pacman=(
        'efibootmgr' 
        'networkmanager' 
        'network-manager-applet'
        'dialog' 
        'wpa_supplicant' 
        'mtools' 
        'dosfstools'
        'base-devel'
        'linux-headers'
        'avahi'
        'xdg-user-dirs'
        'xdg-utils'
        'gvfs'
        'gvfs-smb'
        'nfs-utils'
        'inetutils'
        'dnsutils'
        'bluez'
        'bluez-utils'
        'cups' 
        'hplip'
        'alsa-utils'
        'pipewire'
        'pipewire-alsa' 
        'pipewire-pulse' 
        'pipewire-jack'
        'bash-completion' 
        'openssh' 
        'rsync' 
        'reflector' 
        'acpi' 
        'acpi_call' 
        'virt-manager' 
        'qemu' 
        'qemu-arch-extra' 
        'edk2-ovmf' 
        'bridge-utils' 
        'dnsmasq' 
        'vde2' 
        'openbsd-netcat' 
        'iptables-nft'
        'ipset' 
        'firewalld' 
        'flatpak' 
        'sof-firmware'
        'nss-mdns' 
        'acpid' 
        'os-prober' 
        'ntfs-3g' 
        'terminus-font'
    )
        #The installing of application
for application_pacman in "${application_pacman[@]}"; do
    echo "
-------------------------------------------------------------------------
          INSTALLING: "${application_pacman}"
-------------------------------------------------------------------------
         "    
    sudo pacman -S "$application_pacman" --noconfirm --needed
done

echo -ne "
-------------------------------------------------------------------------
                --- Enabling Services ---
-------------------------------------------------------------------------"

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon

systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

printf "\e[1;32mDone! \e[0m"




