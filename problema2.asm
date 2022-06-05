main
	ldi r5,mensagem
	sub sp,2
	stw r5,sp
	ldw r3,tamanho
	bnz r7,first_while
	
print_count
	ldi r1,82
	stw r1,0xf000
	ldi r1,58
	stw r1,0xf000
	ldi r1,32
	stw r1,0xf000

	stw r4,0xf002
 	ldw r5,sp
	add sp,2

	hcf
ret_word_first
	and r4,r4,r4
	bnz r7,print_count
ret_word_second
	add r4,1
	bnz r7,print_count
plus_word
	add r4,1
	bnz r7,first_while	
first_while
	ldw r5,sp
	ldb r2,r5

	bez r5,ret_word_first
	ldi r1,33

	slt r1,r2,r1
	bez r1,second_while

	add r5,1
	sub sp,2
	stw r5,sp
	ldb r2,r5
	bnz r2,first_while
	bnz r7,ret_word_second
second_while
	ldw r5,sp

	ldb r2,r5

	ldi r1,33
	slt r1,r2,r1
	bnz r1,plus_word
	
	
	ldw r5,sp
	add sp,2
	add r5,1
	sub sp,2
	stw r5,sp
	ldb r2,r5
	bnz r2,second_while	
	bnz r7,ret_word_second




mensagem "Lorem ipsum dolor"
tamanho	16