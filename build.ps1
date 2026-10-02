$VERSION = Get-Date -Format 'yyyy-M-d'

ri build -Recurse -Force -ErrorAction SilentlyContinue
md build -ErrorAction SilentlyContinue

tar -pcvzf "build/hieamtsrn-freebsd-console-$VERSION.tar.gz" freebsd-console
tar -pcvzf "build/hieamtsrn-netbsd-console-$VERSION.tar.gz" netbsd-console
tar -pcvzf "build/hieamtsrn-linux-console-$VERSION.tar.gz" linux-console
tar -pcvzf "build/hieamtsrn-unix-x11-xkb-$VERSION.tar.gz" unix-x11-xkb
tar -pcvzf "build/hieamtsrn-unix-xmodmap-$VERSION.tar.gz" unix-xmodmap

