#!/bin/bash

# Initial variables
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

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

  # message
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# display starting message
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS
CURRENT_GUESS_AMT=1

# guessing game
while [[ $GUESS != $SECRET_NUMBER ]]
do
  # if not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read GUESS

  # if lower than number
  elif [[ $GUESS < $SECRET_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
    (( CURRENT_GUESS_AMT++ ))

  # if higher than number
  elif [[ $GUESS > $SECRET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
    (( CURRENT_GUESS_AMT++ ))
  fi
done

# if guessed correctly
# message
echo You guessed it in $CURRENT_GUESS_AMT tries. The secret number was $SECRET_NUMBER. Nice job!

# input into database
# insert when first game
if [[ -z $GAMES_PLAYED ]]
then
  # enter info into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO guess_info(username, games_played, best_game) VALUES('$USERNAME', 1, $CURRENT_GUESS_AMT)")

# if not new
else
  # calculate games played and new best
  (( GAMES_PLAYED++ ))
  if [[ $CURRENT_GUESS_AMT < $BEST_GAME ]]
  then
    BEST_GAME=$CURRENT_GUESS_AMT
  fi

  # update info into database
  UPDATE_USER_RESULT=$($PSQL "UPDATE guess_info SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username = '$USERNAME'")
fi
