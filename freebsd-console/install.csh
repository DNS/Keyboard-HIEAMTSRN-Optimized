#!/bin/csh

if ("`whoami`" != "root") then
    echo 'Please run as root'
    exit 1
endif


cp hieamtsrn.kbd /usr/share/syscons/keymaps/hieamtsrn.kbd
echo keymap=\"/usr/share/syscons/keymaps/hieamtsrn.kbd\" >> /etc/rc.conf
