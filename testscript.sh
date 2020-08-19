#!/bin/bash

displayMenu (){

  clear
  echo "1.  Check memory"
  echo "2.  Check Disk Usage"
  echo "3.  Run bpytop"
  echo "4.  Get date"
  echo "5.  Update System"
  echo ""
  echo "0.  Exit"
  echo ""

}

processOption(){

  clear
  case $CHOICE in
    1)
      free -h;;
    2)
      df -h;;
    3)
      bpytop;;
    4)
      date;;
    5) apt update -yy && apt upgrade -yy;;
    0)
      exit 0;;
    *)
      echo "You can only choose options from the menu.";read DUMMY;;
  esac
  read
}

##=======================================
## Main program
##=======================================

#Process option if passed
if (($#>1)); then

  if (($1>0)); then
    CHOICE=$1
    processOption
    exit
  fi
fi

CHOICE=99

while ((CHOICE >0))
  do
    displayMenu
    read -p "Enter your choice: " CHOICE
    processOption
done
