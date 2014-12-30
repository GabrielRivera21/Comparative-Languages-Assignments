########################################################################################
#ToUpperCase
#By Gabriel Rivera Per-ossenkopp
#Student ID: 841-11-6930
#COTI 3205 Organizacion de Computadora Seccion: LK1
#This Program prints the equivalent uppercase String of the user input string
#
#Register Use:
# $t0 - holds the string of the user
# $t1 - holds the one char of the user input String
# $t3 - Array of uppercase string
# $a0 - system argument adress
# $a1 - system argument adress for length of the user String
# $v0 - system call code
########################################################################################
.data
prompt: .asciiz "Enter the String: "
uppermsg: .asciiz "The Upper Case Equivalent is: "
string: .space 81
upper: .space 81
########################################################################################
#Text(Code) Segment
########################################################################################
.text
.globl main

	main: 
		li $v0, 4		#Set System to print String
		la $a0, prompt		#Setting the first printed String
		syscall			#Prints the first String
	
		li $v0, 8		#Set System to read a String by user
		la $a0, string		#setting to read String
		li $a1, 81		#Buffer length for String
		syscall			#Reads String from user
		move $t0, $a0		# Moves into register the string from user
	
		li $v0, 4		#Set System to print String
		la $a0, uppermsg	#Setting message to print
		syscall			#Prints the String message
		
		la $a0, upper		#Stores in upper string
		li $a1, 81		#Buffer length of Upper 
		move $t3, $a0
	
	Loop: 	lb $t1, ($t0)		#loads byte of the string
		beq $t1,$zero, Print	#Exits the loop when reads null
		blt $t1, 'a', nxt_Char	#If its less than the value of 'a' doesnt change and moves to next char
		bgt $t1, 'z', nxt_Char	#If its greater than the value of 'z' doesnt change and moves to next char
		sub $t1, $t1, 32	#Converts the char to upper case
					
     nxt_Char: 	sb $t1, ($t3)		#Stores the char in the upper Case Array
     		add $t0, $t0, 1 	#Points to next Char
     		add $t3,$t3, 1		#Points to next Char to be filled in Upper Array Chars
     		b Loop			#Returns to the loop sequence
     		
     	Print:	li $v0, 4		#Setting system to print String
     		la $a0, upper		#Preparing for String in upper case to be printed
     		syscall			#Prints the Upper Case String
     		
     		li $v0, 10		#Setting system to terminate program
     		syscall			#terminates program
	
	
	
	
