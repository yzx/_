#!/bin/bash

VSC=./@vsc.sh

if [ -f $VSC ]
then

  source $VSC

  if [ "$1" = "" ]
  then

    $VSC_APP -v > /dev/null 2>&1

    if [ $? -ne 0 ]
    then

      if [ ! -f $VSC_INST_FILE ]
      then

        printf "\nGetting instalation file for $VSC_APP IDE\n\n"
        wget -O $VSC_INST_FILE $VSC_SRC_URL

      else

        printf "\n"

      fi

      printf "Installing ${VSC_APP^} IDE\n\n"

      if [ "$KERNEL" = "Linux" ]
      then

        $SUDO apt install -y $VSC_INST_FILE

      fi

    else

      VSC_INSTALLED_VERSION=$($VSC_APP -v | head -n 1)

      printf "\n${VSC_APP^} IDE version $VSC_INSTALLED_VERSION is already installed\n"

    fi

  printf "\n"

  fi

else

  printf "\nUnknown VSC definitions\n\n"

fi
