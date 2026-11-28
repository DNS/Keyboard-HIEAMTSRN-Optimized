#!/bin/sh
# curl -fsSL https://example.com/install.sh | sh

# https://api.github.com/repos/DNS/Keyboard-HIEAMTSRN-Optimized/releases


#wget -cnd (irm https://api.github.com/repos/DNS/Keyboard-HIEAMTSRN-Optimized/releases/latest | % assets | % browser_download_url | sls freebsd)

if [ "$(whoami)" != "root" ]; then
    echo 'Please run as root'
    exit 1
fi


os_id=$(cat /etc/os-release | grep -i '^ID' | cut -d= -f2 | tr -d '"')
latest=$(curl -fsSL https://api.github.com/repos/DNS/Keyboard-HIEAMTSRN-Optimized/releases/latest | grep -oE '"browser_download_url": *"[^"]+"' | grep -oE 'https://[^"]+')

if ! (os_id | grep -qiE 'debian|ubuntu'); then
	# download the latest release for Linux console and X11 XKB
	echo "$latest" | grep -E 'linux-console|x11-xkb' | while read -r url; do curl -fL -C - -O "$url"; done
	
	# install
	ls hieamtsrn-*.tar.gz | xargs -I{} tar -xzf {}
	cd linux-console
	chmod +x *.sh
	./install.sh
	cd ../unix-x11-xkb
	chmod +x *.sh
	./install.sh
	cd ..;
elif ! (os_id | grep -qiE 'freebsd'); then
	# download the latest release for FreeBSD console and X11 XKB
	echo "$latest" | grep -E 'freebsd-console|x11-xkb' | while read -r url; do curl -fL -C - -O "$url"; done

	# install
	ls hieamtsrn-*.tar.gz | xargs -I{} tar -xzf {}
	cd freebsd-console
	chmod +x *.csh
	./install.csh
	cd ../unix-x11-xkb
	chmod +x *.sh
	./install.sh
	cd ..;
elif ! (os_id | grep -qiE 'netbsd'); then
	# download the latest release for NetBSD console and X11 XKB
	echo "$latest" | grep -E 'netbsd-console|x11-xkb' | while read -r url; do curl -fL -C - -O "$url"; done

	# install
	ls hieamtsrn-*.tar.gz | xargs -I{} tar -xzf {}
	cd netbsd-console
	chmod +x *.sh
	./install.sh
	cd ../unix-x11-xkb
	chmod +x *.sh
	./install.sh
	cd ..;
fi

