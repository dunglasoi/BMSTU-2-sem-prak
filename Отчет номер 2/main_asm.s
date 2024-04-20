GAS LISTING /tmp/ccZcwpRP.s 			page 1


   1              		.file	"main.c"
   2              		.text
   3              		.section	.rodata
   4              	.LC1:
   5 0000 256C6600 		.string	"%lf"
   6              	.LC3:
   7 0004 496E7661 		.string	"Invalid input!"
   7      6C696420 
   7      696E7075 
   7      742100
   8              		.text
   9              		.globl	calculate_d
  10              		.type	calculate_d, @function
  11              	calculate_d:
  12              	.LFB0:
  13              		.cfi_startproc
  14 0000 F30F1EFA 		endbr64
  15 0004 55       		pushq	%rbp
  16              		.cfi_def_cfa_offset 16
  17              		.cfi_offset 6, -16
  18 0005 4889E5   		movq	%rsp, %rbp
  19              		.cfi_def_cfa_register 6
  20 0008 4883EC20 		subq	$32, %rsp
  21 000c 64488B04 		movq	%fs:40, %rax
  21      25280000 
  21      00
  22 0015 488945F8 		movq	%rax, -8(%rbp)
  23 0019 31C0     		xorl	%eax, %eax
  24 001b 660FEFC0 		pxor	%xmm0, %xmm0
  25 001f F20F1145 		movsd	%xmm0, -16(%rbp)
  25      F0
  26 0024 660FEFC0 		pxor	%xmm0, %xmm0
  27 0028 F20F1145 		movsd	%xmm0, -24(%rbp)
  27      E8
  28 002d C745E401 		movl	$1, -28(%rbp)
  28      000000
  29 0034 488D45E8 		leaq	-24(%rbp), %rax
  30 0038 4889C6   		movq	%rax, %rsi
  31 003b 488D0500 		leaq	.LC1(%rip), %rax
  31      000000
  32 0042 4889C7   		movq	%rax, %rdi
  33 0045 B8000000 		movl	$0, %eax
  33      00
  34 004a E8000000 		call	__isoc99_scanf@PLT
  34      00
  35 004f F20F104D 		movsd	-24(%rbp), %xmm1
  35      E8
  36 0054 F20F1005 		movsd	.LC2(%rip), %xmm0
  36      00000000 
  37 005c 660F2FC1 		comisd	%xmm1, %xmm0
  38 0060 761C     		jbe	.L13
  39 0062 488D0500 		leaq	.LC3(%rip), %rax
  39      000000
  40 0069 4889C7   		movq	%rax, %rdi
  41 006c E8000000 		call	puts@PLT
  41      00
  42 0071 F20F1005 		movsd	.LC4(%rip), %xmm0
GAS LISTING /tmp/ccZcwpRP.s 			page 2


  42      00000000 
  43 0079 E9A30000 		jmp	.L10
  43      00
  44              	.L13:
  45 007e E9830000 		jmp	.L5
  45      00
  46              	.L9:
  47 0083 F20F104D 		movsd	-24(%rbp), %xmm1
  47      E8
  48 0088 F20F1005 		movsd	.LC2(%rip), %xmm0
  48      00000000 
  49 0090 660F2FC1 		comisd	%xmm1, %xmm0
  50 0094 0F878100 		ja	.L14
  50      0000
  51 009a F20F1045 		movsd	-24(%rbp), %xmm0
  51      E8
  52 009f 660FEFC9 		pxor	%xmm1, %xmm1
  53 00a3 F20F2A4D 		cvtsi2sdl	-28(%rbp), %xmm1
  53      E4
  54 00a8 F20F5EC1 		divsd	%xmm1, %xmm0
  55 00ac 66480F7E 		movq	%xmm0, %rax
  55      C0
  56 00b1 66480F6E 		movq	%rax, %xmm0
  56      C0
  57 00b6 E8000000 		call	sqrt@PLT
  57      00
  58 00bb F20F104D 		movsd	-16(%rbp), %xmm1
  58      F0
  59 00c0 F20F58C1 		addsd	%xmm1, %xmm0
  60 00c4 F20F1145 		movsd	%xmm0, -16(%rbp)
  60      F0
  61 00c9 8345E401 		addl	$1, -28(%rbp)
  62 00cd 488D45E8 		leaq	-24(%rbp), %rax
  63 00d1 4889C6   		movq	%rax, %rsi
  64 00d4 488D0500 		leaq	.LC1(%rip), %rax
  64      000000
  65 00db 4889C7   		movq	%rax, %rdi
  66 00de B8000000 		movl	$0, %eax
  66      00
  67 00e3 E8000000 		call	__isoc99_scanf@PLT
  67      00
  68 00e8 83F801   		cmpl	$1, %eax
  69 00eb 7419     		je	.L5
  70 00ed 488D0500 		leaq	.LC3(%rip), %rax
  70      000000
  71 00f4 4889C7   		movq	%rax, %rdi
  72 00f7 E8000000 		call	puts@PLT
  72      00
  73 00fc F20F1005 		movsd	.LC4(%rip), %xmm0
  73      00000000 
  74 0104 EB1B     		jmp	.L10
  75              	.L5:
  76 0106 F20F1045 		movsd	-24(%rbp), %xmm0
  76      E8
  77 010b 660F2F05 		comisd	.LC2(%rip), %xmm0
  77      00000000 
  78 0113 0F836AFF 		jnb	.L9
