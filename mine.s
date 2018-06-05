	.text
	.globl main
main:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	li $v1, 4
	move $a0, $v1
	jal _halloc
	move $t0, $v0
	la $v1, TV_Start
	move $t1, $v1
	sw $t1, 0($t0)
	li $v1, 4
	move $a0, $v1
	jal _halloc
	move $t1, $v0
	sw $t0, 0($t1)
	move $t0, $t1
	lw $t1, 0($t0)
	lw $t1, 0($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl TV_Start
TV_Start:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	li $v1, 84
	move $a0, $v1
	jal _halloc
	move $t0, $v0
	la $v1, Tree_Delete
	move $t1, $v1
	sw $t1, 0($t0)
	la $v1, Tree_SetHas_Left
	move $t1, $v1
	sw $t1, 4($t0)
	la $v1, Tree_RemoveLeft
	move $t1, $v1
	sw $t1, 8($t0)
	la $v1, Tree_GetKey
	move $t1, $v1
	sw $t1, 12($t0)
	la $v1, Tree_SetRight
	move $t1, $v1
	sw $t1, 16($t0)
	la $v1, Tree_GetLeft
	move $t1, $v1
	sw $t1, 20($t0)
	la $v1, Tree_GetRight
	move $t1, $v1
	sw $t1, 24($t0)
	la $v1, Tree_Remove
	move $t1, $v1
	sw $t1, 28($t0)
	la $v1, Tree_SetLeft
	move $t1, $v1
	sw $t1, 32($t0)
	la $v1, Tree_Insert
	move $t1, $v1
	sw $t1, 36($t0)
	la $v1, Tree_accept
	move $t1, $v1
	sw $t1, 40($t0)
	la $v1, Tree_Print
	move $t1, $v1
	sw $t1, 44($t0)
	la $v1, Tree_Init
	move $t1, $v1
	sw $t1, 48($t0)
	la $v1, Tree_GetHas_Right
	move $t1, $v1
	sw $t1, 52($t0)
	la $v1, Tree_GetHas_Left
	move $t1, $v1
	sw $t1, 56($t0)
	la $v1, Tree_RemoveRight
	move $t1, $v1
	sw $t1, 60($t0)
	la $v1, Tree_Search
	move $t1, $v1
	sw $t1, 64($t0)
	la $v1, Tree_SetKey
	move $t1, $v1
	sw $t1, 68($t0)
	la $v1, Tree_Compare
	move $t1, $v1
	sw $t1, 72($t0)
	la $v1, Tree_SetHas_Right
	move $t1, $v1
	sw $t1, 76($t0)
	la $v1, Tree_RecPrint
	move $t1, $v1
	sw $t1, 80($t0)
	li $v1, 28
	move $a0, $v1
	jal _halloc
	move $t1, $v0
	li $v1, 0
	move $t2, $v1
	sw $t2, 4($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 8($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 12($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 16($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 20($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 24($t1)
	sw $t0, 0($t1)
	move $s0, $t1
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 48($t1)
	li $v1, 16
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 44($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	li $v1, 100000000
	move $a0, $v1
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 8
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 24
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 4
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 12
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 20
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 28
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 36($t1)
	li $v1, 14
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 44($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	li $v1, 100000000
	move $a0, $v1
	jal _print
	li $v1, 4
	move $a0, $v1
	jal _halloc
	move $t0, $v0
	la $v1, MyVisitor_visit
	move $t1, $v1
	sw $t1, 0($t0)
	li $v1, 12
	move $a0, $v1
	jal _halloc
	move $t1, $v0
	li $v1, 0
	move $t2, $v1
	sw $t2, 4($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 8($t1)
	sw $t0, 0($t1)
	move $t0, $t1
	li $v1, 50000000
	move $a0, $v1
	jal _print
	move $t1, $s0
	lw $t2, 0($t1)
	lw $t2, 40($t2)
	move $a0, $t1
	move $a1, $t0
	jalr $t2
	move $t0, $v0
	li $v1, 100000000
	move $a0, $v1
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 24
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 12
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 16
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 50
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 12
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 0($t1)
	li $v1, 12
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 44($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 64($t1)
	li $v1, 12
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	li $v1, 0
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 12
	j $ra

	.text
	.globl Tree_Init
Tree_Init:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t1, $a0
	move $t0, $a1
	sw $t0, 24($t1)
	li $v1, 0
	move $t0, $v1
	sw $t0, 20($t1)
	li $v1, 0
	move $t0, $v1
	sw $t0, 8($t1)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_SetRight
Tree_SetRight:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	sw $t1, 16($t0)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_SetLeft
Tree_SetLeft:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	sw $t1, 4($t0)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_GetRight
Tree_GetRight:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	lw $t0, 16($t0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_GetLeft
Tree_GetLeft:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	lw $t0, 4($t0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_GetKey
Tree_GetKey:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	lw $t0, 24($t0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_SetKey
Tree_SetKey:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	sw $t1, 24($t0)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	lw $t0, 8($t0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	lw $t0, 20($t0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	sw $t1, 20($t0)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	sw $t1, 8($t0)
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_Compare
Tree_Compare:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t1, $a1
	move $t0, $a2
	li $v1, 0
	move $t2, $v1
	li $v1, 1
	add $v1, $t0, $v1
	move $t3, $v1
	slt $v1, $t1, $t0
	move $t0, $v1
	beqz $t0, L2
	li $v1, 0
	move $t2, $v1
	b L3
L2:	li $v1, 1
	move $t0, $v1
	slt $v1, $t1, $t3
	move $t1, $v1
	sub $v1, $t0, $t1
	move $t0, $v1
	beqz $t0, L4
	li $v1, 0
	move $t2, $v1
	b L5
L4:	li $v1, 1
	move $t2, $v1
L5:	nop
L3:	nop
	move $v0, $t2
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_Insert
Tree_Insert:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a0
	move $s1, $a1
	li $v1, 84
	move $a0, $v1
	jal _halloc
	move $t0, $v0
	la $v1, Tree_Delete
	move $t1, $v1
	sw $t1, 0($t0)
	la $v1, Tree_SetHas_Left
	move $t1, $v1
	sw $t1, 4($t0)
	la $v1, Tree_RemoveLeft
	move $t1, $v1
	sw $t1, 8($t0)
	la $v1, Tree_GetKey
	move $t1, $v1
	sw $t1, 12($t0)
	la $v1, Tree_SetRight
	move $t1, $v1
	sw $t1, 16($t0)
	la $v1, Tree_GetLeft
	move $t1, $v1
	sw $t1, 20($t0)
	la $v1, Tree_GetRight
	move $t1, $v1
	sw $t1, 24($t0)
	la $v1, Tree_Remove
	move $t1, $v1
	sw $t1, 28($t0)
	la $v1, Tree_SetLeft
	move $t1, $v1
	sw $t1, 32($t0)
	la $v1, Tree_Insert
	move $t1, $v1
	sw $t1, 36($t0)
	la $v1, Tree_accept
	move $t1, $v1
	sw $t1, 40($t0)
	la $v1, Tree_Print
	move $t1, $v1
	sw $t1, 44($t0)
	la $v1, Tree_Init
	move $t1, $v1
	sw $t1, 48($t0)
	la $v1, Tree_GetHas_Right
	move $t1, $v1
	sw $t1, 52($t0)
	la $v1, Tree_GetHas_Left
	move $t1, $v1
	sw $t1, 56($t0)
	la $v1, Tree_RemoveRight
	move $t1, $v1
	sw $t1, 60($t0)
	la $v1, Tree_Search
	move $t1, $v1
	sw $t1, 64($t0)
	la $v1, Tree_SetKey
	move $t1, $v1
	sw $t1, 68($t0)
	la $v1, Tree_Compare
	move $t1, $v1
	sw $t1, 72($t0)
	la $v1, Tree_SetHas_Right
	move $t1, $v1
	sw $t1, 76($t0)
	la $v1, Tree_RecPrint
	move $t1, $v1
	sw $t1, 80($t0)
	li $v1, 28
	move $a0, $v1
	jal _halloc
	move $t1, $v0
	li $v1, 0
	move $t2, $v1
	sw $t2, 4($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 8($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 12($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 16($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 20($t1)
	li $v1, 0
	move $t2, $v1
	sw $t2, 24($t1)
	sw $t0, 0($t1)
	move $s2, $t1
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 48($t1)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	move $t0, $v0
	li $v1, 1
	move $s3, $v1
L6:	beqz $s3, L7
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	slt $v1, $s1, $t0
	move $t0, $v1
	beqz $t0, L8
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L9
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s0, $t0
	b L10
L9:	li $v1, 0
	move $s3, $v1
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 4($t1)
	li $v1, 1
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 32($t1)
	move $a0, $t0
	move $a1, $s2
	jalr $t1
	move $t0, $v0
L10:	nop
	b L11
L8:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L12
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s0, $t0
	b L13
L12:	li $v1, 0
	move $s3, $v1
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 76($t1)
	li $v1, 1
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 16($t1)
	move $a0, $t0
	move $a1, $s2
	jalr $t1
	move $t0, $v0
L13:	nop
L11:	nop
	b L6
L7:	nop
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	j $ra

	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $s0
	move $s3, $s0
	li $v1, 1
	move $s4, $v1
	li $v1, 0
	move $v0, $v1
	sw $v0, -52($fp)
	li $v1, 1
	move $s6, $v1
L14:	beqz $s4, L15
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s7, $t0
	slt $v1, $s1, $s7
	move $t0, $v1
	beqz $t0, L16
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L17
	move $s3, $s2
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s2, $t0
	b L18
L17:	li $v1, 0
	move $s4, $v1
L18:	nop
	b L19
L16:	slt $v1, $s7, $s1
	move $t0, $v1
	beqz $t0, L20
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L21
	move $s3, $s2
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s2, $t0
	b L22
L21:	li $v1, 0
	move $s4, $v1
L22:	nop
	b L23
L20:	beqz $s6, L24
	li $v1, 1
	move $s7, $v1
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sub $v1, $s7, $t0
	move $s7, $v1
	li $v1, 1
	move $s5, $v1
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sub $v1, $s5, $t0
	move $t0, $v1
	mul $v1, $s7, $t0
	move $t0, $v1
	beqz $t0, L25
	li $v1, 1
	move $t0, $v1
	b L26
L25:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 28($t1)
	move $a0, $t0
	move $a1, $s3
	move $a2, $s2
	jalr $t1
	move $t0, $v0
L26:	nop
	b L27
L24:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 28($t1)
	move $a0, $t0
	move $a1, $s3
	move $a2, $s2
	jalr $t1
	move $t0, $v0
L27:	nop
	li $v1, 1
	move $v0, $v1
	sw $v0, -52($fp)
	li $v1, 0
	move $s4, $v1
L23:	nop
L19:	nop
	li $v1, 0
	move $s6, $v1
	b L14
L15:	nop
	lw $v1, -52($fp)
	move $v0, $v1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 52
	j $ra

	.text
	.globl Tree_Remove
Tree_Remove:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s1, $a0
	move $s2, $a1
	move $s0, $a2
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L28
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 8($t1)
	move $a0, $t0
	move $a1, $s2
	move $a2, $s0
	jalr $t1
	move $t0, $v0
	b L29
L28:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L30
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 60($t1)
	move $a0, $t0
	move $a1, $s2
	move $a2, $s0
	jalr $t1
	move $t0, $v0
	b L31
L30:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s0, $t0
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $t1, $s1
	lw $t2, 0($t1)
	lw $t2, 72($t2)
	move $a0, $t1
	move $a1, $s0
	move $a2, $t0
	jalr $t2
	move $t0, $v0
	beqz $t0, L32
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 32($t1)
	lw $t2, 12($s1)
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 4($t1)
	li $v1, 0
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	b L33
L32:	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 16($t1)
	lw $t2, 12($s1)
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 76($t1)
	li $v1, 0
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
L33:	nop
L31:	nop
L29:	nop
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	j $ra

	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s1, $a0
	move $s2, $a1
	move $s0, $a2
L34:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L35
	move $s3, $s0
	lw $t0, 0($s3)
	lw $s4, 68($t0)
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $s3
	move $a1, $t0
	jalr $s4
	move $t0, $v0
	move $s2, $s0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s0, $t0
	b L34
L35:	nop
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 16($t1)
	lw $t2, 12($s1)
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 76($t1)
	li $v1, 0
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	j $ra

	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s1, $a0
	move $s2, $a1
	move $s0, $a2
L36:	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L37
	move $s3, $s0
	lw $t0, 0($s3)
	lw $s4, 68($t0)
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $s3
	move $a1, $t0
	jalr $s4
	move $t0, $v0
	move $s2, $s0
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s0, $t0
	b L36
L37:	nop
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 32($t1)
	lw $t2, 12($s1)
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 4($t1)
	li $v1, 0
	move $t2, $v1
	move $a0, $t0
	move $a1, $t2
	jalr $t1
	move $t0, $v0
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	j $ra

	.text
	.globl Tree_Search
Tree_Search:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $t0, $a0
	move $s0, $a1
	move $s1, $t0
	li $v1, 1
	move $s2, $v1
	li $v1, 0
	move $s3, $v1
L38:	beqz $s2, L39
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s4, $t0
	slt $v1, $s0, $s4
	move $t0, $v1
	beqz $t0, L40
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L41
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s1, $t0
	b L42
L41:	li $v1, 0
	move $s2, $v1
L42:	nop
	b L43
L40:	slt $v1, $s4, $s0
	move $t0, $v1
	beqz $t0, L44
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L45
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $s1, $t0
	b L46
L45:	li $v1, 0
	move $s2, $v1
L46:	nop
	b L47
L44:	li $v1, 1
	move $s3, $v1
	li $v1, 0
	move $s2, $v1
L47:	nop
L43:	nop
	b L38
L39:	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	j $ra

	.text
	.globl Tree_Print
Tree_Print:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t0, $a0
	move $t1, $t0
	lw $t2, 0($t0)
	lw $t2, 80($t2)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	move $t0, $v0
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Tree_RecPrint
Tree_RecPrint:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a0
	move $s1, $a1
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L48
	move $s2, $s0
	lw $t0, 0($s2)
	lw $s3, 80($t0)
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $s2
	move $a1, $t0
	jalr $s3
	move $t0, $v0
	b L49
L48:	li $v1, 1
	move $t0, $v1
L49:	nop
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L50
	lw $t0, 0($s0)
	lw $s2, 80($t0)
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $s0
	move $a1, $t0
	jalr $s2
	move $t0, $v0
	b L51
L50:	li $v1, 1
	move $t0, $v1
L51:	nop
	li $v1, 1
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 32
	j $ra

	.text
	.globl Tree_accept
Tree_accept:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 8
	move $t1, $a0
	move $t0, $a1
	li $v1, 333
	move $a0, $v1
	jal _print
	lw $t2, 0($t0)
	lw $t2, 0($t2)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	move $t0, $v0
	li $v1, 0
	move $t0, $v1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 8
	j $ra

	.text
	.globl Visitor_visit
Visitor_visit:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s1, $a0
	move $s0, $a1
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L52
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sw $t0, 4($s1)
	lw $t0, 4($s1)
	lw $t1, 0($t0)
	lw $t1, 40($t1)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	move $t0, $v0
	b L53
L52:	li $v1, 0
	move $t0, $v1
L53:	nop
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L54
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sw $t0, 8($s1)
	lw $t0, 8($s1)
	lw $t1, 0($t0)
	lw $t1, 40($t1)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	move $t0, $v0
	b L55
L54:	li $v1, 0
	move $t0, $v1
L55:	nop
	li $v1, 0
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 16
	j $ra

	.text
	.globl MyVisitor_visit
MyVisitor_visit:
	sw $fp, -8($sp)
	sw $ra, -4($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s1, $a0
	move $s0, $a1
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L56
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 24($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sw $t0, 4($s1)
	lw $t0, 4($s1)
	lw $t1, 0($t0)
	lw $t1, 40($t1)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	move $t0, $v0
	b L57
L56:	li $v1, 0
	move $t0, $v1
L57:	nop
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	move $a0, $t0
	jal _print
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 56($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	beqz $t0, L58
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	move $a0, $t0
	jalr $t1
	move $t0, $v0
	sw $t0, 8($s1)
	lw $t0, 8($s1)
	lw $t1, 0($t0)
	lw $t1, 40($t1)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	move $t0, $v0
	b L59
L58:	li $v1, 0
	move $t0, $v1
L59:	nop
	li $v1, 0
	move $t0, $v1
	move $v0, $t0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 16
	j $ra

	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	j $ra

	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	j $ra

	.data
	.align 0
newl:
	.asciiz "\n"
	.data
	.align 0
str_er:
	.asciiz " ERROR: abnormal termination\n"
