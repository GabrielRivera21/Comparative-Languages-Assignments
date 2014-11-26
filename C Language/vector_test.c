/*
 * char_vector_test.c
 * This program tests the character vector and its operations.
 */

#include "char_vector.h"   // for Vector and its functions

#include <stdio.h>   // for printf
#include <stddef.h>  // for NULL definition

// Declares functions using prototypes.
void show_vector(Vector *vct);
void show_element(char elem);

// Starts the execution of the program.
int main(void) {
    Vector *vct = create_vector(5);
    printf("A new vector has been created.\n");
    show_vector(vct);

    add_vector(vct, 'y');
    add_vector(vct, 'd');
    add_vector(vct, 'm');
    add_vector(vct, 'h');
    add_vector(vct, 'a');
    printf("Some elements (y,d,m,h,a) have been added.\n");
    show_vector(vct);

    int index = find_vector(vct, 'h');
    if (index > 0)
        printf("Element h is at index %d.\n\n", index);

    insert_vector(vct, 2, 'x'); // should increase capacity
    printf("An element (x) has been inserted at index 2.\n");
    show_vector(vct);

    remove_vector(vct, 2);
    printf("An element (x) has been removed at index 2.\n");
    show_vector(vct);

    if (! is_sorted_vector(vct)) {
        sort_vector(vct);
        printf("The vector has been sorted.\n");
        show_vector(vct);
    }

    index = binary_search_vector(vct, 'h');
    if (index > 0)
        printf("Element h is at index %d.\n\n", index);

    index = binary_search_vector(vct, 'f');
    if (index < 0) {
        index = -(index + 1);
        insert_vector(vct, index, 'f');
        printf("An element (f) has been inserted in order.\n");
        show_vector(vct);  // should still be sorted
    }

    printf("The first element is %c\n", get_vector(vct, 0));
    set_vector(vct, 0, 't');
    printf("Element at index 0 has been set to a new value (t).\n");
    show_vector(vct);      // no longer sorted

    if (! is_sorted_vector(vct))
        printf("The vector is no longer sorted.\n");

    destroy_vector(vct);
    vct = NULL;
    return 0;
}

// Displays a vector.
void show_vector(Vector *vct) {
    printf("The vector's size is %d\n", size_vector(vct));
    printf("Its capacity is %d\n", capacity_vector(vct));
    if (is_empty_vector(vct))
        printf("It is empty.\n\n");
    else {
        printf("Its contents are ");
        iterate_vector(vct, &show_element);
        printf("\n\n");
    }
}

// Displays an element.
void show_element(char elem) {
    printf("%c ", elem);
}

