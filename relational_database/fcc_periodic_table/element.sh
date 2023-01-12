#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

NO_FIND() {
  echo -e "I could not find that element in the database."
}

FIND() {
  #$1 = atomic number
  #lets find all the others
  SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")| sed -r 's/^ *| *$//g')
  NAME=$(echo $($PSQL "SELECT name FROM elements WHERE atomic_number = $1")| sed -r 's/^ *| *$//g')
  AT_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $1")| sed -r 's/^ *| *$//g')
  MPC=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $1")| sed -r 's/^ *| *$//g')
  BPC=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $1")| sed -r 's/^ *| *$//g')
  TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $1")
  TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")| sed -r 's/^ *| *$//g')
  echo -e "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AT_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
}

if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  else
    #if a number
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      # check atomic number
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
      if [[ -z $ATOMIC_NUMBER ]]
      then
        NO_FIND
      else
        FIND $ATOMIC_NUMBER
      fi
        
    else
      # check symbol and name
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
      NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
      if [[ $SYMBOL ]]
      then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
        FIND $ATOMIC_NUMBER
      elif [[ $NAME ]]
      then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
        FIND $ATOMIC_NUMBER
      else
        NO_FIND
      fi
    fi
  fi

