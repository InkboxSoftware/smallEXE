BITS 64

;HEADER:
    DW 'MZ'
	DW 0
PE_HDR:
    DW 'PE'
	DW 0
    DW 0X8664
    DW 0X01
	DD 0
    DD 0
    DD 0
	DW OPTHDRSIZE
    DW 0X22
	OPTHDR:
    DW 0X020B
	DB "INKBOX"
	DD 0
    DD 0
    DD ENTRY
    DD 0
	DD 0
    DD 00
    DD 4
    DD 4
    DW 0
    DW 0
    DW 0
    DW 0
    DW 0X06
    DW 0
    DD 0
    DD FILESIZE
    DD 0
    DD 0
    DW 0X02
    DW 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DD 0
    DD 0
    DD 0
    DD 0
    DD 0
    DD 0
OPTHDRSIZE EQU $-OPTHDR

ENTRY:
    PUSH 0x100	;256
    POP RAX
    RET
;TRAILING 0s
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
    DQ 0
	DQ 0
    DQ 0
	DQ 0
    DQ 0
	DB 0

FILESIZE EQU $-$$