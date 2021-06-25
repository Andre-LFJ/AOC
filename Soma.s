#Faça um programa em Assembly para MIPS que:

#Solicita continuamente valores inteiros ao usuário da entrada padrão
#O programa termina quando o usuário digita -1
#Você pode assumir que todos os números informados são inteiros maiores ou igual a -1
#Calcula a soma e a média dos valores solicitados, (desconsiderar o -1 digitado para terminar)
#Para a média faça a divisão inteira da soma com a quantidade de valores digitados
#Ao final o programa deve exibir (imprimir) duas linhas na saída padrão:
#Na primeira a soma
#Na segunda linha a média dos valores digitados
#Se for uma divisão por zero (nenhum valor digitado) não imprima o resultado da divisão e sim a mensagem "ERRO"
#A soma de nenhum número resulta em zero

	.data
endl: .asciiz "\n"
erro: .asciiz "ERRO"

	.text
	.globl main
	
main:
	# carregar o número
	li $v0, 5
	syscall
	
	# se negativo termina
	blt $v0, $zero, endMenosUm
	
	# chamar função
	move $t2, $v0
	jal soma
	
	#imprimir soma
	move $a0, $t1
	li $v0, 1
	syscall
	
	# \n
	li $v0, 4
	la $a0, endl
	syscall
	
	# imprimir resultado
	move $a0, $s0
	li $v0, 1
	syscall
	
	# \n
	li $v0, 4
	la $a0, endl
	syscall
	
	j end
	
	#j main
	
	
soma:
	# iniciar registradores temporários
	li $t0, 0     # cont
	li $t1, 0     # temp
	li $t6, -1     # -1
	#move $t2, $a2 # n
	
while:
	beq $t2, $t6, fim_soma #if (n == -1) goto fim_soma
	
	addi $t0, $t0, 1 #cont = cont+1
	add $t1, $t1, $t2 #temp = temp+n
	
	li $v0, 5
	syscall #le do teclado
	move $t2, $v0 #copia o input pra t2(n)
	
	j while
	
fim_soma:
	div $t1, $t0
	mflo $s0

	jr $ra
	
endMenosUm:
	
	li $v0, 1
	la $a0, 0
	syscall
	# \n
	li $v0, 4
	la $a0, endl
	syscall
	#erro
	li $v0, 4
	la $a0, erro 
    syscall 
    # \n
	li $v0, 4
	la $a0, endl
	syscall
	
end:
    li $v0, 10 
    syscall 