	.file	"crackme.c"
	.text
	.globl	_hash
	.def	_hash;	.scl	2;	.type	32;	.endef
_hash:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$-1515870811, -4(%ebp)
	jmp	L2
L3:
	movl	-4(%ebp), %eax
	sall	$5, %eax
	subl	-4(%ebp), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%ebp)
L2:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L3
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_auth
	.def	_auth;	.scl	2;	.type	32;	.endef
_auth:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_gets
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_hash
	cmpl	$1113772777, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.section .rdata,"dr"
LC0:
	.ascii "Access granted\0"
	.text
	.globl	_grant_access
	.def	_grant_access;	.scl	2;	.type	32;	.endef
_grant_access:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	call	___main
	call	_auth
	testl	%eax, %eax
	je	L10
	call	_grant_access
L10:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_gets;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
