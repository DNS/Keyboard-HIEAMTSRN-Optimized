$VERSION = Get-Date -Format 'yyyy-M-d'

ri build -Recurse -Force -ErrorAction SilentlyContinue
md build -ErrorAction SilentlyContinue

tar -pcvzf "build/freebsd-console-$VERSION.tar.gz" freebsd-console
tar -pcvzf "build/netbsd-console-$VERSION.tar.gz" netbsd-console
tar -pcvzf "build/linux-console-$VERSION.tar.gz" linux-console
tar -pcvzf "build/unix-x11-xkb-$VERSION.tar.gz" unix-x11-xkb
tar -pcvzf "build/unix-xmodmap-$VERSION.tar.gz" unix-xmodmap

