#!/bin/csh

cp hieamtsrn.kbd /usr/share/syscons/keymaps/hieamtsrn.kbd

echo keymap=\"/usr/share/syscons/keymaps/hieamtsrn.kbd\" >> /etc/rc.conf
