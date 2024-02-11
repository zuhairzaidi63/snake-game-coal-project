[org 0x100]

jmp start

seed: dw 98
backup: db 0
back: dw 2000
up: db 4000
incre: db 0
head : db 0
increr: db 0
down : dw 0
right: dw 0
length: dw 09
loc: dw 2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
keyboardkey : db 0
last : db 'GAME OVER'
len : dw 5
count:dd 0
count1:db 0

game: db '-:Snake Game:-'
len_game : dw 14

name : db '-:Players:-'
len1 : dw 11

name1 : db 'Tanees              Zuhair'
len11 : dw 26

roll : db '-:Players Roll no:-'
len2 : dw 19

roll1 : db '21F-9174            21F-9056'
len21 : dw 28							

menu0 : db '-:Game Menu:-'
len0 : dw 13

menu : db 'w key for moving towards up'
len3 : dw 27

menu1 : db 's arrow key for moving towards down'
len4 : dw 35

menu2 : db 'd arrow key for moving towards right'
len5 : dw 36

menu3 : db 'a arrow key for moving towards left'
len6 : dw 35
score : db 'score:'
scoring : db 0x30
loc_game: dw 198
loc1: dw 520
loc2: dw 824
loc3: dw 1150
loc4: dw 1460
loc5: dw 1796
loc6: dw 2096
loc7: dw 2416
loc8: dw 2736
loc9: dw 3056

delaY1:
	mov dword[count],1200000

delaYLoop1:
	sub dword [count],1
	cmp dword[count],0
	jne delaYLoop1
	ret

starting_display:

	push bp
	mov bp, sp



	mov ax,0xb800
	mov es,ax
	mov di,[bp+4]

	mov si,[bp+8]
	mov cx,[bp+6]
	mov ah,0x02

	cld 
nexte:	lodsb 
	stosw 
	loop nexte

	
	pop bp
	ret 6



end:	call clrscr

	mov ax,0xb800
	mov es,ax
	mov di,1180

	mov si,last
	mov cx,9
	mov ah,0x04

	cld 
nextend:lodsb 
	stosw 
	loop nextend 
	
	jmp endloc

clrscr:		
	push ax
	push es
	push di
	push cx
	xor di,di
	mov ax,0xb800
	mov es,ax
	mov ax,0x0720
	mov cx, 0

next:
	mov word [es:di],ax
	add di,2
	cmp di,4000
	jne next
	mov ax , 0xb800
	mov es , ax
	mov di,158

l156:
	mov word [es:di],0x076C
	add di,160
	cmp di,4000
	jle l156
	mov di,3998
	mov word [es:di],0x076C
	add di,160
	mov ax , 0xb800
	mov es , ax
	mov di,0

l157:
	mov word [es:di],0x076C
	add di,160
	cmp di,3840
	jle l157
	mov ax , 0xb800
	mov es , ax
	mov di,3522

l158:
	mov word [es:di],0x072D
	add di,2
	cmp di,3676
	jle l158
	mov ax , 0xb800
	mov es , ax
	mov di,2

l159:
	mov word [es:di],0x072D
	add di,2
	cmp di,156
	jle l159

	
	
	pop cx
	pop di
	pop es
	pop ax
	ret 
scores:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov ax,0xb800
	mov es,ax
	mov di,3682

	mov si,score
	mov cx,6
	mov ah,0x04
	cld 
nextend5:lodsb 
	stosw 
	loop nextend5
	
	call scoringsx
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 
scoringsx:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov ax,0xb800
	mov es,ax
	mov di,3696

	mov al,byte[scoring]
	mov ah,0x03
	mov [es:di],ax
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 
delaY:
	mov dword[count],120000

delaYLoop:
	sub dword [count],1
	cmp dword[count],0
	jne delaYLoop
	ret
foodeat:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov ax,0
	 mov bx,[bp+4]
	mov cx,[length]
	dec cx
	shl cx,1
	mov di,cx
	mov dx,[seed]
	cmp [bx+di],dx
	jne k
	
	mov ax,seed
	push ax
    call printfood
	mov ax,1
	inc byte[scoring]
	call scoringsx
k:
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
collide:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	
	mov cx , [bp+6]
	mov bx,[bp+4]
	dec cx
	shl cx,1
	mov di , cx
	dec cx
	dec cx
	mov si ,0
	lp:
	  mov dx ,[bx+di]
	  cmp [bx+si],dx
	  je end
	  add si,2
	  cmp si,cx
	  jne lp
	  jmp co
co:
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
move_right:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov bx,[bp+4]
	mov di,[back]
	cmp di,0
	je next3e
	mov ax,0xb800
	mov es,ax
	mov  word [es:di],0x0720
	mov di,[bx]
