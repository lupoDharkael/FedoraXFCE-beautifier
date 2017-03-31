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
    guake \
    gimp \
    htop \
    terminator \
    git \
    preload \
    libreoffice \
    clementine \
    gstreamer1-plugin-mpg123 \
    arc-theme \
    install numix-icon-theme-circle \
    paper-icon-theme \
    lightdm-gtk-greeter-settings \
    breeze-cursor-theme \
    terminology
    #dnf install @virtualization
    #sudo dnf install gnome-packagekit-updater
    
systemctl enable preload
systemctl start preload

cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

# modify bashrc
echo "" >> $HOME_/.bashrc
echo 'export PS1="\[$(tput bold)\]\[\033[38;5;68m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;28m\]\h\[$(tput sgr0)\]\[\033[38;5;69m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;68m\]\w\[$(tput bold)\]:\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> $HOME_/.bashrc

# login conf
sed -i 's/.*/[greeter]\nbackground = \/usr\/share\/backgrounds\/wallpaper.jpg\ntheme-name = Arc-Dark\nicon-theme-name = Paper\ndefault-user-image = #stellarium/' /etc/lightdm/lightdm-gtk-greeter.conf

# telegram
#wget https://updates.tdesktop.com/tlinux/tsetup.1.0.14.tar.xz -P /tmp && mkdir $HOME_/.telegram && tar xf /tmp/tsetup.1.0.14.tar.xz -C $HOME_/.telegram/ --strip-components=1 && $HOME_/.telegram/Telegram 

