#!/usr/bin/bash

echo 'run as root'

apt install -y console-data
gzip -k HIEAMTSRN.kmap
cp -f HIEAMTSRN.kmap.gz /usr/share/keymaps/i386/qwerty/HIEAMTSRN.kmap.gz
loadkeys HIEAMTSRN


