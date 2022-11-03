# SUM function
# INPUTS: rax -> x
#         rbx -> &y address of where in memory y is
# OUTPUTS: x = x + y : update rax by adding y
#                      quantity at the location of &y
	#          if y is positive then add y into an 8 byte value
	#          at stored at a location marked by a symbol
	#          named SUM_POSTIVE
	#          else add y into an 8 byte value stored at a
	#          location makred by a symbol named SUM_NEGATIVE
	#          final rbx should be updated to equal &y + 8
#
# This file must provide the symbols SUM_POSTIVE
# and SUM_NEGATIVE and associated memory

	.intel_syntax noprefix

	.section .data

# Label for location storing positive sum, set aside 8 bytes of memory
SUM_POSITIVE:
	.quad 0

# Label for location storing negative sum, set aside 8 bytes of memory
SUM_NEGATIVE:
	.quad 0

	.section .text
	.global SUM_FUNC
	.global SUM_POSITIVE
	.global SUM_NEGATIVE

# Begin fragment
SUM_FUNC:
	add rax, QWORD PTR [rbx]
	mov r15, QWORD PTR [rbx]
	cmp QWORD PTR [rbx], 0
	jl is_neg
	add SUM_POSITIVE, r15
	jmp done_cond

# If rbx is negative, jump here
is_neg:
	add SUM_NEGATIVE, r15
	jmp done_cond

# End of conditional statement, jump here to end program
# Add 8 to rbx and return to calc
done_cond:
	add rbx, 8
	ret
