Delivery contents
=========================================================

Put all your delivery files, scripts, SQL's to this folder. It will be mounted to the Raspbian environment and you'll access them.

auto.mod
----------------------------------------------------------------------------------------------------
This file is intended for automating modifications within an image. It is called by install.sh from the delivery-folder and contains
the command 'bash' only which enables manual modifications as intended by Andrius Kairiukstis. Deleting the 'bash' command
and adding your own commands may result in automating the whole modification process.

If this file exists it will be parsed for bash commands line by line.
This means the file must be either empty or contain a linefeed-separated list of commands to execute.

###Example:

dpkg-reconfigure tzdata
dpkg-reconfigure locales
apt-get remove x11-common midori lxde --purge

The file must be readable (chmod 644).