	org 100h
section .text

		mov di,0d
		mov cx, [len]

lupita: mov bl, [comnt+di]
		mov [di+200h], bl
		inc di
		loop lupita
		mov bx, 9d
		add ax, bx
		mov bx, 1d
		add ax, bx
		mov bx, 9d
		add ax, bx
		mov bx, 1d
		add ax, bx
		mov bx, 3d
		add ax, bx
		mov bx, 5d; 5 decimal, primeras 5 cifras
		div bx ; 9+1+9+1+3+5= 23/5 =4h

        int 20h

section .data
comnt 	db "Me recupero" ; Mi respuesta fue: 4h
len 	equ $-comnt
