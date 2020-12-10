.data
	A: .space 80
	B: .space 80
	soluongA: .asciiz"Nhap so luong phan tu A:\n"
	soluongB: .asciiz"Nhap so luong phan tu B:\n"
	giatrii: .asciiz"Nhap vao chi so i:\n"
	xuatmang: .asciiz "Mang vua nhap:\n"
	cach: .asciiz" ; "
	tbao1: .asciiz"Ket thuc!\n"
	NhapA: .asciiz"Nhap mang A:\n"
	NhapB: .asciiz"Nhap mang B:\n"
.text
	#Nhap so luong phan tu cua mang
	li $v0, 4
	la $a0, soluongA 
	syscall
	li $v0, 5
	syscall
	
	addi $s4, $v0, 0	#luu tam thoi so phan tu mang A
	move $s5, $s4#s5 là s? luownwngj A
	
	la $a0, soluongB
	li $v0, 4 
	syscall
	li $v0, 5
	syscall
	
	addi $s6, $v0, 0	#luu tam thoi so phan tu mang B
	move $s7, $s6#s7 là s? lý?ng B
	
	la $s1, A	#luu dia chi nen
	la $s2, B		
	
	la $a0, NhapA
	li $v0, 4 
	syscall
	input_loopA:
		beq $s5, 0, endloopA 	#kiem tra dk n!=0
		li $v0, 5	#Nhap mang 
		syscall
		sw $v0, ($s1)	#luu gia tri vao mang
		addi $s5, $s5, -1
		addi $s1, $s1, 4
		b input_loopA
	endloopA:
		li $v0, 4 
		la $a0, tbao1
		syscall
		la $s1, A
		move $s5, $s4
	la $a0, NhapB
	li $v0, 4 
	syscall
	
	input_loopB:
		beq $s7, 0, endloopB 	#kiem tra dk n!=0
		li $v0, 5	#Nhap mang 
		syscall
		sw $v0, ($s2)	#luu gia tri vao mang
		addi $s7, $s7, -1
		addi $s2, $s2, 4
		b input_loopB
	endloopB:
		la $a0, tbao1
		li $v0, 4 
		syscall
		la $s2, B
		move $s7, $s6
	#s1 A
	#s2 B
	li $t0, 0
	addi $s0, $s0, 2	#luu gia tri i
	addi $t1, $t1, 10
	    #bgt $s0, $s5, finish	#ktra i > nA khong
	do:
		bgt $s0, $s5, finish	#ktra i > nA khong
		bge $s0,$t1,finish#neu lon hon = 10 thi out vong lap
		addi $t0, $s0, -2	#i-2
		#beq $t0, $t1, finish	#i<10
		sll $t2, $t0, 2
		add $t3, $t2, $s1	#dia chi A[i-2]
		lw $s3,($t3)	#gia tri tai A[i-2]
		
		#bgt $s3, $s7,finish
		sll $t4, $s3, 2
		add $t5, $t4, $s2	#dia chi B[A[i-2]]
		lw $t4, ($t5)	#gia tri B[A[i-2]]
		
		sll $t0, $s0, 2
		add $t6, $t0, $s1	#Dia chi A[i]
		sw $t4, ($t6)
		
		addi $s0, $s0, 1
		j do
		
	finish:
		move $s5, $s4
		move $s7, $s6
	output_loopA:
		beq $s5, 0,exit
		
		lw $t2, ($s1)	#doc tung phan tu mang vao t2
		move $a0, $t2	
		li $v0,1
		syscall
		
		la $a0, cach
		li $v0, 4 
		syscall
		
		addi $s5, $s5, -1
		addi $s1, $s1, 4
		b output_loopA			 
	
	exit:
		la $a0, tbao1
		li $v0, 4 
		syscall
