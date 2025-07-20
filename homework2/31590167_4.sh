#!/bin/bash

#problem 4

file="$1" 

if [ -f "$file" ]; then 
	mapfile -t multi_cities < <(grep -E '[a-zA-Z]+ [a-zA-Z]+, [0-9]{4}-[0-9]{1,2}-[0-9]{1,2}, ([A-Za-z]+ [A-Za-z]+)+, ([A-Za-z ])+' "$file")
	> "$file"

	for item in "${multi_cities[@]}"; do 
		echo "$item" >> "$file" #will get rid of any blank lines in original file

		birth_year=$(echo "$item" | sed -En 's/.*([0-9]{4})-[0-9]{1,2}-[0-9]{1,2}.*/\1/p')
		curr_year=$(date +%Y)
		
		 name=$(echo "$item" | sed -E -n 's/^([A-Za-z]+ [A-Za-z]+),.*/\1/p')

		if [[ $birth_year =~ ^[0-9]{4}$ && $name =~ ^[A-Za-z]+[[:space:]][A-Za-z]+$ ]]; then 
			age=$(($curr_year - $birth_year))
			echo "$name is $age years old." >> name_num.txt	
		fi 
	done

	sort -k4nr "name_num.txt" -o temp && mv temp "name_num.txt"

else 
	echo "Did Not Give File Name"
	exit 1
fi


	
