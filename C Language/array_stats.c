/**
 * array_stats.c
 * @author Gabriel Rivera Per-ossenkopp
 * Student Number: 841-11-6930
 * September 24, 2014
 * Description: This program initializes an array by user input
 * and sees the minimum and average of the array.
 */

#include <stdio.h>

#define LENGTH 10

//prototype
int minimum(const int arr[], int len);
int minimum_v2(int *base, int len);
float average(const int arr[], int len);
float average_v2(int *base, int len);
int odd_elements(const int arr[], int len);
int odd_elements_v2(int *base, int len);
void fill_array(int arr[], int len);

int main(void){
    int arr[LENGTH];
    printf("Enter the %d Elements: ", LENGTH);
    fill_array(arr, LENGTH);

    printf("\n");
    printf("The minimum element is %d\n", minimum(arr, LENGTH));
    printf("The average of the elements is %.1f\n", average(arr, LENGTH));
    printf("There are %d odd elements\n\n", odd_elements(arr, LENGTH));

    printf("The minimum element is %d\n", minimum_v2(arr, LENGTH));
    printf("The average of the elements is %.1f\n", average_v2(arr, LENGTH));
    printf("There are %d odd elements\n\n", odd_elements_v2(arr, LENGTH));

    printf("Thanks for using this program.\n");

    return 0;
}

/**
 * Grabs the user input of the User and fills the array
 */
void fill_array(int arr[], int len){
    for (int idx = 0; idx < len; idx++)
        scanf("%d", &arr[idx]);
}

/**
 * Returns the minimum from an array
 */
int minimum(const int arr[], int len){
    int min = 0;
    for(int idx=0; idx < len; idx++){
        if(arr[idx] < min)
            min = arr[idx];
    }
    return min;
}

/**
 * Returns the average of an array of int
 */
float average(const int arr[], int len){
    float avg = 0;
    int idx = 0;
    while(idx < len){
        avg += (float) arr[idx++];
    }
    avg /= (idx);
    return avg;
}

/**
 * Returns the how many odd elements there are in an array.
 */
int odd_elements(const int arr[], int len){
    int odds = 0;
    for(int idx = 0; idx < len; idx++){
        if(arr[idx] % 2 != 0)
            odds++;
    }
    return odds;
}

/**
 * Returns the minimum from an array
 */
int minimum_v2(int *base, int len){
    int min = 0;
    for(int idx=0; idx < len; idx++){
        if(*(base + idx) < min)
            min = *(base + idx);
    }
    return min;
}

/**
 * Returns the average of an array of int
 */
float average_v2(int *base, int len){
    float avg = 0;
    int idx = 0;
    while(idx < len){
        avg += (float) *(base + idx++);
    }
    avg /= (idx);
    return avg;
}

/**
 * Returns the how many odd elements there are in an array.
 */
int odd_elements_v2(int *base, int len){
    int odds = 0;
    for(int idx = 0; idx < len; idx++){
        if(*(base + idx) % 2 != 0)
            odds++;
    }
    return odds;
}
