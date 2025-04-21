<#

https://unix.stackexchange.com/questions/51804/how-can-i-install-a-new-keyboard-layout-in-kde-4

#>
 
Copy-Item -Path /usr/share/X11/xkb/rules/evdev.xml -Destination /usr/share/X11/xkb/rules/evdev.xml.OLD
Copy-Item -Path /usr/share/X11/xkb/rules/evdev.lst -Destination /usr/share/X11/xkb/rules/evdev.lst.OLD
Copy-Item -Path /usr/share/X11/xkb/symbols/us -Destination /usr/share/X11/xkb/symbols/us.OLD

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

$evdev_xml = Get-Content -Raw /usr/share/X11/xkb/rules/evdev.xml
$evdev_xml -replace $xml1, $xml2 | Out-File /usr/share/X11/xkb/rules/evdev.xml


####################


$lst1 = '  chr             us: Cherokee'
$lst2 = @'
  HIEAMTSRN             us: English (HIEAMTSRN)
  chr             us: Cherokee
'@


$evdev_lst = Get-Content -Raw /usr/share/X11/xkb/rules/evdev.lst
$evdev_lst -replace $lst1, $lst2 | Out-File /usr/share/X11/xkb/rules/evdev.lst





####################

"`n`n`n" | Add-Content /usr/share/X11/xkb/symbols/us
Get-Content -Raw ./HIEAMTSRN.xkb | Add-Content /usr/share/X11/xkb/symbols/us


####################



