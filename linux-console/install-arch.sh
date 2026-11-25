#!/bin/bash


if [ "$(whoami)" != "root" ]; then
    echo 'Please run as root'
    exit 1
fi


if ! (cat /etc/os-release | grep -i '^ID' | cut -d= -f2 | tr -d '"' | grep -qiE 'arch'); then
	echo 'This installer is only works on Arch-based systems'
	exit 1
fi



# DEPENDENCIES
apt install -y console-data

# INSTALLATION
gzip -k hieamtsrn.kmap
cp -f hieamtsrn.kmap.gz /usr/share/keymaps/i386/qwerty/hieamtsrn.kmap.gz

echo '' >> ~/.profile
echo 'loadkeys hieamtsrn' >> ~/.profile

#shutdown -r now
