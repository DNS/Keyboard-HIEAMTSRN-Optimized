#!/usr/bin/bash

echo 'run as root'

apt install -y console-data
gzip -k hieamtsrn.kmap
cp -f hieamtsrn.kmap.gz /usr/share/keymaps/i386/qwerty/hieamtsrn.kmap.gz
loadkeys hieamtsrn


