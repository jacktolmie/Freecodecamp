#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USER

USERNAME=$($PSQL "select username from users where username = '$USER' ")

if [[ $USERNAME ]]
then
    GAMES_PLAYED=$($PSQL "select games_played from users where username = '$USERNAME' ")
    BEST_GAME=$($PSQL "select best_game from users where username = '$USERNAME' ")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
    USERNAME=$USER
    TEST1=$($PSQL "insert into users(username) values('$USERNAME')")
    USERNAME=$($PSQL "select username from users where username = '$USER' ")
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
fi

SECRET_NUMBER=$(($RANDOM % 10 + 1))
NUMBER_OF_GUESSES=0

echo -e "Guess the secret number between 1 and 1000:"
while true
do
  
  read GUESS
  
  if [[ $GUESS =~ ^[0-9]+$  ]]
  then
    ((++NUMBER_OF_GUESSES))
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo -e "It's lower than that, guess again:"
        
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo -e "It's higher than that, guess again:"
    
    else
     TEST2=$($PSQL "update users set games_played = games_played + 1 where username = '$USERNAME' ")
      if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
      then
        TEST3=$($PSQL "update users set best_game = $NUMBER_OF_GUESSES where username = '$USERNAME' ")
      fi
       echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!\n"
      break
    fi
  else echo -e "That is not an integer, guess again:"
  fi
 done         
 
