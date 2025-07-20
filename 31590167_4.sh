#!/bin/bash

function display_dir()
{
	echo "Below is the list of files modified in the past 24 hours. Please select a corresponding number to choose a file."

	function search(){
		now=$(date +%s)
		for item in "$FILE"/*; do
			if [ -f "$item" ]; then
				last_mod=$(stat -c %Y "$item")
				difference=$((now - last_mod))
				if [ "$difference" -le 86400 ]; then 
					mod_list+=("$item")
				fi
			elif [ -d "$item" ]; then
				search "$item"
			fi
		done 
		select ITEM in "${mod_list[@]}"; do
			if [ -n "$ITEM" ]; then
                        total_lines=$(wc -l < "$ITEM")
                        lines_displayed=10

                        head -n 10 "$ITEM"

                        while true; do
                        echo -e "\nDo you wish to print more lines? Yes or no?"
                                read input
                        if [ "$input" = yes ]; then
                                start=$(("$lines_displayed" + 1))
                                lines_displayed=$(("$lines_displayed" + 10))
                                if [ "$lines_displayed" -le "$total_lines" ]; then
                                        sed -n "${start},${lines_displayed}p" "$ITEM"
                                else
                                        echo -e "\nEnd of file reached." 
                                        break
                                fi
                        else
                                break
                        fi
                done
                        break
                fi
        done

        echo -e "\nDo you want to choose another file? Yes or no?"
        read again
        if [ "$again" != yes ]; then
                echo "Exiting..."
       		exit
	fi 

	}
	search "$dir_name"

}

function display_file()
{
	while true; do

select FILE in "$dir_name"/*; do
       if [ -d "$FILE" ]; then 
	       display_dir "$FILE"
       fi	       
                if [ -n "$FILE" ]; then
                        total_lines=$(wc -l < "$FILE")
                        lines_displayed=10
        
                        head -n 10 "$FILE"

                        while true; do
			echo -e "\nDo you wish to print more lines? Yes or no?"
				read input
                        if [ "$input" = yes ]; then
                                start=$(("$lines_displayed" + 1))
                                lines_displayed=$(("$lines_displayed" + 10))    
                                if [ "$lines_displayed" -le "$total_lines" ]; then
                                        sed -n "${start},${lines_displayed}p" "$FILE"
                                else 
                                        echo -e "\nEnd of file reached." 
                                        break
                                fi
                        else 
                                break   
                        fi 
                done 
			break 
                fi
	done 	

	echo -e "\nDo you want to choose another file? Yes or no?"
	read again
	if [ "$again" != yes ]; then
		echo "Exiting..."
		break
	fi
done

}

echo "Please enter a directory name: "
read dir_name

if [ -e "$dir_name" -a -d "$dir_name" ]; then
	echo "Please select a corresponding number to choose a file." 
	display_file "$dir_name"
else 
	echo "Invalid Directory"
fi 
			
