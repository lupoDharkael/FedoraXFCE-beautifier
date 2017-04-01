#! /bin/bash

HOME_="$(su $1 -c "echo ~")"

#cp wallpaper.jpg /usr/share/backgrounds/

#https://github.com/numixproject/numix-icon-theme-circle
 
dnf copr enable numix/numix
dnf config-manager --add-repo http://download.opensuse.org/repositories/home:snwh:paper/Fedora_25/home:snwh:paper.repo
dnf upgrade -y
dnf remove -y \
    geany \
    abiword \
    gnumeric \
    pragha

dnf install -y \
    #@virtualization \
    #gnome-packagekit-updater \
    gimp \
    vim \
    htop \
    git \
    preload \
    libreoffice \
    clementine \
    shutter \
    tmux \
    gstreamer1-plugin-mpg123 \
    arc-theme \
    install numix-icon-theme-circle \
    paper-icon-theme \
    lightdm-gtk-greeter-settings \
    breeze-cursor-theme \
    
systemctl enable preload
systemctl start preload

# modify bashrc
echo "" >> $HOME_/.bashrc
echo 'export PS1="\[$(tput bold)\]\[\033[38;5;68m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;28m\]\h\[$(tput sgr0)\]\[\033[38;5;69m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]\w\[$(tput bold)\]:\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> $HOME_/.bashrc

# login conf
sed -i 's/.*/[greeter]\nbackground = \/usr\/share\/backgrounds\/wallpaper.jpg\ntheme-name = Arc-Dark\nicon-theme-name = Paper\ndefault-user-image = #stellarium/' /etc/lightdm/lightdm-gtk-greeter.conf

#wget https://updates.tdesktop.com/tlinux/tsetup.1.0.14.tar.xz -P /tmp && mkdir $HOME_/.telegram && tar xf /tmp/tsetup.1.0.14.tar.xz -C $HOME_/.telegram/ --strip-components=1 && $HOME_/.telegram/Telegram 

# TODO Panel/Elements/Menu Whishker
# TODO wallpaper(Unique xmatrix)

# visuals
su $1 -c 'xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
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
    xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/F12 -t string -s "xfce4-terminal --drop-down" -n'

    #wallpaper
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /usr/share/backgrounds/wallpaper.jpg -t string -n
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/wallpaper.jpg
