#!/bin/bash

# Initial variables
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
CURRENT_GUESS_AMT=0

