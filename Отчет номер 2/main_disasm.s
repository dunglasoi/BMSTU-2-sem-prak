
main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <calculate_d>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 30          	sub    $0x30,%rsp
   8:	0f 57 c0             	xorps  %xmm0,%xmm0
   b:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
  10:	0f 57 c0             	xorps  %xmm0,%xmm0
  13:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
  18:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
  1f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 26 <calculate_d+0x26>
  26:	48 8d 75 e8          	lea    -0x18(%rbp),%rsi
  2a:	b0 00                	mov    $0x0,%al
  2c:	e8 00 00 00 00       	call   31 <calculate_d+0x31>
  31:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # 39 <calculate_d+0x39>
  38:	00 
  39:	66 0f 2e 45 e8       	ucomisd -0x18(%rbp),%xmm0
  3e:	0f 86 20 00 00 00    	jbe    64 <calculate_d+0x64>
  44:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 4b <calculate_d+0x4b>
  4b:	b0 00                	mov    $0x0,%al
  4d:	e8 00 00 00 00       	call   52 <calculate_d+0x52>
  52:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # 5a <calculate_d+0x5a>
  59:	00 
  5a:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  5f:	e9 b5 00 00 00       	jmp    119 <calculate_d+0x119>
  64:	e9 00 00 00 00       	jmp    69 <calculate_d+0x69>
  69:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
  6e:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 76 <calculate_d+0x76>
  75:	00 
  76:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  7a:	0f 82 8f 00 00 00    	jb     10f <calculate_d+0x10f>
  80:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # 88 <calculate_d+0x88>
  87:	00 
  88:	66 0f 2e 45 e8       	ucomisd -0x18(%rbp),%xmm0
  8d:	0f 86 05 00 00 00    	jbe    98 <calculate_d+0x98>
  93:	e9 77 00 00 00       	jmp    10f <calculate_d+0x10f>
  98:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
  9d:	f2 0f 11 45 d8       	movsd  %xmm0,-0x28(%rbp)
  a2:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
  a7:	f2 0f 2a 4d e4       	cvtsi2sdl -0x1c(%rbp),%xmm1
  ac:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  b0:	e8 00 00 00 00       	call   b5 <calculate_d+0xb5>
  b5:	0f 28 c8             	movaps %xmm0,%xmm1
  b8:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  bd:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  c1:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
  c6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  c9:	83 c0 01             	add    $0x1,%eax
  cc:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  cf:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # d6 <calculate_d+0xd6>
  d6:	48 8d 75 e8          	lea    -0x18(%rbp),%rsi
  da:	b0 00                	mov    $0x0,%al
  dc:	e8 00 00 00 00       	call   e1 <calculate_d+0xe1>
  e1:	83 f8 01             	cmp    $0x1,%eax
  e4:	0f 84 20 00 00 00    	je     10a <calculate_d+0x10a>
  ea:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # f1 <calculate_d+0xf1>
  f1:	b0 00                	mov    $0x0,%al
  f3:	e8 00 00 00 00       	call   f8 <calculate_d+0xf8>
  f8:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # 100 <calculate_d+0x100>
  ff:	00 
 100:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
 105:	e9 0f 00 00 00       	jmp    119 <calculate_d+0x119>
 10a:	e9 5a ff ff ff       	jmp    69 <calculate_d+0x69>
 10f:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
 114:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
 119:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
 11e:	48 83 c4 30          	add    $0x30,%rsp
 122:	5d                   	pop    %rbp
 123:	c3                   	ret    
 124:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
 12b:	00 00 00 
 12e:	66 90                	xchg   %ax,%ax

0000000000000130 <main>:
 130:	55                   	push   %rbp
 131:	48 89 e5             	mov    %rsp,%rbp
 134:	48 83 ec 20          	sub    $0x20,%rsp
 138:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 13f:	e8 00 00 00 00       	call   144 <main+0x14>
 144:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
 149:	0f 57 c0             	xorps  %xmm0,%xmm0
 14c:	66 0f 2e 45 f0       	ucomisd -0x10(%rbp),%xmm0
 151:	0f 86 0c 00 00 00    	jbe    163 <main+0x33>
 157:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
 15e:	e9 29 00 00 00       	jmp    18c <main+0x5c>
 163:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
 168:	e8 00 00 00 00       	call   16d <main+0x3d>
 16d:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
 172:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
 177:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 17e <main+0x4e>
 17e:	b0 01                	mov    $0x1,%al
 180:	e8 00 00 00 00       	call   185 <main+0x55>
 185:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 18c:	8b 45 fc             	mov    -0x4(%rbp),%eax
 18f:	48 83 c4 20          	add    $0x20,%rsp
 193:	5d                   	pop    %rbp
 194:	c3                   	ret    