next3e:
	mov cx,[bp+6]
	mov si,cx
	dec si
	shl si,1
	mov ax,0x472A
	add word[bx+si],2
    mov si,0
l9sx:
mov dx ,158
   l963c:
	  cmp dx,3999
	  jge exit23v
	 cmp di,dx
	 je end
	 add dx,160
	 jne l963c
exit23v:
mov dx ,3522
  l973c:
	  cmp dx,3678
	  jge exit33a
	 cmp di,dx
	  je end
	  add dx,2
	  jne l973c
exit33a:
mov dx ,0
  l993x:
	  cmp dx,158
	  jge exit4c
	  cmp di,dx
	  je end
	  add dx,2
	  jne l993x
exit4c:
mov dx ,0
  l999c:
	 cmp dx,3842
	  jge exit3ca
	  cmp di,dx
	  je end
	  add dx,160
	  jne l999c
exit3ca:
	mov word [es:di],ax
	dec cx
	add si,2
	mov di , [bx+si]
	cmp cx,0
	jne l9sx
	mov dx,[bx]
	mov [back],dx
	mov cx,[bp+6]
	push cx
	push bx
	call collide
	mov cx,[bp+6]
	push cx
	push bx
	call foodeat
	mov cx,[bp+6]
	dec cx
	mov si,0
	l9rz:
	  mov dx ,[bx+si+2]
	  mov [bx+si],dx
	  add si,2
	  loop l9rz
	call delaY
	call delaY
	
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
move_left:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov bx,[bp+4]
	mov di,[back]
	cmp di,0
	je next3evc
	mov ax,0xb800
	mov es,ax
	mov  word [es:di],0x0720
	mov di,[bx]
next3evc:
	mov cx,[bp+6]
	mov si,cx
	dec si
	shl si,1
	mov ax,0x472A
	sub word[bx+si],2
    mov si,0
l9sxk:
mov dx ,158
   l963cq:
	  cmp dx,3999
	  jge exit23vc
	 cmp di,dx
	 je end
	 add dx,160
	 jne l963cq
exit23vc:
mov dx ,3522
  l973cws:
	  cmp dx,3678
	  jge exit33am
	 cmp di,dx
	  je end
	  add dx,2
	  jne l973cws
exit33am:
mov dx ,0
  l993xqa:
	  cmp dx,158
	  jge exit4cg
	  cmp di,dx
	  je end
	  add dx,2
	  jne l993xqa
exit4cg
mov dx ,0
  l999cd:
	   cmp dx,3842
	  jge exit3cal
	  cmp di,dx
	  je end
	  add dx,160
	  jne l999cd
exit3cal:
	mov word [es:di],ax
	dec cx
	add si,2
	mov di , [bx+si]
	cmp cx,0
	jne l9sxk
	mov dx,[bx]
	mov [back],dx
	mov cx,[bp+6]
	dec cx 
	shl cx,1
	mov dx,cx
	mov cx,[bp+6]
	push cx
	push bx
	call collide
	mov cx,[bp+6]
	push cx
	push bx
	call foodeat
	;mov dx,[bx]
	;mov [back],dx
	mov cx,[bp+6]
	dec cx
	mov si,0
	l9rze:
	  mov dx ,[bx+si+2]
	  mov [bx+si],dx
	  add si,2
	  loop l9rze
	call delaY
	call delaY
	
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
printsnake:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov bx,[bp+4]
	mov di,[back]
	cmp di,0
	je next2
	mov ax,0xb800
	mov es,ax
	mov  word [es:di],0x0720
	mov di,[bx]
next2:
	mov cx,[bp+6]
	mov ax,0x472A
    mov si,0
l1:
mov dx ,158
   l96:
	  cmp dx,3999
	  jge exit2
	 cmp di,dx
	 je end
	 add dx,160
	 jne l96
exit2:
mov dx ,3522
  l97:
	  cmp dx,3678
	  jge exit3
	 cmp di,dx
	  je end
	  add dx,2
	  jne l97
exit3:
mov dx ,0
  l99:
	  cmp dx,158
	  jge exit4j
	  cmp di,dx
	  je end
	  add dx,2
	  jne l99
exit4j
mov dx ,0
  l999l:
	 cmp dx,3842
	  jge exit
	  cmp di,dx
	  je end
	  add dx,160
	  jne l999l
