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
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  # enter info into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO guess_info(username) VALUES('$USERNAME')")
fi
