	.data
endl: .asciiz "\n"
	.text
	.globl main
	
main:
	li $v0, 5 #n
	syscall	
	move $a0, $v0 # copia de n, n
	jal fatorial
	
fatorial:
	li $t0, 1     # i
	move $t1, $a0 # x, n

while:
	beq $t0, $a0, end # if(i == n) goto end
	sub $t4, $a0, $t0 # (n - 1)
	mul $t1, $t1, $t4 #x * t4 ((n - 1))
	add $t0, $t0, 1
	j while #loop


end:
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0,10
    syscall

