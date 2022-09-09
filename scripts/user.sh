echo -ne  "
██    ██ ███████ ███████ ██████       ██████ ██████  ███████  █████  ████████ ███████ 
██    ██ ██      ██      ██   ██     ██      ██   ██ ██      ██   ██    ██    ██      
██    ██ ███████ █████   ██████      ██      ██████  █████   ███████    ██    █████   
██    ██      ██ ██      ██   ██     ██      ██   ██ ██      ██   ██    ██    ██      
 ██████  ███████ ███████ ██   ██      ██████ ██   ██ ███████ ██   ██    ██    ███████ 
"

echo -ne "
-------------------------------------------------------------------------
                    Enter Host Name
-------------------------------------------------------------------------"
read hostname
echo "{$hostname}" >> /etc/hostname
echo -ne "
-------------------------------------------------------------------------
            ---   Adding Root & User Account ---
-------------------------------------------------------------------------
"
echo -ne "
-------------------------------------------------------------------------
            ---   Enter Root password ---
-------------------------------------------------------------------------"

read -s root_password

echo root:{$root_password} | chpasswd

echo -ne "
-------------------------------------------------------------------------
            ---   Enter User Account Name --- 
-------------------------------------------------------------------------"
read -s user_name
useradd -m {$user_name}

echo -ne "
-------------------------------------------------------------------------
            ---   Enter User Account Password --- 
-------------------------------------------------------------------------"
read -s user_password
echo {$user_name}: {$user_password} | chpasswd
usermod -aG libvirt {$user_name}


echo -ne "
-------------------------------------------------------------------------
            ---  Adding Sudo Privileges to {$user_name} ---
-------------------------------------------------------------------------"

echo "{$user_name} chpasswdALL=(ALL) ALL" >> /etc/sudoers.d/{$user_name}

printf "\e[1;32mDone! \e[0m"