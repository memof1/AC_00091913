		org 100h
        mov ax ,2d
		mov cx, 2d ; variable empezando en dos
		mov bx, 0h; contador en 1
		mul cx
		mov [bx+210h], ax

lupi:	inc bx
		mul cx
		mov [bx+210h], ax
		cmp ax, 00ffh ; Si sigue siendo menor a 2 bits sigo 
		jb lupi
lupi2:  add bx, 2d ;Ahora sumo 2 ya que será cada 2 celdas
		mul cx
		mov [bx+210h], ax
		cmp bx, 12d ; Si ya estuvieron las 11 veces
		jbe lupi2