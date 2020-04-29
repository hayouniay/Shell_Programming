# ------------------------------------------------------------------
# [Author] Aymen HAYOUNI
#          Description
#
#          Main file for all tests
#
# Dependency:
#     color.sh
# ------------------------------------------------------------------

#!/bin/bash
. ./color.sh
VERSION=0.1.0
USAGE="Usage: `basename "$0"` -c[--calcul]|-f[--factorial]|-d[--convert]|-h[--help]
                -c arg1 op arg2: arg1 and arg2 are integers, op in (+ * - /)
                -f arg: arg is an integer
                -d arg base: arg is an integer, base is in (2 8 16)"

# ------------------------------------------------------------------
# Description: Used to do do the choice between many scripts
# Arguments: see the usage
#
#
# Output: diffirent from a case to another
# ------------------------------------------------------------------
main ()
{

options=$(getopt -o cdfh --long calcul --long convert --long factorial --long help: -- "$@")
[ $? -eq 0 ] || {
    echo "[MAIN]: [${Red}ERROR${Reset}] - Incorrect option provided";
    exit 1;
}

eval set -- "$options"
while true; do
    case "$1" in
      -c | --calcul)
          shift 3;
          if [ "$#" != 3 ]; then
              echo "[MAIN]: [${Red}ERROR${Reset}] - Must verify parameters: arg op arg";
              echo "[MAIN]: [${Red}ERROR${Reset}] - op in +, - , * , /"
              exit 1;
          fi
          . ./calcul.sh "$1" "$2" "$3" ;
          break
          ;;
      -d | --convert)
          shift 3;
          if [ "$#" -eq 2 ]; then
            . ./convert.sh "$1" "$2";
          elif [ "$#" -eq 1 ]; then
            . ./convert.sh "$1";
          else
            echo "[MAIN]: [${Red}ERROR${Reset}] - Must verify parameters: convert arg [base]";
            echo "[MAIN]: [${Red}ERROR${Reset}] - base in 2 , 8 , 16"
            exit 1;
          fi
          break
          ;;
      -f | --factorial)
          shift 3;
          if [ "$#" != 1 ]; then
              echo "[MAIN]: [${Red}ERROR${Reset}] - Must verify parameters: factorial arg";
              exit 1;
          fi
          . ./factorial.sh "$1";
          break
          ;;
      -h | --help)
          echo "$USAGE";
          break
          ;;
      --)
          shift
          break
          ;;
    esac
done
}

# Main -------------------------------------------------------------
main $0 "$@"
