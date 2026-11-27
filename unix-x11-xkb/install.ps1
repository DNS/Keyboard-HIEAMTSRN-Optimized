<#

Tested & compatible with:
	- Linux
	- FreeBSD
	- NetBSD

#>


# https://unix.stackexchange.com/questions/51804/how-can-i-install-a-new-keyboard-layout-in-kde-4



if ($(whoami) -ne 'root') {
	Write-Host "This script must be run as root."
	exit 1
}


if (-not (Test-Path -Path /usr/share/X11/xkb/rules/evdev.xml.OLD)) {
	Copy-Item -Force -Path /usr/share/X11/xkb/rules/evdev.xml -Destination /usr/share/X11/xkb/rules/evdev.xml.OLD
}

if (-not (Test-Path -Path /usr/share/X11/xkb/rules/evdev.lst.OLD)) {
	Copy-Item -Force -Path /usr/share/X11/xkb/rules/evdev.lst -Destination /usr/share/X11/xkb/rules/evdev.lst.OLD
}

if (-not (Test-Path -Path /usr/share/X11/xkb/symbols/us.OLD)) {
	Copy-Item -Force -Path /usr/share/X11/xkb/symbols/us -Destination /usr/share/X11/xkb/symbols/us.OLD
}


####################

$evdev_xml = Get-Content -Raw /usr/share/X11/xkb/rules/evdev.xml

$xml1 = @'
        <variant>
          <configItem>
            <name>chr</name>
'@

$xml2 = @'
        <variant>
          <configItem>
            <name>HIEAMTSRN</name>
            <!-- Keyboard indicator for HIEAMTSRN Optimized layouts -->
            <shortDescription>HIEAMTSRN</shortDescription>
            <description>HIEAMTSRN Optimized</description>
            <languageList>
              <iso639Id>HIEAMTSRN</iso639Id>
            </languageList>
          </configItem>
        </variant>
        <variant>
          <configItem>
            <name>chr</name>
'@

if (Get-Content -Raw /usr/share/X11/xkb/rules/evdev.xml -match '<name>HIEAMTSRN</name>') {
	Write-Host "HIEAMTSRN already exists in /usr/share/X11/xkb/rules/evdev.xml. Skipping replacement."
} else {
	$evdev_xml = Get-Content -Raw /usr/share/X11/xkb/rules/evdev.xml
	$evdev_xml -replace $xml1, $xml2 | Out-File /usr/share/X11/xkb/rules/evdev.xml
}



####################


$lst1 = '  chr             us: Cherokee'
$lst2 = @'
  HIEAMTSRN       us: English (HIEAMTSRN)
  chr             us: Cherokee
'@

if (Get-Content -Raw /usr/share/X11/xkb/rules/evdev.lst -match 'HIEAMTSRN') {
	Write-Host "HIEAMTSRN already exists in /usr/share/X11/xkb/rules/evdev.lst. Skipping replacement."
} else {
	$evdev_lst = Get-Content -Raw /usr/share/X11/xkb/rules/evdev.lst
	$evdev_lst -replace $lst1, $lst2 | Out-File /usr/share/X11/xkb/rules/evdev.lst
}






####################


if (Get-Content -Raw /usr/share/X11/xkb/symbols/us -match 'HIEAMTSRN') {
	Write-Host "HIEAMTSRN already exists in /usr/share/X11/xkb/symbols/us. Skipping replacement."
} else {
	"`n`n`n" | Add-Content /usr/share/X11/xkb/symbols/us
	Get-Content -Raw ./HIEAMTSRN.xkb | Add-Content /usr/share/X11/xkb/symbols/us
}

####################



