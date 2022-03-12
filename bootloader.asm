   [bits 16]	
   [org 0x7c00] 

   mov si, str
   call char2Print
   jmp $

   printFunc:  
	mov ah, 0x0e
	mov bl, 0x07
	mov bh, 0
	int 0x10
	ret

   char2Print:
       .loop:
	mov al, [si]
	inc si 
	or al, al
	jz .stop
	call printFunc
	jmp .loop
       .stop:
	  ret

   str: db "harddisk.com.br && templo7k.ninja", 0

   bootloaderSignature:
	times 510-($-$$) db 0
	dw 0xAA55
