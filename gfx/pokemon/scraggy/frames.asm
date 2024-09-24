	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29
.frame2
	db $00 ; bitmask
	db $19, $2a, $1b, $1c, $1d, $1e, $1f, $2b, $2c, $22, $23, $2d, $2e, $26, $27, $28, $29
.frame3
	db $01 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $2f, $20, $21, $30, $24, $25, $26, $31
