; First Entries blank
db 0,0,0;

; Entry 1,2
db 0xFF; First cluster, EOF
db 0x0F;
db 0x00;
; Pad region
TIMES 4608-($-$$) DB 0
