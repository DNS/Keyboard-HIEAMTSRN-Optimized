#!/usr/bin/env bash

# not tested !

# prompt: convert this pwsh script to bash, do not change the code structure, (use grep/sed, do not use perl/awk):


if [ "$(whoami)" != 'root' ]; then
	echo "This script must be run as root."
	exit 1
fi


if [ ! -e /usr/share/X11/xkb/rules/evdev.xml.OLD ]; then
	cp -f /usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml.OLD
fi

if [ ! -e /usr/share/X11/xkb/rules/evdev.lst.OLD ]; then
	cp -f /usr/share/X11/xkb/rules/evdev.lst /usr/share/X11/xkb/rules/evdev.lst.OLD
fi

if [ ! -e /usr/share/X11/xkb/symbols/us.OLD ]; then
	cp -f /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.OLD
fi


####################

if grep -q '<name>HIEAMTSRN</name>' /usr/share/X11/xkb/rules/evdev.xml; then
	echo "HIEAMTSRN already exists in /usr/share/X11/xkb/rules/evdev.xml. Skipping replacement."
else
	# Insert the HIEAMTSRN <variant> block before the <variant> that holds the chr entry
	sed -i.bak '
/^        <variant>$/{
N
N
/\n          <configItem>\n            <name>chr<\/name>$/{
i\
\        <variant>\
\          <configItem>\
\            <name>HIEAMTSRN</name>\
\            <!-- Keyboard indicator for HIEAMTSRN Optimized layouts -->\
\            <shortDescription>HIEAMTSRN</shortDescription>\
\            <description>HIEAMTSRN Optimized</description>\
\            <languageList>\
\              <iso639Id>HIEAMTSRN</iso639Id>\
\            </languageList>\
\          </configItem>\
\        </variant>
}
}
' /usr/share/X11/xkb/rules/evdev.xml && rm -f /usr/share/X11/xkb/rules/evdev.xml.bak
fi


####################

if grep -q 'HIEAMTSRN' /usr/share/X11/xkb/rules/evdev.lst; then
	echo "HIEAMTSRN already exists in /usr/share/X11/xkb/rules/evdev.lst. Skipping replacement."
else
	sed -i.bak 's/^  chr             us: Cherokee$/  HIEAMTSRN       us: English (HIEAMTSRN)\
&/' /usr/share/X11/xkb/rules/evdev.lst && rm -f /usr/share/X11/xkb/rules/evdev.lst.bak
fi


####################

if grep -q 'HIEAMTSRN' /usr/share/X11/xkb/symbols/us; then
	echo "HIEAMTSRN already exists in /usr/share/X11/xkb/symbols/us. Skipping replacement."
else
	printf '\n\n\n' >> /usr/share/X11/xkb/symbols/us
	cat ./HIEAMTSRN.xkb >> /usr/share/X11/xkb/symbols/us
fi

####################