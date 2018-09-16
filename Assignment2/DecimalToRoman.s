#######################################################################
## Name of Program: Decimal To Roman		
## Version number: V0.1
## Date last changed: 02:17 14/08/2017
## Author: Melissa Brennan			Student ID: B00714027
## Description:
##	This program takes a number input from the user, and converts
##	it into the roman number system.
#######################################################################
## Notes
## - $t0 stores the users input.
#######################################################################

	.data
INTRO: 	.asciiz	"Decimal to Roman Converter\n--------------------------"
text0:	.asciiz	"Please enter a number: "
text1a:	.asciiz	"The roman number for "
text1b:	.asciiz	" is: "
error_Number:	.asciiz	"Invalid Number."

M:	.asciiz "M" # 1000's
D:	.asciiz "D" # 500's
C:	.asciiz "C" # 100's
L: 	.asciiz "L" # 50's
X:	.asciiz "X" # 10's
V:	.asciiz "V" # 5's
I:	.asciiz "I" # 1's

CM:	.asciiz "CM" # 900's
CD:	.asciiz "CD" # 400's
XC:	.asciiz "XC" # 90's
XL:	.asciiz "XL" # 40's
IX: .asciiz "IX" # 9's
IV:	.asciiz "IV" # 4's

ln:	.asciiz "\n" # New Line

	.globl main
	.text

########## [@] --- Main --- [@] ##########

main:
	# Prints the INTRO string to the console.
	la $a0, INTRO
	li $v0, 4
	syscall

	# Jumps to printNewLine to output to the console a new line.
	jal printNewLine
	jal printNewLine
	
	# Prints "Please enter a number: " to the console.
	la $a0, text0
	li $v0, 4
	syscall

	# Jumps to printNewLine to output to the console a new line.
	jal printNewLine

	# Awaits for user input - Waiting for an int value.
	li $v0, 5
	syscall

	# Move the value stored in $v0 to $t0.
	move $t0, $v0

	# Error checking.
	blez $t0, invalidNumber

	# Prints "The roman number for x is: " to the console.
	jal printString
	# Jumps to printNewLine to output to the console a new line.
	jal printNewLine

	# Jumps to the loop
	jal loop

	# Jumps to the end
	j end

########## [@] --- Loop --- [@] ##########

loop:
	blez $t0, end
	bge $t0, 1000, oneThousand	# If $t0 is greater than or equal to 1000, run oneThousand.
	bge $t0, 900, nineHundred	# If $t0 is greater than or equal to 900, run nineHundred.
	bge $t0, 500, fiveHundred	# If $t0 is greater than or equal to 500, run fiveHundred.
	bge $t0, 400, fourHundred	# If $t0 is greater than or equal to 400, run fourHundred.
	bge $t0, 100, oneHundred	# If $t0 is greater than or equal to 100, run oneHundred.
	bge $t0, 90, ninety			# If $t0 is greater than or equal to 90, run ninety.
	bge $t0, 50, fifty			# If $t0 is greater than or equal to 50, run fifty.
	bge $t0, 40, forty			# If $t0 is greater than or equal to 40, run forty.
	bge $t0, 10, ten			# If $t0 is greater than or equal to 10, run ten.
	bge $t0, 9, nine			# If $t0 is greater than or equal to 9, run nine.
	bge $t0, 5, five			# If $t0 is greater than or equal to 5, run five.
	bge $t0, 4, four			# If $t0 is greater than or equal to 4, run four.
	bge $t0, 1, one				# If $t0 is greater than or equal to 1, run one.

########## [@] --- Handle Numbers --- [@] ##########

oneThousand:
	la $a0, M	# Moves the string in M to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -1000	# Adds -1000 to the value in $t0.
	b loop		# Return to loop to repeat.
	
nineHundred:
	la $a0, CM	# Moves the string in CM to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -900	# Adds -900 to the value in $t0.
	b loop		# Return to loop to repeat.
	
fiveHundred:
	la $a0, D	# Moves the string in D to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -500	# Adds -500 to the value in $t0.
	b loop		# Return to loop to repeat.
	
fourHundred:
	la $a0, CD	# Moves the string in CD to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -400	# Adds -400 to the value in $t0.
	b loop		# Return to loop to repeat.
	
oneHundred:
	la $a0, C	# Moves the string in C to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -100	# Adds -100 to the value in $t0.
	b loop		# Return to loop to repeat.
	
ninety:
	la $a0, XC	# Moves the string in XC to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -90	# Adds -90 to the value in $t0.
	b loop		# Return to loop to repeat.
	
fifty:
	la $a0, L	# Moves the string in L to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -50	# Adds -50 to the value in $t0.
	b loop		# Return to loop to repeat.
	
forty:
	la $a0, XL	# Moves the string in XL to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -40	# Adds -40 to the value in $t0.
	b loop		# Return to loop to repeat.
	
ten:
	la $a0, X	# Moves the string in X to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -10	# Adds -10 to the value in $t0.
	b loop		# Return to loop to repeat.
	
nine:
	la $a0, IX	# Moves the string in IX to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -9	# Adds -9 to the value in $t0.
	b loop		# Return to loop to repeat.
	
five:
	la $a0, V	# Moves the string in V to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -5	# Adds -5 to the value in $t0.
	b loop		# Return to loop to repeat.
	
four:
	la $a0, IV	# Moves the string in IV to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -4	# Adds -4 to the value in $t0.
	b loop		# Return to loop to repeat.
	
one:
	la $a0, I	# Moves the string in I to $a0
	li $v0, 4	# Put the value 4 into $v0, allowing $a0 to be printed to the console.
	syscall		# Check $v0 for code and perform action.
	addi $t0, -1	# Adds -1 to the value in $t0.
	b loop		# Return to loop to repeat.

########## [@] --- Print String --- [@] ##########

printString:
	la $a0, text1a
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, text1b
	li $v0, 4
	syscall

	jr $ra

########## [@] --- Print New Line --- [@] ##########

printNewLine:
	la $a0, ln
	li $v0, 4
	syscall	
	
	jr $ra		# Return

########## [@] --- End --- [@] ##########

end:
	# Sets the argument code to exit.
	li $v0, 10
	# Calls a check for the argument code and execute.
	syscall

########## [@] --- InvalidNumber --- [@] ##########

invalidNumber:
	la $a0, error_Number
	li $v0, 4
	syscall

	j end