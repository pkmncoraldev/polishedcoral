	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39
.frame2
	db $01 ; bitmask
	db $3a, $0e, $3b, $3c, $3d, $3e, $3f, $40, $41
.frame3
	db $02 ; bitmask
	db $42, $43, $44, $45, $46, $0e, $47, $48
