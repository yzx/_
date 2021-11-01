#!/bin/bash

check_err () {

  RET=$?
  
  if [ $RET -ne 0 ]
  then
  
    printf "ERR $RET\n\n"
    exit $RET
  
  else
  
    printf "OK\n"
  
  fi

}

THIS_REPO_PATH=$(git rev-parse --show-toplevel 2> /dev/null)
UNDER_DIR=$THIS_REPO_PATH/__
DOWNLOAD_DIR=$UNDER_DIR/download

I_AM=$(whoami 2> /dev/null)
SUDO=

if [ "$I_AM" != "root"  ] 
then

  SUDO=sudo

fi

KERNEL=$(uname -s)

if [ "$KERNEL" != "Linux"  ] &&
   [ "$KERNEL" != "Darwin" ] 
then

  KERNEL=Windows

fi

BSIZE=$(getconf LONG_BIT) 

ARCH=$(uname -m)

if [ "$ARCH" != "armv7l"  ] &&
   [ "$ARCH" != "aarch64" ] &&
   [ "$ARCH" != "x86_64"  ] 
then

  printf "\nUnsupported Architecture\n\n"
  exit 1

fi

OSN=
OSV=
OSE=
OSS=

if [ "$KERNEL" = "Windows" ]
then

  OSN=$(systeminfo | grep "OS Name:" | awk '{print $4}')
  OSV=$(systeminfo | grep "OS Name:" | awk '{print $5}')
  OSE=$(systeminfo | grep "OS Name:" | awk '{print $6}')

elif [ "$KERNEL" = "Darwin" ]
then

  OSN=$(sw_vers | grep "ProductName:" | awk '{print $2 $3 $4}')
  OSV=$(sw_vers | grep "ProductVersion:" | awk '{print $2}')

else

  _ID=$(cat /etc/os-release | grep -w ID | awk -F = '{print $2}')
  OSN=${_ID^}
  OSV=$(cat /etc/os-release | grep -w VERSION_ID | awk -F '"' '{print $2}')
  OSE=$(cat /etc/os-release | grep -w VERSION_CODENAME | awk -F = '{print $2}')
  OSS=/etc/systemd/system

fi

if
   [ "$OSN" != "Raspbian" ] &&
   [ "$OSN" != "Debian"   ] &&
   [ "$OSN" != "Ubuntu"   ] &&
   [ "$OSN" != "Windows"  ] &&
   [ "$OSN" != "MacOSX"   ]
then

  printf "\nUnsupported Operating System\n\n"
  exit 1

fi

mkdir -p $DOWNLOAD_DIR

if [ "$1" != "" ]
then

  printf "\nKERNEL -> %s"           $KERNEL
  printf "\nBSIZE  -> %s"           $BSIZE
  printf "\nARCH   -> %s"           $ARCH
  printf "\nOS     -> %s %s %s\n\n" $OSN $OSV $OSE

fi
