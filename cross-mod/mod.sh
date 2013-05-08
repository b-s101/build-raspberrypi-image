#!/bin/bash

# Modify an existing Debian-based Raspberry Pi Image or use for Cross-Compiling applications

if [ $# -ne 2 ]; then
	echo "Wrong number of parameters used."
	echo "Usage: ./mod.sh options imagfile"
	echo "options:"
	echo "mount: mounts the desired imagefile"
	echo "unmount: un-mounts the desired imagefile"
	echo ""
	echo "imagefile:"
	echo "full path to IMG file"
	echo ""
	echo "Example: ./mod.sh mount /home/myuser/rpi.img"
	echo ""
	echo "MAKE SURE TO RUN AS ROOT"
	exit 1
fi

if [ $EUID -ne 0 ]; then
  echo "this tool must be run as root"
  exit 1
fi

if [ $1 = "mount" ] && [ -f $2 ]
then
    kpartx -a $2
    mount /dev/mapper/loop0p2 /mnt
    cp /usr/bin/qemu-arm-static /mnt/usr/bin
    # backing up resolv.conf
    cp /mnt/etc/resolv.conf /mnt/etc/resolv.conf.org
    cp /etc/resolv.conf /mnt/etc/resolv.conf
    mount -o bind /dev /mnt/dev
    mount -o bind /proc /mnt/proc
    mount -o bind /sys /mnt/sys
    echo "If you want to use the image for cross compiling execute \"apt-get install build-essentials\" first"
    echo "Type \"exit\" to quit chroot when you are done"
    chroot /mnt
elif [ $1 = "unmount" ] && [ -f $2 ]
then
	rm /mnt/usr/bin/qemu-arm-static
	rm /mnt/etc/resolv.conf
	cp /mnt/etc/resolv.conf.org /mnt/etc/resolv.conf
	umount /mnt/dev
	umount /mnt/proc
	umount /mnt/sys
	umount /mnt
	kpartx -d $2
else
	echo "Something went wrong with your parameters."
	echo "Usage: ./mod.sh options imagfile"
	echo "options:"
	echo "mount: mounts the desired imagefile"
	echo "unmount: un-mounts the desired imagefile"
	echo ""
	echo "imagefile:"
	echo "full path to IMG file"
	echo ""
	echo "Example: ./mod.sh mount /home/myuser/rpi.img"
	echo ""
	echo "MAKE SURE TO RUN AS ROOT"
	exit 1
fi