#!/bin/bash 

#problem 3

function traverse()
{
	dir=$1 

	for i in "$dir"/*; do
		 	if [ -f "$i" ]; then 		
			grep -E '^[a-zA-Z]+[0-9]*([._-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$' "$i" >> addresses.txt 	
		elif [ -d "$i" ]; then 
			traverse "$i" 
		fi 
	done 	

}

> addresses.txt
 		
if [ $# -ne 1 ]; then
	echo "Error occured." 
               exit 1
	elif [ ! -d "$1" ]; then 
		echo "Not a directory." 
		exit 1
        fi

traverse "$1"

sort -fu addresses.txt > unique_emails.txt
