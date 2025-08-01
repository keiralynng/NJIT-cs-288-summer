#include <stdio.h> 
#include <stdlib.h> 

struct node {
	int value; 
	struct node *next; 
};

void showList(struct node *head){
	struct node *p = head; 
	if(head == NULL) return; 

	while(p != NULL){
		printf("Data = %d\n", p->value); 
		p = p->next; 
	}
}

struct node *add(struct node *head, struct node *p){
	struct node *prev_node, *curr_node; 
	if(head == NULL) return p; 

	if (p->value < head->value){
		p->next = head; 
		return p;
}

	prev_node=head;
	curr_node = prev_node->next;

	while(curr_node != NULL){
		if(p->value < curr_node->value)
			break;

		prev_node=curr_node; 
		curr_node=curr_node->next;   
		}

		prev_node->next=p;
		p->next=curr_node; 
		return head; 
}

struct node *reverse(struct node *head2, struct node *p2){
	struct node *prev_node, *curr_node; 
	if(head2 == NULL) return p2;

	if(p2->value > head2->value){
		p2->next = head2;	
		return p2; 
	}

	prev_node=head2; 
	curr_node=prev_node-> next; 

	while(curr_node != NULL){
		if(p2->value > curr_node->value)
			break; 

		prev_node=curr_node; 
		curr_node=curr_node->next; 
	}

	prev_node->next=p2;
	p2->next=curr_node; 
	return head2; 
}

int main(){
	int i; 
	struct node *p, *p2, *head = NULL, *head2 = NULL; 
	
	printf("Please enter some integers below:\n"); 

	while((scanf("%d", &i)) != EOF){ // ctrl + D 
		p = (struct node *)malloc(sizeof(struct node)); 
		p2 = (struct node *)malloc(sizeof(struct node)); 
		p->value =i; 
		p2->value = i; 
		p->next = NULL;
	        p2->next = NULL; 	
		head = add(head, p);
	        head2 = reverse(head2, p2); 	
	}
	printf("\nData entered in the list are:\n"); 
	showList(head); 
	printf("\nThe list in reverse is:\n"); 
	showList(head2); 

	return 0;
}

