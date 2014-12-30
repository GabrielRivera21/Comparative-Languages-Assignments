########################################################################################
#Dot Product
#By Gabriel Rivera Per-ossenkopp
#Student ID: 841-11-6930
#COTI 3205 Organizacion de Computadora Seccion: LK1
#This Program calculates the dot product of 2 vectors of the same size
#
#Register Use:
# $t0 - holds the array length input by user
# $t1 - Counter for filling arrays and dot product calculation
# $t2 - Holds Vector A Array
# $t3 - Temporary variable holding user input for element into array
# $t4 - Holds Vector B Array
# $t5 - Holds Element of Vector A for Calculations
# $t6 - Holds Element of Vector B for Calculations
# $t7 -	Holds the Result of multiplication of Elements of Vector A and B
# $s0 - Accumulates the result of the dot product
# $a0 - system argument adress
# $v0 - system call code / holds integer variable of user
########################################################################################
.data
prompt: .asciiz "Enter the length of the vectors: "
prompt2: .asciiz "Enter an element: "
msgA: .asciiz "\nReading Vector A...\n"
msgB: .asciiz "\nReading Vector B...\n"
dotmsg: .asciiz "\nThe dot product of A and B is "
length: .word 0
vectorA: .space 40	#Reserve space for 10 integers
vectorB: .space 40	#Reserve space for 10 integers
errormsg: .asciiz "Error! You must enter enter a number between 0 and 10.\n"
########################################################################################
#Text(Code) Segment
########################################################################################
.text
.globl main

	main: 	
		li $v0, 4			#System code for print String
		la $a0, prompt			#Loads String
		syscall				#Prints String
		
		li $v0, 5			#Set System code to read an integer from user	
		syscall				#Reads Integer from User
		blt $v0, $zero, Error 		#If user enters negative number it goes to an error message
		bgt $v0, 10, Error		#If user enters a number higher than 10 it goes to error
		sw $v0, length			#Stores the new Length in length variable
		
		li $v0, 4			#System code for print string
		la $a0, msgA			#Loads the Reading Vector A msg
		syscall				#Prints String
		
		li $t1, 0			#Initialize Counter for Filling arrays
		
		la $t2, vectorA 		#Loads Base Adress of vectorA into register
		lw $t0, length			#Loads vector length into register
		
   Fill_VectA:	beq $t1, $t0, Fill_VectB	#Exits when Counter == length to fill next Vector 
   		li $v0, 4			#System Code for Print String
   		la $a0, prompt2			#Loads Message
   		syscall				#Prints Message
   		li $v0, 5			#System Code to read Integer from user
   		syscall				#Reads Integer
   		move $t3, $v0			#Moves the user's integer into a temporary register
   		sw $t3, ($t2)			#Stores the N number of user into vector A
   		add $t2, $t2, 4			#Points to next Element in vector A
   		add $t1, $t1, 1			#Increments Counter
   		b Fill_VectA			#Branch to Fill_VectA
   		
   Fill_VectB: 	la $t4, vectorB			#Loads Vector B into a register
   		li $v0, 4			#System Code to Print String
   		la $a0, msgB			#Loads the message
   		syscall				#prints the message
   		mul $t1, $t1, 4			#Multiplies Counter by 4 in order to substract pointer of array A
   		sub $t2, $t2, $t1		#Points to First Element of Vector A
   		li $t1, 0			#Re-Initializes Counter for fill Vector B
   	
   	FillB: 	beq $t1, $t0, dotProd		#When finished filling exits to dotProduct calculation
   		li $v0, 4			#System Code to Print String
   		la $a0, prompt2			#Loads String
   		syscall				#Prints String
   		li $v0, 5			#System call to get Integer from User
   		syscall				#Gets User Integer
   		move $t3, $v0			#Moves user input into a temporary register
   		sw $t3, ($t4)			#Stores the N number of user into Vector B
   		add $t4, $t4, 4			#Points to next Element
   		add $t1, $t1, 1			#Increments Counter
   		b FillB				#Branch to FillB
   		
      dotProd:	mul $t1, $t1, 4			#Multiplies Counter times 4 in order to substract pointer of array
      		sub $t4, $t4, $t1		#Points to first element of Vector B
      		li $v0, 4			#Set System code to print String
      		la $a0, dotmsg			#Loads String
      		syscall				#Prints the string
      		li $t1, 0			#Re-Initialize Counter			
      
      dotLoop:	beq $t1, $t0, Print		#Exits loop when finished calculation
      		lw $t5, ($t2)			#Loads Element of Vector A
      		lw $t6, ($t4)			#Loads Element of Vector B
      		mul $t7, $t5, $t6		#Multiplies elements of Vector B & Vector A
      		add $s0, $s0, $t7		#Result of dot product
      		add $t2, $t2, 4			#Points to next Element in Vector A
      		add $t4, $t4, 4			#Points to next Element in Vector B
      		add $t1, $t1, 1			#Increments Counter
      		b dotLoop			#Branch to Loop
      		
      	Error: 	li $v0, 4			#System code for print String
      		la $a0, errormsg		#Loads Error Msg
      		syscall				#Prints Error Msg
      		b main				#Back to Start of program
      		
      	Print: 	li $v0, 1			#System Code to Print Integer
      		la $a0, ($s0)			#Loads result of dot Product into adress
      		syscall				#Prints the result
      		
      		li $v0,10			#System code to terminate program
      		syscall				#Terminates program
