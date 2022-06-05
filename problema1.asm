main
; preservando registradores r1 a r5
	sub	sp,2
	stw	r1,sp
	sub	sp,2
	stw	r2,sp
	sub	sp,2
	stw	r3,sp    
	sub	sp,2
	stw	r4,sp
	sub	sp,2
	stw	r5,sp
    
	ldi lr,ret_print1
	bnz r7,print_vec
ret_print1
	ldi lr,ret_insertion_sort
	bnz r7,loop_insertion_sort
ret_insertion_sort
	ldi lr,ret_print2
	bnz r7,print_vec
ret_print2
; desempilha os valores de r1 a r5
	ldw	r1,sp
	add	sp,2
	ldw	r2,sp
	add	sp,2
	ldw	r3,sp
	add	sp,2
	ldw	r4,sp
	add	sp,2
	ldw	r5,sp
	add	sp,2

	hcf

print_vec
	ldi r1,82
	stw r1,0xf000
	ldi r1,58
	stw r1,0xf000
	ldi r1,32
	stw r1,0xf000
	ldi r1,0
	ldw r2,size
	ldi r3,vec
loop_print_vec
	ldw r4,r3
	stw r4,0xf002
	ldi r4,32
	stw r4,0xf000
	add r1,1
	add r3,2
	slt r5,r1,r2
	bnz r5,loop_print_vec
	ldi r4,10
	stw r4,0xf000
	bnz r7,lr

loop_insertion_sort
	ldi r3,vec
	ldw r1,i

	add r3,r3,r1
	add r3,r3,r1
	ldw r2,r3
	stw r2,aux

	stw r1,j
	ldw r2,size
	slt r4,r1,r2
	bez r4,end_i
	bnz r7,while

while
	ldi r4,1
	ldw r5,j

	slt r4,r5,r4
	bnz r4,end_j
   
	ldi r3,vec
	add r3,r3,r5
	add r3,r3,r5    
	sub r3,1
	sub r3,1
	ldw r2,r3

	ldw r4,aux

	slt r1,r4,r2
	bnz r1,swap
	bnz r7,end_j
swap  
	ldi r3,vec
	add r3,r3,r5
	add r3,r3,r5
	stw r2,r3

	sub r5,1
	stw r5,j

	bnz r7,while
end_j
	ldw r4,aux
	ldi r3,vec
	add r3,r3,r5
	add r3,r3,r5  
	stw r4,r3 
	ldw r1,i
	add r1,1
	stw r1,i
	bnz r7,loop_insertion_sort
end_i
	ldi r4,10
	stw r4,0xf000
	bnz	r7,lr


i	1
j	0
aux	0
size	20
vec	-5 8 -22 123 77 -1 3 6 1 9 78 3 5 7 15 55 43 2 8 0
