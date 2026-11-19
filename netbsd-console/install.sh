#!/bin/sh

if [ "$(whoami)" != "root" ]; then
    echo 'Please run as root'
    exit 1
fi

cp hieamtsrn.mapfile /usr/share/wscons/keymaps/hieamtsrn.mapfile
echo 'mapfile /usr/share/wscons/keymaps/hieamtsrn.mapfile' >> /etc/wscons.conf
