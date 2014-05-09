#!/bin/sh

# Part of passwordless cryptofs setup in Debian Etch.
# See: http://wejn.org/how-to-make-passwordless-cryptsetup.html
# Author: Wejn <wejn at box dot cz>

if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
	KEYF=dd.key
else
	KEYF=$1
fi
MD=/tmp-usb-mount
echo "Trying to get the key from USB keychain ..." >&2
mkdir -p $MD
modprobe usb-storage >/dev/null 2>&1
modprobe vfat >/dev/null 2>&1

cat <<EOF >&2
[33m
 ad8888888888ba
dP           "8b,
8  ,aaa,       "Y888a     ,aaaa,     ,aaa,  ,aa,
8  8   8           "8baaaad""""baaaad""""baad""8b
8  8   8              """"      """"      ""    8b
8  8, ,8         ,aaaaaaaaaaaaaaaaaaaaaaaaddddd88P
8   """        ,d8""
Yb,         ,ad8"   
 "Y8888888888P"
[00m
EOF
sleep 5
mount -t vfat /dev/sdb1 $MD 
cat /$MD/dd.key
umount $MD >/dev/null 2>&1
echo "key loaded" >&2
