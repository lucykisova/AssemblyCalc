	.intel_syntax noprefix

	.section .data
RAX_FINAL:
	.quad 0x0
NUM_DATA_BYTES:
	.quad 0x0
	
	.section .text
	.global _start	# makes label accessible in other files
_start:
	# zero out rax, set rbx to point to start of data
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]

# beginning of loop
LOOP_START:
	cmp QWORD PTR [rbx], 0
	jz write_stdout		# if zero, jump to write and exit
	cmp QWORD PTR [rbx], '&'
	je CALL_AND		# if & character found, jump to call and function
	cmp QWORD PTR [rbx], '|'
	je CALL_OR		# if | character found, jump to call or function
	cmp QWORD PTR [rbx], 'S'
	je CALL_SUM		# if S character found, jump to call sum function
	cmp QWORD PTR [rbx], 'U'
	je CALL_UPPER		# if U character found, jump to call upper function

# dummy function to increment rbx by 8
inc_rbx:
	add rbx, 8
	jmp LOOP_START

# calls function for and
CALL_AND:
	add rbx, 8
	call AND_FUNC
	jmp LOOP_START

# calls function for or
CALL_OR:
	add rbx, 8
	call OR_FUNC
	jmp LOOP_START

# calls function for sum
CALL_SUM:
	add rbx, 8
	call SUM_FUNC
	jmp LOOP_START

# calls function for upper
CALL_UPPER:
	add rbx, 8
	call UPPER_FUNC
	jmp LOOP_START
	
# writes to standard output
write_stdout:
	add QWORD PTR [RAX_FINAL], rax

	# write final value of RAX register
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [RAX_FINAL]
	mov rdx, 8
	syscall

	# write final value of SUM_POSITIVE
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_POSITIVE]
	mov rdx, 8
	syscall

	# write final value of SUM_NEGATIVE
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_NEGATIVE]
	mov rdx, 8
	syscall

	# calculate number of bytes data takes up
	xor r8, r8
	mov r8, OFFSET [CALC_DATA_END]
	add QWORD PTR [NUM_DATA_BYTES], r8

	xor r9, r9
	mov r9, OFFSET [CALC_DATA_BEGIN]
	sub QWORD PTR [NUM_DATA_BYTES], r9

	# write final data in memory
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [CALC_DATA_BEGIN]
	mov rdx, QWORD PTR [NUM_DATA_BYTES]
	syscall

	jmp loop_done
	
# jump here when done with program, hands control back to debugger
loop_done:
	mov rax, 60
	mov rdi, 0
	syscall
	
