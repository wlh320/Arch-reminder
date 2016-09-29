#!/bin/sh
# Caution: Only fit my PC!
#          DO NOT EXECUTE IT IF YOU DON'T KNOW WHAT IT DO!

echo "--Config system--"

echo "1.Config language and timezone"
mv /etc/locale.gen /etc/locale.gen.bak
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_TW.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
echo "done!"
echo "-----------------------------------------"

echo "2.Set password"
passwd
echo "done!"
echo "-----------------------------------------"

echo "3.Set hostname"
echo "wlh-PC" >> /etc/hostname
mv /etc/hosts /etc/hosts.bak
echo "127.0.0.1	localhost.localdomain  localhost	wlh-PC" > /etc/hosts
echo "::1		localhost.localdomain  localhost	wlh-PC" >> /etc/hosts
echo "done!"
echo "-----------------------------------------"

echo "4.Install boot loader - [[refind]]"
pacman -S os-prober ntfs-3g efibootmgr refind-efi iw wpa_supplicant dialog
systemctl enable dhcpcd.service
echo "done!"
echo "-----------------------------------------"

echo "Then reboot and execute post-install.sh!"
