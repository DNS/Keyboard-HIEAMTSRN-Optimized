# HIEAMTSRN - Optimized Keyboard Layout

HIEAMTSRN is an optimized keyboard layout created by Sasha Viminitz, optimized by Daniel Sirait. 

The 'J', 'F', 'B' are arranged to make better typing experience when writing english text.

The Windows version created using [MSKLC](https://www.microsoft.com/en-us/download/details.aspx?id=102134).

# **Download:** [**HIEAMTSRN-Optimized.zip**](https://github.com/dns/Keyboard-HIEAMTSRN-Optimized/releases/download/v2.0/HIEAMTSRN-Optimized.zip)


**HIEAMTSRN-Standard Keyboard Layout**

![HIEAMTSRN-Standard layout.png](https://raw.githubusercontent.com/dns/Keyboard-HIEAMTSRN-SiraitX/master/HIEAMTSRN-Standard%20layout.png)

**HIEAMTSRN-AltGr Keyboard Layout**

![HIEAMTSRN-AltGr layout.png](https://raw.githubusercontent.com/dns/Keyboard-HIEAMTSRN-SiraitX/master/HIEAMTSRN-AltGr%20layout.png)


**Windows install:**

>Run setup.exe to install keyboard layout.

FreeBSD/GhostBSD (with X) usage:

>`xmodmap /path/to/hieamtsrn-bsd.xmodmap`

FreeBSD/GhostBSD use older version of XKeyCaps 2.46, it's not compatible with newer 2.47.

**FreeBSD (console/without X) install:**

>`# chmod +x install-freebsd.sh`
>`# ./install-freebsd.sh`
>`# shutdown -r now`

**NetBSD (console/without X) install:**

>`# chmod +x install-freebsd.sh`
>`# ./install-freebsd.sh`
>`# shutdown -r now`

**Linux (Debian, with X) usage:**

>`xmodmap /path/to/hieamtsrn-bsd.xmodmap`

Run `xmodmap hieamtsrn-linux.xmodmap` as startup command in Settings > Startup Applications.

**Cygwin/X usage:**

>`xmodmap /path/to/hieamtsrn-cygwin.xmodmap`

Copyright (c) 2019-2021 by Daniel Sirait
