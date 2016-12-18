; for boot

SECTION BOOT vstart=0x1000

extern read_from_disk
;-----------------------
mov eax, 0x10
mov cx, 1
mov bx, 0x70000
;-----------------------
; read disk to memory -> cpu -> excute
call read_from_disk
jmp 0x70000
