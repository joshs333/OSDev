; File Table Entry
db "KRNLDR  "   ; 8 byte Filename
db "SYS"        ; 3 byte file extension
db 00000000b    ; attributes 76543210
    ; 0 Read-only
    ; 1 Hidden
    ; 2 System
    ; 3 Volume label
    ; 4 Subdirectory
    ; 5 Archive
    ; 6 Unused
    ; 7 Unused
dw 0x0000       ; Reserved
dw 0x0000       ; Creation time
dw 0x0000       ; Creation date
dw 0x0000       ; Last access date
dw 0x0000       ; Ignore
dw 0x0000       ; Last write time
dw 0x0000       ; Last write date
dw 2       ; first logical cluster
dd 512   ; file size
TIMES 7168-($-$$) DB 0
