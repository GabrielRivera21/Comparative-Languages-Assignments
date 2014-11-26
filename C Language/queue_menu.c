/*
 * queue_menu.c
 * This program manages a menu of common queue operations.
 */

#include "queue.h"   // for Queue and its functions

#include <stdio.h>   // for printf, scanf, getchar, puts
#include <stdlib.h>  // for malloc, free
#include <stddef.h>  // for NULL

// Declares functions using prototypes.
void show_menu(void);
int read_selection(void);
void process_selection(int sel, Queue *que);
void process_enqueue(Queue *que);
void process_dequeue(Queue *que);
void process_view(const Queue *que);
void show_element(void *elem);
void destroy_element(void *elem);

// Starts the execution of the program.
int main(void) {
    Queue *que = create_queue();
    int sel = 0;

    do {
        show_menu();
        sel = read_selection();
        process_selection(sel, que);
    } while (sel != 0);

    iterate_queue(que, &destroy_element);
    destroy_queue(que);
    que = NULL;
}

// Shows the menu options.
void show_menu(void) {
    puts("\nQueue Menu\n");
    puts("1. Enqueue an element");
    puts("2. Dequeue an element");
    puts("3. View the contents");
    puts("0. Exit");
}

// Returns the menu option selected by the user.
int read_selection(void) {
    int sel;
    printf("Enter your selection: ");
    scanf("%d", &sel);
    while (getchar() != '\n');  // empty input buffer
    return sel;
}

// Processes a menu selection and updates a Queue.
void process_selection(int sel, Queue *que) {
    switch (sel) {
        case 1: process_enqueue(que); break;
        case 2: process_dequeue(que); break;
        case 3: process_view(que); break;
        case 0: puts("Thanks for using this program!"); break;
        default: puts("Error! Selection must be between 0 and 3.");
    }
}

// Process the push element menu option.
void process_enqueue(Queue *que) {
    char *elem = malloc(sizeof(char));
    printf("Enter a character: ");
    scanf("%c", elem);
    enqueue(que, elem);
    printf("%c has been enqueued.\n", *elem);
}

// Process the pop element menu option.
void process_dequeue(Queue *que) {
    char *elem = dequeue(que);
    if (elem == NULL)
        puts("Could not dequeue. Queue is empty.");
    else {
        printf("%c has been dequeued.\n", *elem);
        free(elem);
    }
}

// Process the view contents menu option.
void process_view(const Queue *que) {
    if (is_empty_queue(que))
        puts("Cannot show.  Queue is empty.");
    else {
        printf("These are the contents of the queue: ");
        iterate_queue(que, &show_element);
        printf("\n");
    }
}

// Displays an element.
void show_element(void *elem) {
    printf("%c ", *(char *)elem);
}

// Deallocates the memory of an element.
void destroy_element(void *elem) {
    free(elem);
}
