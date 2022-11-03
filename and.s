# AND function
# INPUTS: rax -> x
#         rbx -> &y address of where in memory y is
# OUTPUTS: x = x bitwise and y : update rax with bit wise and of the
#                                8 byte quantity at the location of &y
#          rbx should be updated to equal &y + 8

	.intel_syntax noprefix

	.section .text
	.global AND_FUNC

# Begin function
AND_FUNC:
	and rax, QWORD PTR [rbx]

	# Add 8 to rbx and return to calc
	add rbx, 8
	ret
