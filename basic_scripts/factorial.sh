# ------------------------------------------------------------------
# [Author] Aymen HAYOUNI
#          Description
#
#          Factorial calculation Methods
#
# Dependency:
#     color.sh
# ------------------------------------------------------------------

#!/bin/bash
. ./color.sh
VERSION=0.1.0
USAGE="Usage: `basename "$0"` integer"
number=$1

# --- Option processing --------------------------------------------
verif_parameters(){
  if [ "$#" != 1 ]; then
      echo "[FACTORIAL]: ${Red}ERROR${Reset} - Must verify parameters";
      echo "[FACTORIAL]: ${Red}ERROR${Reset} - $USAGE"
      exit 1;
  fi
  if ! echo "$number" | grep -E "^[0-9]{1,}$" > /dev/null; then
    echo "[FACTORIAL]: ${Red}ERROR${Reset} - Must be an integer";
    exit 1;
  fi
}

# ------------------------------------------------------------------
# Description: Used to calculate factorial for a given number
# Arguments: $number: Integer
#
# Output: factorail number
# ------------------------------------------------------------------
first_factorial() {
  value=$number
  result=1
  while [ "$value" -ne 0 ]
  do
    result=$(($value * $result));
    value=$(($value - 1));
  done
  if [ "$value" -eq 0 ]; then
    echo "[FACTORIAL]: ${Green}SUCCESS${Reset} - factorial($number)=$result";
  fi
}

# ------------------------------------------------------------------
# Description: Used to calculate factorial for a given number using
#              reccursive method
# Arguments: $number: Integer
#
# Output: factorail number
# ------------------------------------------------------------------
second_factorial() {
  fact=$(( $number \- 1 ))
  fact=$(second_factorial $fact)
  fact=$(($number \* $fact ))

  echo "[FACTORIAL]: ${Green}SUCCESS${Reset} - factorial($number)=$fact";
}

# Main -------------------------------------------------------------
verif_parameters $number

if [ $number -eq 0 ] || [ $number -eq 1 ]; then
  echo "[FACTORIAL]: ${Green}SUCCESS${Reset} - factorial($number)=1";
else
  echo "[FACTORIAL] ${Yellow}INFO${Reset} - you need to identify method to calcualte [1/2]:"
  read -p "choice: " choice
  if [ $choice -eq 1 ]; then
    first_factorial $number;
  elif [ $choice -eq 2 ]; then
    second_factorial $number;
  else
    echo "[FACTORIAL]: ${Red}ERROR${Reset} - Operation not recognized, please verify";
  fi
fi
