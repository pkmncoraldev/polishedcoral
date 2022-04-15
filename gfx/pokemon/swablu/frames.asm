	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23
.frame2
	db $01 ; bitmask
	db $24, $25, $26, $27, $28, $29, $1d, $1e, $2a, $20, $00, $2b, $2c, $2d, $23, $00, $2e, $2f, $30
.frame3
	db $00 ; bitmask
	db $19, $1a, $1b, $31, $1d, $1e, $2a, $20, $21, $22, $23
.frame4
	db $02 ; bitmask
	db $20, $22, $23
