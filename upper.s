# UPPER function
# INPUTS: rax -> will store length of the string
# 		rbx -> pointer to a string somewhere in memory
# OUTPUTS: string stored in rbx becomes all lowercase
#		If character is uppercase or not a character, then skip
# 		Else subtract 20 (32 in decimal) from ascii value to convert
#	rax should be updated to add length of string	
	

	.intel_syntax noprefix

	.section .text
	.global UPPER_FUNC

# Begin function
UPPER_FUNC:
	xor r14, r14
	xor r15, r15
	push rax
	mov r14, QWORD PTR [rbx]

# Begin loop, jump back here each iteration
LOOP_START:	
	mov al, BYTE PTR [r14 + r15]
	cmp al, 0		# if zero, jump to return
	jz loop_done
	cmp al, 'a		# if before a, move to next character
	jb loop_next
	cmp al, 'z		# if after z, move to next character
	ja loop_next
	sub al, 32		# if a-z, subtract 32 from ascii value to make uppercase
	mov BYTE PTR [r14 + r15], al	# move new character back to original position
	jmp loop_next		# move to next iteration

# Increments length counter and jumps back to next iteration of the loop
loop_next:
	inc r15
	jmp LOOP_START

# End of loop, returns to calc
loop_done:
	pop rax
	add rax, r15
	ret
