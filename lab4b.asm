.data
	str1: .asciiz"Nhap vao 1 so nguyen duong: "
	str2: .asciiz "\nNhap sai! vui long nhap lai \n" 
	outer1: .asciiz"\nSo vua nhap: " 
	zero: .asciiz" Zero " 
	one: .asciiz" One " 
	two: .asciiz" two " 
	three: .asciiz" three " 
	four: .asciiz " four " 
	five: .asciiz" five " 
	six: .asciiz" six " 
	seven: .asciiz" seven " 
	eight: .asciiz" eight " 
	nine: .asciiz" nine "
.text

main:

li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0#t0 la so vua nhap vao

li $v0,4
la $a0,outer1
syscall




addi $s0,$t0,0
addi $t3,$0,100

div $s0,$t3
mflo $t4  # lay so dau tien la phan thuc
	
addi $t2,$t4,0
jal check	


addi $t3,$0,10  
div $s0,$t3   # 
mflo $s0      # s0 = s0/10  ab

div $s0,$t3
mfhi $t5    # t5 = hang chuc


addi $t2,$t5,0
jal check

addi $s0,$t0,0
div $s0,$t3
mfhi $t6	# t6 - hang tram


addi $t2,$t6,0
jal check
j exit
check:

case0:

# t2 = so can xet
bne $t2,$0,case1#neu ma khac thi toi case tiep theo

li $v0,4
la $a0,zero
syscall

j back
case1:

addi $t7,$0,1
bne $t2,$t7,case2

li $v0,4
la $a0,one
syscall

j back
case2:

addi $t7,$0,2
bne $t2,$t7,case3

li $v0,4
la $a0,two
syscall

j back
case3:

addi $t7,$0,3
bne $t2,$t7,case4

li $v0,4
la $a0,three
syscall

j back
case4:

addi $t7,$0,4
bne $t2,$t7,case5

li $v0,4
la $a0,four
syscall

j back
case5:

addi $t7,$0,5
bne $t2,$t7,case6

li $v0,4
la $a0,five
syscall

j back
case6:

addi $t7,$0,6
bne $t2,$t7,case7

li $v0,4
la $a0,six
syscall

j back 
case7:

addi $t7,$0,7
bne $t2,$t7,case8

li $v0,4
la $a0,seven
syscall

j back
case8:

addi $t7,$0,8
bne $t2,$t7,case9

li $v0,4
la $a0,eight
syscall

j back
case9:

addi $t7,$0,9
bne $t2,$t7,back

li $v0,4
la $a0,nine
syscall
back:

jr $ra

exit:
