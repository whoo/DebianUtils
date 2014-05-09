#!/bin/bash


# Gen Key + Addit to you device
#dd if=/dev/urandom of=file.key bs=1024 count=4
#cryptsetup luksAddKey /dev/sda5 file.key
#cp file.key /mnt/usb/



#Adding module
cat <<EOF | tee -a /etc/initramfs-tools/modules
vfat
fat
nls_cp437
nls_iso8898_1
nls_utf8
EOF

#Adding crypt info
cat <<EOF | tee -a /etc/crypttab
#sda*_crypt DISK  KEY.NAME	luks,keyscript=/usr/local/sbin/crypto-usb-key.sh
EOF
echo "Edit /etc/crypttab"


#Save initramfs (in case of emergency)
mkdir /boot/save
cp /boot/initrd* /boot/save/

update-initramfs -u

