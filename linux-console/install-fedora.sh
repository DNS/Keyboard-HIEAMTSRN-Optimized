#!/bin/bash


if [ "$(whoami)" != "root" ]; then
    echo 'Please run as root'
    exit 1
fi


if ! (cat /etc/os-release | grep -i '^ID' | cut -d= -f2 | tr -d '"' | grep -qiE 'rhel|fedora|rocky|centos'); then
	echo 'This installer is only works on Debian-based systems'
	exit 1
fi



# DEPENDENCIES
#apt install -y console-data

# INSTALLATION
mv hieamtsrn.kmap hieamtsrn.map
gzip -k hieamtsrn.map
cp -f hieamtsrn.kmap.gz /usr/lib/kbd/keymaps/i386/qwerty/hieamtsrn.map.gz

echo '' >> ~/.profile
echo 'loadkeys hieamtsrn' >> ~/.profile

#shutdown -r now



