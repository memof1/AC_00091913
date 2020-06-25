;LETRA E - ESTRADA
org 	100h

section .text

	call 	grafico	
	mov di, 0h
        
main:  mov cx, 125d;
            mov dx, 50d
            add dx, di
            call pixel
            inc di
            cmp di,101d
            jne main
        
mov di,0h
p1:	mov 	cx, 125d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 50d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 60d
            jne 	p1


mov di,0h
p1v: mov cx, 185d
           mov dx, 50d
           add dx, di ;Termina en fila 70d
           call pixel
           inc di 
           cmp di,20d
           jne p1v

mov di,0h
p1h:	mov 	cx, 155d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 70d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 30d
            jne 	p1h
mov di,0h
pv2: mov cx, 155d
           mov dx, 70d
           add dx, di ;Termina en fila 90d
           call pixel
           inc di 
           cmp di,20d
           jne pv2

mov di,0h
p2h:	mov 	cx, 155d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 90d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 30d
            jne 	p2h

mov di,0h
p2v: mov cx, 185d
           mov dx, 90d
           add dx, di ;Termina en fila 110d
           call pixel
           inc di 
           cmp di,20d
           jne p2v

mov di,0h
p2h2:	    mov cx, 155d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 110d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 30d
            jne 	p2h2

mov di,0h
pv3:       mov cx, 155d
           mov dx, 110d
           add dx, di ;Termina en fila 130d
           call pixel
           inc di 
           cmp di,20d
           jne pv3

mov di,0h
p3h:	mov 	cx, 155d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 130d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 30d
            jne 	p3h

mov di,0h
p3v: mov cx, 185d
           mov dx, 130d
           add dx, di ;Termina en fila 150d
           call pixel
           inc di 
           cmp di,20d
           jne p3v
mov di,0h
p4h: mov cx, 125d
        add cx, di
        mov dx, 150d ;Fila
        call pixel
        inc di
        cmp di,60d
        jne p4h


fin:   call 	kb	
	int 	20h


grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1101b
	int 	10h
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data