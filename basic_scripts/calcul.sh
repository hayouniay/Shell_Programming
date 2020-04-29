# ------------------------------------------------------------------
# [Author] Aymen HAYOUNI
#          Description
#
#          This script aims to simulaate all basic operations
#          +, -, * and /
#
# Dependency:
#     color.sh
# ------------------------------------------------------------------
#!/bin/bash

. ./color.sh

VERSION=0.1.0
USAGE="Usage: `basename "$0"` integer op integer"

MaxArguments=3
RightOp="$1";
Op="$2";
leftOp="$3";

# --- Option processing --------------------------------------------
verif_parameters(){
  if [ "$#" != "$MaxArguments" ]; then
      echo "[CALCUL]: [${Red}ERROR${Reset}] - Must verify parameters";
      echo "[CALCUL]: [${Red}ERROR${Reset}] - $USAGE"
      exit 1;
  fi
  if ! echo "$1$3" | grep -E "^[0-9]{2,}$" > /dev/null; then
    echo "[CALCUL]: [${Red}ERROR${Reset}] - Operators must be integers";
    exit 1;
  fi
  if ! echo "$Op" | grep -E "^(\+|\-|\/|\*){1}$" > /dev/null
  then
    echo "[CALCUL]: [${Red}ERROR${Reset}] - Operation must be in (+ - * /)";
    exit 1;
  fi
}

# ------------------------------------------------------------------
# Description: Used to do simple operations (+ * / -)
# Arguments: $RightOp: first operand
#            $Op: + / * -
#            $leftOp: second operand
# Output: decimal number
# ------------------------------------------------------------------
calcul(){
  case "$Op" in
    "/")
      if [ $leftOp -eq 0 ]; then
        echo "[CALCUL]: [${Red}ERROR${Reset}] - Operation not permitted";
        result=0;
        exit 1;
      else
        result=$(($RightOp $Op $leftOp));
      fi
      ;;
    *)
     result=$(($RightOp $Op $leftOp));
     ;;
  esac
  echo "[CALCUL]: [${Green}SUCCESS${Reset}] $RightOp$Op$leftOp=$result";
}

# Main -------------------------------------------------------------
verif_parameters $RightOp $Op $leftOp
calcul
