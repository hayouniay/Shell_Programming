######################################
#       simple Calculation tool      #
######################################

#!/bin/bash
set -x

verif_parameters(){
  echo $#;
  if ! [ $# -eq 3 ]; then
      echo -n "[CALCUL]: Must verify parameters";
  fi
}

verif_parameters $1 $2 $3 ;
