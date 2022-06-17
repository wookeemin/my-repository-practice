#!/bin/bash

read -p "Input your name: " NAME
read -sp "Input your password: " PASSWORD

if [[ $NAME = $(whoami) ]] && [[ $PASSWORD = "Aa1234" ]]
then
  echo -e "\nWelcome $(whoami)"
else
  echo -e "\nIt is wrong account"
fi

