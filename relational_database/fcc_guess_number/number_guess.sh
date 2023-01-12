#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$((RANDOM % 1000 + 1 ))
NEW_PLAYER=1

echo -e "Enter your username:"
read USERNAME
PRINT_NAME=$(echo $USERNAME| sed -r 's/^ *| *$//g')
DB_USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ $DB_USERNAME ]]
then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  NEW_PLAYER=0
  echo -e "Welcome back, $PRINT_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo -e "Welcome, $PRINT_NAME! It looks like this is your first time here."
fi

echo -e "Guess the secret number between 1 and 1000:"
read GUESS
GUESS_NR=1

while (( GUESS != NUMBER ))
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
  elif (( GUESS > NUMBER ))
  then
    echo -e "It's lower than that, guess again:"
  else
    echo -e "It's higher than that, guess again:"
  fi
  read GUESS
  GUESS_NR=$(($GUESS_NR + 1 ))
done

if [[ $NEW_PLAYER == 1 ]]
then
  ADD_PLAYER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) 
  VALUES('$PRINT_NAME', 1, $GUESS_NR)")
else
  GAMES_PLAYED=$(($GAMES_PLAYED + 1 ))
  if [[ $GUESS_NR < $BEST_GAME ]]
  then
    BEST_GAME=$GUESS_NR
  fi
  UPDATE_PLAYER_RESULT=$($PSQL "UPDATE users SET
  games_played = $GAMES_PLAYED,
  best_game = $BEST_GAME
  WHERE username = '$PRINT_NAME'")
fi

echo "You guessed it in $GUESS_NR tries. The secret number was $NUMBER. Nice job!"