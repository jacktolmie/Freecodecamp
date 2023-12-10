#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "truncate teams, games")"
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ "$YEAR" != "year" ]]
  then
    echo "$($PSQL "insert into teams(name) values('$WINNER') on conflict (name) do nothing")"
    echo "$($PSQL "insert into teams(name) values('$OPPONENT') on conflict (name) do nothing")"
    WINNER_ID="$($PSQL "select team_id from teams where name = '$WINNER' ")"
    OPPONENT_ID="$($PSQL "select team_id from teams where name = '$OPPONENT'")"
    echo "$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")"
  fi
done
