.data
input:	.space	256#c?p 256 byte b? nh? chýa ðý?c kh?i t?o
output:	.space	256
enterString: .asciiz "Nhap chuoi:\n"
outerString: .asciiz "\nXuat chuoi:"
	.text
	.globl main
main:

	li $v0,4
	la $a0,enterString
	syscall

	li	$v0, 8			
	la	$a0, input		
	li	$a1, 256		
	syscall
	
	
	
	jal	strlen			
	
	add	$t1, $zero, $v0	#len	
	add	$t2, $zero, $a0	#ki tu dau	
	
reverse:
	li	$t0, 0	#bien dem		
	li	$t3, 0	#luu dia chi		
	
	reverse_loop:
		add	$t3, $t2, $t0		
		lb	$t4, 0($t3)		
		beqz	$t4, exit		
		sb	$t4, output($t1)		
		subi	$t1, $t1, 1		
		addi	$t0, $t0, 1		
		j	reverse_loop		
	
exit:
	
        li $v0,4
	la $a0,outerString
	syscall
	
	li	$v0, 4			
	la	$a0, output		
	syscall
		
	li	$v0, 10		#exit	
	syscall
	

strlen:
	li	$t0, 0
	li	$t2, 0
	
	strlen_loop:
		add	$t2, $a0, $t0#a0 de lýu bien truyen vào
		lb	$t1, 0($t2)
		beqz	$t1, strlen_exit#neu t1 bang 0 thi exit
		addi	$t0, $t0, 1#t0 là bien ðem
		j	strlen_loop
		
	strlen_exit:
		subi	$t0, $t0, 1
		add	$v0, $zero, $t0#v0 thuong luu gia tri tra ve cua ham
		add	$t0, $zero, $zero
		jr	$ra
