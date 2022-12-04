	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $00, $25, $26, $27
.frame2
	db $00 ; bitmask
	db $19, $1a, $1b, $28, $29, $1e, $1f, $20, $2a, $22, $23, $24, $00, $25, $26, $27
.frame3
	db $00 ; bitmask
	db $19, $1a, $1b, $2b, $2c, $1e, $1f, $20, $2d, $22, $23, $24, $00, $25, $26, $27
.frame4
	db $01 ; bitmask
	db $2e, $2f, $30, $31
