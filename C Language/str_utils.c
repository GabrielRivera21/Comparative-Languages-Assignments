/**
 * str_utils.c
 * @author Gabriel Rivera Per-ossenkopp
 * Student Number: 841-11-6930
 * September 24, 2014
 * Description: This program uses a custom string to upper case function
 * and a string to int.
 */

#include <stdio.h>
#include <ctype.h> //for toupper

#define LENGTH 81

//Prototypes
void strtoupper(const char *str);
int strtoint(const char *str);
int my_strlen(const char *str);


int main(void){
    char str1[LENGTH];
    printf("Input a word: ");
    gets(str1);

    printf("The word you typed is %s.\n", str1);
    strtoupper(str1);
    printf("Checking if original changed. %s\n", str1);

    char str2[LENGTH];
    printf("\nType a digit string: ");
    scanf("%s", str2);
    int strdigit = strtoint(str2);
    printf("The String is now the Digit %d\n", strdigit);
}

/**
 * Displays a String in its upper case format
 */
void strtoupper(const char *str){
    char ptr[LENGTH];
    int idx = 0;
    while(*(str + idx)){
        ptr[idx] = toupper(*(str + idx));
        idx++;
    }
    ptr[idx] = '\0';
    printf("%s\n", ptr);
}

/**
 * Converts the String to an int
 */
int strtoint(const char *str){
    int len = my_strlen(str);
    int sign = 1;
    int place = 1;
    int digit = 0;

    for (int idx = len - 1; idx >= 0; idx--, place *= 10){
        int c = str[idx];
        switch (c){
            case '-':
                if (idx == 0) //checks if it's in the start of the number
                    sign = -1;
                else
                    return 0;
                break;
            default:
                if (c >= '0' && c <= '9')
                    digit += (c - '0') * place; //multiplies by the place it's in and accumulates
                else
                    return 0;
        }
    }
    return sign * digit;
}

/**
 * Returns the length of the String
 */
int my_strlen(const char *str){
    const char *ptr = str;
    while(*ptr++);
    return ptr - str -1;
}
