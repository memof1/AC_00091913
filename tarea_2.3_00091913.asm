		org 100h

        mov ax, 0000h
		mov cx, 0000h
		mov dx, 0d
		mov [220h], dx ;condicion paro
		mov dx, 1h
		mov [221h], dx ; condicion paro
		mov bx, 1h

iter1:
		inc bx 
		mov ax, [220h+bx-1h]  ;Funciona como variable x-1
		mov cx, [220h+bx-2h] ; Funciona como variable x-2
		add ax, cx

		cmp ax,  00ffh ; Igual que parte 2
		jb iter2
		mov [220h+bx], ax
		cmp bx, 10h
		jb iter1
iter2:
		mov ah, [220h+bx]
		mov al, [220h+bx+1h]
		add bx, 2d
		mov ax, [220h+bx-1h]
		mov bx, [220h+bx-3h]
		cmp bx, 10h
		jb iter2
