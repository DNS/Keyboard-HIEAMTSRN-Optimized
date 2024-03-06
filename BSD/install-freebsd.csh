#!/bin/csh

cp hieamtsrn-freebsd.kbd /usr/share/syscons/keymaps/hieamtsrn-freebsd.kbd

echo keymap=\"/usr/share/syscons/keymaps/hieamtsrn-freebsd.kbd\" >> /etc/rc.conf
