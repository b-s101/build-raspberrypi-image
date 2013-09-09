#!/bin/sh

machine=`uname -m`
if [ "${machine}" != "armv6l" ]; then
  echo "This script will be executed at mounted raspbian enviroment (armv6l). Current environment is ${machine}."
  exit 1
fi

echo "Please check environment variables etc, this script can be executed ONLY within RPI environment!"
#echo "When tasks done, type \"exit\" to return"
echo ""

cat /usr/src/delivery/auto.execute | while read LINE
do
	$LINE
done
