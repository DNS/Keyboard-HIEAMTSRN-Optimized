#!/bin/bash

if ! (cat /etc/os-release | grep -i '^ID' | cut -d= -f2 | tr -d '"' | grep -qiE 'debian'); then
	echo 'This installer is only works on Debian-based systems'
	exit 1
fi


if whoami | grep -qi 'root'; then
	apt install -y console-data
	
	gzip -k hieamtsrn.kmap
	cp -f hieamtsrn.kmap.gz /usr/share/keymaps/i386/qwerty/hieamtsrn.kmap.gz
	
	echo '' >> ~/.profile
	echo 'loadkeys hieamtsrn' >> ~/.profile

	shutdown -r now
else
	echo 'Please run as root'
	exit 1
fi
