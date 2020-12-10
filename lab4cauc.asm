.data
a: .space 16
b: .space 16
astr: .asciiz "Nhap a:"
bstr: .asciiz "\nNhap b:"
Tong: .asciiz "\nTong:\n"
Hieu: .asciiz "\nHieu:\n"
Tich: .asciiz "\nTich:\n"
Thuong: .asciiz "\nThuong:\n"
Du: .asciiz "\nDu:\n"
SS: .asciiz "\nKet qua so sanh(so lon hon) la:\n"
Bang: .asciiz "\nHai so bang nhau\n"

.text
.globl main
main:

li $v0,4
la $a0,astr
syscall

li $v0,5
syscall
addi $t0, $v0, 0

li $v0,4
la $a0,bstr
syscall

li $v0,5
syscall
move $t1, $v0


add $t3,$t1,$t0
li $v0,4
la $a0,Tong
syscall


li $v0,1#xuat tong
la $a0,($t3)
syscall



sub $t4,$t0,$t1
li $v0,4
la $a0,Hieu
syscall


li $v0,1#xuat hieu
la $a0,($t4)
syscall

mult $t1,$t0
mflo $t5
li $v0,4
la $a0,Tich
syscall

li $v0,1
la $a0,($t5)
syscall

div $t0,$t1
mflo $t6#phan thuc
li $v0,4
la $a0,Thuong
syscall
li $v0,1
la $a0,($t6)#xuat thuong
syscall
li $v0,4
la $a0,Du
syscall
mfhi $t7
li $v0,1#xuat du
la $a0,($t7)
syscall


sub $t4,$t0,$t1
bgtz $t4,LonHon0
beq $t4,$0,BangNhau
bltz $t4,BeHon0
syscall


LonHon0:
li $v0,4
la $a0,SS
syscall
li $v0,1
la $a0,($t0)
syscall
j exit
BangNhau:
li $v0,4
la $a0,SS
syscall
li $v0,4
la $a0,Bang
syscall
j exit
BeHon0:
li $v0,4
la $a0,SS
syscall
li $v0,1
la $a0,($t1)
syscall

exit:





