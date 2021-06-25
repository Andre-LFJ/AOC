	.data
endl: .asciiz "\n"

	.text
	.globl main
	
main:
	li $v0, 5 #carrega um numero
	syscall
	
	blt $v0, $zero, end # se o numero for negativo pula pro end
	
	move $a0, $v0
	jal fibonacci # chama funcao fibonacci
	
	
	move $a0, $v0
	li $v0, 1
	syscall # imprime o resultado
	
	li $v0, 4
	la $a0, endl
	syscall # \n depois do resultado
	
	
	j end #pula pro fim para terminar o programa
	
	
fibonacci:
	# auxiliares
	li $t0, 0     # a
	li $t1, 1     # b
	li $t2, 0     # contador
	
while:
	beq $t2, $a0, fim_fibo #se t2==a0 goto fim_fibo
	
	# soma
	add $t3, $t1, $t0  # $t4 = $t1 + $t0
	move $t0, $t1
	move $t1, $t3
	addi $t2, $t2, 1
	
	j while #goto while
	
fim_fibo:
	move $v0, $t1
	
	jr $ra #retorna pra main
	
end:
    li $v0, 10
    syscall # fim