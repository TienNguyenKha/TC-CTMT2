.data
inputStr: .space 16
enterString: .asciiz "Nhap Chuoi:"
outerString: .asciiz "\nXuat Chuoi:"
.text
.globl main
main:
li $v0,4
la $a0,enterString
syscall

li $v0,8
la $a0, inputStr
li $a1, 16#length
move $t0, $a0
syscall

li $v0,4
la $a0,outerString
syscall

li $v0, 4
la $a0, $t0
#move $a0, $t0
syscall



li $v0, 10#exit
syscall
