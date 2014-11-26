/**
 * fibonacci_calc.c
 * @author Gabriel Rivera Per-ossenkopp
 * Student Number: 841-11-6930
 * September 24, 2014
 * Description: This program calculates the n-th term of the fibonacci sequence
 */

 #include <stdio.h>

 //prototype
 int iterative_fibo(int n);
 int recursive_fibo(int n);

 int main(void){
    int n;
    printf("Enter a non-negative integer: ");
    scanf("%d", &n);

    printf("\n");
    printf("Using iteration, the %d-th number in the Fibonacci sequence is %d\n", n, iterative_fibo(n));
    printf("Using recursion, the %d-th number in the Fibonacci sequence is %d\n", n, recursive_fibo(n));
    printf("Thanks for using this program.\n");

    return 0;
 }

/**
 * Returns the n-th number of the Fibonacci Sequence using iterations
 */
 int iterative_fibo(int n){
    int firstTerm = 0, secondTerm = 1, nextTerm = 0;
    while(n-- > 0){
        nextTerm = firstTerm + secondTerm;
        firstTerm = secondTerm;
        secondTerm = nextTerm;
    }

    return firstTerm;
 }

/**
 * Returns the n-th number of the Fibonacci Sequence using recursion
 */
 int recursive_fibo(int n){
    if(n == 0)
        return 0;
    if(n == 1)
        return 1;
    return recursive_fibo(n - 1) + recursive_fibo(n - 2);
 }
