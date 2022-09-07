	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $03, $29, $2a, $2b, $2c, $2d, $03, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37
.frame2
	db $01 ; bitmask
	db $24, $25, $26, $27, $28, $03, $29, $2a, $2b, $2c, $2d, $03, $2e, $2f, $30, $31, $32, $33, $34, $38, $39, $3a, $3b, $3c
.frame3
	db $01 ; bitmask
	db $24, $25, $26, $27, $28, $03, $29, $2a, $2b, $2c, $2d, $03, $2e, $2f, $30, $31, $32, $3d, $34, $3e, $3f, $40, $41, $42
.frame4
	db $02 ; bitmask
	db $43, $44
.frame5
	db $03 ; bitmask
	db $45, $46, $47
