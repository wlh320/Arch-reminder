#!/bin/sh
# Caution: Only fit my PC!
#          DO NOT EXECUTE IT IF YOU DON'T KNOW WHAT IT DO!
echo "--Post-install-config--"
echo "1.add a user"
useradd -m -G wheel -s /bin/bash wlh
passwd wlh
echo "done!"
echo "check if '%wheel ALL=(ALL) ALL' is uncomment"
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
visudo
echo "done!"
echo "-----------------------------------------"

echo "2. add archlinuxcn and infinality-bundle"
mv /etc/pacman.conf /etc/pacman.conf.bak
echo "[archlinuxcn]" >> /etc/pacman.conf
echo "SigLevel = Optional TrustedOnly" >> /etc/pacman.conf
echo "Server = http://mirrors.163.com/archlinux-cn/$arch" >> /etc/pacman.conf
echo "[infinality-bundle]" >> /etc/pacman.conf
echo "Server = http://bohoomil.com/repo/$arch" >> /etc/pacman.conf
echo "Add trust:"
pacman -S archlinuxcn-keyring
pacman-key -r 962DDE58
pacman-key -f 962DDE58
pacman-key --lsign-key 962DDE58
echo "done!"
echo "-----------------------------------------"
echo "Now you can install packages"



