	.file	"sum-check.c"
	.text
.Ltext0:
#APP
	.text
.globl	branch
.type	branch, @function
branch:
	push %rax
	push %rdx
	movslq	signature(%rip), %rdx
	leaq	branch_targets(%rip), %rax
	movq	(%rax,%rdx,8), %rax
	movq	%rax, target(%rip)
	pop %rdx
	pop %rax
	jmp *target(%rip)

	.globl	label1
.type	label1, @function
label1:
	addl $4, %edi
	addl $1, signature(%rip)
	jmp branch

	.globl	label2
.type	label2, @function
label2:
	addl $2, %edi
	addl $1, signature(%rip)
	jmp branch

#NO_APP
	.globl	sum
	.type	sum, @function
sum:
.LVL0:
.LFB11:
	.file 1 "sum-check.c"
	.loc 1 34 15 view -0
	.cfi_startproc
	.loc 1 35 5 view .LVU1
#APP
# 35 "sum-check.c" 1
		jmp branch
# 0 "" 2
	.loc 1 36 5 view .LVU2
# 36 "sum-check.c" 1
	.globl label3
.type label3, @function
label3:

# 0 "" 2
	.loc 1 39 5 view .LVU3
# 39 "sum-check.c" 1
		mov %edi, %eax

# 0 "" 2
.LVL1:
	.loc 1 40 5 view .LVU4
	.loc 1 41 1 is_stmt 0 view .LVU5
#NO_APP
	ret
	.cfi_endproc
.LFE11:
	.size	sum, .-sum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter the code:"
.LC1:
	.string	"%d"
.LC2:
	.string	"Correct number. Hurray!"
.LC3:
	.string	"Incorrect. Try again :("
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.loc 1 44 1 is_stmt 1 view -0
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 44 1 is_stmt 0 view .LVU7
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 45 4 is_stmt 1 view .LVU8
	.loc 1 46 4 view .LVU9
#APP
# 46 "sum-check.c" 1
	movq $label1, branch_targets(%rip)
# 0 "" 2
	.loc 1 47 4 view .LVU10
# 47 "sum-check.c" 1
	movq $label2, 8+branch_targets(%rip)
# 0 "" 2
	.loc 1 48 4 view .LVU11
# 48 "sum-check.c" 1
	movq $label3, 16+branch_targets(%rip)
# 0 "" 2
	.loc 1 50 4 view .LVU12
#NO_APP
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.LVL2:
	.loc 1 51 4 view .LVU13
	leaq	4(%rsp), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.LVL3:
	.loc 1 53 4 view .LVU14
	.loc 1 53 16 is_stmt 0 view .LVU15
	movl	$5, %edi
	call	sum
