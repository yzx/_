#!/bin/bash

CODE_DEFS=$PWD/code-def.sh

if [ -f $CODE_DEFS ]; then

  source $CODE_DEFS

  if [ "$1" = "" ]; then

    "$CODE_PATH$CODE_APP" -v > /dev/null 2>&1
    if [ $? -ne 0 ]; then

      if [ ! -f $INST_FILE ]; then

        printf "\nGetting instalation file for $CODE_APP IDE\n\n"
        wget -O $INST_FILE $SRC_URL

      else

        printf "\n"

      fi

      printf "Installing $CODE_APP IDE\n\n"

      if [ "$KERNEL" = "Linux" ]; then
        sudo apt install -y ./$INST_FILE

      elif [ "$KERNEL" = "Darwin" ]; then
        unzip $INST_FILE -d $APP_ROOT

      fi

      printf "\n"

    fi

  fi

else

  printf "\nUnknown CODE definitions\n\n"

fi
