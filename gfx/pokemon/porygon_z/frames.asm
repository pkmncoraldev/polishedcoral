	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30
.frame2
	db $01 ; bitmask
	db $31, $32, $33, $34, $35, $36, $00, $37, $38, $00
.frame3
	db $02 ; bitmask
	db $00, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41
