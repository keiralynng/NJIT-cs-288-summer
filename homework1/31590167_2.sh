#!/bin/bash

#problem 2

if [ $# -eq 0 ]; then 
	echo "Please enter one file name or directory here: " 
read input
else 
       input="$1"
fi 

if [ -d "$input" ]; then
       	if [ -r "$input" ] && [ -x "$input" ]; then 
	       	for i in "$input"/*; do
		       	stat --format="%n %s bytes" "$i"
	       	done
       else 
	      "Warning: Do not have read and execute permissions." 
	      exit
 	fi 
fi 

if [ -f "$input" ]; then 
	if [ -r "$input" ]; then 
		wc=$(wc -w < "$input")
		lc=$(wc -l < "$input")
		cc=$(wc -m < "$input")
		if [ "$cc" -gt 10000 ]; then
			echo "Word Heavy" 
		elif [ "$cc" -gt 1000 -a "$cc" -lt 10000 ]; then
			echo "Moderately sized"  
		elif [ "$cc" -lt 1000 ]; then 
			echo "Light file" 
		fi
	else 	
		echo "Warning: Do not have read permission"
	exit
  fi 
fi

