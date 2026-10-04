#!/bin/bash

if ! (cat /etc/os-release | grep -i '^ID' | cut -d= -f2 | tr -d '"' | grep -qiE 'debian'); then
	echo 'only for debian'
	exit 1
fi


if whoami | grep -qi 'root'; then
	apt install -y console-data
	
	gzip -k hieamtsrn.kmap
	cp -f hieamtsrn.kmap.gz /usr/share/keymaps/i386/qwerty/hieamtsrn.kmap.gz
	
	echo '#!/bin/sh' >> /etc/rc.local
	echo 'loadkeys hieamtsrn' >> /etc/rc.local
	chmod +x /etc/rc.local

	shutdown -r now
else
	echo 'Please run as root'
	exit 1
fi
