#!/bin/csh

cp hieamtsrn-freebsd.kbd /usr/share/syscons/keymaps/hieamtsrn-freebsd.kbd
sysrc keymap="/usr/share/syscons/keymaps/hieamtsrn-freebsd.kbd"

printf '\n\n\n\n\n' >> /usr/local/share/X11/xkb/symbols/us
cat HIEAMTSRN >> /usr/local/share/X11/xkb/symbols/us

