	.intel_syntax noprefix

	.section .text
	.global _start

_start:
	# zero out rax
	xor rax, rax

	# set up rbx to point to start of commands
	mov rbx, OFFSET [CALC_DATA_BEGIN]

	# exit
	mov rax, 60
	mov rdi, 0
	syscall
