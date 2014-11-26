#ifndef VECTOR_H_INCLUDED
#define VECTOR_H_INCLUDED

// Defines Vector as an alias for an opaque type.
typedef struct vector Vector;

// Returns a new empty vector with the specified initial capacity.
// Pre: init_cap > 0
Vector *create_vector(int init_cap);

// Determines whether the vector is empty.
bool is_empty_vector(const Vector *vct);

// Returns the capacity of the vector.
int capacity_vector(const Vector *vct);

// Returns the number of elements in the vector.
int size_vector(const Vector *vct);

// Changes the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
void set_vector(Vector *vct, int idx, char elem);

// Returns the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
char get_vector(const Vector *vct, int idx);

// Adds an element at the end of the vector.
void add_vector(Vector *vct, char elem);

// Inserts the element at the specified index of the vector.
// Pre: idx >= 0 && idx <= size_vector.
void insert_vector(Vector *vct, int idx, char elem);

// Removes the element at the specified index of the vector.
// Pre: idx >= 0 && idx < size_vector.
void remove_vector(Vector *vct, int idx);

// Returns the index of the specified element in the vector if found.
// Returns -1 otherwise.
int find_vector(const Vector *vct, char elem);

// Returns the index of the specified element in the vector if found.
// Returns -(insertion_point + 1) otherwise.
int binary_search_vector(const Vector *vct, char elem);

// Sorts the vector in ascending order.
void sort_vector(Vector *vct);

// Determines whether the vector is sorted.
bool is_sorted_vector(const Vector *vct);

// Iterates through the vector using a visit function.
void iterate_vector(const Vector *vct, void (*visit)(char elem));

// Deallocates the memory of the vector.
void destroy_vector(Vector *vct);


#endif // VECTOR_H_INCLUDED
