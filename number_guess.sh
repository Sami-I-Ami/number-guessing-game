#!/bin/bash

# Initial variables
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
CURRENT_GUESS_AMT=0

# Login
# read username
echo Enter your username:
read USERNAME

# get player's games_played from database
GAMES_PLAYED=$($PSQL "SELECT games_played FROM guess_info WHERE username = '$USERNAME'")

# if there is no GAMES
if [[ -z $GAMES_PLAYED ]]
then
  # message
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

# otherwise
else
  # get player's best game
  BEST_GAME=$($PSQL "SELECT best_game FROM guess_info WHERE username = '$USERNAME'")

  # format variables
  GAMES_PLAYED_FORMATTED=$(echo $GAMES_PLAYED | sed 's/ //')
  BEST_GAME_FORMATTED=$(echo $BEST_GAME | sed 's/ //')

  # message
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED_FORMATTED games, and your best game took $BEST_GAME_FORMATTED guesses."
fi

# guessing game
GAME() {

# display message
echo -e "\n$1"

# read guess
read GUESS

# increase guess amount
CURRENT_GUESS_AMT=$((CURRENT_GUESS_AMT + 1))

# if not a number
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  GAME "That is not an integer, guess again:"

# if lower than number
elif [[ $GUESS < $SECRET_NUMBER ]]
then
  GAME "It's higher than that, guess again:"

# if higher than number
elif [[ $GUESS > $SECRET_NUMBER ]]
then
  GAME "It's lower than that, guess again:"

# if guessed correctly
else
  echo -e "You guessed it in $CURRENT_GUESS_AMT tries. The secret number was $SECRET_NUMBER. Nice Job!"
fi
}

# inital run of game
GAME "Guess the secret number between 1 and 1000:"

# input into database
# insert when first game
if [[ -z $PLAYER_INFO ]]
then
  # enter info into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO guess_info(username, games_played, best_game) VALUES('$USERNAME', 1, $CURRENT_GUESS_AMT)")

# if not new
else
  # calculate games played and new best
  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  if [[ $CURRENT_GUESS_AMT < $BEST_GAME ]]
  then
    BEST_GAME=$CURRENT_GUESS_AMT
  fi

  # enter info into database
fi