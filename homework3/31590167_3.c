#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 


void swap(char **a, char **b){ // swap values'
	char *temp = *a; 
	*a = *b; 
	*b = temp; 
}


void bubbleSortEnv(char *envp[]){ // sorting the environment variables  
	char *name1, *name2, *token, *token2; 

	for(int i = 0; envp[i] != NULL; i++){
		for(int j = 0; envp[j+1] != NULL; j++){
			token = strdup(envp[j]); //copy so not modifying the original
			name1 = strtok(token, "="); 
		
			token2 = strdup(envp[j+1]); 
			name2 = strtok(token2, "="); 

			if(strcmp(name1, name2) > 0){
				swap(&envp[j], &envp[j+1]); 
			}
			free(token); 
			free(token2); //free the memory allocated by strdup 


		}
	 }

}


int main(int argc, char *argv[], char *envp[]){
	bubbleSortEnv(envp); 

	for(int i=0; envp[i] != NULL; i++){
		printf("%s\n", envp[i]); 
	}
	return 0; 

}
