#! /bin/bash

# Panel/Elements/Menu Whishker
# wallpaper(Unique xmatrix)

# visuals
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Paper"
xfconf-query -c xsettings -p /Gtk/ButtonImages -s false
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "breeze_cursors"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark"
xfconf-query -c xsettings -p /Gtk/FontName -s "FreeSans 10"
# panels
xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior -t int -s 1 -n
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -t int -s 1 -n

# shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Super_L -t string -s /usr/bin/xfce4-popup-whiskermenu -n

xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/\<Primary\>\<Alt\>t -t string -s xfce4-terminal -n
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/F12 -t string -s 'xfce4-terminal --drop-down' -n

#wallpaper
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /usr/share/backgrounds/wallpaper.jpg -t string -n

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/wallpaper.jpg
