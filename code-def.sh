#!/bin/bash

ENV_DEFS=$PWD/env-def.sh

if [ -f $ENV_DEFS ]; then

  source $ENV_DEFS

  CODE_URL=https://update.code.visualstudio.com/latest
  CODE_PATH=

  if [ "$KERNEL" = "Linux" ]
  then

    CODE_PACK=deb

    if   [ "$ARCH" = "armv7l" ]
    then

      CODE_DISTRO=armhf
      SRC_URL=$CODE_URL/linux-deb-$CODE_DISTRO/stable

    elif [ "$ARCH" = "aarch64" ]
    then

      CODE_DISTRO=arm64
      SRC_URL=$CODE_URL/linux-deb-$CODE_DISTRO/stable

    else

      CODE_DISTRO=x64
      SRC_URL=$CODE_URL/linux-deb-$CODE_DISTRO/stable

    fi

  elif [ "$KERNEL" = "Darwin" ]
  then

    CODE_PACK=zip
    CODE_DISTRO=darwin
    SRC_URL=$CODE_URL/$CODE_DISTRO/stable
    APP_ROOT=/Applications
    CODE_HOME="$APP_ROOT/Visual Studio Code.app"
    CODE_REMOVE="$APP_ROOT/Visual\ Studio\ Code.app"
    CODE_PATH=$CODE_HOME/Contents/Resources/app/bin/

  else

    CODE_PACK=exe
    CODE_DISTRO=user
    SRC_URL=$CODE_URL/win32-x64-$CODE_DISTRO/stable
    
  fi

  CODE_APP=code
  CODE_VERSION=latest-stable
  CODE_NAME=$CODE_APP-$CODE_VERSION-$CODE_DISTRO
  INST_FILE=$CODE_NAME.$CODE_PACK

else

  printf "\nUnknown ENV definitions\n\n"
  exit 1

fi

if [ "$1" != "" ]
then

  printf "\nSRC_URL   -> %s"     $SRC_URL
  printf "\nINST_FILE -> %s\n\n" $INST_FILE

fi
