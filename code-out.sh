#!/bin/bash

CODE_DEFS=$PWD/code-def.sh

if [ -f $CODE_DEFS ]; then

  source $CODE_DEFS

  if [ "$1" = "" ]; then

    "$CODE_PATH$CODE_APP" -v > /dev/null 2>&1
    if [ $? -eq 0 ]; then

      printf "\nRemoving $CODE_APP IDE\n\n"

      if [ "$KERNEL" = "Linux" ]; then
        sudo apt purge -y $CODE_APP
        printf "\n"

      elif [ "$KERNEL" = "Darwin" ]; then
        rm -rf "$CODE_HOME"

      elif [ "$KERNEL" = "Windows" ]; then
        ~/AppData/Local/Programs/Microsoft\ VS\ Code/unins000.exe
        rm -rf ~/.vscode ~/AppData/Roaming/Code

      fi
      
    fi

  fi

else

  printf "\nUnknown CODE definitions\n\n"

fi
