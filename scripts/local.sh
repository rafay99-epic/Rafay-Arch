ln -sf /usr/share/zoneinfo/Asia/Karachi /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us_CH-latin1" >> /etc/vconsole.conf