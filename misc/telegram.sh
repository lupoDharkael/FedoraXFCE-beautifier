#! /bin/bash

wget https://github.com/telegramdesktop/tdesktop/releases/download/v1.1.23/tsetup.1.1.23.tar.xz -P /tmp && mkdir $HOME_/.telegram && tar xf /tmp/tsetup.1.0.14.tar.xz -C $HOME_/.telegram/ --strip-components=1 && $HOME_/.telegram/Telegram
