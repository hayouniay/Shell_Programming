# ------------------------------------------------------------------
# [Author] Aymen HAYOUNI
#          Description
#
#          Change from decimal to binary and
#          from binary to decimal base
#
# Dependency:
#     color.sh
# ------------------------------------------------------------------

#!/bin/bash
. ./color.sh
VERSION=0.1.0
USAGE="Usage: `basename "$0"` integer base[optionnal]"
number="$1"
base=$2

# --- Option processing --------------------------------------------
Usage(){
  if [ "$#" != 1 ]; then
      echo "[CONVERT]: [${Red}ERROR${Reset}] - Must verify parameters";
      echo "[CONVERT]: [${Red}ERROR${Reset}] - $USAGE"
      exit 1;
  fi
}

# ------------------------------------------------------------------
# Description: Used to convert decimal to any base (2, 8 , 16)
# Arguments: $number: the value to be converted to basename
#            $base: the base (2, 8, 16)
# Output: decimal number
# ------------------------------------------------------------------
decimatobase (){
   value=$number
   while [ $value -ne 0 ]
   do
      result=$(( $value % $base ))$result
      value=$(( $value / $base ))
   done
   case $base in
     "2")
        echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Decimal[$number]==>Binary[$result]"
        ;;
     "8")
        echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Decimal[$number]==>Octal[$result]"
        ;;
     "16")
        echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Decimal[$number]==>Hexadecimal[$result]"
        ;;
      "*")
        echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Decimal[$number]==>Pther[$result]"
        ;;
  esac
 }

 # ------------------------------------------------------------------
 # Description: Used to convert any base (2, 8 , 16) to decimal
 # Arguments: $number: basename number
 #            $base: the base (2, 8, 16)
 # Output: decimal number
 # ------------------------------------------------------------------
basetodecimal (){
  result=`echo "obase=10; ibase=$base; $number" | bc`
  case $base in
    "2")
       echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Bnary[$number]==>Decimal[$result]"
       ;;
    "8")
       echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Octal[$number]==>Decimal[$result]"
       ;;
    "16")
       echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Hexadecimal[$number]==>Decimal[$result]"
       ;;
     "*")
       echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Other[$number]==>Decimal[$result]"
       ;;
 esac
}

# ------------------------------------------------------------------
# Description: Used to convert decimal to binary
# Arguments: $number: the value to be converted to basename
#
# Output: decimal number
# ------------------------------------------------------------------
decimaltobinary() {
  value=$number
  while [ $value -ne 0 ]
  do
    result=$(( $value % 2 ))$result #residual is next digit
    value=$(( $value / 2 ))
  done
  echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Decimal[$number]==>Binary[$result]";
}

# ------------------------------------------------------------------
# Description: Used to convert binary to decimal
# Arguments: $number: the value to be converted to decimal
#
# Output: binary number
# ------------------------------------------------------------------
binarytodecimal() {
  result=`echo "obase=10; ibase=2; $number" | bc`
  echo "[CONVERT]: [${Green}SUCCESS${Reset}] - Bnary[$number]==>Decimal[$result]";
}

# Main -------------------------------------------------------------
Usage $number
echo "[CONVERT] [${Yellow}INFO${Reset}] - you need to identify opration [D/B/DO/OD]:"
read -p "choice: " choice

if [ `echo "$choice" | tr '/a-z/' '/A-Z/'` = "B" ]; then
  decimaltobinary $number;
elif [ `echo "$choice" | tr '/a-z/' '/A-Z/'` = "D" ]; then
  binarytodecimal $number;
else
  if [ `echo "$choice" | tr '/a-z/' '/A-Z/'` = "DO" ]; then
  echo "[CONVERT]: [${Yellow}ONFO${Reset}] - Using Default conversion : DECIMAL To OTHER";
    if [ "$#" != 2 ]; then
        echo "[CONVERT]: [${Red}ERROR${Reset}] - Must verify parameters";
        exit 1;
    fi
    decimatobase $number $base
  elif [ `echo "$choice" | tr '/a-z/' '/A-Z/'` = "OD" ]; then
    echo "[CONVERT]: [${Yellow}ONFO${Reset}] - Using Default conversion : OTHER To DECIMAL";
      if [ "$#" != 2 ]; then
          echo "[CONVERT]: [${Red}ERROR${Reset}] - Must verify parameters";
          exit 1;
      fi
      basetodecimal $number $base
  fi
fi
