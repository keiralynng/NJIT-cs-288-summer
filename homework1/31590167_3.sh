#!/bin/bash

#problem 3

if [ "$#" -eq 0 ]; then
	echo "Error: no arguments were provided."
	exit 
fi 

if [ "$#" -ge 3 ]; then 
	date=$(date +"%Y%m%d")
	backup_dir="backup_$date" 
	mkdir "$backup_dir"
	backup_file="$backup_dir/backup.log"

		for i in "$@"; do
			if [ -e "$i" ]; then 
				cp -p "$i" "$i"_"$date"
                		mv "$i"_"$date"  "$backup_dir"
				echo "$i" "->" "$i"_"$date" >> "$backup_file" 
			else 
				echo "Warning: "$i" does not exist" 	
				continue
			fi
		done 
fi 

echo -e "The backup process has completed.\nBackup location: $(realpath "$backup_dir")"  
