	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $03, $03, $03, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $2d
.frame2
	db $00 ; bitmask
	db $03, $03, $03, $35, $36, $26, $27, $28, $37, $38, $2b, $2c, $39, $3a, $2f, $30, $31, $32, $33, $34, $2d
.frame3
	db $01 ; bitmask
	db $03, $3b, $3c, $3d, $3e, $3f, $40, $41
.frame4
	db $02 ; bitmask
	db $42, $43, $44, $45, $46, $47
