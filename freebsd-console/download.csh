#!/bin/csh

wget -cnd https://github.com/DNS/Keyboard-HIEAMTSRN-Optimized/raw/refs/heads/master/freebsd-console/hieamtsrn.kbd
cp hieamtsrn.kbd /usr/share/syscons/keymaps/hieamtsrn.kbd
echo keymap=\"/usr/share/syscons/keymaps/hieamtsrn.kbd\" >> /etc/rc.conf
