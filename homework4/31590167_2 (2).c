#include <stdio.h> 
#include <stdlib.h>

struct node{
	int value; 
	struct node *next;

};

void bubble(struct node **head_ref){
	int swapped; 
	struct node **ptr; 
	struct node *a, *b; 

	if(*head_ref == NULL) return; 

	do{
		swapped = 0; 
		ptr = head_ref;   

		while((*ptr)->next != NULL){
			a = *ptr; 
			b = a->next;

			if(a->value > b->value){
				a->next = b->next;
				b->next = a; 
				*ptr = b;
				swapped = 1;
			}
	ptr = &((*ptr)->next); 
	}
	}	
while(swapped);
}

void showList(struct node *head){
	struct node *p = head;
	printf("\n");
	if(head == NULL) return; 
	while(p != NULL){
		printf("%d\n", p->value); 
		p = p->next; 
	}
}

int main(){
	struct node *p, *tail = NULL, *head = NULL; 
	int i; 

	printf("Enter some integers below:\n"); 

	while(scanf("%d", &i) != EOF){
		p = (struct node *)malloc(sizeof(struct node)); 
		p->value = i;
		p->next = NULL; 	

	if(head == NULL){
		head = p; 
		tail =p; 	
	}
	else{
		tail->next = p; 
		tail = p;
	}
	}
	bubble(&head); 
	showList(head); 
	return 0; 
}

