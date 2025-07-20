#!/bin/bash 

#problem 2

function counter()
{
file="$1"  

scan_count=$(grep -c 'scanf' "$1")
print_count=$(grep -c 'printf' "$1")

if [ -e "scanf_log.txt" ]; then 
	grep 'scanf' "$1" >> "scanf_log.txt" #will append to file already
else 
	grep 'scanf' "$1" > "scanf_log.txt"	
fi 

if [ -e "printf_log.txt" ]; then 
	grep 'printf' "$1" >> "printf_log.txt" #redundant but homework is breaking this step into two parts - if exists and if doesnt
else 
	grep 'printf' "$1" > "printf_log.txt" 
fi 

total_lines=$(sed -n '$=' < "$1")

echo "Total lines of file: $total_lines"

scan_percent=$(echo "scale=2; $scan_count * 100 / $total_lines" | bc -l)
print_percent=$(echo "scale=2; $print_count * 100 / $total_lines" | bc -l) 

echo "Percentage of lines containing printf: $print_percent%" 
echo "Percentage of lines containign scanf: $scan_percent%" 
} 

if [ $# -ne 1 ]; then
        echo "Error: provide a single .c file."
        exit 1
fi
if [ "$1" != *.c ]; then 
	echo "Error: not a .c file." 
	exit 1 
fi 

counter "$1"
