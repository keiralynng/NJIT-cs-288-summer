#include <stdio.h> 
#include <unistd.h> 

int main(int argc, char *argv[]){	
	int opt; 
	while((opt = getopt(argc, argv, ":cduf:s:")) != -1){
		switch(opt){
			case 'c':
			case 'd': 
			case 'u':
				printf("Option: -%c\n", opt); 
				break; 
			case 'f': 
			case 's': 
				printf("Option -%c has argument %s\n", opt, optarg); 
				break; 
			case ':':
				printf("Missing option argument.\n"); 
				break; 
			case '?':
				printf("Unknown option -%c\n", optopt); 
				break; 
		}
	}

		for(int i = optind; optind < argc; optind++){
			printf("Operand argument: %s\n", argv[optind]); 
			}

}
