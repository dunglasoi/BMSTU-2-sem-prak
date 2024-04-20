	.file	"main.c"
	.text
	.section	.rodata
.LC1:
	.string	"%lf"
.LC3:
	.string	"Invalid input!"
	.text
	.globl	calculate_d
	.type	calculate_d, @function
calculate_d:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$1, -28(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movsd	-24(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L13
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movsd	.LC4(%rip), %xmm0
	jmp	.L10
.L13:
	jmp	.L5
.L9:
	movsd	-24(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L14
	movsd	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-28(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$1, -28(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movsd	.LC4(%rip), %xmm0
	jmp	.L10
.L5:
	movsd	-24(%rbp), %xmm0
	comisd	.LC2(%rip), %xmm0
	jnb	.L9
	jmp	.L8
.L14:
	nop
.L8:
	movsd	-16(%rbp), %xmm0
.L10:
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calculate_d, .-calculate_d
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	calculate_d
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	pxor	%xmm0, %xmm0
	comisd	-16(%rbp), %xmm0
	jbe	.L20
	movl	$1, %eax
	jmp	.L18
.L20:
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	-1598689907
	.long	-1095710985
	.align 8
.LC4:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
