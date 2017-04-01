#! /bin/bash

wget https://updates.tdesktop.com/tlinux/tsetup.1.0.14.tar.xz -P /tmp && mkdir $HOME_/.telegram && tar xf /tmp/tsetup.1.0.14.tar.xz -C $HOME_/.telegram/ --strip-components=1 && $HOME_/.telegram/Telegram  
