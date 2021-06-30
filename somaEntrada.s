#Faça um programa em Assembly para MIPS que:

#Leia um inteiro n da entrada padrão
#n é um inteiro positivo de 32 bits em complemento 2
#Seu programa deve tratar uma entrada composta por vários casos de testes e parar quando: n == 0
#Implemente uma função recursiva que calcule a soma dos dígitos decimais de n
#Imprima uma linha com o resultado retornado pela função na saída padrão em decimal

	.data
endl: .asciiz "\n"
	.text
	.globl main
	
	
main:
	j funcao #chama a funcao	
	
funcao:
	li $v0, 0
	li $t0, 0
	li $t1, 0
	li $t7, 0
	li $s0, 0

	li $v0, 5 #carrega um numero, N
	syscall
	beq $v0, $zero, end # se o numero for zero pula pro end
	move $s0, $v0 # s0 = n
	
while:
	li $t7, 10 #t7 = 10
	div $s0, $t7 #n/10 (t7)
	
	mfhi $t0 #t0 = resto da divisao
	mflo $s0 #atualiza n
	
	add $t1, $t1, $t0
	
	beq $s0, $zero, printar
	j while

printar:
	move $a0, $t1
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