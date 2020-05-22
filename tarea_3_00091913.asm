	org 	100h

	
section .dataA
A	db 	"Vamos por Mercedes F1"
len 	equ	$-A

section .dataB
B	db 	"Mia San Mia"
len2 	equ	$-B

section .dataC
C	db 	"Bayern de Munich"
len3 	equ	$-C

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
    add     dx, ax
	mov 	dh, bh ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
	loop:	mov 	cl, [A+di]
			mov     ax, 46d
			mov 	bh, 6d ;ESTA SERÁ LA FILA QUE USARE CUANDO LLAME A m_sursr
			call    m_cursr
			call 	w_char
			inc	di
			cmp 	di, len
			jb	loop
    
    mov 	di, 0d
	loop2:	mov 	cl, [B+di]
			mov     ax, 35d
			mov 	bh, 14d
			call    m_cursr
			call 	w_char
			inc	di
			cmp 	di, len2
			jb	loop2
        
	mov di, 0d
	loop3:	mov 	cl, [C+di]
			mov     ax, 21d
			mov 	bh, 21d
			call    m_cursr
			call 	w_char
			inc	di
			cmp 	di, len3
			jb	loop3
	ret

