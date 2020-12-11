.data
	A: .space 100
	soluong: .asciiz"Nhap so luong phan tu:\n"
	chiso: .asciiz"Nhap vao chi so can tim\n"
	xuatmang: .asciiz "Mang vua nhap:\n"
	cach: .asciiz" ; "
	tbao1: .asciiz"Ket thuc!\n"
.text
	#Nhap so luong phan tu cua mang
	li $v0, 4
	la $a0, soluong 
	syscall
	li $v0, 5
	syscall
	
	addi $s6, $v0, 0	#luu tam thoi so phan tu
	move $s7, $s6
	la $s3, A	#luu dia chi nen
	
	input_loop:
		beq $s7, 0, endloop 	#kiem tra dk n==0 thi end loop
		li $v0, 5	#Nhap mang 
		syscall
		sw $v0, ($s3)	#luu gia tri vao mang
		addi $s7, $s7, -1
		addi $s3, $s3, 4
		b input_loop
	endloop:
		li $v0, 4 
		la $a0, tbao1
		syscall
		la $s3, A
		move $s7, $s6
	
	syscall
	li $v0, 5
	syscall
	addi $s0, $v0, 0	#luu gia tri i
	
	li $v0, 5
	syscall
	addi $s1,$v0, 0	#luu gia tri j
	
	bgt $s0, $s6, exit#s6 la so phan tu
	bgt $s1, $s6, exit
	blt $s0, $s1, do1#neu s0 be hon s1
	#else
	sll $t0, $s1, 2	#*4 dich trai 2 
	add $t1, $t0, $s3	#tinh toan dia chi A[i]
	sw $s1, ($t1)
	
	do1:
		sll $t0, $s0, 2#*4
		add $t1, $t0, $s3#s3 la A
		sw $s0, ($t1)
	
	output_loop:
		beq $s7, 0,exit
		
		lw $t2, ($s3)	#doc tung phan tu mang vao t2
		li $v0,1
		move $a0, $t2	
		syscall
		
		la $a0, cach
		li $v0, 4 
		syscall
		
		addi $s7, $s7, -1
		addi $s3, $s3, 4
		j output_loop			 
	
	exit:	
		move $s7, $s6	