exit:
	mov word [es:di],ax
	mov [bx+si],di
	dec cx
	add di,2
	add si,2
	cmp cx,0
	jne l1 
	mov dx,[bx]
	mov [back],dx
	mov cx,[bp+6]
	dec cx 
	shl cx,1
	mov dx,cx
	mov cx,[bp+6]
	push cx
	push bx
	call collide
	mov cx,[bp+6]
	push cx
	push bx
	call foodeat
	mov cx,[bp+6]
	dec cx
	mov si,0
	l9:
	  mov dx ,[bx+si+2]
	  mov [bx+si],dx
	  add si,2
	  loop l9
	call delaY
	call delaY
	
	
    pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
move_down:
push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov bx,[bp+4]
	mov di,[back]
	cmp di,0
	je next3t
	mov ax,0xb800
	mov es,ax
	mov  word [es:di],0x0720
	mov di,[bx]
next3t:
	mov cx,[bp+6]
	mov si,cx
	dec si
	shl si,1
	mov ax,0x472A
	add word[bx+si],160
    mov si,0
l9s:
mov dx ,158
   l963:
	  cmp dx,3999
	  jge exit23
	 cmp di,dx
	 je end
	 add dx,160
	 jne l963
exit23:
mov dx ,3522
  l973:
	  cmp dx,3678
	  jge exit33
	 cmp di,dx
	  je end
	  add dx,2
	  jne l973
exit33:
mov dx ,0
  l993:
	  cmp dx,158
	  jge exit4ca
	  cmp di,dx
	  je end
	  add dx,2
	  jne l993
exit4ca
mov dx ,0
  l999cb:
	  cmp dx,3842
	  jge exit3c
	  cmp di,dx
	  je end
	  add dx,160
	  jne l999cb
exit3c:
	mov word [es:di],ax
	dec cx
	add si,2
	mov di , [bx+si]
	cmp cx,0
	jne l9s
	mov dx,[bx]
	mov [back],dx
	mov cx,[bp+6]
	dec cx 
	shl cx,1
	mov dx,cx
	mov cx,[bp+6]
	push cx
	push bx
	call collide
	mov cx,[bp+6]
	push cx
	push bx
	call foodeat
	mov cx,[bp+6]
	dec cx
	mov si,0
	l9r:
	  mov dx ,[bx+si+2]
	  mov [bx+si],dx
	  add si,2
	  loop l9r
	call delaY
	call delaY
	
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
move_up:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di
	push si
	mov bx,[bp+4]
	mov di,[back]
	cmp di,0
	je next3z
	mov ax,0xb800
	mov es,ax
	mov  word [es:di],0x0720
	mov di,[bx]
next3z:
	mov cx,[bp+6]
	mov si,cx
	dec si
	shl si,1
	mov ax,0x472A
	sub word[bx+si],160
    mov si,0
l9so:
mov dx ,158
   l963a:
	  cmp dx,3999
	  jge exit23z
	 cmp di,dx
	 je end
	 add dx,160
	 jne l963a
exit23z:
mov dx ,3522
  l973m:
	  cmp dx,3678
	  jge exit33q
	 cmp di,dx
	  je end
	  add dx,2
	  jne l973m
exit33q:
mov dx ,0
  l993m:
	  cmp dx,158
	  jge exit8d
	  cmp di,dx
	  je end
	  add dx,2
	  jne l993m
exit8d:
mov dx ,0
  l993mv:
	  cmp dx,3842
	  jge exit3cq
	  cmp di,dx
	  je end
	  add dx,160
	  jne l993mv
exit3cq:
	mov word [es:di],ax
	dec cx
	add si,2
	mov di , [bx+si]
	cmp cx,0
	jne l9so
	mov dx,[bx]
	mov [back],dx
	mov cx,[bp+6]
	dec cx 
	shl cx,1
	mov dx,cx
	mov cx,[bp+6]
	push cx
	push bx
	call collide
	mov cx,[bp+6]
	push cx
	push bx
	call foodeat
	mov cx,[bp+6]
	dec cx
	mov si,0
	l9rg:
	  mov dx ,[bx+si+2]
	  mov [bx+si],dx
	  add si,2
	  loop l9rg
	call delaY
	call delaY
	
	pop si
	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4

printfood:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push es
	push di

v:
	mov cx,3998
	mov ax,0xb800
	mov es,ax

	mov bx,[bp+4]
	mov di,[bx]
	mov word [es:di],0x0720
	mov ax,di
	shl ax,4
	div cx
	mov di,dx
	
mov dx ,158
   l963cd:
	  cmp dx,3999
	  jge exit23vx
	 cmp di,dx
	 je v
	 add dx,160
	 jne l963cd
exit23vx:
mov dx ,3522
  l973ck:
	  cmp dx,3998
	  jge exit33al
	 cmp di,dx
	  je v
	  add dx,2
	  jne l973ck
