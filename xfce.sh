#! /bin/bash

#cp --remove-destination wallpaper.jpg /usr/share/backgrounds/
 
dnf config-manager --add-repo http://download.opensuse.org/repositories/home:snwh:paper/Fedora_25/home:snwh:paper.repo

dnf upgrade -y

REMOVE="leafpad abiword gnumeric pragha"
dnf remove -y $REMOVE

INSTALL="gimp vim htop git preload libreoffice gstreamer1-plugin-mpg123 arc-theme paper-icon-theme lightdm-gtk-greeter-settings breeze-cursor-theme"
dnf install -y $INSTALL &&
systemctl enable preload && systemctl start preload

# modify bashrc
echo "Configuring custom terminal prompt."
echo "" >> $HOME/.bashrc &&
BASHRC='export PS1="\[$(tput bold)\]\[\033[38;5;68m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;28m\]\h\[$(tput sgr0)\]\[\033[38;5;69m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]\w\[$(tput bold)\]:\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"'
echo $BASHRC >> $HOME/.bashrc

# libreoffice icon set
echo "Setting Libreoffice's icon theme."
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-libreoffice-theme/master/install-papirus-root.sh | sh

mkdir -p $HOME/.config/libreoffice/4/user/ &&
cp --remove-destination registrymodifications.xcu $HOME/.config/libreoffice/4/user/registrymodifications.xcu

# set QT theme
echo "Setting QT theme."
dnf install -y qt5-qtstyleplugins qtcurve-qt5 qt5ct qgnomeplatform &&
echo "" >> $HOME/.bashrc &&
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> $HOME/.bashrc &&
mkdir -p $HOME/.config/qt5ct &&
cp --remove-destination qt5ct.conf $HOME/.config/qt5ct/ &&
source $HOME/.bashrc

# icon cache
gtk-update-icon-cache /usr/share/icons/Paper/

# login conf
echo "Configuring new loging theme."
sed -i 's/.*/[greeter]\nbackground = \/usr\/share\/backgrounds\/default.png\ntheme-name = Arc-Dark\nicon-theme-name = Paper\ndefault-user-image = #stellarium/' /etc/lightdm/lightdm-gtk-greeter.conf

# deletes cached sessions
echo "Deleting cached sessions."
rm -r $HOME/.cache/sessions/

# change screensaver configuration
echo "Configuring screensaver."
cp --remove-destination xscreensaver $HOME/.xscreensaver 


echo "Configuring xfce4."
su $1 -m -c 'xfconf-query -c xfce4-session -p /general/SaveOnExit -s false -n
    
    # visuals
    xfconf-query -c xsettings -p /Net/ThemeName -t string -s "Arc-Dark" -n
    xfconf-query -c xsettings -p /Net/IconThemeName -t string -s "Paper" -n
    xfconf-query -c xsettings -p /Gtk/ButtonImages -t string -s false -n
    xfconf-query -c xsettings -p /Gtk/CursorThemeName -t string -s "breeze_cursors" -n
    xfconf-query -c xfwm4 -p /general/theme -t string -s "Arc-Dark" -n
    xfconf-query -c xsettings -p /Gtk/FontName -t string -s "FreeSans 10" -n

    # panels
    xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior -t int -s 2 -n
    xfconf-query -c xfce4-panel -p /panels/panel-2/background-alpha -t int -s 60 -n
    xfconf-query -c xfce4-panel -p /panels/panel-2/position -s "p=6;x=0;y=0"
    xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -t int -s 1 -n
    xfconf-query -c xfce4-panel -p /panels/panel-1/position -s "p=10;x=0;y=0"
    xfconf-query -c xfce4-panel -p /plugins/plugin-1 -s "whiskermenu"
    xfconf-query -c xfce4-panel -p /plugins/plugin-8 -t string -s "pulseaudio" -n
    
    xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -rR
    xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -t int -s 1 -t int -s 3 -t int -s 15 -t int -s 4 -t int -s 8 -t int -s 5 -t int -s 6 -t int -s 2 --create
    
    xfconf-query -c xfce4-panel -p /panels/panel-2/plugin-ids -rR
    xfconf-query -c xfce4-panel -p /panels/panel-2/plugin-ids -t int -s 10 -t int -s 11 --create
    
    # desktop
    xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -t bool -s false -n
    xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -t bool -s false -n
    xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -t bool -s false -n
    
    # shortcuts
    xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Super_L -t string -s /usr/bin/xfce4-popup-whiskermenu -n
    xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Print -t string -s "xfce4-screenshooter -r -c" -n
    xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/\<Primary\>\<Alt\>t -t string -s xfce4-terminal -n
    xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/F12 -t string -s "xfce4-terminal --drop-down" -n
    xfce4-panel -r'
    
    #wallpaper
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /usr/share/backgrounds/wallpaper.jpg -t string -n
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/wallpaper.jpg
    
    
cp --remove-destination whiskermenu-1.rc $HOME/.config/xfce4/panel/

# update locate database
echo "Updating locate's database."
updatedb

notify-send -i appointment -u critical "You may need to log out to enjoy the new configuration"
