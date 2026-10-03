#!/usr/bin/bash


if cat /etc/os-release | grep -qi debian;  then 
	#echo 'running on debian'
else
	echo 'this installer is only for debian'
	exit 1
fi


if whoami | grep -qi 'root'; then
	apt install -y console-data
	
	gzip -k hieamtsrn.kmap
	cp -f hieamtsrn.kmap.gz /usr/share/keymaps/i386/qwerty/hieamtsrn.kmap.gz
	
	'#!/bin/sh' >> /etc/rc.local
	'loadkeys hieamtsrn' >> /etc/rc.local
	chmod +x /etc/rc.local

	shutdown -r now
else
	echo 'not root'
	exit 1
fi
