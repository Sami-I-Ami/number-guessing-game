#!/bin/bash

# Initial variables
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
CURRENT_GUESS_AMT=0

# Login
# read username
echo Enter your username:
read USERNAME

# get player's info from database
PLAYER_INFO=$($PSQL "SELECT games_played, best_game FROM guess_info WHERE username = '$USERNAME'")

# if there is no info
if [[ -z $PLAYER_INFO ]]
then
  # message
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # enter info into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO guess_info(username) VALUES('$USERNAME')")

# otherwise
else
  # split info
  echo $PLAYER_INFO | while read GAMES_PLAYED BAR BEST_GAME
  do
    # message
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# guessing game
GAME() {
echo -e "\n$1"
}

# inital run of game
GAME "Guess the secret number between 1 and 1000:"