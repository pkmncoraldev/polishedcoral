	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $03, $03, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $03, $2e, $2f, $30, $31, $03, $32, $33, $34, $35
.frame2
	db $00 ; bitmask
	db $03, $03, $03, $36, $37, $27, $28, $29, $38, $39, $2c, $2d, $35, $2e, $2f, $30, $31, $03, $32, $33, $34, $35
.frame3
	db $01 ; bitmask
	db $3a, $3b, $3c, $3d, $3e, $3f, $40
.frame4
	db $02 ; bitmask
	db $41, $42, $43, $44, $45, $46, $47
