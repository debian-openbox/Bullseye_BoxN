#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts
sudo chmod -R 755 ~/.scripts

sudo chown -R $(logname):$(logname) /home/$(logname)/
find ~/Sparky_BoxN -type d -exec chmod 755 {} \;
find ~/Sparky_BoxN -type f -exec chmod 755 {} \;

#sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free
#cd ~/Sparky_BoxN/scripts
#sudo ./non-free.sh

sudo apt-get update

sudo apt install -y  mpd ncmpcpp geany terminator nmap net-tools libglu1-mesa fbxkb mpv mlocate vlc apt-file xutils mesa-utils dnsutils xfburn simplescreenrecorder htop apt-rdepends compton compton-conf firefox-esr xsel numlockx sysstat acpi hardinfo hddtemp gnome-disk-utility python3-pip fonts-ubuntu fonts-ubuntu-console suckless-tools sxiv xsettingsd git wmctrl arc-theme oxygen-icon-theme psmisc flameshot package-update-indicator && sudo apt install -y ttf-mscorefonts-installer && sudo apt install -y qbittorrent  --no-install-recommends pcmanfm-qt --no-install-recommends

cp -Rp ~/Sparky_BoxN/.config ~/

cp -p ~/Sparky_BoxN/.Xresources ~/

cp -p ~/Sparky_BoxN/keyboard.sh ~/

sudo cp -p ~/Sparky_BoxN/rs.png /usr/share/fbxkb/images/rs.png

sudo cp ~/Sparky_BoxN/ncmpcpp.svg /usr/share/icons

#sudo chmod 755 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

#sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Sparky_BoxN/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Sparky_BoxN/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Sparky_BoxN/start-compton.sh ~/bin
sudo chmod -R 755 ~/bin

## instalacija ncmpcpp
cp -Rp ~/Sparky_BoxN/.ncmpcpp ~/
cp -Rp ~/Sparky_BoxN/.mpd ~/
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp.svg" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp -p ~/Sparky_BoxN/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp -p ~/Sparky_BoxN/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
# cp -p ~/Sparky_BoxN/scripts/settings_geany ~/.scripts
# cd ~/.scripts
# sudo ./settings_geany

# cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
# sudo ./install.sh

cd /home/$(logname)/Sparky_BoxN/scripts && sudo ./wps-office.sh
cd /home/$(logname)/Reports
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cd /home/$(logname)/Sparky_BoxN/scripts/
sudo ./install_missing_wps_fonts.sh

# dt-dark-theme
# cp -pR /home/$(logname)/Sparky_BoxN/.themes /home/$(logname)/


# cd ~/projects/debian-openbox/10_openbox_conky
# sudo ./install.sh

# cd ~/projects/debian-openbox/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_nomacs-viewer
# sudo ./install.sh
# sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openbox/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Sparky_BoxN/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Sparky_BoxN/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Sparky_BoxN/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

#sudo chmod --recursive 777 ~/.config

## setting default text editor
xdg-mime default pcmanfm-qt.desktop inode/directory


## settings htop.desktop & ranger.desktop files
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

#echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

#sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

#sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

#sudo sed -i 's!Icon=pnmixer!Icon=/usr/share/icons/Arc-Darkest-Suru/categories/16/pnmixer.svg!' /usr/share/applications/pnmixer.desktop
#sudo sed -i 's!Icon=nm-device-wireless!Icon=/usr/share/icons/Arc-Darkest-Suru/categories/16/networkmanager.svg!' /usr/share/applications/nm-applet.desktop

sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

# replace thunar with pcmanfm-qt
#sed -i '/thunar --daemon &/c\pcmanfm-qt --desktop &' ~/.config/openbox/autostart.sh
sed -i 's!sparky-fileopen!pcmanfm-qt!' ~/.config/jgmenu/prepend.csv



cd ~/Sparky_BoxN/scripts/openbox_conky
sudo ./install.sh

cd ~/Sparky_BoxN/scripts/install_vim/
sudo ./install.sh

#sudo chown -R $(logname):$(logname) /home/$(logname)/
#find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
#find /home/$(logname) -type f | xargs sudo chmod 700

