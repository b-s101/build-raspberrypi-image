#!/bin/sh

# install requirements
apt-get install binfmt-support qemu qemu-user-static debootstrap kpartx lvm2 dosfstools apt-cacher-ng coreutils

# creating rcopy folder
BASEDIR='pwd'
mkdir $BASEDIR\delivery\rcopy