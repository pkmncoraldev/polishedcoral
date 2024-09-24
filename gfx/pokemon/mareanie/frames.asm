	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $00
.frame2
	db $01 ; bitmask
	db $38, $39, $00, $3a, $3b, $3c, $3d, $2c, $2d, $2e, $3e, $3f, $40, $41, $42, $43, $00
.frame3
	db $02 ; bitmask
	db $44
.frame4
	db $03 ; bitmask
	db $45, $46