.LVL4:
	.loc 1 53 6 view .LVU16
	cmpl	4(%rsp), %eax
	je	.L7
	.loc 1 56 7 is_stmt 1 view .LVU17
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.LVL5:
.L4:
	.loc 1 58 4 view .LVU18
	.loc 1 59 1 is_stmt 0 view .LVU19
	movl	$0, %eax
	movq	8(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L8
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	.loc 1 54 7 is_stmt 1 view .LVU20
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.LVL6:
	jmp	.L4
.L8:
	.loc 1 59 1 is_stmt 0 view .LVU21
	call	__stack_chk_fail@PLT
.LVL7:
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.globl	target
	.bss
	.align 8
	.type	target, @object
	.size	target, 8
target:
	.zero	8
	.globl	signature
	.align 4
	.type	signature, @object
	.size	signature, 4
signature:
	.zero	4
	.comm	branch_targets,32,32
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/types/struct_FILE.h"
	.file 5 "/usr/include/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/bits/sys_errlist.h"
	.file 8 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x462
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF52
	.byte	0xc
	.long	.LASF53
	.long	.LASF54
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.byte	0x17
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x68
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x68
	.uleb128 0x6
	.byte	0x8
	.long	0x8d
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x8d
	.uleb128 0x8
	.long	.LASF55
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x220
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x87
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x87
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x87
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x87
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x87
	.byte	0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x87
	.byte	0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x87
	.byte	0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x87
	.byte	0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x87
	.byte	0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x87
	.byte	0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x87
	.byte	0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x239
	.byte	0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x23f
	.byte	0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x61
	.byte	0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x61
	.byte	0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x6f
	.byte	0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x4c
	.byte	0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x53
	.byte	0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x245
	.byte	0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x255
	.byte	0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x260
	.byte	0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x26b
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x23f
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x43
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x61
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x271
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x99
	.uleb128 0xa
	.long	.LASF56
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF41
	.uleb128 0x6
	.byte	0x8
	.long	0x234
	.uleb128 0x6
	.byte	0x8
	.long	0x99
	.uleb128 0xc
	.long	0x8d
	.long	0x255
	.uleb128 0xd
	.long	0x35
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22c
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x25b
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x266
	.uleb128 0xc
	.long	0x8d
	.long	0x281
	.uleb128 0xd
	.long	0x35
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF44
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x28d
	.uleb128 0x6
	.byte	0x8
	.long	0x220
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x28d
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x28d
	.uleb128 0xe
	.long	.LASF47
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x61
	.uleb128 0xc
	.long	0x2cd
	.long	0x2c2
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2b7
	.uleb128 0x6
	.byte	0x8
	.long	0x94
	.uleb128 0x7
	.long	0x2c7
	.uleb128 0xe
	.long	.LASF48
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x2c2
	.uleb128 0xc
	.long	0x2ee
	.long	0x2ee
	.uleb128 0xd
	.long	0x35
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f4
	.uleb128 0x10
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1
	.byte	0x4
	.byte	0x8
	.long	0x2de
	.uleb128 0x9
	.byte	0x3
	.quad	branch_targets
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.long	0x61
	.uleb128 0x9
	.byte	0x3
	.quad	signature
	.uleb128 0x11
	.long	.LASF51
	.byte	0x1
	.byte	0x6
	.byte	0x8
	.long	0x2ee
	.uleb128 0x9
	.byte	0x3
	.quad	target
	.uleb128 0x12
	.long	.LASF57
	.byte	0x1
	.byte	0x2b
	.byte	0x5
	.long	0x61
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x40f
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x2d
	.byte	0x8
	.long	0x61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.quad	.LVL2
	.long	0x444
	.long	0x387
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.uleb128 0x14
	.quad	.LVL3
	.long	0x44f
	.long	0x3ac
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x14
	.quad	.LVL4
	.long	0x40f
	.long	0x3c3
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x14
	.quad	.LVL5
	.long	0x444
	.long	0x3e2
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x14
	.quad	.LVL6
	.long	0x444
	.long	0x401
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.uleb128 0x16
	.quad	.LVL7
	.long	0x45c
	.byte	0
	.uleb128 0x17
	.string	"sum"
	.byte	0x1
	.byte	0x22
	.byte	0x5
	.long	0x61
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x444
	.uleb128 0x18
	.string	"a"
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.long	0x61
	.long	.LLST0
	.long	.LVUS0
	.byte	0
	.uleb128 0x19
	.long	.LASF59
	.long	.LASF60
	.byte	0x8
	.byte	0
	.uleb128 0x1a
	.long	.LASF61
	.long	.LASF62
	.byte	0x6
	.value	0x19a
	.byte	0xc
	.uleb128 0x1b
	.long	.LASF63
	.long	.LASF63
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS0:
	.uleb128 0
	.uleb128 .LVU4
	.uleb128 .LVU4
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LFE11
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"_IO_buf_end"
.LASF27:
	.string	"_old_offset"
.LASF60:
	.string	"__builtin_puts"
.LASF47:
	.string	"sys_nerr"
.LASF22:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF58:
	.string	"input"
.LASF61:
	.string	"__isoc99_scanf"
.LASF32:
	.string	"_offset"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF18:
	.string	"_IO_buf_base"
.LASF23:
	.string	"_markers"
.LASF13:
	.string	"_IO_read_end"
.LASF36:
	.string	"_freeres_buf"
.LASF49:
	.string	"branch_targets"
.LASF46:
	.string	"stderr"
.LASF31:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF54:
	.string	"/home/sam/repos/reverse-engineering-demo/insecure"
.LASF28:
	.string	"_cur_column"
.LASF55:
	.string	"_IO_FILE"
.LASF2:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF33:
	.string	"_codecvt"
.LASF1:
	.string	"unsigned int"
.LASF41:
	.string	"_IO_marker"
.LASF30:
	.string	"_shortbuf"
.LASF59:
	.string	"puts"
.LASF15:
	.string	"_IO_write_base"
.LASF39:
	.string	"_unused2"
.LASF63:
	.string	"__stack_chk_fail"
.LASF12:
	.string	"_IO_read_ptr"
.LASF3:
	.string	"short unsigned int"
.LASF10:
	.string	"char"
.LASF57:
	.string	"main"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF9:
	.string	"__off64_t"
.LASF37:
	.string	"__pad5"
.LASF42:
	.string	"_IO_codecvt"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_end"
.LASF53:
	.string	"sum-check.c"
.LASF8:
	.string	"__off_t"
.LASF24:
	.string	"_chain"
.LASF62:
	.string	"scanf"
.LASF43:
	.string	"_IO_wide_data"
.LASF21:
	.string	"_IO_backup_base"
.LASF44:
	.string	"stdin"
.LASF50:
	.string	"signature"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF14:
	.string	"_IO_read_base"
.LASF51:
	.string	"target"
.LASF29:
	.string	"_vtable_offset"
.LASF20:
	.string	"_IO_save_base"
.LASF48:
	.string	"sys_errlist"
.LASF25:
	.string	"_fileno"
.LASF40:
	.string	"FILE"
.LASF52:
	.string	"GNU C17 8.3.0 -mtune=generic -march=x86-64 -g -O1"
.LASF45:
	.string	"stdout"
.LASF56:
	.string	"_IO_lock_t"
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