exit33al:
mov dx ,0
  l993xq:
	  cmp dx,158
	  jge exit4cn
	  cmp di,dx
	  je v
	  add dx,2
	  jne l993xq
exit4cn:
mov dx ,0
  l999cs:
	 cmp dx,3842
	  jge exit3can
	  cmp di,dx
	  je v
	  add dx,160
	  jne l999cs
 exit3can:
	mov word [bx],di
	mov word [es:di],0x0724

	pop di
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2


start:
call clrscr

	mov ax,game	;0
	push ax
	
	mov ax,[len_game]
	push ax

	mov ax,[loc_game]
	push ax

	call starting_display


	mov ax,name	;1
	push ax
	
	mov ax,[len1]
	push ax

	mov ax,[loc1]
	push ax

	call starting_display

	mov ax,name1	;2
	push ax
	
	mov ax,[len11]
	push ax

	mov ax,[loc2]
	push ax

	call starting_display
	
	mov ax,roll	;3
	push ax
	
	mov ax,[len2]
	push ax

	mov ax,[loc3]
	push ax

	call starting_display

	mov ax,roll1	;4
	push ax
	
	mov ax,[len21]
	push ax

	mov ax,[loc4]
	push ax

	call starting_display

	mov ax,menu0	;5
	push ax
	
	mov ax,[len0]
	push ax

	mov ax,[loc5]
	push ax

	call starting_display

	mov ax,menu	;6
	push ax
	
	mov ax,[len3]
	push ax

	mov ax,[loc6]
	push ax

	call starting_display

	mov ax,menu1	;7
	push ax
	
	mov ax,[len4]
	push ax

	mov ax,[loc7]
	push ax

	call starting_display

	mov ax,menu2	;8
	push ax
	
	mov ax,[len5]
	push ax

	mov ax,[loc8]
	push ax

	call starting_display

	mov ax,menu3	;9
	push ax
	
	mov ax,[len6]
	push ax

	mov ax,[loc9]
	push ax

	call starting_display

	call delaY1
	call delaY1
	call delaY1
	call delaY1
	call delaY1
	call delaY1
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call clrscr
	;call boundry
	mov ah,00h
int 1ah
mov ax,dx
xor dx,dx
mov bx,1998
div bx
add dx,dx
call scores
mov word [seed],dx
	mov dx,[seed]
	mov dx,19
outer:
	mov ax ,seed
	push ax
	call printfood
	;call delaY 
	mov cx,60

while:

	mov ah, 0x01

    int 0x16

	jz ni
	mov ah, 0x00

    int 0x16

	 mov [keyboardkey], al
	 cmp byte[keyboardkey],97
	 je x
	 cmp byte[keyboardkey],100
	 je x
	 cmp byte[keyboardkey],119
	 je x
	 cmp byte[keyboardkey],115
	 je x
	 mov bl,byte[backup]
	   mov byte[keyboardkey],bl

	 x:
	   cmp byte[keyboardkey],119
	   jne z
	   cmp byte[backup],115
	   jne z
	    mov bl,byte[backup]
	   mov byte[keyboardkey],bl
	   jmp z

ni:    	jmp niot

z:	    cmp byte[keyboardkey],115
	   jne z1
	   cmp byte[backup],119
	   jne z1
	    mov bl,byte[backup]
	   mov byte[keyboardkey],bl

z1:	   cmp byte[keyboardkey],100
	   jne z2
	   cmp byte[backup],97
	   jne z2
	    mov bl,byte[backup]
	   mov byte[keyboardkey],bl

z2:	    cmp byte[keyboardkey],97
	   jne z3
	   cmp byte[backup],100
	   jne z3
	    mov bl,byte[backup]
	   mov byte[keyboardkey],bl
	   jne z1

 z3: mov al,byte[keyboardkey]
	   mov byte[backup],al
	 jmp while
niot:
	mov ax,last
	push ax
	
	mov ax,[len]
	push ax

	mov ax,[length]
	push ax

	mov ax,loc
	push ax

	cmp byte[keyboardkey], 97
	jne gfsde
	call move_left
	jmp bj
gfsde:
	cmp byte[keyboardkey], 100
	jne gfsd
	call move_right
	jmp bj
gfsd:
    	cmp byte[keyboardkey], 119
	jne gfs
	call move_up
	jmp bj
gfs:
    cmp byte[keyboardkey], 115
	jne gr
	call move_down
	jmp bj
gr:
    cmp byte[keyboardkey], 0
	jne bj
	call printsnake
	mov byte[backup], 100
bj:
	dec cx
	cmp cx,0
	jne while
	dec dx
	cmp dx,0
	jnz outer

endloc:
	mov ax,0x4c00
	int 0x21