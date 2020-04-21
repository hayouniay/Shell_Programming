######################################
#       simple Calculation tool      #
######################################

#!/bin/bash

# For logging level
# Reset
Reset='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
White='\033[0;37m'        # White

MaxArguments=3
RightOp="$1";
Op="$2";
leftOp="$3";

set -x
verif_parameters(){
  echo $#
  if [ "$#" != "$MaxArguments" ]; then
      echo "[CALCUL]: ${Red}ERROR${Reset} - Must verify parameters";
      break;
  fi
  if ! echo "$1$3" | grep -E "^[0-9]{2,}$" > /dev/null; then
    echo "[CALCUL]: ${Red}ERROR${Reset} - Operators must be integers";
    break;
  fi
  if ! echo "$Op" | grep -E "^(\+|\-|\/|\*){1}$" > /dev/null
  then
    echo "[CALCUL]: ${Red}ERROR${Reset} - Operation must be in (+ - * /)";
    break;
  fi
}

calcul(){
  case "$Op" in
    "/")
      if [ $leftOp -eq 0 ]; then
        echo "[CALCUL]: ${Red}ERROR${Reset} - Operation not permitted";
        result=0;
        break;
      else
        result=$(($RightOp $Op $leftOp));
      fi
      ;;
    *)
     result=$(($RightOp $Op $leftOp));
     ;;
  esac
  echo "$result";
}


verif_parameters $RightOp $Op $leftOp
calcul
