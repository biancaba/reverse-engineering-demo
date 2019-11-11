	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_compute_code           ## -- Begin function compute_code
	.p2align	4, 0x90
_compute_code:                          ## @compute_code
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -12(%rbp)
	movl	$17, -16(%rbp)
	movl	$13, -20(%rbp)
	movl	-12(%rbp), %eax
	addl	$17, %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$11, -16(%rbp)
	movl	$5, -20(%rbp)
	movl	-4(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	cltd
	idivl	-20(%rbp)
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	subl	$31, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rdi
	movl	$0, -4(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str.1(%rip), %rdi
	leaq	-12(%rbp), %rsi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	callq	_compute_code
	movl	%eax, -8(%rbp)
	movl	-12(%rbp), %eax
	movl	-8(%rbp), %ecx
	addl	$4, %ecx
	cmpl	%ecx, %eax
	jne	LBB1_2
## %bb.1:
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	jmp	LBB1_3
LBB1_2:
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
LBB1_3:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Enter the code:\n"

L_.str.1:                               ## @.str.1
	.asciz	"%d"

L_.str.2:                               ## @.str.2
	.asciz	"Correct number. Hurray!\n"

L_.str.3:                               ## @.str.3
	.asciz	"Incorrect. Try again :(\n"


.subsections_via_symbols
