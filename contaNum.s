#Faça um programa em Assembly para MIPS que:

#Leia dois inteiros n e k da entrada padrão, respectivamente
#n é um inteiro positivo de 32 bits em complemento 2
#0 <= k <= 9
#Seu programa deve tratar uma entrada composta por vários casos de testes e parar quando: n == 0 (sem ler o respectivo k)
#Implemente uma função recursiva que determine quantas vezes um dígito K ocorre em um número natural N
#Imprima uma linha com o resultado retornado pela função na saída padrão



	.data
endl: .asciiz "\n"
	.text
	.globl main
	
main:
	j funcao #chama a funcao	

funcao:
	li $v0, 0
	li $s0, 0
	li $s1, 0
	li $s7, 0
	li $t7, 0
	li $t0, 0
	li $t1, 0

	
	li $v0, 5 #carrega um numero, N
	syscall
	beq $v0, $zero, end # se o numero for zero pula pro end
	move $s0, $v0 # s0 = n
	
	li $v0, 5 #carrega um numero, K
	syscall
	move $s1, $v0 # s1 = k
	
while:
	
	li $t7, 10 #t7 = 10
	div $s0, $t7 #n/10 (t7)
	
	mfhi $t0 #t0 = resto da divis�o
	mflo $s0 #atualiza n
	
	seq $t1, $t0, $s1
	add $s7, $s7, $t1 # s7 = quantas vezes aparece
	
	beq $s0, $zero, printar
		
	j while
	
printar:
	move $a0, $s7
	li $v0, 1
	syscall # imprime o resultado
	# \n
	li $v0, 4
	la $a0, endl
	syscall
	j funcao

end:
	li $v0, 10
	syscall
