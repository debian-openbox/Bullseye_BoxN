#! /bin/bash

#annoying beep no more
xset b off &
### polkit agent
sparky-polkit &

nitrogen --restore &

export PATH="${PATH}:$HOME/.scripts"

tint2 &

~/keyboard.sh

fbxkb &

### networkmanager tray applet
if [ -f /opt/sparky/nm-applet-reload ]; then
/opt/sparky/nm-applet-reload &
fi
### power manager - particularly important for laptop users
if [ -f /usr/bin/xfce4-power-manager ]; then
/usr/bin/xfce4-power-manager &
fi
### creates a full suite of localized default user directories within the $HOME directory
if [ -f /usr/bin/xdg-user-dirs-update ]; then
/usr/bin/xdg-user-dirs-update &
fi

#~/conkystartup.sh
sleep 10 && /usr/bin/conky-session &

### audio tray applet
sleep 5 && pnmixer &

udiskie &

package-update-indicator &

compton -cC -i 0.85 -e 0.85 -m 0.9 -r 4 -l -4 -t -4 &
# $HOME/bin/start-compton.sh &

# Start screensaver
xscreensaver -no-splash &

# Turn on Numlock at start-up
numlockx on &
