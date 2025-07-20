#!/bin/bash 

echo -e "Hello players!\n"
echo -e "Here are the rules of the game:
1. Rock beats scissors (by crushing them).
2. Scissors beat paper (by cutting it).
3. Paper beats rock(by covering it).\n" 

echo "Please Enter Your Selection: " 
read player1

options=(rock paper scissors)
options_len="${#options[@]}"
comp_selection=$(($RANDOM % "options_len"))


function theGame()
{
	player2="${options[comp_selection]}" 
if [ "$player1" != "$player2" ]; then
       if [ "$player1" = rock ]; then
	      if [ "$player2" =  scissors ]; then
		     echo -e "Player 2's Selection: "$player2"\n"
		     echo "Rock beats scissors. You win!"
		     exit  
	     elif [ "$player2" =  paper ]; then
		    echo -e "Player 2's Selection: "$player2"\n" 
		    echo "Paper beats rock. Player 2 wins!" 
		    exit 
	      fi
       fi
       if [ "$player1" = paper ]; then
              if [ "$player2" =  scissors ]; then
		     echo -e "Player 2's Selection: "$player2"\n" 
                     echo "Scissors beat paper. Player 2 wins!"
                     exit 
             elif [ "$player2" =  rock ]; then
		    echo -e "Player 2's Selection: "$player2"\n"
                    echo "Paper beats rock. You win!"
                    exit 
              fi
       fi
       if [ "$player1" = scissors ]; then
              if [ "$player2" =  rock ]; then
                     echo -e "Player 2's Selection: "$player2"\n"
		     echo "Rock beats scissors. Player 2 wins!"
                     exit
             elif [ "$player2" =  paper ]; then
		    echo -e "Player 2's Selection: "$player2"\n"
                    echo "Scissors beat paper. You win!"
                    exit 
              fi
       fi
fi        

if [ "$player1" = "${options[comp_selection]}" ]; then
	echo -e "\nThere is a tie! Let's play again.\n"
	echo "Please Enter Your New Selection: " 
	read player1
	comp_selection=$(($RANDOM % "options_len"))
	player2="${options[comp_selection]}"
	theGame "$player1" "$player2"
fi

return 
}

theGame "$player1" "$player2" 