GAS LISTING /tmp/ccZcwpRP.s 			page 3


  78      FFFF
  79 0119 EB01     		jmp	.L8
  80              	.L14:
  81 011b 90       		nop
  82              	.L8:
  83 011c F20F1045 		movsd	-16(%rbp), %xmm0
  83      F0
  84              	.L10:
  85 0121 66480F7E 		movq	%xmm0, %rax
  85      C0
  86 0126 488B55F8 		movq	-8(%rbp), %rdx
  87 012a 64482B14 		subq	%fs:40, %rdx
  87      25280000 
  87      00
  88 0133 7405     		je	.L11
  89 0135 E8000000 		call	__stack_chk_fail@PLT
  89      00
  90              	.L11:
  91 013a 66480F6E 		movq	%rax, %xmm0
  91      C0
  92 013f C9       		leave
  93              		.cfi_def_cfa 7, 8
  94 0140 C3       		ret
  95              		.cfi_endproc
  96              	.LFE0:
  97              		.size	calculate_d, .-calculate_d
  98              		.globl	main
  99              		.type	main, @function
 100              	main:
 101              	.LFB1:
 102              		.cfi_startproc
 103 0141 F30F1EFA 		endbr64
 104 0145 55       		pushq	%rbp
 105              		.cfi_def_cfa_offset 16
 106              		.cfi_offset 6, -16
 107 0146 4889E5   		movq	%rsp, %rbp
 108              		.cfi_def_cfa_register 6
 109 0149 4883EC10 		subq	$16, %rsp
 110 014d E8000000 		call	calculate_d
 110      00
 111 0152 66480F7E 		movq	%xmm0, %rax
 111      C0
 112 0157 488945F0 		movq	%rax, -16(%rbp)
 113 015b 660FEFC0 		pxor	%xmm0, %xmm0
 114 015f 660F2F45 		comisd	-16(%rbp), %xmm0
 114      F0
 115 0164 7607     		jbe	.L20
 116 0166 B8010000 		movl	$1, %eax
 116      00
 117 016b EB39     		jmp	.L18
 118              	.L20:
 119 016d 488B45F0 		movq	-16(%rbp), %rax
 120 0171 66480F6E 		movq	%rax, %xmm0
 120      C0
 121 0176 E8000000 		call	sin@PLT
 121      00
 122 017b 66480F7E 		movq	%xmm0, %rax
GAS LISTING /tmp/ccZcwpRP.s 			page 4


 122      C0
 123 0180 488945F8 		movq	%rax, -8(%rbp)
 124 0184 488B45F8 		movq	-8(%rbp), %rax
 125 0188 66480F6E 		movq	%rax, %xmm0
 125      C0
 126 018d 488D0500 		leaq	.LC1(%rip), %rax
 126      000000
 127 0194 4889C7   		movq	%rax, %rdi
 128 0197 B8010000 		movl	$1, %eax
 128      00
 129 019c E8000000 		call	printf@PLT
 129      00
 130 01a1 B8000000 		movl	$0, %eax
 130      00
 131              	.L18:
 132 01a6 C9       		leave
 133              		.cfi_def_cfa 7, 8
 134 01a7 C3       		ret
 135              		.cfi_endproc
 136              	.LFE1:
 137              		.size	main, .-main
 138              		.section	.rodata
 139 0013 00000000 		.align 8
 139      00
 140              	.LC2:
 141 0018 8DEDB5A0 		.long	-1598689907
 142 001c F7C6B0BE 		.long	-1095710985
 143              		.align 8
 144              	.LC4:
 145 0020 00000000 		.long	0
 146 0024 0000F0BF 		.long	-1074790400
 147              		.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
 148              		.section	.note.GNU-stack,"",@progbits
 149              		.section	.note.gnu.property,"a"
 150              		.align 8
 151 0000 04000000 		.long	1f - 0f
 152 0004 10000000 		.long	4f - 1f
 153 0008 05000000 		.long	5
 154              	0:
 155 000c 474E5500 		.string	"GNU"
 156              	1:
 157              		.align 8
 158 0010 020000C0 		.long	0xc0000002
 159 0014 04000000 		.long	3f - 2f
 160              	2:
 161 0018 03000000 		.long	0x3
 162              	3:
 163 001c 00000000 		.align 8
 164              	4:
GAS LISTING /tmp/ccZcwpRP.s 			page 5


DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
     /tmp/ccZcwpRP.s:11     .text:0000000000000000 calculate_d
     /tmp/ccZcwpRP.s:100    .text:0000000000000141 main

UNDEFINED SYMBOLS
__isoc99_scanf
puts
sqrt
__stack_chk_fail
sin
printf
