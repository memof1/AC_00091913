org 	100h
section .text
            call 	w_strng ;Llamando a teclado

reset:  	mov si,0h
lupi:	    call 	kb
            sub al, 30h  ;Convertir 
            mov	[300h+si], al
            cmp 	si, 04h
            je	fun
            inc 	si
            jmp 	lupi

mostrar:    mov 	dx, nl
            call	w_strng
            mov	byte [300h+si], "$"
            mov 	dx, 300h
            call 	w_strng
            call 	kb	; solo detenemos la ejecución
            int 	20h

texto:	    mov 	ah, 0h
            int 	16h ;Modo texto de la BIOS
            ret

kb: 	    mov	ah, 1h
            int 	21h
            ret

w_strng:    mov	ah, 09h
            int 	21h
            ret

printf:
            mov ah,09h
            int 21h
            ret

fun:mov ax, [300h]
    add ax, [301h]
    add ax, [302h]
    add ax, [303h]
    add ax, [304h] ;Sumamnos todas las celdas de memoria donde he puesto cada uno de mis numeros
    mov ah, 00h
    mov bl, 5d ; El promedio /5
    div bl
    mov cl, al
    mov dx, msg1 ;Los "if" de cada resultado
    cmp cl, 0x01
    je printf
    mov dx, msg2
    cmp cl, 0x02
    je printf
    mov dx, msg3
    cmp cl, 0x03
    je printf
    mov dx, msg4
    cmp cl, 0x04
    je printf
    mov dx, msg5
    cmp cl, 0x05
    je printf
    mov dx, msg6
    cmp cl, 0x06
    je printf
    mov dx, msg7
    cmp cl, 0x07
    je printf
    mov dx, msg8
    cmp cl, 0x08
    je printf
    mov dx, msg9
    cmp cl, 0x09
    je printf
    mov dx, msgA
    cmp cl, 0x0a
    je printf
    


section .data
msg 	db 	"Ultimo 5 digitos del carnet: $"
nl	db 	0xA, 0xD, "$"
section .data
msg1 	db 	"Solo necesito el 0 $"
section .data
msg2 	db 	"Aun se pasa $"
section .data
msg3 	db 	"Hay salud $"
section .data
msg4 	db 	"Me recupero $"
section .data
msg5 	db 	"En el segundo $"
section .data
msg6 	db 	"Peor es nada $"
section .data
msg7 	db 	"Muy bien $"
section .data
msg8 	db 	"Colocho $"
section .data
msg9 	db 	"Siempre me esfuerzo $"
section .data
msgA 	db 	"Perfecto solo dios $"
