#!/bin/bash

PSQL="psql -X --user=freecodecamp --db=salon --tuples-only -c"

SERVICES=$($PSQL "select service_id, name from services order by service_id")
MAX_SERVICES=$($PSQL "select max(service_id) from services" | sed -E 's/^ *| *$//')

PRINT_SERVICE(){
  
  echo -e "What all can I do for y'all?\n"
  echo "$SERVICES" | while IFS="| " read ID SERVICE; do
  echo  "$ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    [1-"$MAX_SERVICES"]) echo -e "\nGood choice"; 
          ADD_APPOINTMENT $SERVICE_ID_SELECTED ;;
    *) echo -e "\nY'all picked there a wrong number\n"
        PRINT_SERVICE ;;
  esac
}

ADD_APPOINTMENT(){
  # Get phone number and send service #
  GET_NUMBER

  echo "Customer: $IS_CLIENT"
  BOOK_APPOINTMENT $IS_CLIENT 
  #unset CUSTOMER
}

GET_NUMBER(){
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  if [[ -z $CUSTOMER_PHONE || ! $CUSTOMER_PHONE =~ [^\d{3}-\d{3}-\d{4}] ]]; then
    echo -e "\nPlease enter a number"
    GET_NUMBER
  else 
    # Check db with service # and phone #
    CHECK_DB $CUSTOMER_PHONE
  fi
}

CHECK_DB(){
  IS_CLIENT=$($PSQL "select phone from customers where phone = '$1'")

  if [[ -z "$IS_CLIENT" ]]; then
    echo -e "calling add_client"
    # Add client with service # and phone number
    ADD_CLIENT $1
  fi
}

ADD_CLIENT(){
  echo -e "What is your name?"
  read CUSTOMER_NAME
  if [[ -z $CUSTOMER_NAME ]]; then
    echo "Please provide your name."
    ADD_CLIENT $1
  else 
    echo $($PSQL "insert into customers(phone, name) values('$1', '$CUSTOMER_NAME') ")
    # Book appointment with new client
    CHECK_DB $1
  fi
}

BOOK_APPOINTMENT(){
  echo -e "What time would you like booked?"
  read SERVICE_TIME
  if ! [[ $SERVICE_TIME =~ [^\d{1,2}:\d{2}] ]]; then
    echo "How about y'all give me a proper time?"
    BOOK_APPOINTMENT $1
  else
    ADD_CUS=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE' "| sed -E 's/^ *| *$//')
    ADD_SER=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED "| sed -E 's/^ *| *$//')
    echo "CUS AND SER: $ADD_CUS and $ADD_SER"

    echo "$($PSQL "insert into appointments(time, service_id, customer_id) values('$SERVICE_TIME', '$ADD_SER', '$ADD_CUS') ")"

    GET_SERV=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED" | sed -E 's/^ *| *$//')
    GET_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE' " | sed -E 's/^ *| *$//')
    echo "I have put you down for a $GET_SERV at $SERVICE_TIME, $GET_NAME."
  fi
}

MAIN_MENU(){
echo -e "\n~~~~~~ Welcome to Hillbilly Joe's Salon ~~~~~~\n"
PRINT_SERVICE

}

MAIN_MENU
