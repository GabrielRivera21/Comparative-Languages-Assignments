#ifndef VECTOR_H
#define VECTOR_H

#include <stdbool.h>

// Defines Queue as an alias for an opaque type.
typedef struct queue Queue;

// Returns a new empty queue.
Queue *create_queue(void);

// Determines whether the queue is empty.
bool is_empty_queue(const Queue *que);

// Adds an element to the rear of the queue.
void enqueue(Queue *que, void *elem);

// Removes and returns the element at the front of the queue.
// Returns NULL if queue is empty.
void *dequeue(Queue *que);

// Iterates through the queue using a visit function.
void iterate_queue(const Queue *que, void (*visit)(void *elem));

// Deallocates the memory of the queue.
void destroy_queue(Queue *que);

#endif // VECTOR_H
