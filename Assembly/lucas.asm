########################################################################################
#Lucas Numbers
#By Gabriel Rivera Per-ossenkopp
#This program prints all the terms specified by the user of the Lucas Numbers sequence 
#
#Register Use:
# $t1 - First Nth-term
# $t2 - 2nd N-th Term
# $t3 - Nth terms
# $t4 - Counter
# $t5 - Result of Summatory
# $a0 - system call argument
# $v0 - system call code
########################################################################################
.data
prompt1: .asciiz "Enter the first term: "
prompt2: .asciiz "Enter the second term: "
prompt3: .asciiz "Enter the number of terms: "
lucasmsg1: .asciiz "The first "
lucasmsg2: .asciiz " terms: "
space: .asciiz " "
#######################################################################################
#Text(Code) Segment
#######################################################################################
.text
.globl main

main:
	li $v0, 4 		#System call for Print String 
	la $a0, prompt1		#Prints the first String
	syscall			#Read String
	li $v0, 5		#set system to Read an integer of the user
	syscall			#Reads the integer from user input
	move $t1, $v0		#Stores the the first Term to a register
	
	li $v0, 4 		#System call for print String
	la $a0, prompt2		#Setting to print the second String
	syscall			#Prints the second String 
	li $v0, 5		#set System to read the second integer of the user
	syscall			#Reads the second integer from user input
	move $t2, $v0		#Stores the second Term in another register
	
	li $v0,4 		#System call for print String
	la $a0, prompt3		#Setting to print the third String
	syscall			#Prints the third String
	li $v0,5		#Set System to read number of terms
	syscall			#Reads the N-th Term from user
	move $t3,$v0		#Store Max terms
	
	li $t4, 3		#Initialize counter for loop
	
	li $v0, 4		#System call for print String
	la $a0, lucasmsg1	#Setting to print the string
	syscall			#Prints the first String for lucasMSG
	li $v0, 1		#System call to print integer
	la $a0, ($t3)		#Setting for printing the number of terms
	syscall			#Prints the number of terms
	li $v0, 4		#System call for print String
	la $a0,lucasmsg2	#setting to print the last part of the string for lucas
	syscall			#Prints the last String of LucasMsg
	
	li $v0, 1		#System call to print Integer
	la $a0, ($t1)		#Setting the to print the first term
	syscall			#Prints the first term
	
	li $v0, 4		#System call to print a String
	la $a0, space		#Setting to address blank space
	syscall			#Print Blank Space
	
	li $v0, 1		#System Call to Print Integer
	la $a0,($t2)		#Setting to print the second term
	syscall			#Prints the second term
	
	li $v0, 4		#System call to Print String
	la $a0, space		#Setting blank space in adress
	syscall			#Prints blank Space
	
Loop:	bgt $t4, $t3, END	#Exits Loop when the Counter > terms
	add $t5, $t1, $t2	#Calculation for the sums
	li $v0, 1		#Setting System to print the calculation
	la $a0, ($t5)		#Preparing to print the calculation
	syscall			#Print the number
	
	li $v0, 4		#System Call to Print String
	la, $a0, space		#Setting Blank Space in address
	syscall			#Prints Blank Space
	
	move $t1, $t2		#Update the First Term
	move $t2, $t5		#Update Second Term	
	add $t4, $t4, 1		#Increments counter
	b Loop			#Branch to loop
	
END: 	li $v0, 10		#Calling System to end the program
	syscall			#terminate the program
			
	
	
	
