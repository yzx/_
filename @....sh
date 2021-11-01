#!/bin/bash

ENV=./@env.sh

if [ -f $ENV ]
then

  source $ENV

else

  printf "\nUnknown ENV definitions\n\n"
  exit 1

fi

if [ "$1" != "" ]
then

  printf "YZX -> ...\n"
  printf "\n"

fi
