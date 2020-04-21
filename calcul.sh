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

verif_parameters(){
  if ! [ $# != "$MaxArguments" ]; then
      echo "[CALCUL]: ${Red}ERROR${Reset} - Must verify parameters";
  fi
  if [ $op != *[/_*+]* ]; then
    echo "[CALCUL]: ${Red}ERROR${Reset} - Operation must be in (+ - * /)";
  fi
}

verif_parameters $RightOp $Op $leftOp;
