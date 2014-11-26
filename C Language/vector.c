/**
 *  vector.c
 *  @author Gabriel
 *  Date: 15/October/2014
 *  Description: Implements the Vector as a char array.
 */
#include "vector.h"

#include <stdbool.h> //for boolean
#include <stdlib.h> //for malloc and free
#include <stddef.h> //for NULL definition

void ensure_capacity(Vector *vct);
void quick_sort(Vector *vct, int lo, int hi);
int partition(Vector *vct, int lo, int hi);

struct vector {
    int capacity;    // capacity of array
    char *data;      // pointer to array of characters
    int size;        // number of characters
};

Vector *create_vector(int init_cap){
    if(init_cap < 0)
        return NULL;
    Vector *vct = malloc(sizeof(Vector));
    vct->capacity = init_cap;
    vct->data = malloc(sizeof(char) * vct->capacity);
    vct->size = 0;
    return vct;
}

// Determines whether the vector is empty.
bool is_empty_vector(const Vector *vct){
    return vct->size == 0;
}

// Returns the capacity of the vector.
int capacity_vector(const Vector *vct){
    return vct->capacity;
}

// Returns the number of elements in the vector.
int size_vector(const Vector *vct){
    return vct->size;
}

// Changes the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
void set_vector(Vector *vct, int idx, char elem){
    if(idx >= 0 && idx < size_vector(vct))
        vct->data[idx] = elem;
}

// Returns the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
char get_vector(const Vector *vct, int idx){
    return vct->data[idx];
}

// Adds an element at the end of the vector.
void add_vector(Vector *vct, char elem){
    ensure_capacity(vct);
    vct->data[vct->size++] = elem;
}

void ensure_capacity(Vector *vct){
    if(vct->size == vct->capacity){
        vct->capacity *= 2;
        char *temp = malloc(sizeof(char) * vct->capacity);

        for(int idx = 0; idx < vct->size; idx++)
            temp[idx] = vct->data[idx];

        free(vct->data);
        vct->data = temp;
    }
}

// Inserts the element at the specified index of the vector.
// Pre: idx >= 0 && idx <= size_vector.
void insert_vector(Vector *vct, int idx, char elem){
    if(idx >= 0 && idx <= size_vector(vct))
        vct->data[idx] = elem;
}

// Removes the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
void remove_vector(Vector *vct, int idx){
    if(idx >= 0 && idx < size_vector(vct)){
        for(int x = idx; x < size_vector(vct) - 1; x++)
            vct->data[idx] = vct->data[idx + 1];
        vct->size--;
    }
}

// Returns the index of the specified element in the vector if found.
// Returns -1 otherwise.
int find_vector(const Vector *vct, char elem){
    for(int idx = 0; idx < size_vector(vct); idx ++){
        if(vct->data[idx] == elem)
            return idx;
    }
    return -1;
}

// Returns the index of the specified element in the vector if found.
// Returns -(insertion_point + 1) otherwise.
int binary_search_vector(const Vector *vct, char elem){
    int lo = 0, hi = size_vector(vct) - 1;
    while(lo < hi){
        int mid = (lo + hi)/2;
        if(vct->data[mid] == elem)
            return mid;
        else if(elem < vct->data[mid])
            hi = mid - 1;
        else
            lo = mid + 1;
    }
    return -(lo + 1);
}

// Sorts the vector in ascending order.
void sort_vector(Vector *vct){
    quick_sort(vct, 0 , size_vector(vct) - 1);
}

void quick_sort(Vector *vct, int lo, int hi){
    if(lo < hi){
        int pivotIdx = partition(vct, lo, hi);
        quick_sort(vct, lo, pivotIdx - 1); //sort left partition
        quick_sort(vct, pivotIdx + 1, hi); //sort right partition
    }
}

int partition(Vector *vct, int lo, int hi){
    char pivot = vct->data[hi];
    int left = 0;
    int right = hi;

    do{
        while(left < right && vct->data[left] <= pivot)
            left++;
        while(right > left && vct->data[right] >= pivot)
            right++;
        if(left < right){
            char temp = vct->data[left];
            vct->data[left] = vct->data[right];
            vct->data[right] = temp;
        }
    }while(left < right);

    vct->data[hi] = vct->data[left];
    vct->data[left] = pivot;
    return left;
}

// Determines whether the vector is sorted.
bool is_sorted_vector(const Vector *vct){
    for(int x = 0; x < size_vector(vct) - 1; x++){
        if(vct->data[x] > vct->data[x + 1])
            return false;
    }
    return true;
}

// Iterates through the vector using a visit function.
void iterate_vector(const Vector *vct, void (*visit)(char elem)){
    for(int curr = 0; curr < size_vector(vct); curr++)
        (*visit)(vct->data[curr]);
}

// Deallocates the memory of the vector.
void destroy_vector(Vector *vct){
    free(vct->data);
}


