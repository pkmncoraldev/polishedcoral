	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $00, $00, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $00, $00
.frame2
	db $01 ; bitmask
	db $31, $32, $24, $33, $34, $27, $28, $35, $36, $2a, $2b, $37, $38, $2c, $2d, $39, $3a, $30, $3b, $3c
.frame3
	db $02 ; bitmask
	db $3d, $36, $37, $38
.frame4
	db $03 ; bitmask
	db $3e, $3f
