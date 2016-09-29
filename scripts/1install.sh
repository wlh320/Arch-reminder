#!/bin/sh
# Caution: Only fit my PC!
#          DO NOT EXECUTE IT IF YOU DON'T KNOW WHAT IT DO!
echo "--Install Archlinux--"

echo "Step 1 - mount partitions"
# /
mount /dev/sda5 /mnt
# boot
mkdir -p /mnt/boot
mount /dev/sda2 /mnt/boot
# home
mkdir -p /mnt/home
mount /dev/sda6 /mnt/home
swapon /dev/sda9
lsblk
echo "done!"
echo "-----------------------------------------"

echo "Step 2 - add mirrorlist"
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo "Server = http://mirrors.163.com/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
echo "Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist
echo "done!"
echo "-----------------------------------------"

echo "Step 3 - install base system"
pacstrap -i /mnt base base-devel
echo "done!"
echo "-----------------------------------------"

echo "Step 4 - generate fstab"
genfstab -U -p /mnt > /mnt/etc/fstab
echo "done!"

arch-chroot /mnt /bin/bash

