#!/bin/sh
# Caution: Only fit my PC!
#          DO NOT EXECUTE IT IF YOU DON'T KNOW WHAT IT DO!
echo "--Install useful packages--"
sudo pacman -S vim os-prober ntfs-3g efibootmgr yaourt refind-efi iw wpa_supplicant dialog \
rp-pppoe archlinuxcn-keyring xorg-server deepin wqy-microhei deepin-terminal screenfetch \
noto-fonts xorg-utils firefox flashplugin google-chrome wiznote netease-cloud-music \
sublime-text-dev-zh-cn curl wget aria2 zsh git gtk-engine-murrine wps-office bumblebee mesa \
xf86-video-intel nvidia xf86-input-synaptics fcitx-sogoupinyin acpi fcitx-configtool fcitx-im \
fcitx-configtool bbswitch lm_sensors qtcreator jdk nodejs ipython npm mariadb apache php \
xfce4-taskmanager imagemagick python-gobject python2-gobject python2-xdg autojump \
freetype2-infinality-ultimate fontconfig-infinality-ultimate noto-fonts-cjk \
tar unrar unzip xarchiver zip p7zip thunderbird thunderbird-i18n-zh-cn gnome-keyring \
linux-headers seahorse  noto-fonts tlp ethtool python-requests python-beautifulsoup4 \
python-numpy cppcheck clang gdb ranger ttf-ms-fonts libotf opendesktop-fonts lua openssh \
openssl cowsay dnsmasq htop foxitreader virtualbox virtualbox-host-modules-arch \
virtualbox-ext-oracle qt5ct graphviz dia cmake codeblocks gparted figlet
echo "done!"
echo "---------------------------------\n"
echo "Enable lightdm after boot:"
systemctl enable lightdm
echo "done!"
figlet "Enjoy Archlinux!"
