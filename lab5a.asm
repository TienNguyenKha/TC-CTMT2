.data
	mang: .space 100
	soluong: .asciiz"Nhap so luong phan tu:\n"
	chiso: .asciiz"Nhap vao chi so can tim\n"
	xuatmang: .asciiz "Mang vua nhap:\n"
	cach: .asciiz" ; "
	tbao1: .asciiz"Ket thuc!\n"
	tbaoMAX: .asciiz "\nMAX la:"
	tbaoMIN: .asciiz "\nMIN la:"
	tbaoSUM: .asciiz "\nSum la:"
	tbaoKQ: .asciiz "\nGia tri tuong ung:"
	loiindex: .asciiz "\nChi so index khong dung:"
.text
	#Nhap so luong phan tu cua mang
	li $v0, 4 
	la $a0, soluong
	syscall
	li $v0, 5#lýu so phan tu trong v0
	syscall
	
	addi $s0, $v0, 0	#luu tam thoi so phan tu
	move $s1, $s0
	la $t0, mang
	input_loop:
		beq $s1, 0, endloop 	#kiem tra dk n==0 thi end loop
		li $v0, 5	#Nhap mang 
		syscall
		sw $v0, ($t0)	#luu gia tri vao mang
		addi $s1, $s1, -1
		addi $t0, $t0, 4
		j input_loop
	endloop:
	        li $v0, 4 
		la $a0, tbao1
		
	        syscall
		la $t0, mang
		move $s1, $s0
	
	li $v0, 4
	la $a0, xuatmang
	syscall
		
	output_loop:
		beq $s1, 0,exit#s1 là sl phan tu
		
		lw $t2, ($t0)	#doc tung phan tu mang vao t2,t0 la dia chi nen
		li $v0,1
		move $a0, $t2	
		syscall
		
		li $v0, 4 
		la $a0, cach
		syscall
		
		addi $s1, $s1, -1
		addi $t0, $t0, 4
		j output_loop			 
	
	exit:
	move $s1, $s0#s0 la so phan tu cua mang
	#TIM MIN MAX
	li $t1, 0	#xem nhu phan tu A[i]
	lw $s2, mang($t1)	#gtri MAX 
	lw $s4, mang($t1)	#gtri Min
	li $t2, 1	#i
	findMAXMIN:
		beq $t2, $s0, endfind #neu t2 bang so phan tu thi end
		add $t1, $t1, 4
		lw $s3, mang($t1) #phan tu A[i]
		
		bge $s2, $s3, increase_i#>=
		move $s2, $s3
		
		
	findMIN:
	    beq $t2, $s0, endfind #neu t2 bang so phan tu thi end
		add $t1, $t1, 4
		lw $s3, mang($t1) #phan tu A[i]
		
		sub $s7,$s4,$s3
		#ble $s4, $s3, increase_i#<=
		bltz $s7,increase_i2
		move $s4, $s3
	increase_i:
		add $t2, $t2, 1
		j findMAXMIN
	increase_i2:
		add $t2, $t2, 1
		j findMIN
	endfind:
		li $v0, 4 
		la $a0, tbaoMAX
		syscall
		
		li $v0, 1
		move $a0, $s2
		syscall 	#Xuat MAX
		
		li $v0, 4 
		la $a0, tbaoMIN
		syscall
		
		li $v0, 1
		move $a0, $s4
		syscall 
		
		
	li $t4, 0	#xem nhu phan tu A[i]
	li $s5, 0	#Sum
	li $t5, 0	# i
	Sum:
		beq $t5, $s0, endsum
		lw $t6, mang($t4) #phan tu A[i]
		add $s5, $s5, $t6
		addi $t4, $t4, 4
		addi $t5, $t5, 1
		j Sum
	endsum:
	
		li $v0, 4 
		la $a0, tbaoSUM
		syscall
		
		li $v0, 1
		move $a0, $s5
		syscall 	#Xuat Sum
	indexi:
	li $t4, 0 
	li $v0, 4
	la $a0, chiso 
	syscall
	li $v0, 5
	syscall
	
	addi $t4, $v0, 0 #chi so can tim
	bgt $t4, $s0, error#neu lon hon chi so phan tu toi da thi loi
	li $t5, 0	# i
	li $s3, 0
	li $t1, 0
	findIndex:
		beq $t5, $t4, endIndex #neu t5 bang t4 thi tim ra roi 
		add $t1, $t1, 4
		add $t5, $t5, 1
		j findIndex
	endIndex:
		li $v0, 4 
		la $a0, tbaoKQ
		syscall
		li $v0, 1
		#lw $s3, mang($t1) #phan tu A[i] can tim
		lw $a0, mang($t1)#t1 la index theo dia chi load w
		syscall
		j exit2
	error:
		li $v0, 4 
		la $a0, tbao1
		syscall
		li $v0, 4 
		la $a0, loiindex
		syscall
		j indexi
exit2:
		

		
