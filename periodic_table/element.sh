PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! -z $1 ]]; then
  CHECK=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements full join properties using(atomic_number) full join types using(type_id) where  atomic_number::TEXT = '$1' or  symbol = '$1' or name = '$1' ")
  if [[ -z $CHECK ]]; then echo "I could not find that element in the database."
  else
    echo $CHECK | while IFS='|' read atn sym name mass mpc bpc metal ; do
    echo "The element with atomic number $atn is $name ($sym). It's a $metal, with a mass of $mass amu. $name has a melting point of $mpc celsius and a boiling point of $bpc celsius."
    done
  fi
else echo "Please provide an element as an argument."
fi
