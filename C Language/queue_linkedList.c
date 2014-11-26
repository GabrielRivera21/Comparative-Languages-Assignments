/**
 * queue_linkedList.c
 * @author Gabriel Rivera Per-ossenkopp
 * Date: October 15, 2014
 * Description: This implements the Queue with a linked list.
 */
 #include "queue.h"

 #include <stdlib.h> // for malloc and free
 #include <stddef.h> // for NULL definition

 typedef struct node Node;

 struct node {
    void *data;
    Node *next;
 };

 struct queue {
    Node *front;        // pointer to the first node
    Node *rear;         // pointer to the last node
};

// Returns a new empty queue.
Queue *create_queue(void){
    Queue *que = malloc(sizeof(Queue));
    que->front = NULL;
    que->rear = NULL;
    return que;
}

// Determines whether the queue is empty.
bool is_empty_queue(const Queue *que){
    return que->front == NULL;
}

// Adds an element to the rear of the queue.
void enqueue(Queue *que, void *elem){
    Node *temp = malloc(sizeof(Node));
    temp->data = elem;
    temp->next = NULL;
    if(is_empty_queue(que))
        que->front = que->rear = temp;
    else
        que->rear = que->rear->next = temp;

}

// Removes and returns the element at the front of the queue.
// Returns NULL if queue is empty.
void *dequeue(Queue *que){
    if(que->front == NULL)
        return NULL;
    Node *temp = que->front;
    void *elem = que->front->data;
    que->front = que->front->next;
    free(temp);

    if(que->front == NULL)
        que->rear = NULL;

    return elem;
}

// Iterates through the queue using a visit function.
void iterate_queue(const Queue *que, void (*visit)(void *elem)){
    for(Node *curr = que->front; curr != NULL; curr = curr->next)
        visit(curr->data);
}

// Deallocates the memory of the queue.
void destroy_queue(Queue *que){
    while(que->front != NULL){
        Node *curr = que->front;
        que->front = que->front->next;
        free(curr);
    }
    que->rear = NULL;
    free(que);
}



