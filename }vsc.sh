#!/bin/bash

VSC=./@vsc.sh

if [ -f $VSC ]
then

  source $VSC

  if [ "$1" = "" ]
  then

    $VSC_APP -v > /dev/null 2>&1

    if [ $? -eq 0 ]
    then

      printf "\nRemoving ${VSC_APP^} IDE\n\n"

      if [ "$KERNEL" = "Linux" ]
      then
      
        sudo apt purge -y $VSC_APP
        printf "\n"

      elif [ "$KERNEL" = "Darwin" ]
      then

        rm -rf "$CODE_HOME"

      elif [ "$KERNEL" = "Windows" ]
      then

        ~/AppData/Local/Programs/Microsoft\ VS\ Code/unins000.exe
        rm -rf ~/.vscode ~/AppData/Roaming/Code

      fi
      
    fi

  fi

else

  printf "\nUnknown VSC definitions\n\n"

fi
