#!/bin/bash

ENV=./@env.sh

if [ -f $ENV ]
then

  source $ENV

  VSC_URL=https://update.code.visualstudio.com/latest
  VSC_PATH=

  if [ "$KERNEL" = "Linux" ]
  then

    VSC_PACK=deb

    if   [ "$ARCH" = "armv7l" ]
    then

      VSC_DISTRO=armhf
      VSC_SRC_URL=$VSC_URL/linux-deb-$VSC_DISTRO/stable

    elif [ "$ARCH" = "aarch64" ]
    then

      VSC_DISTRO=arm64
      VSC_SRC_URL=$VSC_URL/linux-deb-$VSC_DISTRO/stable

    else

      VSC_DISTRO=x64
      VSC_VSC_SRC_URL=$VSC_URL/linux-deb-$VSC_DISTRO/stable

    fi

  elif [ "$KERNEL" = "Darwin" ]
  then

    VSC_PACK=zip
    VSC_DISTRO=darwin
    VSC_SRC_URL=$VSC_URL/$VSC_DISTRO/stable
    APP_ROOT=/Applications
    VSC_CODE_HOME="$APP_ROOT/Visual Studio Code.app"
    VSC_CODE_REMOVE="$APP_ROOT/Visual\ Studio\ Code.app"
    VSC_PATH=$CODE_HOME/Contents/Resources/app/bin/

  else

    VSC_PACK=exe
    VSC_DISTRO=user
    VSC_SRC_URL=$VSC_URL/win32-x64-$VSC_DISTRO/stable
    
  fi

  VSC_APP=code
  VSC_VERSION=latest-stable
  VSC_NAME=$VSC_APP-$VSC_VERSION-$VSC_DISTRO
  VSC_INST_FILE=$DOWNLOAD_DIR/$VSC_NAME.$VSC_PACK

else

  printf "\nUnknown ENV definitions\n\n"
  exit 1

fi

if [ "$1" != "" ]
then

  printf   "VSC_SRC_URL   -> %s"     $VSC_SRC_URL
  printf "\nINST_FILE -> %s\n\n" $INST_FILE

fi
