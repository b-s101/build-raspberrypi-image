cross-mod contents
=========================================================

This script mounts an existing Debian-based Raspberry Pi Image.
You may use it for modifying the mounted image or cross compile applications within the environment.

Usage
---------------------------------------------------------
The script must be run as root/with root permissions.

The first argument must be either 'mount' or 'unmount'. 'Mount' takes all the steps necessary to create your Raspberry Pi
environment and executes chroot, while 'unmount' does it all the other way around. Make sure to exit chroot before 
executing 'unmount'.

The second argument must be the full path to the imagefile which is mandatory for either 'mount' or 'unmount' operations.