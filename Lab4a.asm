.data
	stNhap: .asciiz "Nhap vao 1 chuoi:\n "

  	stXuatTruoc: "\nKi tu dung truoc:\n"

  	stXuatSau: "\nKi tu dung sau:\n "
.text
	.globl main
	main:
	li $v0,4
	la $a0,stNhap
	syscall
	
	li $v0,12#doc 1 ki tu
	syscall
	move $t0, $v0
	
	
	li $v0,4
	la $a0,stXuatSau
	syscall
	
	addi $t1,$t0,1
	addi $t2,$t0,-1
	li $v0,11#xuat 1 ki tu
	la $a0,($t1)
	syscall
	
	li $v0,4
	la $a0,stXuatTruoc
	syscall
	li $v0,11
	la $a0,($t2)
	syscall
	
	
	
